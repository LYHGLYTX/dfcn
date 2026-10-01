// Overview memory circumstance 233 names a history-event collection. Retain
// its typed identity and roles while the original formatter owns the inputs;
// the generated English title alone cannot identify all eighteen families.
#ifdef _WIN32
// Steam 53.16 AMD64 call 1a6f1f -> 66fe50:
// RCX/RDX are unit pointers, R8 is the output string, R9D is the circumstance.
// The caller copies emotion +10/+14 as DWORD stack arguments five and six.
// 66fe8c loads argument five into EDI; 673093 uses EDI as the collection ID.
using NativeOverviewEventFn = void (*)(void *, void *, NativeString *,
    int32_t, int32_t, int32_t);

struct NativeOverviewEventSource {
    std::string source;
    int32_t collection_id = -1;
    bool ambiguous = false;
    std::shared_ptr<const NativeHistoryDocument> document;
};

static std::mutex g_native_overview_event_mutex;
static std::array<NativeOverviewEventSource, 256> g_native_overview_event_sources;
static size_t g_native_overview_event_next = 0;
static NativeCallHook g_native_overview_event_hooks;
static NativeOverviewEventFn g_native_overview_event_original = nullptr;

static void remember_native_overview_event_source(std::string source,
        int32_t collection_id, std::shared_ptr<const NativeHistoryDocument> document) {
    std::lock_guard<std::mutex> lock(g_native_overview_event_mutex);
    for (auto &entry : g_native_overview_event_sources) {
        if (entry.source.empty()) break;
        if (entry.source != source) continue;
        // Two collections may display the same title while carrying different
        // participants or object roles. Never select one merely by its text.
        if (entry.collection_id != collection_id) entry.ambiguous = true;
        if (entry.ambiguous) entry.document.reset();
        else entry.document = std::move(document);
        return;
    }
    g_native_overview_event_sources[g_native_overview_event_next] = {
        std::move(source), collection_id, false, std::move(document)};
    g_native_overview_event_next = (g_native_overview_event_next + 1) %
        g_native_overview_event_sources.size();
}

static std::shared_ptr<const NativeHistoryDocument> native_overview_event_source(
        std::string_view normalized_sentence) {
    try {
        if (!normalized_sentence.starts_with("It was ") ||
                !normalized_sentence.ends_with('.')) return {};
        std::lock_guard<std::mutex> lock(g_native_overview_event_mutex);
        for (const auto &entry : g_native_overview_event_sources) {
            if (entry.source.empty()) break;
            if (entry.source == normalized_sentence)
                return entry.ambiguous ? nullptr : entry.document;
        }
    } catch (...) {
        // An optional owned snapshot must never unwind into the native UI.
    }
    return {};
}

static void capture_native_overview_event(void *unit, void *other,
        NativeString *output, int32_t circumstance, int32_t data, int32_t subdata) {
    NativeInputCallbackScope callback;
    callback.call_native([&] {
        g_native_overview_event_original(unit, other, output, circumstance, data, subdata);
    });
    // Every other circumstance, including the native no-sentence cases, keeps
    // the exact original call and follows its existing sentence vocabulary.
    if (circumstance != 233 || data < 0) return;
    try {
        std::string_view native;
        if (!native_string_view(output, &native, 262144)) return;
        std::string source = normalize_utterance(native);
        // The failed/empty title is "It was." and belongs to the glossary.
        if (!source.starts_with("It was ") || !source.ends_with('.')) return;
        std::shared_ptr<const NativeHistoryDocument> captured;
        try {
            auto document = std::make_shared<NativeHistoryDocument>();
            auto &event = document->event;
            event.fields["overview_collection"] = {data};
            if (capture_native_history_collection_title(data, event) &&
                    populate_native_history_subjects(event) &&
                    capture_native_history_subject_item_labels(event) &&
                    native_history_tree_within_limits(event, true)) {
                document->native_source = source;
                captured = std::move(document);
            }
        } catch (...) {
            // Even a declined snapshot must invalidate a prior text collision
            // with another ID rather than silently reusing that other record.
        }
        remember_native_overview_event_source(std::move(source), data, std::move(captured));
    } catch (...) {
        // Capture never changes the game's string or its original result.
    }
}

static bool native_overview_event_hooks_active() {
    return g_native_overview_event_hooks.active();
}

static void uninstall_native_overview_event_hooks() {
    if (!native_callbacks_idle()) return;
    if (!g_native_overview_event_hooks.uninstall("Native overview event source restore")) return;
    g_native_overview_event_original = nullptr;
    std::lock_guard<std::mutex> lock(g_native_overview_event_mutex);
    for (auto &entry : g_native_overview_event_sources) entry = {};
    g_native_overview_event_next = 0;
}

static bool install_native_overview_event_hooks() {
    if (g_native_overview_event_hooks.installed) return true;
    if (native_overview_event_hooks_active()) {
        uninstall_native_overview_event_hooks();
        if (native_overview_event_hooks_active()) return false;
    }
    const uintptr_t base = native_history_profile_base();
    if (!base) return false;
    g_native_overview_event_original =
        reinterpret_cast<NativeOverviewEventFn>(native_pe_address(base, 0x66fe50));
    struct InstallGuard {
        bool committed = false;
        ~InstallGuard() { if (!committed) uninstall_native_overview_event_hooks(); }
    } guard;
    std::vector<NativeCall> calls{
        {0x1a6f1f, 0x66fe50, reinterpret_cast<const void *>(&capture_native_overview_event)},
    };
    if (!native_reference_calls(calls, 0) ||
            !g_native_overview_event_hooks.install(base, calls, "Native overview event source"))
        return false;
    guard.committed = true;
    return true;
}
#else
static std::shared_ptr<const NativeHistoryDocument> native_overview_event_source(std::string_view) {
    return {};
}
static bool native_overview_event_hooks_active() { return false; }
static bool install_native_overview_event_hooks() { return true; }
static void uninstall_native_overview_event_hooks() {}
#endif
