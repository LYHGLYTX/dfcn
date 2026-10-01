// Common SDL positioning, hook ownership and callback lifetime. Conditional
// code only discovers the native IME interface and invokes OS-specific APIs.
using StartTextInputFn = void (*)();
static StartTextInputFn g_real_start_text_input = nullptr;
static NativeString *g_ime_text_target = nullptr;
static SDL_Rect g_ime_text_rect{};
#ifdef _WIN32
using SdlImeBeginUiElementFn = HRESULT (STDMETHODCALLTYPE *)(void *, DWORD, BOOL *);
using SdlImeUiElementFn = HRESULT (STDMETHODCALLTYPE *)(void *, DWORD);
static SdlImeBeginUiElementFn g_real_sdl_ime_begin = nullptr;
static SdlImeUiElementFn g_real_sdl_ime_update = nullptr;
static SdlImeUiElementFn g_real_sdl_ime_end = nullptr;

static void capture_sdl_ime_candidates(void *raw_sink) noexcept {
    try {
    if (!raw_sink) return;
    // SDL's TSFSink ABI is {vtable, int refcount, padding, data}. The
    // exact SDL 2.26.2 binary is validated before its vtable is hooked.
    auto *sink_bytes = static_cast<unsigned char *>(raw_sink);
    auto *video_data = *reinterpret_cast<unsigned char **>(sink_bytes + 16);
    if (!video_data) return;

    static constexpr size_t candlist_offset = 0x108;
    static constexpr size_t candidates_offset = 0x110;
    static constexpr size_t count_offset = 0x118;
    static constexpr size_t selection_offset = 0x120;
    static constexpr size_t page_size_offset = 0x124;
    static constexpr size_t max_candidates = 10;
    static constexpr size_t max_candidate_length = 256;

    const bool active =
        *reinterpret_cast<const int *>(video_data + candlist_offset) != 0;
    const auto *candidate_buffer =
        *reinterpret_cast<wchar_t *const *>(video_data + candidates_offset);
    const DWORD total_count =
        *reinterpret_cast<const DWORD *>(video_data + count_offset);
    const DWORD page_size =
        *reinterpret_cast<const DWORD *>(video_data + page_size_offset);
    const DWORD selected =
        *reinterpret_cast<const DWORD *>(video_data + selection_offset);

    std::vector<std::string> captured;
    if (active && candidate_buffer) {
        const size_t visible_count = std::min<size_t>(
            max_candidates, page_size > 0 ? page_size : total_count);
        captured.reserve(visible_count);
        for (size_t index = 0; index < visible_count; ++index) {
            const wchar_t *candidate =
                candidate_buffer + index * max_candidate_length;
            size_t length = 0;
            while (length < max_candidate_length && candidate[length]) ++length;
            captured.push_back(utf16_to_utf8(candidate, length));
        }
    }

    const bool has_candidates = std::any_of(
        captured.begin(), captured.end(),
        [](const std::string &candidate) { return !candidate.empty(); });
    {
        std::lock_guard<std::mutex> lock(g_ime_popup_mutex);
        g_ime_popup_snapshot.candidates = std::move(captured);
        g_ime_popup_snapshot.selected = has_candidates
            ? static_cast<int>(std::min<DWORD>(
                  selected,
                  static_cast<DWORD>(g_ime_popup_snapshot.candidates.size() - 1)))
            : -1;
    }
    if (has_candidates && !g_logged_ime_candidates.exchange(true)) {
        log_line("INFO", "Captured IME candidate list for in-game popup");
    }
    } catch (...) {
        // Candidate decoding must never unwind through the native COM ABI.
    }
}

static HRESULT STDMETHODCALLTYPE dfcn_sdl_ime_begin(
        void *sink, DWORD element_id, BOOL *show) {
    NativeInputCallbackScope callback;
    const HRESULT result = g_real_sdl_ime_begin
        ? callback.call_native([&] { return g_real_sdl_ime_begin(sink, element_id, show); })
        : E_FAIL;
    if (show) *show = TRUE;
    capture_sdl_ime_candidates(sink);
    return result;
}

static HRESULT STDMETHODCALLTYPE dfcn_sdl_ime_update(
        void *sink, DWORD element_id) {
    NativeInputCallbackScope callback;
    const HRESULT result = g_real_sdl_ime_update
        ? callback.call_native([&] { return g_real_sdl_ime_update(sink, element_id); })
        : E_FAIL;
    capture_sdl_ime_candidates(sink);
    return result;
}

static HRESULT STDMETHODCALLTYPE dfcn_sdl_ime_end(
        void *sink, DWORD element_id) {
    NativeInputCallbackScope callback;
    const HRESULT result = g_real_sdl_ime_end
        ? callback.call_native([&] { return g_real_sdl_ime_end(sink, element_id); })
        : E_FAIL;
    capture_sdl_ime_candidates(sink);
    return result;
}

static HWND focused_sdl_window_handle() {
    SDL_Window *window = SDL_GetKeyboardFocus();
    if (!window) return nullptr;
    SDL_SysWMinfo window_info{};
    SDL_VERSION(&window_info.version);
    if (SDL_GetWindowWMInfo(window, &window_info) != SDL_TRUE ||
        window_info.subsystem != SDL_SYSWM_WINDOWS) {
        return nullptr;
    }
    return window_info.info.win.window;
}

static void position_native_ime(HWND window, const SDL_Rect &rect) {
    if (!window) return;
    HIMC input_context = ImmGetContext(window);
    if (!input_context) return;

    COMPOSITIONFORM composition{};
    composition.dwStyle = CFS_RECT;
    composition.ptCurrentPos.x = rect.x;
    composition.ptCurrentPos.y = rect.y;
    composition.rcArea.left = rect.x;
    composition.rcArea.top = rect.y;
    composition.rcArea.right = rect.x + rect.w;
    composition.rcArea.bottom = rect.y + rect.h;
    ImmSetCompositionWindow(input_context, &composition);

    CANDIDATEFORM candidate{};
    candidate.dwIndex = 0;
    candidate.dwStyle = CFS_EXCLUDE;
    candidate.ptCurrentPos.x = rect.x;
    candidate.ptCurrentPos.y = rect.y + rect.h;
    candidate.rcArea = composition.rcArea;
    ImmSetCandidateWindow(input_context, &candidate);
    ImmReleaseContext(window, input_context);
}

static bool prepare_native_ime_profile(std::vector<NativeCodePatch> &patches,
                                       std::vector<NativeImportHook> &imports) {
    static constexpr DWORD expected_timestamp = 0x63b44241;
    static constexpr uintptr_t show_rva = 0x00147316, vtable_rva = 0x0017cbe0;
    static constexpr std::array<uintptr_t, 3> original_rvas{{0x00147290, 0x001473b0, 0x00147140}};
    const HMODULE module = GetModuleHandleW(L"SDL2.dll");
    if (!module) return false;
    auto *base = reinterpret_cast<unsigned char *>(module);
    const auto *dos = reinterpret_cast<const IMAGE_DOS_HEADER *>(base);
    if (dos->e_magic != IMAGE_DOS_SIGNATURE) return false;
    const auto *nt = reinterpret_cast<const IMAGE_NT_HEADERS64 *>(base + dos->e_lfanew);
    if (nt->Signature != IMAGE_NT_SIGNATURE || nt->FileHeader.TimeDateStamp != expected_timestamp ||
        nt->OptionalHeader.SizeOfImage < vtable_rva + 6 * sizeof(void *)) {
        log_line("ERROR", "Unsupported SDL2 native IME interface");
        return false;
    }
    const std::vector<unsigned char> hide{0xc7, 0x07, 0, 0, 0, 0};
    const std::vector<unsigned char> show{0xc7, 0x07, 1, 0, 0, 0};
    if (std::memcmp(base + show_rva, hide.data(), hide.size()) != 0) {
        log_line("ERROR", "SDL IME UI callback identity mismatch");
        return false;
    }
    const std::array<void *, 3> wrappers{{reinterpret_cast<void *>(&dfcn_sdl_ime_begin),
        reinterpret_cast<void *>(&dfcn_sdl_ime_update), reinterpret_cast<void *>(&dfcn_sdl_ime_end)}};
    for (size_t i = 0; i < original_rvas.size(); ++i) {
        auto **slot = reinterpret_cast<void **>(base + vtable_rva + (i + 3) * sizeof(void *));
        void *original = base + original_rvas[i];
        if (std::atomic_ref<void *>(*slot).load(std::memory_order_acquire) != original) {
            log_line("ERROR", "SDL IME UIElement vtable identity mismatch");
            return false;
        }
        imports.push_back({slot, original, wrappers[i]});
    }
    g_real_sdl_ime_begin = reinterpret_cast<SdlImeBeginUiElementFn>(base + original_rvas[0]);
    g_real_sdl_ime_update = reinterpret_cast<SdlImeUiElementFn>(base + original_rvas[1]);
    g_real_sdl_ime_end = reinterpret_cast<SdlImeUiElementFn>(base + original_rvas[2]);
    patches.push_back({base + show_rva, hide, show});
    return true;
}
#else
static bool prepare_native_ime_profile(std::vector<NativeCodePatch> &,
                                       std::vector<NativeImportHook> &) {
    // SDL delegates candidate presentation to the native input method here.
    // Its composition/input events and popup positioning use the shared path.
    return true;
}
#endif

static void position_native_ime(NativeString *target) {
    int mouse_x = 0;
    int mouse_y = 0;
    const Uint32 buttons = SDL_GetMouseState(&mouse_x, &mouse_y);
    if (target != g_ime_text_target || (buttons & SDL_BUTTON_LMASK) != 0) {
        int window_width = 0;
        int window_height = 0;
        if (SDL_Window *window = SDL_GetKeyboardFocus()) {
            SDL_GetWindowSize(window, &window_width, &window_height);
        }
        g_ime_text_rect.x = std::clamp(mouse_x, 0, std::max(0, window_width - 1));
        g_ime_text_rect.y = std::clamp(mouse_y, 0, std::max(0, window_height - 1));
        g_ime_text_rect.w = 1;
        g_ime_text_rect.h = 24;
        g_ime_text_target = target;
    }
    update_ime_popup_anchor(g_ime_text_rect);
    SDL_SetTextInputRect(&g_ime_text_rect);
#ifdef _WIN32
    position_native_ime(focused_sdl_window_handle(), g_ime_text_rect);
#endif
}

static void dfcn_start_text_input() {
    NativeInputCallbackScope callback;
    if (!g_real_start_text_input) return;
    callback.call_native([&] { g_real_start_text_input(); });
    try {
        if (g_ime_text_target) position_native_ime(g_ime_text_target);
    } catch (...) {}
}

static std::vector<NativeCodePatch> g_native_ime_patches;
static std::vector<NativeImportHook> g_native_ime_imports;
static bool g_native_ime_code_installed = false;
static bool g_native_ime_installed = false;
static bool native_ime_hooks_active() {
    return g_native_ime_code_installed || native_code_patches_pending(g_native_ime_patches) ||
        std::any_of(g_native_ime_imports.begin(),
        g_native_ime_imports.end(), [](const auto &hook) { return hook.active(); });
}
static void uninstall_native_ime_hooks() {
    g_native_ime_installed = false;
    for (auto it = g_native_ime_imports.rbegin(); it != g_native_ime_imports.rend(); ++it)
        it->uninstall("Native IME callback");
    if (g_native_ime_code_installed)
        write_native_code_patches(g_native_ime_patches, false, "Native IME UI", &g_native_ime_code_installed);
    if (!g_native_ime_code_installed)
        flush_native_code_patches(g_native_ime_patches, "Native IME UI restore");
    if (!native_ime_hooks_active()) {
        g_native_ime_imports.clear();
        g_native_ime_patches.clear();
    }
    // Original callback addresses and popup state remain until all in-flight
    // input/IME callbacks finish and the common shutdown permits cleanup.
}
static bool install_native_ime_hooks() {
    if (g_native_ime_installed) return true;
    if (native_ime_hooks_active()) {
        uninstall_native_ime_hooks();
        if (native_ime_hooks_active()) return false;
    }
    g_native_ime_patches.clear();
    g_native_ime_imports.clear();
    if (!prepare_native_ime_profile(g_native_ime_patches, g_native_ime_imports)) return false;
    if (!g_native_ime_patches.empty() && !write_native_code_patches(g_native_ime_patches, true,
            "Native IME UI", &g_native_ime_code_installed)) {
        uninstall_native_ime_hooks();
        return false;
    }
    for (auto &hook : g_native_ime_imports) {
        if (!hook.install("Native IME callback")) {
            uninstall_native_ime_hooks();
            return false;
        }
    }
    g_native_ime_installed = true;
    return true;
}
static void cleanup_native_ime_state() {
    if (!native_callbacks_idle() || native_ime_hooks_active()) return;
    g_ime_text_target = nullptr;
    g_ime_text_rect = {};
    g_real_start_text_input = nullptr;
#ifdef _WIN32
    g_real_sdl_ime_begin = nullptr;
    g_real_sdl_ime_update = nullptr;
    g_real_sdl_ime_end = nullptr;
#endif
    std::lock_guard<std::mutex> lock(g_ime_popup_mutex);
    g_ime_popup_snapshot = {};
    g_logged_ime_candidates.store(false);
}
