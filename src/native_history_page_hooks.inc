#include "native_history_page_calls.inc"
// Exact native producer call sites delimit records which are not virtual
// getSentence calls. Their text buffers establish token ownership only;
// meaning is copied independently from the native arguments and structures.
using NativeHistoryLiteralFn = NativeString *(*)(NativeString *, const char *);
using NativeHistoryLiteralCountFn = NativeString *(*)(NativeString *, const char *, size_t);

template<typename Invoke>
static void capture_native_history_relationship_call(void *history, void *chunk,
        int32_t index, NativeString *source, void *context, Invoke &&invoke) {
    NativeHistoryCallbackScope callback;
    auto *page = native_history_legends_state().active;
    size_t begin = SIZE_MAX;
    std::optional<NativeHistoryEventData> snapshot;
    try {
        std::string_view prefix;
        if (page && page->source_started && page->local_source &&
            native_string_view(source, &prefix, kNativeHistorySourceLimit)) {
            begin = prefix.size();
            snapshot = snapshot_native_history_relationship(history, chunk, index, context);
        }
    } catch (...) {}
    {
        NativeHistoryActiveScope active(snapshot ? &*snapshot : nullptr);
        invoke();
    }
    if (!page || begin == SIZE_MAX) return;
    try {
        std::string_view complete;
        if (!snapshot || !populate_native_history_subjects(*snapshot) ||
            !native_history_tree_within_limits(*snapshot) ||
            !native_string_view(source, &complete, kNativeHistorySourceLimit) || begin >= complete.size() ||
            complete.size() - begin > kNativeHistoryStringLimit ||
            page->spans.size() >= kNativeHistoryCaptureDocuments) {
            ++page->missing_snapshots;
            return;
        }
        NativeHistoryLegendsSpan span;
        span.begin = begin;
        span.end = complete.size();
        span.source.assign(complete.substr(begin));
        span.event = std::move(*snapshot);
        page->spans.push_back(std::move(span));
    } catch (...) { ++page->missing_snapshots; }
}

static NativeString *capture_native_history_battle_begin(NativeString *source, const char *literal) {
    NativeHistoryCallbackScope callback;
    try { begin_native_history_page_segment(source); } catch (...) {}
    return reinterpret_cast<NativeHistoryLiteralFn>(native_history_page_address(NativeHistoryPageSymbol::AppendLiteral))(source, literal);
}

static void capture_native_history_battle_name(void *name, NativeString *source, bool translated, int32_t mode) {
    NativeHistoryCallbackScope callback;
    try {
        auto *page = native_history_legends_state().active;
        if (page && page->segment_source && reinterpret_cast<uintptr_t>(name) >= 0x60)
            page->segment = snapshot_native_history_page_battle(
                reinterpret_cast<uintptr_t>(name) - 0x60, page->figure_id);
    } catch (...) {}
    reinterpret_cast<NativeHistoryMaterialNameFn>(native_history_page_address(NativeHistoryPageSymbol::Name))(
        name, source, translated, mode);
}

static NativeString *capture_native_history_page_end(NativeString *source, const char *literal) {
    NativeHistoryCallbackScope callback;
    try { finish_native_history_page_segment(source); } catch (...) {}
    return reinterpret_cast<NativeHistoryLiteralFn>(native_history_page_address(NativeHistoryPageSymbol::AppendLiteral))(source, literal);
}

static NativeString *capture_native_history_page_counted_end(NativeString *source, const char *literal, size_t length) {
    NativeHistoryCallbackScope callback;
    auto *result = reinterpret_cast<NativeHistoryLiteralCountFn>(native_history_page_address(NativeHistoryPageSymbol::CountedAppend))(source, literal, length);
    // These verified callers end with [R], optionally preceded by ')'.
    try { finish_native_history_page_segment(source, 3); } catch (...) {}
    return result;
}

using NativeHistoryFigureNameFn = void (*)(void *, NativeString *, int32_t, void *, int16_t, int16_t);
static void capture_native_history_related_figure_name(void *history, NativeString *source,
        int32_t id, void *context, int16_t first_mode, int16_t second_mode) {
    NativeHistoryCallbackScope callback;
    try {
        if (auto *page = native_history_legends_state().active) {
            const auto key = std::pair{NativeHistoryPageKind::RelatedFigure, id};
            page->prepared_segment = snapshot_native_history_page_figure_link(
                page->figure_id, id, page->occurrences[key]++, reinterpret_cast<uintptr_t>(context), second_mode);
        }
    } catch (...) {}
    native_history_call_figure_name(history, source, id, context, first_mode, second_mode);
}

static NativeString *capture_native_history_related_figure_begin(NativeString *source,
        const char *literal, size_t length) {
    NativeHistoryCallbackScope callback;
    try {
        // Bind before the native temporary name is copied into the page.
        // The prepared identity, relationship and dates own the entire row,
        // including its name link, through the existing [R] end callback.
        begin_native_history_page_segment(source);
        if (auto *page = native_history_legends_state().active) {
            page->segment = std::move(page->prepared_segment);
            page->prepared_segment.reset();
        }
    } catch (...) {}
    return reinterpret_cast<NativeHistoryLiteralCountFn>(native_history_page_address(NativeHistoryPageSymbol::CountedAppend))(source, literal, length);
}

using NativeHistoryEntityNameFn = void (*)(void *, NativeString *, int32_t, int32_t);
template<int Producer>
static void capture_native_history_related_extra_begin(void *history, NativeString *source,
        int32_t id, int32_t flags) {
    NativeHistoryCallbackScope callback;
    try {
        begin_native_history_page_segment(source);
        if (auto *page = native_history_legends_state().active) {
            const size_t occurrence = page->extra_occurrences[std::pair{Producer, id}]++;
            if constexpr (Producer == 0)
                page->segment = snapshot_native_history_page_spouse_office(page->figure_id, id, occurrence);
            else if constexpr (Producer == 1)
                page->segment = snapshot_native_history_page_worshippers(id);
            else if constexpr (Producer == 2)
                page->segment = snapshot_native_history_page_reputation(page->figure_id, id, occurrence);
            else page->segment = snapshot_native_history_page_site_link(page->figure_id, id, occurrence);
        }
    } catch (...) {}
    native_history_call_entity_name(Producer == 3, history, source, id, flags);
}

static void capture_native_history_related_entity_begin(void *history, NativeString *source,
        int32_t id, int32_t flags) {
    NativeHistoryCallbackScope callback;
    try { begin_native_history_related_entity(source, id); } catch (...) {}
    native_history_call_entity_name(false, history, source, id, flags);
}

// history::describe has a separate artifact introduction followed by its
// typed item description. Capture their actual producer ranges before the
// normal event loop. Source bytes determine ownership only; the snapshots
// take names, materials, item state and writing from the native records.
static void begin_native_history_artifact_introduction(const NativeString *source) {
    begin_native_history_page_segment(source);
    if (auto *page = native_history_legends_state().active)
        page->segment = snapshot_native_history_artifact_introduction(page->artifact_id);
}

static void capture_native_history_artifact_name(void *unused, NativeString *source,
        int32_t id, int32_t flags) {
    NativeHistoryCallbackScope callback;
    try { begin_native_history_artifact_introduction(source); } catch (...) {}
    reinterpret_cast<void (*)(void *, NativeString *, int32_t, int32_t)>(
        native_history_page_address(NativeHistoryPageSymbol::ArtifactName))(unused, source, id, flags);
}

static NativeString *capture_native_history_artifact_unnamed(NativeString *source,
        const char *literal) {
    NativeHistoryCallbackScope callback;
    try { begin_native_history_artifact_introduction(source); } catch (...) {}
    return reinterpret_cast<NativeHistoryLiteralFn>(native_history_page_address(NativeHistoryPageSymbol::AssignLiteral))(
        source, literal);
}

static NativeString *capture_native_history_artifact_introduction_end(NativeString *source,
        const char *literal) {
    NativeHistoryCallbackScope callback;
    auto *result = reinterpret_cast<NativeHistoryLiteralFn>(native_history_page_address(NativeHistoryPageSymbol::AppendLiteral))(
        source, literal);
    // b8f258 appends both the period and [B]. Keep the period in the span.
    try { finish_native_history_page_segment(source, 3); } catch (...) {}
    return result;
}

static void capture_native_history_artifact_description(void *item, NativeString *source,
        bool paragraphs, bool full, bool extra, int32_t flags) {
    NativeHistoryCallbackScope callback;
    try {
        begin_native_history_page_segment(source);
    } catch (...) {}
    reinterpret_cast<void (*)(void *, NativeString *, bool, bool, bool, int32_t)>(
        native_history_page_address(NativeHistoryPageSymbol::ItemDescription))(item, source, paragraphs, full, extra, flags);
    try {
        // Native art-image getters can materialize a previously absent image.
        // Read their resulting source records after the producer returns;
        // the translation adapter never invokes those mutating getters.
        if (auto *page = native_history_legends_state().active; page && page->segment_source == source)
            page->segment = snapshot_native_history_artifact_description(page->artifact_id);
    } catch (...) {}
    // b8fd35 appends the actual confidence result; b8fd45 owns the final [B].
    // The description's internal [P]/[R] controls stay within this document.
}

static void capture_native_history_collection_date(void *unused, NativeString *source,
        int32_t year, int32_t seconds) {
    NativeHistoryCallbackScope callback;
    if (auto *page = native_history_legends_state().active) {
        page->marker_year = year;
        page->marker_seconds = seconds;
    }
    native_history_call_collection_date(unused, source, year, seconds);
}

template<int Marker>
static void capture_native_history_collection_marker(void *collection, NativeString *source) {
    NativeHistoryCallbackScope callback;
    try {
        if (auto *page = native_history_legends_state().active; page && !page->local_source) {
            // The name can be formatted into a temporary before an inlined
            // copy. Own the final destination at producer boundaries, not
            // at compiler-dependent string-append call sites.
            finish_native_history_page_segment(page->source, 3);
            begin_native_history_page_segment(page->source);
            page->segment = snapshot_native_history_collection_marker(
                reinterpret_cast<uintptr_t>(collection), Marker, page->marker_year, page->marker_seconds);
        }
    } catch (...) {}
    const void *table = nullptr;
    void (*original)(void *, NativeString *) = nullptr;
    std::memcpy(&table, collection, sizeof(table));
    std::memcpy(&original, static_cast<const unsigned char *>(table) + 0x30, sizeof(original));
    auto *page = native_history_legends_state().active;
    NativeHistoryActiveScope active(page && page->segment ? &page->segment->data : nullptr, true);
    original(collection, source);
}

static void record_native_history_war_choice(int32_t selected, int32_t count, void *collection,
        const void *categories, const void *indices) {
    try {
        auto &pending = pending_native_history_war_selection();
        pending.reset();
        NativeHistoryWarSelection selection;
        selection.collection = reinterpret_cast<uintptr_t>(collection);
        selection.count = count;
        int16_t category = -1, index = -1;
        if (selected >= 0 && selected < count && count <= 1048576 &&
                native_history_copy(selection.collection + 0x58, selection.id) && selection.id >= 0 &&
                native_history_copy(reinterpret_cast<uintptr_t>(categories) + size_t(selected) * 4, category) &&
                native_history_copy(reinterpret_cast<uintptr_t>(indices) + size_t(selected) * 4, index)) {
            selection.category = category;
            selection.index = index;
            pending = selection;
        }
    } catch (...) {}
}

template<int Section>
static NativeString *capture_native_history_section_heading(NativeString *source,
        const char *literal, size_t length) {
    NativeHistoryCallbackScope callback;
    try { begin_native_history_section_heading(source, Section); } catch (...) {}
    auto *result = reinterpret_cast<NativeHistoryLiteralCountFn>(native_history_page_address(NativeHistoryPageSymbol::CountedAppend))(source, literal, length);
    try { finish_native_history_page_segment(source, 3); } catch (...) {}
    return result;
}
