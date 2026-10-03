// Adventure-log filters restore the native candidate
// vector, folds disposable search keys, then runs an inlined substring search.
// No native records, list identities or selection logic are replaced.
static NativeCallHook g_native_journal_search_hook;
static NativeSearchFoldFn g_native_journal_search_fold = nullptr;
struct NativeJournalSearchProfile {
    uintptr_t base = 0;
    NativeSearchFoldFn fold = nullptr;
    std::vector<NativeCall> calls;
};

static void capture_native_journal_search_query(NativeString *query) {
    fold_native_search_query(query, g_native_journal_search_fold);
}

template<JournalSearchKind Kind>
static void capture_native_journal_search_term(NativeString *term,
        const NativeString *query_string, const NativeString *display_source) {
    NativeInputCallbackScope callback;
    std::string source;
    try {
        std::string_view query, caption;
        if (g_overlay.translation_enabled() &&
            native_string_view(query_string, &query, 4096) &&
            !query.empty() &&
            native_string_view(display_source, &caption, 65536)) source.assign(caption);
    } catch (...) {}
    prepare_native_inlined_search_term(term, query_string, g_native_journal_search_fold,
        [&](std::string_view, std::string_view query) {
            return !source.empty() &&
                g_overlay.translated_journal_search_matches(source, query, Kind);
        });
}

#ifdef _WIN32
#include "native_journal_search_profile_pe.inc"
#endif

static bool native_journal_search_hook_active() {
    return g_native_journal_search_hook.active();
}

static void uninstall_native_journal_search_hook() {
    if (!native_callbacks_idle()) return;
    if (g_native_journal_search_hook.uninstall("Native adventure journal search"))
        g_native_journal_search_fold = nullptr;
}

static bool install_native_journal_search_hook() {
    if (g_native_journal_search_hook.installed) return true;
    if (native_journal_search_hook_active()) {
        uninstall_native_journal_search_hook();
        if (native_journal_search_hook_active()) return false;
    }
    NativeJournalSearchProfile profile;
#ifdef _WIN32
    if (!resolve_native_journal_search_profile_pe(profile)) return false;
#else
    const uintptr_t base = native_history_profile_base();
    // Reference ELF bcc6789: owner+2a8 is the input, stack+70 its working
    // query. The relay has pushed its return address, hence RSI = RSP+78.
    // Every callback receives an explicit complete display source before
    // simplify_string destroys spelling. For events this is summary+68;
    // list_name+28 is only an index. The remaining branches copy the full
    // list_name: people/sites/groups/regions/artifacts +08, bestiary +10,
    // agreements +20, intrigue actors/organizations +18, plots +00.
    // Plots also search organization_name+70 with its own name grammar.
    const NativeSearchBinding<NativeJournalSearchProfile> bindings[]{
        {{
            {0x13d92b0, {0xf3,0x0f,0x1e,0xfa,0x41,0x57,0x41,0x56,0x41,0x55,
                0x41,0x54,0x49,0x89,0xfc,0x55,0x53,0x48,0x81,0xec,0xe8,0,0,0}},
            {0x13d92c8, {0x48,0x8b,0xb7,0xa8,0x02,0,0,0x48,0x8b,0x97,0xb0,0x02,0,0}},
            {0x13d9312, {0x48,0x89,0xef,0xe8,0x26,0xc6,0xc4,0xfe,
                0x66,0x41,0x83,0xbc,0x24,0x76,0x02,0,0,0x08}},
            {0x13da72c, {0x48,0x8b,0x4c,0x24,0x08,0x48,0x8b,0x50,0x30,
                0x48,0x89,0x8c,0x24,0xb0,0,0,0,0x48,0x8b,0x70,0x28}},
            {0x13da6a0, {0x49,0x8d,0xbc,0x24,0x98,0x05,0,0}},
            {0x13da720, {0x48,0x8b,0x4c,0x24,0x18,0x4c,0x89,0xf7,0x48,0x8b,0x04,0x08}},
            {0x13e0018, {0x48,0x8d,0xbd,0xa8,0x02,0,0,0x48,0x89,0xd9,
                0xba,0x0f,0,0,0,0xbe,0x14,0,0,0,0xe8,0xbf,0x49,0xc4,0xfe}}
        }, {0, reinterpret_cast<NativeSearchFoldFn>(native_reference_address(base, 0x25940)), {
            {0x13d9315, 0x25940, reinterpret_cast<const void *>(&capture_native_journal_search_query)},
            // R12 is the owner. Stack+18 holds the byte offset of the
            // candidate in owner+598; account for the relay return address.
            {0x13da74c, 0x25940, reinterpret_cast<const void *>(&capture_native_journal_search_term<JournalSearchKind::Event>),
                {0x48,0x8d,0x74,0x24,0x78,
                 0x49,0x8b,0x94,0x24,0x98,0x05,0,0,
                 0x48,0x8b,0x4c,0x24,0x20,
                 0x48,0x8b,0x14,0x0a,0x48,0x83,0xc2,0x68}},
            {0x13da317, 0x25940, reinterpret_cast<const void *>(&capture_native_journal_search_term<JournalSearchKind::Agreement>), {0x48,0x8d,0x74,0x24,0x78,0x48,0x89,0xfa}},
            {0x13da987, 0x25940, reinterpret_cast<const void *>(&capture_native_journal_search_term<JournalSearchKind::Person>), {0x48,0x8d,0x74,0x24,0x78,0x48,0x89,0xfa}},
            {0x13d9c57, 0x25940, reinterpret_cast<const void *>(&capture_native_journal_search_term<JournalSearchKind::Site>), {0x48,0x8d,0x74,0x24,0x78,0x48,0x89,0xfa}},
            {0x13d9eb7, 0x25940, reinterpret_cast<const void *>(&capture_native_journal_search_term<JournalSearchKind::Group>), {0x48,0x8d,0x74,0x24,0x78,0x48,0x89,0xfa}},
            {0x13da0c7, 0x25940, reinterpret_cast<const void *>(&capture_native_journal_search_term<JournalSearchKind::Region>), {0x48,0x8d,0x74,0x24,0x78,0x48,0x89,0xfa}},
            {0x13da527, 0x25940, reinterpret_cast<const void *>(&capture_native_journal_search_term<JournalSearchKind::Creature>), {0x48,0x8d,0x74,0x24,0x78,0x48,0x89,0xfa}},
            {0x13d9757, 0x25940, reinterpret_cast<const void *>(&capture_native_journal_search_term<JournalSearchKind::Artifact>), {0x48,0x8d,0x74,0x24,0x78,0x48,0x89,0xfa}},
            {0x13d99d4, 0x25940, reinterpret_cast<const void *>(&capture_native_journal_search_term<JournalSearchKind::Actor>), {0x48,0x8d,0x74,0x24,0x78,0x48,0x89,0xfa}},
            {0x13daf54, 0x25940, reinterpret_cast<const void *>(&capture_native_journal_search_term<JournalSearchKind::Organization>), {0x48,0x8d,0x74,0x24,0x78,0x48,0x89,0xfa}},
            {0x13d940b, 0x25940, reinterpret_cast<const void *>(&capture_native_journal_search_term<JournalSearchKind::Plot>), {0x48,0x8d,0x74,0x24,0x78,0x48,0x89,0xfa}},
            {0x13d943f, 0x25940, reinterpret_cast<const void *>(&capture_native_journal_search_term<JournalSearchKind::PlotOrganization>), {0x48,0x8d,0x74,0x24,0x78,0x48,0x89,0xfa}}
        }}}
    };
    if (!resolve_native_search_binding(bindings, profile, "Adventure journal search")) return false;
#endif
    g_native_journal_search_fold = profile.fold;
    if (!g_native_journal_search_hook.install(profile.base, profile.calls,
                                              "Native adventure journal search")) {
        uninstall_native_journal_search_hook();
        return false;
    }
    log_line("INFO", "Enabled translated and pinyin adventure journal search across all native tabs");
    return true;
}
