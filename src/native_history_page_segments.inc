// Shared page segment ownership and biography callbacks.
static void begin_native_history_page_segment(const NativeString *source) {
    auto *page = native_history_legends_state().active;
    if (!page || !page->source_started || (!page->local_source && page->source != source)) return;
    if (page->segment_source) ++page->missing_snapshots;
    page->segment_source = nullptr;
    page->segment.reset();
    std::string_view prefix;
    if (!native_string_view(source, &prefix, kNativeHistorySourceLimit)) return;
    page->segment_source = source;
    page->segment_begin = prefix.size();
}

static void finish_native_history_page_segment(const NativeString *source, size_t control_suffix = 0) {
    auto *page = native_history_legends_state().active;
    if (!page || page->segment_source != source) return;
    const size_t begin = page->segment_begin;
    page->segment_source = nullptr;
    auto data = std::move(page->segment);
    page->segment.reset();
    std::string_view complete;
    if (!native_string_view(source, &complete, kNativeHistorySourceLimit) || control_suffix > complete.size() ||
        begin >= complete.size() - control_suffix ||
        complete.size() - begin > kNativeHistoryStringLimit ||
        page->spans.size() >= kNativeHistoryCaptureDocuments) {
        ++page->missing_snapshots;
        return;
    }
    NativeHistoryLegendsSpan span;
    span.begin = begin;
    span.end = complete.size() - control_suffix;
    span.source.assign(complete.substr(begin, span.end - begin));
    if (!page->local_source)
        page->collection_ranges.push_back({span.begin, span.end, span.source});
    if (!data ||
            !capture_native_history_subject_item_labels(data->data) ||
            !native_history_tree_within_limits(data->data, true)) {
        ++page->missing_snapshots;
        return;
    }
    span.page = std::move(data);
    page->spans.push_back(std::move(span));
}


static void capture_native_history_page_biography(void *history, NativeString *source,
        void *figure, int32_t id, void *context) {
    NativeHistoryCallbackScope callback;
    try {
        begin_native_history_page_segment(source);
        if (auto *page = native_history_legends_state().active)
            page->segment = snapshot_native_history_page_biography(reinterpret_cast<uintptr_t>(figure), id);
    } catch (...) {}
    reinterpret_cast<void (*)(void *, NativeString *, void *, int32_t, void *)>(
        native_history_page_address(NativeHistoryPageSymbol::Biography))(
        history, source, figure, id, context);
}

static void capture_native_history_biography_confidence(void *unused, NativeString *source, uint16_t confidence) {
    NativeHistoryCallbackScope callback;
    bool introduction = false;
    try {
        if (auto *page = native_history_legends_state().active; page && page->local_source &&
                page->introduction && !page->segment_source) {
            // Typed introductions use describe's initially empty
            // local string and this confidence producer immediately before
            // [B]. Own the full typed paragraph, not just its last clause.
            begin_native_history_page_segment(source);
            if (page->segment_source == source) {
                page->segment_begin = 0;
                page->segment = std::move(page->introduction);
                page->introduction.reset();
                introduction = true;
            }
        }
        if (auto *page = native_history_legends_state().active; page && page->segment &&
            (page->segment->kind == NativeHistoryPageKind::FigureBiography ||
             page->segment->kind == NativeHistoryPageKind::ArtifactDescription ||
             page->segment->kind == NativeHistoryPageKind::RegionIntroduction ||
             page->segment->kind == NativeHistoryPageKind::EntityIntroduction ||
             page->segment->kind == NativeHistoryPageKind::SiteIntroduction ||
             page->segment->kind == NativeHistoryPageKind::StructureIntroduction))
            page->segment->data.fields["confidence"] = {confidence};
    } catch (...) {}
    reinterpret_cast<void (*)(void *, NativeString *, uint16_t)>(
        native_history_page_address(NativeHistoryPageSymbol::Confidence))(
        unused, source, confidence);
    // The native caller supplies the following paragraph control. Final
    // page validation checks that boundary, just as for event snapshots.
    if (introduction) {
        try { finish_native_history_page_segment(source); } catch (...) {}
    }
}

static void capture_native_history_child_relation(uint16_t relation, NativeString *source,
        bool plural, bool possessive) {
    NativeHistoryCallbackScope callback;
    try {
        if (auto *page = native_history_legends_state().active; page && page->segment &&
            (page->segment->kind == NativeHistoryPageKind::RelatedFigure ||
             page->segment->kind == NativeHistoryPageKind::FigureBiography))
            page->segment->data.fields["child_relation"] = {relation};
    } catch (...) {}
    reinterpret_cast<void (*)(uint16_t, NativeString *, bool, bool)>(
        native_history_page_address(NativeHistoryPageSymbol::ChildRelation))(
        relation, source, plural, possessive);
}
static void capture_native_history_biography_region(void *name, NativeString *source, bool translated, int32_t mode) {
    NativeHistoryCallbackScope callback;
    try {
        if (auto *page = native_history_legends_state().active; page && page->segment &&
            page->segment->kind == NativeHistoryPageKind::FigureBiography) {
            int32_t id = -1;
            if (native_history_copy(reinterpret_cast<uintptr_t>(name) + 0x78, id) && id >= 0) {
                auto &data = page->segment->data;
                data.fields["force_region"] = {id};
                data.references.emplace_back(NativeHistoryObjectKind::Region, id);
                if (!populate_native_history_subjects(data)) data.fields["snapshot.incomplete"] = {1};
            }
        }
    } catch (...) {}
    reinterpret_cast<void (*)(void *, NativeString *, bool, int32_t)>(native_history_page_address(NativeHistoryPageSymbol::Name))(name, source, translated, mode);
}


static void begin_native_history_section_heading(NativeString *source, int section) {
    begin_native_history_page_segment(source);
    if (auto *page = native_history_legends_state().active) {
        NativeHistoryPageData heading;
        heading.kind = NativeHistoryPageKind::SectionHeading;
        heading.data.texts["heading"] = section == 0 ? "Related Historical Figures" :
            section == 1 ? "Related Entities" : "Related Sites";
        page->segment = std::move(heading);
    }
}

static void begin_native_history_related_entity(NativeString *source, int32_t id) {
    begin_native_history_page_segment(source);
    if (auto *page = native_history_legends_state().active) {
        const auto key = std::pair{NativeHistoryPageKind::RelatedEntity, id};
        page->segment = snapshot_native_history_page_entity_link(
            page->figure_id, id, page->occurrences[key]++);
    }
}
