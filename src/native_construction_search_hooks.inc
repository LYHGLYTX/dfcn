// construction.item_filter belongs to the building-material selector. Its
// candidates are build_req_choicest records, whose compstr is folded in place;
// getName supplies the complete case-preserved caption used by native rows.
struct NativeConstructionSearchProfile {
    uintptr_t base = 0;
    NativeSearchFoldFn fold = nullptr;
    NativeSearchDestroyFn destroy = nullptr;
    std::vector<NativeCall> calls;
};
static void capture_native_construction_search_query_fold(NativeString *);
static size_t capture_native_construction_search_find(const char *, size_t,
    const void *, const char *, size_t);
#include "native_construction_search_profile_pe.inc"

static NativeCallHook g_native_construction_search_hook;
static NativeSearchFoldFn g_native_construction_search_fold = nullptr;
static NativeSearchDestroyFn g_native_construction_search_destroy = nullptr;

static void capture_native_construction_search_query_fold(NativeString *query) {
    fold_native_search_query(query, g_native_construction_search_fold);
}

static size_t capture_native_construction_search_find(const char *text, size_t length,
        const void *candidate, const char *query_text, size_t query_length) {
    NativeInputCallbackScope callback;
    const size_t result = native_search_byte_find(text, length, 0, query_text, query_length);
    if (result != SIZE_MAX) return result;
    try {
        if (!g_overlay.translation_enabled() || !query_text ||
            query_length == 0 || query_length > 4096 ||
            !g_native_construction_search_destroy) return result;
        uintptr_t vtable = 0, caption_method = 0;
        if (!native_history_copy(reinterpret_cast<uintptr_t>(candidate), vtable) ||
            !vtable || !native_history_copy(vtable + 2 * sizeof(uintptr_t), caption_method) ||
            !caption_method) return result;
        NativeSearchString caption(g_native_construction_search_destroy);
        using CaptionFn = void (*)(const void *, NativeString *);
        callback.call_native([&] {
            reinterpret_cast<CaptionFn>(caption_method)(candidate, &caption.value);
        });
        std::string_view source;
        if (!native_string_view(&caption.value, &source, 65536) || source.empty() ||
            source.find('\0') != std::string_view::npos) return result;
        if (g_overlay.translated_item_search_matches(source,
                std::string_view(query_text, query_length), true)) return 0;
    } catch (...) {
        // Caption/translation allocation failures retain native rejection.
    }
    return result;
}

static bool native_construction_search_hook_active() {
    return g_native_construction_search_hook.active();
}

static void uninstall_native_construction_search_hook() {
    if (!native_callbacks_idle()) return;
    if (g_native_construction_search_hook.uninstall("Native construction translated search")) {
        g_native_construction_search_fold = nullptr;
        g_native_construction_search_destroy = nullptr;
    }
}

static bool install_native_construction_search_hook() {
    if (g_native_construction_search_hook.installed) return true;
    if (native_construction_search_hook_active()) {
        uninstall_native_construction_search_hook();
        if (native_construction_search_hook_active()) return false;
    }
    NativeConstructionSearchProfile profile;
    if (!resolve_native_construction_search_profile(profile) ||
        !profile.fold || !profile.destroy) return false;
    g_native_construction_search_fold = profile.fold;
    g_native_construction_search_destroy = profile.destroy;
    if (!g_native_construction_search_hook.install(profile.base, profile.calls,
            "Native construction translated search")) {
        uninstall_native_construction_search_hook();
        return false;
    }
    log_line("INFO", "Enabled translated construction material search over complete native item captions");
    return true;
}
