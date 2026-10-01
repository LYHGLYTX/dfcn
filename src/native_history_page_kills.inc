// Figure and item kill statistics use the same death-event IDs and parallel
// race/location/count vectors. Items additionally keep their wielders and
// each wielder's kill count. Neither source is inferred from displayed text.
static std::optional<NativeHistoryPageData> snapshot_native_history_kill_header(
        int32_t count, int32_t category) {
    if (count < 0 || category < 0 || category > 2) return std::nullopt;
    NativeHistoryPageData page;
    page.kind = NativeHistoryPageKind::KillSummary;
    page.data.fields["kill_kind"] = {0};
    page.data.fields["category"] = {category};
    page.data.fields["count"] = {count};
    return page;
}

static std::optional<NativeHistoryPageData> snapshot_native_history_kill_figure(
        int32_t id, int32_t kind = 1, int32_t count = 0) {
    NativeHistoryPageData page;
    page.kind = NativeHistoryPageKind::KillSummary;
    auto &data = page.data;
    data.fields["kill_kind"] = {kind};
    data.fields["count"] = {count};
    data.fields["born"] = {-1};
    data.fields["died"] = {-1};
    const uintptr_t figure = native_history_find_subject(native_history_profile_base(),
        NativeHistoryObjectKind::Figure, id);
    if (!figure) return page;
    int32_t born = -1, died = -1;
    if (!native_history_copy(figure + 0x10, born) ||
        !native_history_copy(figure + 0x30, died)) return std::nullopt;
    data.actor_id = id;
    data.fields["born"] = {born};
    data.fields["died"] = {died};
    if (!populate_native_history_subjects(data)) return std::nullopt;
    return page;
}

static std::optional<NativeHistoryPageData> snapshot_native_history_kill_event(
        uintptr_t death, int32_t event_id) {
    NativeHistoryPageData page;
    page.kind = NativeHistoryPageKind::KillSummary;
    auto &data = page.data;
    data.fields["kill_kind"] = {1};
    data.fields["death_event"] = {event_id};
    data.fields["born"] = {-1};
    data.fields["died"] = {-1};
    int32_t type = -1;
    if (!death || !capture_native_history_event_identity(reinterpret_cast<void *>(death), type) || type != 3)
        return page; // bbaa16: an absent/non-death record says Unknown creature.
    int32_t victim = -1;
    if (!native_history_copy(native_history_event_field(reinterpret_cast<void *>(death), 3, 0x28, 4), victim))
        return std::nullopt;
    const uintptr_t figure = native_history_find_subject(native_history_profile_base(),
        NativeHistoryObjectKind::Figure, victim);
    if (!figure) {
        // bba940's native date helper uses the death event, not a location.
        data.fields["kill_kind"] = {2};
        if (!native_history_copy(death + 8, data.year) ||
            !native_history_copy(death + 0xc, data.seconds)) return std::nullopt;
    } else {
        auto person = snapshot_native_history_kill_figure(victim);
        if (!person) return std::nullopt;
        person->data.fields["death_event"] = {event_id};
        return person;
    }
    return page;
}

static std::optional<NativeHistoryPageData> snapshot_native_history_kill_group(
        uintptr_t kills, size_t index) {
    const uintptr_t base = native_history_profile_base();
    if (!base || !kills) return std::nullopt;
    const auto short_at = [&](size_t offset, int16_t &value) {
        NativeBorrowedVector<int16_t> values;
        return native_history_copy(kills + offset, values) && values.valid(1048576) &&
            index < values.size() && native_history_copy(
                reinterpret_cast<uintptr_t>(values.begin) + index * 2, value);
    };
    int16_t race = -1, caste_id = -1, flags = 0;
    int32_t region = -1, layer = -1, site = -1, count = -1;
    if (!short_at(0x18, race) || !short_at(0x30, caste_id) || !short_at(0x90, flags) ||
        !native_history_page_int_at(kills + 0x48, index, region) ||
        !native_history_page_int_at(kills + 0x60, index, layer) ||
        !native_history_page_int_at(kills + 0x78, index, site) ||
        !native_history_page_int_at(kills + 0xa8, index, count) || count < 0) return std::nullopt;
    NativeHistoryPageData page;
    page.kind = NativeHistoryPageKind::KillSummary;
    auto &data = page.data;
    data.fields["kill_kind"] = {3};
    data.fields["count"] = {count};
    data.fields["race"] = {race};
    data.fields["caste"] = {caste_id};
    data.fields["flags"] = {flags};
    data.fields["sex"] = {-1};
    data.fields["region"] = {region};
    data.fields["layer"] = {layer};
    data.site_id = site;
    if (!capture_native_history_creature_label(base, race, caste_id, count != 1, data.texts["species"]))
        return std::nullopt;
    if (flags & 2) data.texts["species"] = "ghostly " + data.texts["species"];
    if (flags & 1) data.texts["species"] = "zombie " + data.texts["species"];
    NativeBorrowedVector<uintptr_t> creatures;
    const uintptr_t creatures_address = native_history_page_address(NativeHistoryPageSymbol::Creatures);
    if (!native_history_read_vector(creatures_address, creatures)) return std::nullopt;
    const uintptr_t creature = race < 0 ? 0 : native_history_vector_at(creatures, race);
    if (creature && caste_id >= 0) {
        NativeBorrowedVector<uintptr_t> castes;
        if (!native_history_read_vector(creature + 0x178, castes)) return std::nullopt;
        const uintptr_t caste = native_history_vector_at(castes, caste_id);
        if (caste) {
            int8_t sex = -1;
            if (!native_history_copy(caste + 0x15b8, sex)) return std::nullopt;
            if (sex == 0 || sex == 1) data.fields["sex"] = {sex};
        }
    }
    if (site < 0) {
        if (region >= 0) data.references.emplace_back(NativeHistoryObjectKind::Region, region);
        else if (layer >= 0) data.references.emplace_back(NativeHistoryObjectKind::Underground, layer);
    }
    if (!populate_native_history_subjects(data)) return std::nullopt;
    return page;
}
