// Stonesense owns an Allegro window and does not use DFHack's tile renderer.
// Translate only this plugin's text imports, and only its visible backbuffer.
// Its offscreen screenshot/megashot rendering and file exports stay native.
#ifdef _WIN32
static std::optional<std::string> translate_dfhack_stonesense_text(std::string_view source);

struct NativeStonesenseColor { float r, g, b, a; };
static_assert(sizeof(NativeStonesenseColor) == 16);
using NativeStonesenseDrawTextFn = void (*)(const void *, NativeStonesenseColor,
    float, float, int, const char *);
using NativeStonesenseDrawUstrFn = void (*)(const void *, NativeStonesenseColor,
    float, float, int, const void *);
using NativeStonesenseTextWidthFn = int (*)(const void *, const char *);
using NativeStonesenseUstrWidthFn = int (*)(const void *, const void *);
using NativeStonesenseFontHeightFn = int (*)(const void *);
using NativeStonesenseLoadFontFn = void *(*)(const char *, int, int);
using NativeStonesenseDestroyFontFn = void (*)(void *);
using NativeStonesenseDestroyDisplayFn = void (*)(void *);
using NativeStonesenseVoidFn = void (*)();
using NativeStonesensePointerFn = void *(*)();
using NativeStonesenseBackbufferFn = void *(*)(void *);
using NativeStonesenseGetBitmapFlagsFn = int (*)();
using NativeStonesenseSetBitmapFlagsFn = void (*)(int);
using NativeStonesenseHoldDrawingFn = void (*)(bool);
using NativeStonesenseNewUstrFn = void *(*)(const char *);
using NativeStonesenseAppendUstrFn = bool (*)(void *, const char *, va_list);
using NativeStonesenseCstrFn = const char *(*)(const void *);
using NativeStonesenseUstrSizeFn = size_t (*)(const void *);
using NativeStonesenseFreeUstrFn = void (*)(void *);
using NativeStonesenseFlsAllocFn = DWORD (WINAPI *)(PFLS_CALLBACK_FUNCTION);
using NativeStonesenseFlsFreeFn = BOOL (WINAPI *)(DWORD);
using NativeStonesenseFlsGetValueFn = PVOID (WINAPI *)(DWORD);
using NativeStonesenseFlsSetValueFn = BOOL (WINAPI *)(DWORD, PVOID);

struct NativeStonesenseApi {
    NativeStonesenseDrawTextFn draw_text = nullptr;
    NativeStonesenseDrawUstrFn draw_ustr = nullptr;
    NativeStonesenseTextWidthFn text_width = nullptr;
    NativeStonesenseUstrWidthFn ustr_width = nullptr;
    NativeStonesenseFontHeightFn font_height = nullptr;
    NativeStonesenseLoadFontFn load_font = nullptr, load_ttf = nullptr;
    NativeStonesenseDestroyFontFn destroy_font = nullptr;
    NativeStonesenseDestroyDisplayFn destroy_display = nullptr;
    NativeStonesenseVoidFn uninstall_system = nullptr;
    NativeStonesensePointerFn current_display = nullptr, target_bitmap = nullptr;
    NativeStonesenseBackbufferFn backbuffer = nullptr;
    NativeStonesenseGetBitmapFlagsFn bitmap_flags = nullptr;
    NativeStonesenseSetBitmapFlagsFn set_bitmap_flags = nullptr;
    NativeStonesenseHoldDrawingFn hold_drawing = nullptr;
    NativeStonesenseNewUstrFn new_ustr = nullptr;
    NativeStonesenseAppendUstrFn append_ustr = nullptr;
    NativeStonesenseCstrFn cstr = nullptr;
    NativeStonesenseUstrSizeFn ustr_size = nullptr;
    NativeStonesenseFreeUstrFn free_ustr = nullptr;
    NativeStonesenseFlsAllocFn fls_alloc = nullptr;
    NativeStonesenseFlsFreeFn fls_free = nullptr;
    NativeStonesenseFlsGetValueFn fls_get_value = nullptr;
    NativeStonesenseFlsSetValueFn fls_set_value = nullptr;
};
static NativeStonesenseApi g_native_stonesense_api;
static std::array<NativeImportHook, 8> g_native_stonesense_hooks;
static std::atomic_bool g_native_stonesense_translation{false};
static std::atomic_uint g_native_stonesense_callbacks{0};
static std::atomic<DWORD> g_native_stonesense_render_thread{0};
static std::mutex g_native_stonesense_hook_mutex, g_native_stonesense_font_mutex;
static HMODULE g_native_stonesense_module_lease = nullptr;

struct NativeStonesenseCall {
    NativeInputCallbackScope callback;
    NativeStonesenseCall() {
        g_native_stonesense_callbacks.fetch_add(1, std::memory_order_acq_rel);
    }
    ~NativeStonesenseCall() {
        g_native_stonesense_callbacks.fetch_sub(1, std::memory_order_acq_rel);
    }
};
struct NativeStonesenseFontKey {
    const void *native_font = nullptr;
    void *display = nullptr;
    DWORD thread = 0;
    int height = 0;
    bool operator==(const NativeStonesenseFontKey &) const = default;
};
struct NativeStonesenseFontKeyHash {
    size_t operator()(const NativeStonesenseFontKey &key) const noexcept {
        return std::hash<const void *>{}(key.native_font) ^
            (std::hash<void *>{}(key.display) << 1) ^
            (static_cast<size_t>(key.thread) << 2) ^ static_cast<size_t>(key.height);
    }
};
struct NativeStonesenseFont {
    void *font = nullptr;
    DWORD fls = FLS_OUT_OF_INDEXES;
};
static std::unordered_map<NativeStonesenseFontKey, NativeStonesenseFont,
    NativeStonesenseFontKeyHash> g_native_stonesense_fonts;

static bool native_stonesense_visible_target(void **display) {
    const auto &api = g_native_stonesense_api;
    if (!g_native_stonesense_translation.load(std::memory_order_acquire) ||
            !g_overlay.translation_enabled()) return false;
    void *current = api.current_display();
    if (!current || api.target_bitmap() != api.backbuffer(current)) return false;
    const DWORD thread = GetCurrentThreadId();
    DWORD owner = 0;
    // A core loaded after the window opened did not observe al_load_font.
    // The plugin's first visible text/metric call supplies the render owner.
    g_native_stonesense_render_thread.compare_exchange_strong(owner, thread,
        std::memory_order_acq_rel, std::memory_order_acquire);
    if (g_native_stonesense_render_thread.load(std::memory_order_acquire) != thread)
        return false;
    *display = current;
    return true;
}

static bool native_stonesense_text_view(const char *text, std::string_view &view) {
    if (!text) return false;
    constexpr size_t limit = 65536;
    size_t bytes = 0;
    while (bytes < limit && text[bytes]) ++bytes;
    if (bytes == limit) return false;
    view = std::string_view(text, bytes);
    return true;
}

// Only called by Stonesense's render thread with its current display. Fonts
// capture bitmap_flags at load; the TTF addon's lazy glyph atlas later uses
// those captured flags. MEMORY_BITMAP keeps deferred native cleanup free of
// display/context ownership after the window has been destroyed.
static void *native_stonesense_font(NativeStonesenseCall &call,
        const void *native_font, void *display) {
    const auto &api = g_native_stonesense_api;
    const int height = call.callback.call_native([&] { return api.font_height(native_font); });
    if (height <= 0) return nullptr;
    const NativeStonesenseFontKey key{native_font, display, GetCurrentThreadId(), height};
    {
        std::lock_guard<std::mutex> lock(g_native_stonesense_font_mutex);
        const auto found = g_native_stonesense_fonts.find(key);
        if (found != g_native_stonesense_fonts.end()) {
            const auto &entry = found->second;
            if (!entry.font || api.fls_get_value(entry.fls) == entry.font) return entry.font;
            // A previous render thread already exited. Never dereference its
            // stale native font when Windows reuses a thread/display address.
            // Its detached index has no core callback; do not free another
            // fiber's slot merely because this fiber cannot see its value.
            g_native_stonesense_fonts.erase(found);
        }
    }
    const auto cache_failure = [&]() -> void * {
        std::lock_guard<std::mutex> lock(g_native_stonesense_font_mutex);
        g_native_stonesense_fonts.emplace(key, NativeStonesenseFont{});
        return nullptr;
    };
    NativeStonesenseFont result;
    // This callback is Allegro's exported native function, not core code.
    // Win64 has one void(void*) ABI for both this C export and FLS callbacks.
    result.fls = api.fls_alloc(reinterpret_cast<PFLS_CALLBACK_FUNCTION>(api.destroy_font));
    if (result.fls == FLS_OUT_OF_INDEXES) return cache_failure();
    bool registered = false, retained = false;
    struct NewFontGuard {
        const NativeStonesenseApi &api;
        NativeStonesenseFont &font;
        bool &registered, &retained;
        ~NewFontGuard() {
            if (retained) return;
            if (registered && !api.fls_set_value(font.fls, nullptr)) return;
            if (font.font) api.destroy_font(font.font);
            api.fls_free(font.fls);
        }
    } font_guard{api, result, registered, retained};
    const int original_flags = call.callback.call_native([&] { return api.bitmap_flags(); });
    struct BitmapFlagsGuard {
        const NativeStonesenseApi &api;
        int original;
        ~BitmapFlagsGuard() { api.set_bitmap_flags(original); }
    } flags_guard{api, original_flags};
    constexpr int memory_bitmap = 1; // ALLEGRO_MEMORY_BITMAP, native bitmap.h
    call.callback.call_native([&] { api.set_bitmap_flags(memory_bitmap); });
    for (int pixels = std::min(height, 256); pixels > 0; --pixels) {
        void *candidate = call.callback.call_native([&] {
            return api.load_ttf("C:/Windows/Fonts/simhei.ttf", -pixels, 0);
        });
        if (!candidate) break;
        const int actual = call.callback.call_native([&] { return api.font_height(candidate); });
        if (actual > 0 && actual <= height) {
            result.font = candidate;
            break;
        }
        call.callback.call_native([&] { api.destroy_font(candidate); });
    }
    if (!result.font || !api.fls_set_value(result.fls, result.font)) return cache_failure();
    registered = true;
    {
        std::lock_guard<std::mutex> lock(g_native_stonesense_font_mutex);
        g_native_stonesense_fonts.emplace(key, result);
    }
    retained = true;
    return result.font;
}

struct NativeStonesenseTranslation {
    void *font = nullptr;
    std::string text;
};
static std::optional<NativeStonesenseTranslation> native_stonesense_translate(
        NativeStonesenseCall &call, const void *font, std::string_view source) {
    void *display = nullptr;
    if (!font || source.empty() || source.size() > 65536 ||
            source.find('\0') != std::string_view::npos ||
            !native_stonesense_visible_target(&display)) return std::nullopt;
    auto target = translate_dfhack_stonesense_text(source);
    if (!target || target->empty()) return std::nullopt;
    void *translated_font = native_stonesense_font(call, font, display);
    if (!translated_font) return std::nullopt;
    return NativeStonesenseTranslation{translated_font, std::move(*target)};
}

static void native_stonesense_draw_text(NativeStonesenseCall &call, const void *font,
        NativeStonesenseColor color, float x, float y, int flags, const char *text) {
    const auto original = g_native_stonesense_api.draw_text;
    try {
        std::string_view source;
        if (native_stonesense_text_view(text, source))
            if (auto translated = native_stonesense_translate(call, font, source)) {
                call.callback.call_native([&] {
                    original(translated->font, color, x, y, flags, translated->text.c_str());
                });
                return;
            }
    } catch (...) {}
    call.callback.call_native([&] { original(font, color, x, y, flags, text); });
}

static void native_stonesense_draw_ustr(NativeStonesenseCall &call, const void *font,
        NativeStonesenseColor color, float x, float y, int flags, const void *text) {
    const auto &api = g_native_stonesense_api;
    try {
        if (text) {
            const size_t bytes = api.ustr_size(text);
            const char *source = bytes <= 65536 ? api.cstr(text) : nullptr;
            if (source)
                if (auto translated = native_stonesense_translate(call, font,
                        std::string_view(source, bytes))) {
                    call.callback.call_native([&] {
                        api.draw_text(translated->font, color, x, y, flags, translated->text.c_str());
                    });
                    return;
                }
        }
    } catch (...) {}
    call.callback.call_native([&] { api.draw_ustr(font, color, x, y, flags, text); });
}

static void native_dfhack_stonesense_draw_text(const void *font, NativeStonesenseColor color,
        float x, float y, int flags, const char *text) {
    NativeStonesenseCall call;
    native_stonesense_draw_text(call, font, color, x, y, flags, text);
}
static void native_dfhack_stonesense_draw_ustr(const void *font, NativeStonesenseColor color,
        float x, float y, int flags, const void *text) {
    NativeStonesenseCall call;
    native_stonesense_draw_ustr(call, font, color, x, y, flags, text);
}
static void native_dfhack_stonesense_draw_textf(const void *font, NativeStonesenseColor color,
        float x, float y, int flags, const char *format, ...) {
    NativeStonesenseCall call;
    const auto &api = g_native_stonesense_api;
    va_list arguments;
    va_start(arguments, format);
    // Mirror Allegro's own fast path and native USTR formatter. Passing a
    // core CRT's formatted string or forwarding an unknown va_list to a
    // variadic function would change the native format/argument contract.
    if (format && std::strcmp(format, "%s") == 0) {
        const auto *text = va_arg(arguments, const char *);
        va_end(arguments);
        native_stonesense_draw_text(call, font, color, x, y, flags, text);
        return;
    }
    void *buffer = call.callback.call_native([&] { return api.new_ustr(""); });
    if (buffer) call.callback.call_native([&] { api.append_ustr(buffer, format, arguments); });
    va_end(arguments);
    if (!buffer) return;
    struct UstrGuard {
        NativeStonesenseCall &call;
        void *buffer;
        ~UstrGuard() {
            call.callback.call_native([&] { g_native_stonesense_api.free_ustr(buffer); });
        }
    } guard{call, buffer};
    native_stonesense_draw_ustr(call, font, color, x, y, flags, buffer);
}

static int native_dfhack_stonesense_text_width(const void *font, const char *text) {
    NativeStonesenseCall call;
    const auto original = g_native_stonesense_api.text_width;
    try {
        std::string_view source;
        if (native_stonesense_text_view(text, source))
            if (auto translated = native_stonesense_translate(call, font, source))
                return call.callback.call_native([&] {
                    return original(translated->font, translated->text.c_str());
                });
    } catch (...) {}
    return call.callback.call_native([&] { return original(font, text); });
}
static int native_dfhack_stonesense_ustr_width(const void *font, const void *text) {
    NativeStonesenseCall call;
    const auto &api = g_native_stonesense_api;
    try {
        if (text) {
            const size_t bytes = api.ustr_size(text);
            const char *source = bytes <= 65536 ? api.cstr(text) : nullptr;
            if (source)
                if (auto translated = native_stonesense_translate(call, font,
                        std::string_view(source, bytes)))
                    return call.callback.call_native([&] {
                        return api.text_width(translated->font, translated->text.c_str());
                    });
        }
    } catch (...) {}
    return call.callback.call_native([&] { return api.ustr_width(font, text); });
}

static void *native_dfhack_stonesense_load_font(const char *filename, int size, int flags) {
    NativeStonesenseCall call;
    void *font = call.callback.call_native([&] {
        return g_native_stonesense_api.load_font(filename, size, flags);
    });
    if (font) g_native_stonesense_render_thread.store(GetCurrentThreadId(), std::memory_order_release);
    return font;
}

static void native_stonesense_release_display_fonts(NativeStonesenseCall &call, void *display) {
    const auto &api = g_native_stonesense_api;
    if (!display || api.current_display() != display ||
            g_native_stonesense_render_thread.load(std::memory_order_acquire) != GetCurrentThreadId())
        return;
    std::vector<NativeStonesenseFont> fonts;
    {
        std::lock_guard<std::mutex> lock(g_native_stonesense_font_mutex);
        fonts.reserve(g_native_stonesense_fonts.size());
        for (auto it = g_native_stonesense_fonts.begin(); it != g_native_stonesense_fonts.end();)
            if (it->first.display == display && it->first.thread == GetCurrentThreadId()) {
                fonts.push_back(it->second);
                it = g_native_stonesense_fonts.erase(it);
            } else ++it;
    }
    // Glyph bitmaps can still be referenced by Allegro's held vertex cache.
    // Flush on this display's render thread before destroying any font.
    call.callback.call_native([&] { api.hold_drawing(false); });
    for (const auto &entry : fonts) {
        if (entry.fls == FLS_OUT_OF_INDEXES) continue;
        if (api.fls_get_value(entry.fls) == entry.font) {
            if (!api.fls_set_value(entry.fls, nullptr)) continue;
            call.callback.call_native([&] { api.destroy_font(entry.font); });
        }
        api.fls_free(entry.fls);
    }
}
static void native_dfhack_stonesense_destroy_display(void *display) {
    NativeStonesenseCall call;
    try { native_stonesense_release_display_fonts(call, display); } catch (...) {}
    call.callback.call_native([&] { g_native_stonesense_api.destroy_display(display); });
    if (g_native_stonesense_render_thread.load(std::memory_order_acquire) == GetCurrentThreadId())
        g_native_stonesense_render_thread.store(0, std::memory_order_release);
}
static void native_dfhack_stonesense_uninstall_system() {
    NativeStonesenseCall call;
    // Stonesense plugin_shutdown joins its event/render thread before this
    // call. Any FLS font destructor has already run on that render thread.
    // Do not follow cached pointers during the system's native teardown.
    {
        std::lock_guard<std::mutex> lock(g_native_stonesense_font_mutex);
        g_native_stonesense_fonts.clear();
    }
    g_native_stonesense_render_thread.store(0, std::memory_order_release);
    call.callback.call_native([&] { g_native_stonesense_api.uninstall_system(); });
}

static bool native_dfhack_stonesense_hook_active() {
    return g_native_stonesense_callbacks.load(std::memory_order_acquire) ||
        std::any_of(g_native_stonesense_hooks.begin(), g_native_stonesense_hooks.end(),
            [](const auto &hook) { return hook.active(); });
}
static bool native_dfhack_stonesense_window_active() {
    return g_native_stonesense_translation.load(std::memory_order_acquire) &&
        g_native_stonesense_render_thread.load(std::memory_order_acquire) != 0;
}
static bool install_native_dfhack_stonesense_hook() {
    std::lock_guard<std::mutex> lock(g_native_stonesense_hook_mutex);
    constexpr const char *label = "DFHack Stonesense visible text translation";
    if (native_dfhack_stonesense_hook_active()) {
        const bool complete = std::all_of(g_native_stonesense_hooks.begin(), g_native_stonesense_hooks.end(),
            [](const auto &hook) { return hook.active(); });
        if (complete) g_native_stonesense_translation.store(true, std::memory_order_release);
        return complete;
    }
    // IAT fields reside in the optional plugin image. Keep an ordinary loader
    // reference while they are owned, so a DFHack plugin unload cannot leave
    // stale import pointers for the next core detach. This is not a PIN:
    // release the lease after every slot and callback has detached.
    if (!g_native_stonesense_module_lease && !GetModuleHandleExW(0,
            L"stonesense.plug.dll", &g_native_stonesense_module_lease)) return true;
    const auto plugin = g_native_stonesense_module_lease;
    bool committed = false;
    struct UnpublishedModuleLease {
        bool &committed;
        ~UnpublishedModuleLease() {
            if (committed || native_dfhack_stonesense_hook_active()) return;
            if (g_native_stonesense_module_lease) {
                const auto module = g_native_stonesense_module_lease;
                g_native_stonesense_module_lease = nullptr;
                FreeLibrary(module);
            }
        }
    } lease_guard{committed};
    const auto font = GetModuleHandleW(L"allegro_font-5.2.dll");
    const auto ttf = GetModuleHandleW(L"allegro_ttf-5.2.dll");
    const auto allegro = GetModuleHandleW(L"allegro-5.2.dll");
    const auto kernel = GetModuleHandleW(L"kernel32.dll");
    if (!font || !ttf || !allegro || !kernel) {
        report_native_patch_error("ERROR", label, "plugin's native Allegro libraries are unavailable");
        return false;
    }
    NativeStonesenseApi api;
    bool bound = true;
    const auto bind = [&]<typename Function>(Function &target, HMODULE module, const char *symbol) {
        target = reinterpret_cast<Function>(GetProcAddress(module, symbol));
        bound = bound && target;
    };
    bind(api.draw_text, font, "al_draw_text");
    bind(api.draw_ustr, font, "al_draw_ustr");
    bind(api.text_width, font, "al_get_text_width");
    bind(api.ustr_width, font, "al_get_ustr_width");
    bind(api.font_height, font, "al_get_font_line_height");
    bind(api.load_font, font, "al_load_font");
    bind(api.destroy_font, font, "al_destroy_font");
    bind(api.load_ttf, ttf, "al_load_ttf_font");
    bind(api.destroy_display, allegro, "al_destroy_display");
    bind(api.uninstall_system, allegro, "al_uninstall_system");
    bind(api.current_display, allegro, "al_get_current_display");
    bind(api.target_bitmap, allegro, "al_get_target_bitmap");
    bind(api.backbuffer, allegro, "al_get_backbuffer");
    bind(api.bitmap_flags, allegro, "al_get_new_bitmap_flags");
    bind(api.set_bitmap_flags, allegro, "al_set_new_bitmap_flags");
    bind(api.hold_drawing, allegro, "al_hold_bitmap_drawing");
    bind(api.new_ustr, allegro, "al_ustr_new");
    bind(api.append_ustr, allegro, "al_ustr_vappendf");
    bind(api.cstr, allegro, "al_cstr");
    bind(api.ustr_size, allegro, "al_ustr_size");
    bind(api.free_ustr, allegro, "al_ustr_free");
    // Resolve FLS through its native WINAPI exports. The fixed MinGW target
    // headers need not expose these declarations for the host OS to supply
    // them; no target-version macro or alternate toolchain is required.
    bind(api.fls_alloc, kernel, "FlsAlloc");
    bind(api.fls_free, kernel, "FlsFree");
    bind(api.fls_get_value, kernel, "FlsGetValue");
    bind(api.fls_set_value, kernel, "FlsSetValue");
    if (!bound) {
        report_native_patch_error("ERROR", label, "required native text/font exports are unavailable");
        return false;
    }
    struct Binding { HMODULE module; const char *library, *symbol; const void *replacement; };
    const std::array<Binding, 8> bindings{{
        {allegro, "allegro-5.2.dll", "al_destroy_display", reinterpret_cast<const void *>(&native_dfhack_stonesense_destroy_display)},
        {allegro, "allegro-5.2.dll", "al_uninstall_system", reinterpret_cast<const void *>(&native_dfhack_stonesense_uninstall_system)},
        {font, "allegro_font-5.2.dll", "al_load_font", reinterpret_cast<const void *>(&native_dfhack_stonesense_load_font)},
        {font, "allegro_font-5.2.dll", "al_get_text_width", reinterpret_cast<const void *>(&native_dfhack_stonesense_text_width)},
        {font, "allegro_font-5.2.dll", "al_get_ustr_width", reinterpret_cast<const void *>(&native_dfhack_stonesense_ustr_width)},
        {font, "allegro_font-5.2.dll", "al_draw_text", reinterpret_cast<const void *>(&native_dfhack_stonesense_draw_text)},
        {font, "allegro_font-5.2.dll", "al_draw_ustr", reinterpret_cast<const void *>(&native_dfhack_stonesense_draw_ustr)},
        {font, "allegro_font-5.2.dll", "al_draw_textf", reinterpret_cast<const void *>(&native_dfhack_stonesense_draw_textf)}}};
    for (size_t index = 0; index < bindings.size(); ++index) {
        const auto &binding = bindings[index];
        auto **slot = find_iat_slot(plugin, binding.library, binding.symbol);
        void *expected = reinterpret_cast<void *>(GetProcAddress(binding.module, binding.symbol));
        if (!slot || !expected || reinterpret_cast<uintptr_t>(slot) %
                std::atomic_ref<void *>::required_alignment ||
                std::atomic_ref<void *>(*slot).load(std::memory_order_acquire) != expected) {
            report_native_patch_error("ERROR", label, "plugin text import identity/ownership differs");
            return false;
        }
        auto &hook = g_native_stonesense_hooks[index];
        hook.slot = slot;
        hook.original = expected;
        hook.replacement = const_cast<void *>(binding.replacement);
    }
    // Native forwarding APIs precede publication. Lifecycle observers are
    // installed before any translated draw can create a cached font.
    g_native_stonesense_api = api;
    for (auto &hook : g_native_stonesense_hooks)
        if (!hook.install(label)) {
            for (auto it = g_native_stonesense_hooks.rbegin(); it != g_native_stonesense_hooks.rend(); ++it)
                if (it->active()) it->uninstall(label);
            return false;
        }
    g_native_stonesense_translation.store(true, std::memory_order_release);
    committed = true;
    return true;
}
static void uninstall_native_dfhack_stonesense_hook() {
    std::lock_guard<std::mutex> lock(g_native_stonesense_hook_mutex);
    g_native_stonesense_translation.store(false, std::memory_order_release);
    constexpr const char *label = "DFHack Stonesense visible text translation";
    if (g_native_stonesense_callbacks.load(std::memory_order_acquire)) {
        g_native_stonesense_translation.store(true, std::memory_order_release);
        report_native_patch_error("WARN", label, "core remains resident until a short text callback returns");
        return;
    }
    for (auto it = g_native_stonesense_hooks.rbegin(); it != g_native_stonesense_hooks.rend(); ++it)
        if (it->active()) it->uninstall(label);
    if (native_dfhack_stonesense_hook_active()) return;
    {
        std::lock_guard<std::mutex> font_lock(g_native_stonesense_font_mutex);
        // FlsFree would run native cleanup for other fibers on the shutdown
        // caller, where pending Allegro vertices/shared FreeType access cannot
        // be ruled out. Leave only native callbacks and font pointers in FLS:
        // render-thread exit frees fonts before plugin_shutdown's join ends.
        // These detached FLS indexes themselves remain until process exit.
        g_native_stonesense_fonts.clear();
    }
    g_native_stonesense_render_thread.store(0, std::memory_order_release);
    if (g_native_stonesense_module_lease) {
        const auto module = g_native_stonesense_module_lease;
        g_native_stonesense_module_lease = nullptr;
        FreeLibrary(module);
    }
}
#else
// Bind Stonesense's concrete native Allegro ABI separately on a Linux host.
static bool native_dfhack_stonesense_hook_active() { return false; }
static bool native_dfhack_stonesense_window_active() { return false; }
static bool install_native_dfhack_stonesense_hook() { return true; }
static void uninstall_native_dfhack_stonesense_hook() {}
#endif
