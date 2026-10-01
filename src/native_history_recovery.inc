// Rebind a retained chronicle after a core reload. The real history vector
// supplies event IDs/types/fields. Re-render ONLY supported native records
// through their original formatter and rich-text tokenizer into owned scratch
// storage, then require an exact, unique token/link match against the live box.
// No English sentence parsing, name-prefix matching or guessed event boundary.
static void recover_native_history_chronicle() {
    // addst runs once per word. Inspect a retained box at most once per draw
    // epoch, rather than recopying its entire tail for every glyph span.
    static uint64_t inspected_epoch = UINT64_MAX;
    const uint64_t epoch = g_embark_item_capture_epoch.load(std::memory_order_acquire);
    if (inspected_epoch == epoch) return;
    inspected_epoch = epoch;
    auto *box = g_native_history_box;
    if (!box || !native_history_worldgen_page()) return;
    const size_t total = native_history_word_count(box);
    if (!total || total == SIZE_MAX || !g_real_native_history_append) return;
    int32_t last_id = -1;
    if (!native_history_copy(native_history_global(0x24ec88c), last_id) || last_id < 0) return;
    // Allocations can be reused across rejected worlds. Include the current
    // last event pointer and every tail token's content in the fingerprint.
    NativeBorrowedVector<uintptr_t> events;
    if (!native_history_read_vector(native_history_global(0x24f9cb8), events)) return;
    size_t first = 0, end = events.size();
    while (first < end) {
        const size_t mid = first + (end - first) / 2;
        const auto ptr = native_history_vector_at(events, mid);
        int32_t id = -1;
        if (!ptr || !native_history_copy(ptr + 0x20, id)) return;
        if (id <= last_id) first = mid + 1; else end = mid;
    }
    if (!end) return;
    const uintptr_t last_event = native_history_vector_at(events, end - 1);
    const size_t tail_begin = total > kNativeHistoryDocumentTokens ? total - kNativeHistoryDocumentTokens : 0;
    std::vector<NativeHistoryToken> live;
    if (!copy_native_history_tokens(box, tail_begin, live, total - tail_begin)) return;
    struct Fingerprint {
        uintptr_t last_event = 0;
        int32_t last_id = -1;
        size_t total = 0;
        std::vector<NativeHistoryToken> tokens;
    };
    static Fingerprint attempted;
    if (attempted.last_event == last_event && attempted.last_id == last_id && attempted.total == total &&
        attempted.tokens.size() == live.size() &&
        std::equal(live.begin(), live.end(), attempted.tokens.begin(), same_native_history_token)) return;
    attempted = {last_event, last_id, total, live};

    std::unordered_set<uintptr_t> owned;
    for (const auto &doc : captured_native_history_documents())
        if (doc->owner == reinterpret_cast<uintptr_t>(box))
            for (const auto &token : doc->tokens) owned.insert(token.identity);
    if (std::all_of(live.begin(), live.end(), [&](const auto &token) { return owned.contains(token.identity); }))
        return;
    std::set<std::pair<int, int32_t>> links;
    for (const auto &token : live)
        if (token.link_type >= 0) links.emplace(token.link_type, token.link_id);

    // Exact worldgen context initialization at d2b7f5..d2b942. Evidence
    // pointers are null, flags=2, number=1; other IDs are -1. No game state
    // or live output string is mutated during recovery.
    alignas(16) std::array<unsigned char, 0xc8> context;
    initialize_native_history_context(context.data());
    std::vector<std::shared_ptr<NativeHistoryDocument>> ready;
    std::vector<std::pair<size_t, size_t>> ranges;
    std::set<size_t> ambiguous;
    const size_t begin = end > 16384 ? end - 16384 : 0;
    for (size_t index = begin; index < end; ++index) {
        const uintptr_t event = native_history_vector_at(events, index);
        auto snapshot = snapshot_native_history_event(reinterpret_cast<void *>(event), context.data());
        if (!snapshot || snapshot->fields.contains("snapshot.incomplete")) continue;
        // Use typed native link identities to reject unrelated records before
        // invoking a formatter, not prose fragments or translated names.
        const auto linked = [&](NativeHistoryObjectKind kind, int32_t id) {
            if (id < 0) return false;
            const int type = kind == NativeHistoryObjectKind::Figure ? 0 :
                kind == NativeHistoryObjectKind::Site ? 1 : kind == NativeHistoryObjectKind::Artifact ? 2 :
                kind == NativeHistoryObjectKind::Region ? 4 : kind == NativeHistoryObjectKind::Underground ? 5 :
                kind == NativeHistoryObjectKind::Entity ? 6 : kind == NativeHistoryObjectKind::Collection ? 9 : -2;
            return links.contains({type, id}) || (kind == NativeHistoryObjectKind::Artifact && links.contains({3, id}));
        };
        bool relevant = links.empty() || linked(NativeHistoryObjectKind::Figure, snapshot->actor_id) ||
            linked(NativeHistoryObjectKind::Artifact, snapshot->artifact_id) ||
            linked(NativeHistoryObjectKind::Entity, snapshot->entity_id) ||
            linked(NativeHistoryObjectKind::Site, snapshot->site_id);
        for (const auto &[kind, id] : snapshot->references) relevant = relevant || linked(kind, id);
        if (!relevant || !populate_native_history_subjects(*snapshot)) continue;
        uintptr_t table = 0, formatter = 0;
        if (!native_history_copy(event, table) || !native_history_copy(table + 0xd0, formatter)) continue;
        NativeHistoryScratch scratch;
        {
            NativeHistoryActiveScope active(&*snapshot);
            reinterpret_cast<NativeHistorySentenceFn>(formatter)(reinterpret_cast<void *>(event),
                &scratch.source, context.data(), true, false);
        }
        std::string_view source;
        if (!native_string_view(&scratch.source, &source, kNativeHistoryStringLimit) || source.empty()) continue;
        const std::string original(source);
        reinterpret_cast<NativeString *(*)(NativeString *, const char *)>(
            native_history_page_address(NativeHistoryPageSymbol::AppendLiteral))(&scratch.source, "[R]");
        scratch.box.environment = box->environment;
        g_real_native_history_append(&scratch.box, &scratch.source);
        std::vector<NativeHistoryToken> tokens;
        if (!copy_native_history_tokens(&scratch.box, 0, tokens) || tokens.empty() || tokens.size() > live.size())
            continue;
        const auto equal = [](const auto &a, const auto &b) {
            return a.source == b.source && a.color == b.color && a.link_type == b.link_type &&
                a.link_id == b.link_id && a.link_subid == b.link_subid;
        };
        size_t matched = SIZE_MAX;
        for (size_t at = 0; at <= live.size() - tokens.size(); ++at) {
            if (owned.contains(live[at].identity) ||
                !std::equal(tokens.begin(), tokens.end(), live.begin() + at, equal)) continue;
            if (matched != SIZE_MAX) { matched = SIZE_MAX; break; }
            matched = at;
        }
        if (matched == SIZE_MAX) continue;
        const size_t limit = matched + tokens.size();
        bool overlap = false;
        for (size_t n = 0; n < ranges.size(); ++n)
            if (matched < ranges[n].second && limit > ranges[n].first) {
                ambiguous.insert(n);
                overlap = true;
            }
        if (overlap) continue;
        auto doc = std::make_shared<NativeHistoryDocument>();
        doc->owner = reinterpret_cast<uintptr_t>(box);
        doc->event = std::move(*snapshot);
        doc->native_source = original;
        doc->tokens.assign(live.begin() + matched, live.begin() + limit);
        ranges.emplace_back(matched, limit);
        ready.push_back(std::move(doc));
    }
    for (auto it = ambiguous.rbegin(); it != ambiguous.rend(); ++it) ready.erase(ready.begin() + *it);
    if (!ready.empty() && remember_native_history_documents(ready))
        log_line("INFO", "Recovered retained native chronicle records after reload: " + std::to_string(ready.size()));
}
