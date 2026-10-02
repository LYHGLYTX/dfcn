// The exported GUI hook object begins with its original function pointer.
// Exchange only that field; DFHack owns the callback vector that follows it.
// Forward the last member-field argument as its untouched native scalar bits.
using NativeDfhackSetTileFn = bool (*)(const void *, int, int, bool, uintptr_t);
static std::mutex g_native_dfhack_hook_mutex;
static std::atomic<NativeDfhackSetTileFn> g_native_dfhack_original_set_tile{nullptr};
static std::atomic<NativeDfhackSetTileFn *> g_native_dfhack_set_tile_slot{nullptr};

static bool native_dfhack_capture_hook_active() {
    return g_native_dfhack_set_tile_slot.load(std::memory_order_acquire) != nullptr;
}

static bool native_dfhack_set_tile_capture(const void *pen, int x, int y,
        bool map, uintptr_t member_field) {
    NativeInputCallbackScope callback;
    const auto original = g_native_dfhack_original_set_tile.load(std::memory_order_acquire);
    if (!original || original == native_dfhack_set_tile_capture) return false;
    const bool result = callback.call_native([&] {
        return original(pen, x, y, map, member_field);
    });
    if (result && !map) {
        try {
            record_native_dfhack_tile_write(native_graphics(), pen, x, y);
        } catch (...) {
            // Optional capture evidence must never unwind through DFHack.
        }
    }
    return result;
}

static NativeDfhackSetTileFn *native_dfhack_find_set_tile_slot(bool &available) {
    available = false;
#ifdef _WIN32
    const auto module = GetModuleHandleW(L"dfhack.dll");
    if (!module) return nullptr;
    available = true;
    static constexpr char symbol[] =
        "?set_tile@Hooks@Screen@DFHack@@3V?$Hook@$$A6A_NAEBUPen@Screen@DFHack@@HH_NPEQgraphic_viewportst@df@@PEAH@Z@GuiHooks@3@A";
    return reinterpret_cast<NativeDfhackSetTileFn *>(GetProcAddress(module, symbol));
#else
    // Itanium ABI: namespace DFHack::Screen::Hooks, variable set_tile.
    void *slot = dlsym(RTLD_DEFAULT, "_ZN6DFHack6Screen5Hooks8set_tileE");
    available = slot != nullptr;
    return static_cast<NativeDfhackSetTileFn *>(slot);
#endif
}

static bool install_native_dfhack_capture_hook() {
    std::lock_guard<std::mutex> lock(g_native_dfhack_hook_mutex);
    if (native_dfhack_capture_hook_active()) return true;
    bool available = false;
    auto *slot = native_dfhack_find_set_tile_slot(available);
    // DFHack is optional and can appear after this core starts. Render-time
    // retries discover its exported object without starting or reloading it.
    if (!available) return true;
    if (!slot || reinterpret_cast<uintptr_t>(slot) %
            std::atomic_ref<NativeDfhackSetTileFn>::required_alignment != 0) {
        log_line("ERROR", "Cannot bind DFHack artwork capture: set_tile export is unavailable");
        return false;
    }
    std::atomic_ref<NativeDfhackSetTileFn> field(*slot);
    auto original = field.load(std::memory_order_acquire);
    if (!original || original == native_dfhack_set_tile_capture) {
        log_line("ERROR", "Cannot bind DFHack artwork capture: set_tile base ownership is invalid");
        return false;
    }
    // Publish the forwarding target before making the wrapper callable.
    g_native_dfhack_original_set_tile.store(original, std::memory_order_release);
    if (!field.compare_exchange_strong(original, native_dfhack_set_tile_capture,
            std::memory_order_acq_rel, std::memory_order_acquire)) {
        log_line("ERROR", "Cannot bind DFHack artwork capture: set_tile base changed during installation");
        return false;
    }
    g_native_dfhack_set_tile_slot.store(slot, std::memory_order_release);
    return true;
}

static void uninstall_native_dfhack_capture_hook() {
    std::lock_guard<std::mutex> lock(g_native_dfhack_hook_mutex);
    auto *slot = g_native_dfhack_set_tile_slot.load(std::memory_order_acquire);
    if (!slot) {
        clear_native_dfhack_logo_captures();
        return;
    }
    const auto original = g_native_dfhack_original_set_tile.load(std::memory_order_acquire);
    auto expected = static_cast<NativeDfhackSetTileFn>(native_dfhack_set_tile_capture);
    if (!original || !std::atomic_ref<NativeDfhackSetTileFn>(*slot).compare_exchange_strong(
            expected, original, std::memory_order_acq_rel, std::memory_order_acquire)) {
        // Another owner might have chained this wrapper. Keep the core
        // resident instead of overwriting its pointer or claiming detachment.
        log_line("ERROR", "Cannot detach DFHack artwork capture: set_tile base ownership changed");
        return;
    }
    g_native_dfhack_set_tile_slot.store(nullptr, std::memory_order_release);
    // Keep the original target valid for callbacks already in flight; the
    // common callback counter prevents unloading their code prematurely.
    clear_native_dfhack_logo_captures();
}
