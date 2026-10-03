// The Kitchen food predicate owns its type/permission filters and removes
// rejected records before native sorting. Extend only its text comparison;
// the complete food name is still borrowed from the current native entry.
struct NativeKitchenSearchProfile {
    uintptr_t base = 0;
    NativeSearchFoldFn fold = nullptr;
    std::vector<NativeCall> calls;
};
static void capture_native_kitchen_search_query_fold(NativeString *);
static size_t capture_native_kitchen_search_find(const char *, size_t,
    const NativeString *, const char *, size_t);
#include "native_kitchen_search_profile_pe.inc"

static NativeCallHook g_native_kitchen_search_hook;
static NativeSearchFoldFn g_native_kitchen_search_fold = nullptr;

static void capture_native_kitchen_search_query_fold(NativeString *query) {
    fold_native_search_query(query, g_native_kitchen_search_fold);
}

static size_t capture_native_kitchen_search_find(const char *text, size_t length,
        const NativeString *caption, const char *query_text, size_t query_length) {
    NativeInputCallbackScope callback;
    const size_t result = native_search_byte_find(text, length, 0, query_text, query_length);
    if (result != SIZE_MAX) return result;
    try {
        if (!g_overlay.translation_enabled() || !query_text ||
            query_length == 0 || query_length > 4096) return result;
        std::string_view source;
        if (!native_string_view(caption, &source, 65536) || source.empty() ||
            source.find('\0') != std::string_view::npos) return result;
        // fortress_kitchen.inc renders this same food field through exact
        // dictionary, creature/sex and compositional translation. The common
        // matcher uses those productions with literal, pinyin and initials.
        if (g_overlay.translated_search_matches(source,
                std::string_view(query_text, query_length))) return 0;
    } catch (...) {
        // Allocation/translation failures retain the original native result.
    }
    return result;
}

static bool native_kitchen_search_hook_active() {
    return g_native_kitchen_search_hook.active();
}

static void uninstall_native_kitchen_search_hook() {
    if (!native_callbacks_idle()) return;
    if (g_native_kitchen_search_hook.uninstall("Native Kitchen translated search"))
        g_native_kitchen_search_fold = nullptr;
}

static bool install_native_kitchen_search_hook() {
    if (g_native_kitchen_search_hook.installed) return true;
    if (native_kitchen_search_hook_active()) {
        uninstall_native_kitchen_search_hook();
        if (native_kitchen_search_hook_active()) return false;
    }
    NativeKitchenSearchProfile profile;
    if (!resolve_native_kitchen_search_profile(profile) || !profile.fold) return false;
    g_native_kitchen_search_fold = profile.fold;
    if (!g_native_kitchen_search_hook.install(profile.base, profile.calls,
            "Native Kitchen translated search")) {
        uninstall_native_kitchen_search_hook();
        return false;
    }
    log_line("INFO", "Enabled translated Kitchen food search; native type, cooking/brewing permission and sorting preserved");
    return true;
}
