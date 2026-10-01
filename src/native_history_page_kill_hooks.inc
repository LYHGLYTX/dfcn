// Figure and item producers share one record collector and boundary binder.
// Source bytes establish ownership only; identities, dates and counts come
// from the native combat records, including an item's slayer section.
using NativeHistoryKillSummaryFn = void (*)(void *, NativeString *, int32_t);
static void capture_native_history_kill_summary_call(void *object, NativeString *source,
        int32_t flags, bool item, NativeHistoryKillSummaryFn original) {
    NativeHistoryCallbackScope callback;
    std::vector<std::pair<NativeHistoryPageData, char>> records;
    size_t begin = SIZE_MAX;
    try {
        const uintptr_t address = reinterpret_cast<uintptr_t>(object);
        uintptr_t info = 0, kills = 0;
        int32_t mode = -1;
        NativeBorrowedVector<int32_t> notable, counts;
        std::string_view prefix;
        const uintptr_t mode_address = native_history_page_address(NativeHistoryPageSymbol::Mode);
        const uintptr_t events_address = native_history_page_address(NativeHistoryPageSymbol::Events);
        if (native_history_legends_state().active) {
            if (item) {
                uintptr_t profile = 0;
                if (!native_history_copy(native_history_object_field(address, "", 0x88), profile) ||
                    (profile && !native_history_copy(native_history_object_field(
                        profile, "item_profilest", 0), info)) ||
                    (info && !native_history_copy(native_history_object_field(
                        info, "item_history_info", 0), kills)))
                    throw std::runtime_error("unreadable item combat record");
            } else if (!native_history_copy(address + 0x130, info) ||
                    (info && !native_history_copy(info + 0x30, kills)))
                throw std::runtime_error("unreadable figure combat record");
        }
        if (native_history_legends_state().active &&
            native_string_view(source, &prefix, kNativeHistorySourceLimit) &&
            native_history_copy(mode_address, mode) && mode > 1 &&
            kills &&
            native_history_copy(kills, notable) && notable.valid(16384) &&
            native_history_copy(kills + 0xa8, counts) && counts.valid(16384)) {
            begin = prefix.size();
            int64_t total = 0;
            for (size_t i = 0; i < counts.size(); ++i) {
                int32_t count = -1;
                if (!native_history_copy(reinterpret_cast<uintptr_t>(counts.begin) + i * 4, count) || count < 0)
                    throw std::runtime_error("invalid native kill count");
                total += count;
            }
            if (total > INT32_MAX) throw std::runtime_error("native kill count overflow");
            const auto append = [&](std::optional<NativeHistoryPageData> record, char control) {
                if (!record) throw std::runtime_error("incomplete native kill record");
                records.emplace_back(std::move(*record), control);
            };
            if (notable.size()) {
                append(snapshot_native_history_kill_header(notable.size(), counts.size() ? 1 : 0), 'B');
                for (size_t i = 0; i < notable.size(); ++i) {
                    int32_t id = -1;
                    uintptr_t event = 0;
                    if (!native_history_copy(reinterpret_cast<uintptr_t>(notable.begin) + i * 4, id) ||
                        !native_history_material_find_id(events_address, 0x20, id, event))
                        throw std::runtime_error("unreadable native death event");
                    append(snapshot_native_history_kill_event(event, id), 'R');
                }
            }
            if (counts.size() || !notable.size()) {
                append(snapshot_native_history_kill_header(total, notable.size() ? 2 : 0), 'B');
                for (size_t i = 0; i < counts.size(); ++i)
                    append(snapshot_native_history_kill_group(kills, i), 'R');
            }
            if (item) {
                NativeBorrowedVector<int32_t> slayers, slayer_counts;
                if (!native_history_copy(native_history_object_field(kills, "item_kill_info", 0xc0), slayers) ||
                    !native_history_copy(native_history_object_field(kills, "item_kill_info", 0xd8), slayer_counts) ||
                    !slayers.valid(16384) || !slayer_counts.valid(16384) ||
                    slayers.size() != slayer_counts.size())
                    throw std::runtime_error("unreadable item slayer records");
                if (slayers.size()) {
                    NativeHistoryPageData heading;
                    heading.kind = NativeHistoryPageKind::SectionHeading;
                    heading.data.texts["heading"] = slayers.size() == 1 ? "Slayer" : "Slayers";
                    append(std::move(heading), 'B');
                }
                for (size_t i = 0; i < slayers.size(); ++i) {
                    int32_t id = -1, count = -1;
                    if (!native_history_copy(reinterpret_cast<uintptr_t>(slayers.begin) + i * 4, id) ||
                        !native_history_copy(reinterpret_cast<uintptr_t>(slayer_counts.begin) + i * 4, count) ||
                        count < 0) throw std::runtime_error("invalid item slayer record");
                    append(snapshot_native_history_kill_figure(id, 4, count), 'R');
                }
            }
        }
    } catch (...) { begin = SIZE_MAX; }
    original(object, source, flags);
    try {
        auto *page = native_history_legends_state().active;
        std::string_view text;
        if (!page || begin == SIZE_MAX || !native_string_view(source, &text, kNativeHistorySourceLimit) ||
            begin > text.size()) return;
        std::vector<NativeHistoryLegendsSpan> spans;
        size_t first = begin, record = 0;
        for (size_t at = begin; at < text.size();) {
            if (text[at] != '[') { ++at; continue; }
            if (at + 1 < text.size() && text[at + 1] == '[') { at += 2; continue; }
            const size_t last = text.find(']', at + 1);
            if (last == std::string::npos) return;
            const bool boundary = last == at + 2 && (text[at + 1] == 'R' || text[at + 1] == 'B');
            if (boundary) {
                if (at > first) {
                    if (record >= records.size() || records[record].second != text[at + 1]) return;
                    NativeHistoryLegendsSpan span;
                    span.begin = first;
                    span.end = at;
                    span.source.assign(text.substr(first, at - first));
                    span.page = std::move(records[record++].first);
                    if (!native_history_tree_within_limits(span.page->data, true)) return;
                    spans.push_back(std::move(span));
                }
                first = last + 1;
            }
            at = last + 1;
        }
        if (record != records.size() || first != text.size() ||
            spans.size() > kNativeHistoryCaptureDocuments - page->spans.size()) return;
        for (auto &span : spans) page->spans.push_back(std::move(span));
    } catch (...) {}
}

static void capture_native_history_kill_summary(void *figure, NativeString *source, int32_t flags) {
    capture_native_history_kill_summary_call(figure, source, flags, false,
        reinterpret_cast<NativeHistoryKillSummaryFn>(
            native_history_page_address(NativeHistoryPageSymbol::KillSummary)));
}

static void capture_native_history_item_kill_summary(void *item, NativeString *source, int32_t flags) {
    // Preserve the exact virtual function selected by the native caller.
    // Slot layout belongs to the common ABI schema, not to page semantics.
    const void *table = nullptr;
    NativeHistoryKillSummaryFn original = nullptr;
    std::memcpy(&table, item, sizeof(table));
    std::memcpy(&original, static_cast<const unsigned char *>(table) +
        native_history_item_kill_slot(), sizeof(original));
    capture_native_history_kill_summary_call(item, source, flags, true, original);
}
