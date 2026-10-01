// 53.16 drains SDL's event queue before the simulation thread feeds the UI.
// A DOWN followed by UP can therefore erase mouse_lbut before any widget sees
// it. mouse_lbut is the consumable click; mouse_lbut_down is the held state.
// Keep a released click for one native UI tick, then expire it even when the
// click hit empty space. Held buttons and native mouse coordinates stay native.
struct NativeMouseClickHook {
    NativeCallHook tick;
    std::vector<NativeCodePatch> latch;
    bool installed = false;

    bool active() const {
        return installed || tick.active() || native_code_patches_pending(latch) ||
            native_code_patches_pending(tick.patches);
    }

    bool uninstall() {
        constexpr const char *label = "Native left-click delivery";
        if (installed && !write_native_code_patches(latch, false, label, &installed))
            return false;
        if (!flush_native_code_patches(latch, label) || !tick.uninstall(label))
            return false;
        latch.clear();
        return true;
    }
};
static NativeMouseClickHook g_native_mouse_click_hook;

#ifdef _WIN32
using NativeUiTickFn = bool (*)();
static NativeUiTickFn g_native_ui_tick = nullptr;
static unsigned char *g_native_left_click = nullptr;
static unsigned char *g_native_left_held = nullptr;

static bool dfcn_native_ui_tick() {
    NativeInputCallbackScope callback;
    const bool result = callback.call_native([] { return g_native_ui_tick(); });
    // The event loop pauses this simulation thread before changing mouse
    // state. All native logic/feed consumers have now had their opportunity;
    // do not let an unhandled released click follow the pointer into a later UI.
    if (!*g_native_left_held) *g_native_left_click = 0;
    return result;
}
#endif

static bool install_native_mouse_click_hook() {
#ifdef _WIN32
    constexpr const char *label = "Native left-click delivery";
    auto &hook = g_native_mouse_click_hook;
    if (hook.installed)
        return flush_native_code_patches(hook.latch, label) &&
            flush_native_code_patches(hook.tick.patches, label);
    if (!hook.uninstall() || !native_validate_game()) return false;
    auto *base = reinterpret_cast<unsigned char *>(GetModuleHandleW(nullptr));
    // eventLoop_SDL: assign the click and held state, then test DOWN/UP.
    // OR affects only the click assignment. The following TEST overwrites
    // its flags; a release still immediately clears the physical held state.
    static constexpr unsigned char button_state[]{
        0x88,0x05,0x86,0xa1,0xaa,0x01, // mov [enabler.mouse_lbut],al
        0x88,0x05,0x82,0xa1,0xaa,0x01, // mov [enabler.mouse_lbut_down],al
        0x85,0xc0};                    // test eax,eax
    NativePatchPages pages;
    auto *site = base + native_pe_rva(0x8e6440);
    std::vector<unsigned char> expected{std::begin(button_state), std::end(button_state)};
    if (!collect_native_patch_pages(pages, reinterpret_cast<uintptr_t>(site),
            sizeof(button_state), native_patch_page_size(), true, label) ||
        !native_pe_bytes(0x8e6440, expected) ||
        std::memcmp(site, expected.data(), expected.size()) != 0) {
        report_native_patch_error("ERROR", label, "native mouse-state assignment identity mismatch");
        return false;
    }
    NativeCodePatch patch{site, {expected.begin(), expected.begin() + 6},
        {expected.begin(), expected.begin() + 6}};
    patch.replacement[0] = 0x08; // or [enabler.mouse_lbut],al
    hook.latch.push_back(std::move(patch));
    g_native_left_click = base + native_pe_rva(0x23905cc);
    g_native_left_held = base + native_pe_rva(0x23905ce);
    g_native_ui_tick = reinterpret_cast<NativeUiTickFn>(base + native_pe_rva(0xc38870));
    // The sole simulation tick call returns bool in AL. Its logic/feed pass
    // includes the character sheet's eleven tabs (1b1c6f..1b1e9d), which consume
    // mouse_lbut on a hit. Cleanup must follow feed, not SDL polling or Present.
    // Patch the call itself: SDL caches import addresses across event callbacks,
    // so a PollEvent import wrapper could outlive a hot-reloaded core.
    std::vector<NativeCall> calls{
        {0x8e5bce, 0xc38870, reinterpret_cast<const void *>(&dfcn_native_ui_tick)}};
    if (!native_reference_calls(calls, 0) ||
        !hook.tick.install(reinterpret_cast<uintptr_t>(base), calls, label) ||
        !write_native_code_patches(hook.latch, true, label, &hook.installed)) {
        hook.uninstall();
        return false;
    }
    log_line("INFO", "Enabled native left-click delivery through one UI feed pass");
#endif
    return true;
}
