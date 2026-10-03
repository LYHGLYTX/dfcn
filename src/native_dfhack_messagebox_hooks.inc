// Core::fatal uses DFHack::DFSDL_ShowSimpleMessageBox. DFSDL deliberately
// binds SDL dynamically, so this is DFHack's private function-pointer slot,
// not an SDL export or the game's SDL import.
// Source: DFHack/dfhack, library/Core.cpp and library/modules/DFSDL.cpp.
#ifdef _WIN32
static std::optional<std::string> translate_dfhack_console_output(std::string_view source);

using NativeDfhackMessageBoxFn = int (SDLCALL *)(Uint32, const char *, const char *, SDL_Window *);
static NativeImportHook g_native_dfhack_messagebox_hook;
static std::atomic<NativeDfhackMessageBoxFn> g_native_dfhack_messagebox_original{nullptr};
static std::atomic<HMODULE> g_native_dfhack_messagebox_module{nullptr};
static std::atomic_bool g_native_dfhack_messagebox_translation{false};
static std::atomic_uint g_native_dfhack_messagebox_callbacks{0};
static std::mutex g_native_dfhack_messagebox_mutex;

struct NativeDfhackMessageBoxCall {
    NativeInputCallbackScope callback;
    NativeDfhackMessageBoxCall() {
        g_native_dfhack_messagebox_callbacks.fetch_add(1, std::memory_order_acq_rel);
    }
    ~NativeDfhackMessageBoxCall() {
        g_native_dfhack_messagebox_callbacks.fetch_sub(1, std::memory_order_acq_rel);
    }
};

static bool native_dfhack_messagebox_hook_active() {
    return g_native_dfhack_messagebox_hook.active() ||
        g_native_dfhack_messagebox_callbacks.load(std::memory_order_acquire) != 0;
}

static bool native_dfhack_messagebox_owned_address(HMODULE module, uintptr_t address,
        size_t size, bool executable) {
    if (!module || !address || !size) return false;
    MEMORY_BASIC_INFORMATION region{};
    NativePatchProtection protection = 0;
    unsigned long error = 0;
    return VirtualQuery(reinterpret_cast<const void *>(address), &region, sizeof(region)) &&
        region.AllocationBase == module && region.Type == MEM_IMAGE &&
        native_patch_page_protection(address, size, protection, error) &&
        native_patch_readable(protection) && (!executable || native_patch_executable(protection));
}

static std::optional<std::string> native_dfhack_messagebox_translate(const char *source,
        size_t limit) {
    if (!source) return std::nullopt;
    size_t length = 0;
    while (length < limit && source[length]) ++length;
    if (length == limit) return std::nullopt;
    return translate_dfhack_console_output(std::string_view(source, length));
}

static int SDLCALL native_dfhack_show_simple_messagebox(Uint32 flags, const char *title,
        const char *message, SDL_Window *window) {
    // The verified DFSDL wrapper tail-jumps through its private slot, retaining
    // Core::fatal's return address. Calls from outside dfhack.dll pass through.
    const auto caller = reinterpret_cast<uintptr_t>(__builtin_return_address(0));
    NativeDfhackMessageBoxCall call;
    const auto original = g_native_dfhack_messagebox_original.load(std::memory_order_acquire);
    if (!original || original == native_dfhack_show_simple_messagebox) return -1;
    std::optional<std::string> translated_title, translated_message;
    if (g_native_dfhack_messagebox_translation.load(std::memory_order_acquire) &&
            g_overlay.translation_enabled() &&
            native_dfhack_messagebox_owned_address(
                g_native_dfhack_messagebox_module.load(std::memory_order_acquire), caller, 1, true)) {
        try {
            // Both strings use the console's immutable catalog publication;
            // no Overlay containers or game-name grammar are accessed here.
            translated_title = native_dfhack_messagebox_translate(title, 4096);
            translated_message = native_dfhack_messagebox_translate(message, 262144);
        } catch (...) {
            translated_title.reset();
            translated_message.reset();
        }
    }
    // SDL consumes UTF-8 strings synchronously. Keep their owning strings and
    // both callback counters alive until the modal native call has returned.
    return call.callback.call_native([&] {
        return original(flags, translated_title ? translated_title->c_str() : title,
            translated_message ? translated_message->c_str() : message, window);
    });
}

static void **native_dfhack_messagebox_slot(HMODULE module) {
    constexpr const char *label = "DFHack local error message translation";
    const auto address = reinterpret_cast<uintptr_t>(GetProcAddress(module,
        "?DFSDL_ShowSimpleMessageBox@DFSDL@DFHack@@YAHIPEBD0PEAUSDL_Window@@@Z"));
    // Installed native function: mov rax,[rip+disp32]; test rax,rax;
    // jne +6; mov eax,-1; ret; jmp rax. Decode only this complete wrapper;
    // do not scan an unknown function or infer an arbitrary data address.
    constexpr std::array<unsigned char, 3> prefix{0x48, 0x8b, 0x05};
    constexpr std::array<unsigned char, 14> suffix{
        0x48, 0x85, 0xc0, 0x75, 0x06, 0xb8, 0xff,
        0xff, 0xff, 0xff, 0xc3, 0x48, 0xff, 0xe0};
    if (!native_dfhack_messagebox_owned_address(module, address, 21, true)) {
        report_native_patch_error("ERROR", label, "DFSDL message-box export is unavailable");
        return nullptr;
    }
    const auto *instruction = reinterpret_cast<const unsigned char *>(address);
    if (std::memcmp(instruction, prefix.data(), prefix.size()) ||
            std::memcmp(instruction + 7, suffix.data(), suffix.size())) {
        report_native_patch_error("ERROR", label, "DFSDL message-box wrapper signature differs");
        return nullptr;
    }
    int32_t displacement = 0;
    std::memcpy(&displacement, instruction + 3, sizeof(displacement));
    const intptr_t target = static_cast<intptr_t>(address + 7) + displacement;
    if (target <= 0 || static_cast<uintptr_t>(target) %
            std::atomic_ref<void *>::required_alignment ||
            !native_dfhack_messagebox_owned_address(module,
                static_cast<uintptr_t>(target), sizeof(void *), false)) {
        report_native_patch_error("ERROR", label, "DFSDL message-box slot is outside DFHack data");
        return nullptr;
    }
    NativePatchProtection protection = 0;
    unsigned long error = 0;
    if (!native_patch_page_protection(static_cast<uintptr_t>(target),
            sizeof(void *), protection, error) || native_patch_executable(protection)) {
        report_native_patch_error("ERROR", label, "DFSDL message-box slot is not a data field", error);
        return nullptr;
    }
    return reinterpret_cast<void **>(target);
}

static bool install_native_dfhack_messagebox_hook() {
    std::lock_guard<std::mutex> lock(g_native_dfhack_messagebox_mutex);
    if (g_native_dfhack_messagebox_hook.active()) {
        g_native_dfhack_messagebox_translation.store(true, std::memory_order_release);
        return true;
    }
    const auto module = GetModuleHandleW(L"dfhack.dll");
    if (!module) return true; // Optional module can appear after core startup.
    auto **slot = native_dfhack_messagebox_slot(module);
    if (!slot) return false;
    const auto current = std::atomic_ref<void *>(*slot).load(std::memory_order_acquire);
    if (!current) return true; // DFSDL has not bound SDL yet; retry normally.
    constexpr const char *label = "DFHack local error message translation";
    const auto sdl = GetModuleHandleW(L"SDL2.dll");
    const auto expected = sdl ? reinterpret_cast<void *>(
        GetProcAddress(sdl, "SDL_ShowSimpleMessageBox")) : nullptr;
    if (!expected || current != expected ||
            !native_dfhack_messagebox_owned_address(sdl,
                reinterpret_cast<uintptr_t>(expected), 1, true)) {
        report_native_patch_error("ERROR", label, "DFSDL slot no longer owns the native SDL message box");
        return false;
    }
    g_native_dfhack_messagebox_hook.slot = slot;
    g_native_dfhack_messagebox_hook.original = current;
    g_native_dfhack_messagebox_hook.replacement =
        reinterpret_cast<void *>(&native_dfhack_show_simple_messagebox);
    // Forwarding and origin policy precede publication of the callable slot.
    g_native_dfhack_messagebox_original.store(
        reinterpret_cast<NativeDfhackMessageBoxFn>(current), std::memory_order_release);
    g_native_dfhack_messagebox_module.store(module, std::memory_order_release);
    if (!g_native_dfhack_messagebox_hook.install(label)) return false;
    g_native_dfhack_messagebox_translation.store(true, std::memory_order_release);
    return true;
}

static void uninstall_native_dfhack_messagebox_hook() {
    std::lock_guard<std::mutex> lock(g_native_dfhack_messagebox_mutex);
    g_native_dfhack_messagebox_translation.store(false, std::memory_order_release);
    constexpr const char *label = "DFHack local error message translation";
    if (g_native_dfhack_messagebox_callbacks.load(std::memory_order_acquire)) {
        report_native_patch_error("WARN", label, "core remains resident while a native message box is open");
        return;
    }
    (void)g_native_dfhack_messagebox_hook.uninstall(label);
    // Retain the forwarding target for a wrapper already fetched by a native
    // caller. Common callback accounting owns its code through native return.
}
#else
// Bind the concrete native wrapper separately on a Linux host.
static bool native_dfhack_messagebox_hook_active() { return false; }
static bool install_native_dfhack_messagebox_hook() { return true; }
static void uninstall_native_dfhack_messagebox_hook() {}
#endif
