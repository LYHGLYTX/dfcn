// Counterintelligence keeps separate complete actor, organization and plot
// catalogs. Share their display grammar with the journal and leave native
// candidate traversal, selection and organization-chart construction intact.
struct NativeJusticeSearchProfile {
    uintptr_t base = 0;
    NativeSearchFoldFn fold = nullptr;
    std::vector<NativeCall> calls;
};
static void capture_native_justice_search_query(NativeString *);
template<JournalSearchKind Kind>
static void capture_native_justice_search_term(NativeString *, const NativeString *);
#include "native_justice_search_profile_pe.inc"

static NativeCallHook g_native_justice_search_hook;
static NativeSearchFoldFn g_native_justice_search_fold = nullptr;

static void capture_native_justice_search_query(NativeString *query) {
    fold_native_search_query(query, g_native_justice_search_fold);
}

template<JournalSearchKind Kind>
static void capture_native_justice_search_term(NativeString *term,
        const NativeString *query) {
    // The filter just copied the complete list_name/organization_name here.
    // Its clipped p_list_name and persistent simplified key are never used.
    prepare_native_inlined_search_term(term, query, g_native_justice_search_fold,
        [&](std::string_view source, std::string_view needle) {
            return g_overlay.translated_journal_search_matches(source, needle, Kind);
        });
}

static bool native_justice_search_hook_active() {
    return g_native_justice_search_hook.active();
}

static void uninstall_native_justice_search_hook() {
    if (!native_callbacks_idle()) return;
    if (g_native_justice_search_hook.uninstall("Native counterintelligence search"))
        g_native_justice_search_fold = nullptr;
}

static bool install_native_justice_search_hook() {
    if (g_native_justice_search_hook.installed) return true;
    if (native_justice_search_hook_active()) {
        uninstall_native_justice_search_hook();
        if (native_justice_search_hook_active()) return false;
    }
    NativeJusticeSearchProfile profile;
    if (!resolve_native_justice_search_profile(profile) || !profile.fold) return false;
    g_native_justice_search_fold = profile.fold;
    if (!g_native_justice_search_hook.install(profile.base, profile.calls,
                                             "Native counterintelligence search")) {
        uninstall_native_justice_search_hook();
        return false;
    }
    log_line("INFO", "Enabled translated counterintelligence actor, organization and plot search");
    return true;
}
