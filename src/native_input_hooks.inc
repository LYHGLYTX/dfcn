// Native locators supply entry/import metadata. UTF-8 editing, translated
// search, IME positioning and teardown use the same callbacks and state.
using NativeTextInputFn = char (*)(NativeString *, int, unsigned int, void *, const char *);
static NativeTextInputFn g_real_native_text_input = nullptr;
static NativeEntryHook g_native_text_input_entry;
static std::vector<NativeImportHook> g_native_text_input_imports;
static std::vector<NativeImportHook> g_native_start_input_imports;
static bool g_native_input_ready = false;

struct NativeInputProfile {
    unsigned char *entry = nullptr;
    std::vector<unsigned char> prefix;
    NativeTextInputFn original = nullptr;
    std::vector<void **> text_slots, start_slots;
    NativeArenaContext arena;
};
#include "native_input_profile.inc"

static char dfcn_native_text_input(NativeString *target, int maximum,
        unsigned int flags, void *keys, const char *input) {
    NativeInputCallbackScope callback;
    try { position_native_ime(target); } catch (...) {}
    try { capture_name_editor_search_input(target, maximum, flags); } catch (...) {}
    return capture_native_text_input(target, maximum, flags, keys, input,
        g_real_native_text_input, callback);
}

static bool native_input_hooks_active() {
    return g_native_text_input_entry.active() || native_ime_hooks_active() ||
        std::any_of(g_native_text_input_imports.begin(), g_native_text_input_imports.end(),
            [](const auto &hook) { return hook.active(); }) ||
        std::any_of(g_native_start_input_imports.begin(), g_native_start_input_imports.end(),
            [](const auto &hook) { return hook.active(); });
}

static void uninstall_native_input_hooks() {
    g_native_input_ready = false;
    uninstall_native_ime_hooks();
    for (auto it = g_native_start_input_imports.rbegin(); it != g_native_start_input_imports.rend(); ++it)
        it->uninstall("SDL text-input binding");
    for (auto it = g_native_text_input_imports.rbegin(); it != g_native_text_input_imports.rend(); ++it)
        it->uninstall("Native text-input binding");
    // Keep the original entry trampoline while any native callback can still
    // be using it. The common shutdown retains the core and retries later.
    if (native_callbacks_idle()) g_native_text_input_entry.uninstall("Native text-input entry");
}

static bool install_native_input_hooks() {
    if (g_native_input_ready) return true;
    if (native_input_hooks_active()) {
        uninstall_native_input_hooks();
        if (native_input_hooks_active()) return false;
    }
    NativeInputProfile profile;
    if (!prepare_native_input_profile(profile)) {
        log_line("ERROR", "Cannot validate native Unicode input and Arena creature-search bindings");
        return false;
    }
    g_native_text_input_imports.clear();
    g_native_start_input_imports.clear();
    for (void **slot : profile.text_slots)
        g_native_text_input_imports.push_back({slot, nullptr, reinterpret_cast<void *>(&dfcn_native_text_input)});
    for (void **slot : profile.start_slots)
        g_native_start_input_imports.push_back({slot, nullptr, reinterpret_cast<void *>(&dfcn_start_text_input)});
    if (profile.entry) {
        if (!g_native_text_input_entry.prepare(profile.entry, profile.prefix,
                reinterpret_cast<const void *>(&dfcn_native_text_input), {}, "Native text-input entry")) return false;
        profile.original = reinterpret_cast<NativeTextInputFn>(g_native_text_input_entry.original);
    }
    if (!profile.original || (!profile.entry && profile.text_slots.empty())) return false;
    g_real_native_text_input = profile.original;
    g_real_start_text_input = &SDL_StartTextInput;
    bind_native_arena_context(profile.arena.picker, profile.arena.raws, profile.arena.filter);
    auto failed = [] {
        uninstall_native_input_hooks();
        return false;
    };
    if (profile.entry && !g_native_text_input_entry.install("Native text-input entry")) return failed();
    for (auto &hook : g_native_text_input_imports)
        if (!hook.install("Native text-input binding")) return failed();
    for (auto &hook : g_native_start_input_imports)
        if (!hook.install("SDL text-input binding")) return failed();
    if (!install_native_ime_hooks()) return failed();
    g_native_input_ready = true;
    log_line("INFO", "Enabled shared Unicode editing, IME positioning and translated Arena search");
    return true;
}

static void native_cleanup() {
    // Called only after every feature detached and callbacks reached zero.
    g_real_native_text_input = nullptr;
    g_native_text_input_imports.clear();
    g_native_start_input_imports.clear();
    clear_native_arena_context();
    clear_name_editor_search();
    cleanup_native_ime_state();
}
