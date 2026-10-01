// Non-history_eventst Legends producers. Every discriminator and value below
// comes from a native argument, typed field or verified producer branch.
#include "native_history_biography.inc"
#include "native_history_entity_page.inc"

static std::optional<NativeHistoryPageData> snapshot_native_history_structure_introduction(
        uintptr_t context) {
    // describe selects its building branch from the site/building pair, not
    // from a name or a visible "was ... in ..." sentence (ELF a5e798..a5e89b).
    int32_t site = -1, building = -1;
    if (!context || !native_history_copy(context + 0x28, site) || site < 0 ||
        !native_history_copy(context + 0x38, building) || building < 0)
        return std::nullopt;
    for (size_t offset : {0x18, 0x1c, 0x20, 0x2c, 0x30, 0x34, 0x68}) {
        int32_t other = -1;
        if (!native_history_copy(context + offset, other) || other != -1)
            return std::nullopt;
    }
    NativeHistorySubject structure;
    if (!capture_native_history_structure(native_history_profile_base(), site, building, structure) ||
        structure.native_type < 0 || structure.label_key.empty()) return std::nullopt;
    NativeHistoryPageData page;
    page.kind = NativeHistoryPageKind::StructureIntroduction;
    page.data.site_id = site;
    page.data.fields["building"] = {building};
    page.data.texts["building.label"] = structure.label_key;
    page.data.subjects.push_back(std::move(structure));
    if (!populate_native_history_subjects(page.data)) return std::nullopt;
    // The existing confidence callback owns the whole local paragraph and
    // records its actual confidence argument, just like site introductions.
    return page;
}

static std::optional<NativeHistoryPageData> snapshot_native_history_site_introduction(
        uintptr_t context) {
    // describe's site-only branch (a5e5f8..a5e6fb) precedes its event loop.
    // A building also has a site ID; require the independent focus fields
    // to be absent instead of mistaking its introduction for a site's.
    int32_t id = -1;
    if (!context || !native_history_copy(context + 0x28, id) || id < 0)
        return std::nullopt;
    for (size_t offset : {0x18, 0x1c, 0x20, 0x2c, 0x30, 0x34, 0x38, 0x68}) {
        int32_t other = -1;
        if (!native_history_copy(context + offset, other) || other != -1)
            return std::nullopt;
    }
    const uintptr_t site = native_history_find_subject(
        native_history_profile_base(), NativeHistoryObjectKind::Site, id);
    uint8_t named = 0;
    if (!site || !native_history_copy(native_history_object_field(
            site, "world_site", 0x72), named) || !named) return std::nullopt;
    NativeHistoryPageData page;
    page.kind = NativeHistoryPageKind::SiteIntroduction;
    page.data.site_id = id;
    if (!native_history_site_type(site, page.data, "site") ||
        !populate_native_history_subjects(page.data)) return std::nullopt;
    // Confidence and the full source span are captured by the existing
    // shared introduction callback, including any scholar-knowledge suffix.
    return page;
}

static std::optional<NativeHistoryPageData> snapshot_native_history_region_introduction(
        uintptr_t context) {
    // history::describe's region focus is distinct from a site, building or
    // underground layer. The introduction is selected by these native IDs,
    // never by a visible name or an English sentence prefix.
    int32_t region = -1;
    if (!context || !native_history_copy(context + 0x2c, region) || region < 0)
        return std::nullopt;
    for (size_t offset : {0x18, 0x1c, 0x20, 0x28, 0x30, 0x34, 0x38, 0x68}) {
        int32_t other = -1;
        if (!native_history_copy(context + offset, other) || other != -1) return std::nullopt;
    }
    const uintptr_t base = native_history_profile_base();
    const uintptr_t object = native_history_find_subject(base, NativeHistoryObjectKind::Region, region);
    uint8_t named = 0;
    if (!object || !native_history_copy(object + 0x72, named) || !named) return std::nullopt;
    NativeHistoryPageData page;
    page.kind = NativeHistoryPageKind::RegionIntroduction;
    page.data.fields["region"] = {region};
    page.data.references.emplace_back(NativeHistoryObjectKind::Region, region);
    page.data.references.emplace_back(NativeHistoryObjectKind::World, 0);
    if (!populate_native_history_subjects(page.data)) return std::nullopt;
    // The actual confidence formatter argument is captured before binding.
    return page;
}

static uintptr_t native_history_page_link(int32_t figure_id, int32_t related,
        size_t occurrence, size_t vector_offset) {
    const uintptr_t figure = native_history_find_subject(native_history_profile_base(),
        NativeHistoryObjectKind::Figure, figure_id);
    NativeBorrowedVector<uintptr_t> links;
    if (!figure || !native_history_read_vector(figure + vector_offset, links) ||
        !links.valid(1048576)) return 0;
    for (size_t index = 0; index < links.size(); ++index) {
        const uintptr_t link = native_history_vector_at(links, index);
        int32_t id = -1;
        if (!link || !native_history_copy(link + 8, id)) return 0;
        if (id == related && occurrence-- == 0) return link;
    }
    return 0;
}

static bool native_history_page_position_site(uintptr_t entity, uintptr_t assignment,
        uintptr_t position, NativeHistoryEventData &data) {
    data.fields["position_site"] = {-1};
    int16_t scope = 0;
    int32_t assignment_id = -1;
    if (!position || !assignment || !native_history_copy(position + 0x2c8, scope) ||
        !native_history_copy(assignment, assignment_id)) return false;
    if (scope <= 0) return true;
    // 9bdfb0 resolves a site through the entity's position-assignment link.
    NativeBorrowedVector<uintptr_t> links;
    if (!native_history_read_vector(entity + 0xd0, links)) return false;
    for (size_t index = 0; index < links.size(); ++index) {
        const uintptr_t link = native_history_vector_at(links, index);
        int32_t flags = 0, owner = -1, site = -1;
        if (!link || !native_history_copy(link + 0x1c, flags) ||
            !native_history_copy(link + 0xc, owner)) return false;
        if (!(flags & 0x200) || owner != assignment_id) continue;
        if (!native_history_copy(link, site)) return false;
        if (native_history_find_subject(native_history_profile_base(), NativeHistoryObjectKind::Site, site)) {
            data.fields["position_site"] = {site};
            data.references.emplace_back(NativeHistoryObjectKind::Site, site);
        }
        return true;
    }
    return true;
}

static std::optional<NativeHistoryPageData> snapshot_native_history_page_figure_link(
        int32_t figure_id, int32_t related, size_t occurrence, uintptr_t context, int16_t name_mode) {
    const uintptr_t base = native_history_profile_base();
    const uintptr_t link = native_history_page_link(figure_id, related, occurrence, 0x118);
    const uintptr_t figure = native_history_find_subject(base, NativeHistoryObjectKind::Figure, related);
    int32_t type = -1, born = -1, died = -1;
    int16_t strength = 0;
    int8_t sex = -1;
    if (!link || !figure || !native_history_page_getter(link, 0, type) || type < 0 || type > 15 ||
        !native_history_copy(link + 0xc, strength) || !native_history_copy(figure + 6, sex) ||
        !native_history_copy(figure + 0x10, born) || !native_history_copy(figure + 0x30, died))
        return std::nullopt;
    NativeHistoryPageData page;
    page.kind = NativeHistoryPageKind::RelatedFigure;
    auto &data = page.data;
    data.actor_id = related;
    data.fields["link_type"] = {type};
    data.fields["strength"] = {strength};
    data.fields["sex"] = {sex};
    data.fields["born"] = {born};
    data.fields["died"] = {died};
    data.fields["child_relation"] = {42};
    // b93183 chooses the player, then the current figure, as the race
    // context; an explicit curse restores a suppressed species label.
    // b932fa/b93523 still suppress it when this is the current figure.
    int32_t focus = -1, player = -1;
    int16_t race = -1;
    uintptr_t info = 0, curse = 0;
    std::string undead_name;
    uint8_t named_curse = 0;
    if (!context || !native_history_copy(context + 0x20, focus) ||
        !native_history_copy(context + 0x24, player) || !native_history_copy(figure + 2, race) ||
        !native_history_copy(figure + 0x130, info) ||
        (info && !native_history_copy(info + 0x48, curse)) ||
        (curse && (!native_history_copy_string(curse + 0x150, undead_name) ||
                   !native_history_copy(curse + 0x88, named_curse)))) return std::nullopt;
    uintptr_t perspective = native_history_find_subject(base, NativeHistoryObjectKind::Figure, player);
    if (!perspective) perspective = native_history_find_subject(base, NativeHistoryObjectKind::Figure, focus);
    bool include_species = true;
    if (perspective) {
        int16_t perspective_race = -1;
        if (!native_history_copy(perspective + 2, perspective_race)) return std::nullopt;
        include_species = race != perspective_race;
    }
    if (!undead_name.empty() || named_curse) include_species = true;
    data.fields["include_species"] = {include_species && race >= 0 && related != focus &&
        (name_mode == 0 || name_mode == 2)};
    if (!populate_native_history_subjects(data)) return std::nullopt;
    return page;
}

static std::optional<NativeHistoryPageData> snapshot_native_history_page_entity_link(
        int32_t figure_id, int32_t related, size_t occurrence) {
    const uintptr_t base = native_history_profile_base();
    const uintptr_t link = native_history_page_link(figure_id, related, occurrence, 0xe8);
    int32_t type = -1;
    if (!link || !native_history_page_getter(link, 0, type) || type < 0 || type > 16)
        return std::nullopt;
    NativeHistoryPageData page;
    page.kind = NativeHistoryPageKind::RelatedEntity;
    auto &data = page.data;
    data.entity_id = related;
    data.fields["related_kind"] = {0};
    data.fields["position_site"] = {-1};
    data.fields["position_present"] = {1};
    data.fields["link_type"] = {type};
    data.fields["start_year"] = {-1};
    data.fields["end_year"] = {-1};
    if (type >= 10 && type <= 14) {
        int32_t start = -1, end = -1;
        if (!native_history_page_getter(link, native_history_link_slot(NativeHistoryLinkSlot::StartYear), start) ||
            ((type == 11 || type == 14) && !native_history_page_getter(link, native_history_link_slot(NativeHistoryLinkSlot::EndYear), end)))
            return std::nullopt;
        data.fields["start_year"] = {start};
        data.fields["end_year"] = {end};
        int32_t owner = related, position_id = -1;
        int variant = 3;
        const auto missing_position = [&]() -> std::optional<NativeHistoryPageData> {
            // Native b913e1 still closes the row when an office record has
            // disappeared. There is no role/date text in that branch.
            data.fields["position_present"] = {0};
            data.fields["start_year"] = {-1};
            data.fields["end_year"] = {-1};
            if (!populate_native_history_subjects(data)) return std::nullopt;
            return page;
        };
        if (type <= 12) {
            int32_t assignment_id = -1;
            uintptr_t assignment = 0;
            const uintptr_t entity = native_history_find_subject(base, NativeHistoryObjectKind::Entity, related);
            const uintptr_t figure = native_history_find_subject(base, NativeHistoryObjectKind::Figure, figure_id);
            int8_t sex = -1;
            if (!entity || !figure || !native_history_page_getter(link, native_history_link_slot(NativeHistoryLinkSlot::Assignment), assignment_id) ||
                !native_history_material_find_id(entity + 0x1110, 0, assignment_id, assignment)) return std::nullopt;
            if (!assignment) return missing_position();
            if (!native_history_copy(assignment + 0xc, position_id) ||
                !native_history_copy(figure + 6, sex)) return std::nullopt;
            variant = sex == 0 ? 1 : sex == 1 ? 2 : 0;
            uintptr_t position = 0;
            if (!native_history_material_find_id(entity + 0x10c0, 0x20, position_id, position)) return std::nullopt;
            if (!position) return missing_position();
            if (!native_history_page_position_site(entity, assignment, position, data)) return std::nullopt;
        } else {
            // Spouse-position links refer to a unit, not to an assignment.
            int32_t unit_id = -1;
            uintptr_t unit = 0;
            if (!native_history_page_getter(link, native_history_link_slot(NativeHistoryLinkSlot::Unit), unit_id) ||
                !native_history_material_find_id(native_history_page_address(NativeHistoryPageSymbol::Units), 0, unit_id, unit)) return std::nullopt;
            if (!unit) return missing_position();
            if (!native_history_copy(unit + 0x1c4, owner) ||
                !native_history_copy(unit + 0x1c8, position_id)) return std::nullopt;
            const uintptr_t entity = native_history_find_subject(base, NativeHistoryObjectKind::Entity, owner);
            if (!entity) return missing_position();
            uintptr_t position = 0;
            if (!native_history_material_find_id(entity + 0x10c0, 0x20, position_id, position)) return std::nullopt;
            if (!position) return missing_position();
        }
        if (!native_history_position_name(base, owner, position_id, variant, data.position))
            return std::nullopt;
    }
    if (!populate_native_history_subjects(data)) return std::nullopt;
    return page;
}


static bool native_history_item_scalar(uintptr_t object, size_t slot, int32_t &value,
        int width = 4) {
    if (!native_history_typed_getter(object, slot, value)) return false;
    if (width == 2) value = static_cast<int16_t>(value);
    else if (width == 1) value = static_cast<uint8_t>(value);
    return width == 1 || width == 2 || width == 4;
}


static std::optional<NativeHistoryPageData> snapshot_native_history_page_spouse_office(
        int32_t figure_id, int32_t related, size_t occurrence) {
    const uintptr_t base = native_history_profile_base();
    const uintptr_t figure = native_history_find_subject(base, NativeHistoryObjectKind::Figure, figure_id);
    const uintptr_t entity = native_history_find_subject(base, NativeHistoryObjectKind::Entity, related);
    NativeBorrowedVector<uintptr_t> links;
    if (!figure || !entity || !native_history_read_vector(figure + 0x118, links)) return std::nullopt;
    int32_t spouse_id = -1;
    int8_t sex = -1;
    if (!native_history_copy(figure + 6, sex)) return std::nullopt;
    for (size_t index = 0; index < links.size(); ++index) {
        const uintptr_t link = native_history_vector_at(links, index);
        int32_t type = -1;
        if (!link || !native_history_page_getter(link, 0, type)) return std::nullopt;
        if (type == 2) {
            if (!native_history_copy(link + 8, spouse_id)) return std::nullopt;
            break;
        }
    }
    const uintptr_t spouse = native_history_find_subject(base, NativeHistoryObjectKind::Figure, spouse_id);
    if (!spouse || !native_history_read_vector(spouse + 0xe8, links)) return std::nullopt;
    for (size_t index = 0; index < links.size(); ++index) {
        const uintptr_t link = native_history_vector_at(links, index);
        int32_t type = -1, target = -1, assignment_id = -1, position_id = -1;
        uintptr_t assignment = 0, position = 0;
        if (!link || !native_history_copy(link + 8, target) ||
            !native_history_page_getter(link, 0, type)) return std::nullopt;
        if (target != related || type != 10) continue;
        if (!native_history_page_getter(link, native_history_link_slot(NativeHistoryLinkSlot::Assignment), assignment_id) ||
            !native_history_material_find_id(entity + 0x1110, 0, assignment_id, assignment)) return std::nullopt;
        if (!assignment) continue;
        if (!native_history_copy(assignment + 0xc, position_id) ||
            !native_history_material_find_id(entity + 0x10c0, 0x20, position_id, position)) return std::nullopt;
        if (!position) continue;
        std::string neutral, female, male;
        if (!native_history_copy_string(position + 0x158, neutral) ||
            !native_history_copy_string(position + 0x198, female) ||
            !native_history_copy_string(position + 0x1d8, male)) return std::nullopt;
        if (neutral.empty() && female.empty() && male.empty()) continue;
        if (occurrence-- != 0) continue;
        NativeHistoryPageData page;
        page.kind = NativeHistoryPageKind::RelatedEntity;
        auto &data = page.data;
        data.entity_id = related;
        data.fields["related_kind"] = {1};
        data.position = sex == 0 && !female.empty() ? female : sex == 1 && !male.empty() ? male : neutral;
        if (!native_history_page_position_site(entity, assignment, position, data) ||
            !populate_native_history_subjects(data)) return std::nullopt;
        return page;
    }
    return std::nullopt;
}

static std::optional<NativeHistoryPageData> snapshot_native_history_page_worshippers(int32_t related) {
    const uintptr_t entity = native_history_find_subject(native_history_profile_base(),
        NativeHistoryObjectKind::Entity, related);
    int16_t type = -1;
    if (!entity || !native_history_copy(entity, type)) return std::nullopt;
    NativeHistoryPageData page;
    page.kind = NativeHistoryPageKind::RelatedEntity;
    page.data.entity_id = related;
    page.data.fields["related_kind"] = {2};
    page.data.fields["entity_type"] = {type};
    if (!populate_native_history_subjects(page.data)) return std::nullopt;
    return page;
}

static bool native_history_page_reputation_visible(int32_t type) {
    // b92574's first-stage table controls which reputation kinds produce rows.
    switch (type) {
    case 0: case 2: case 3: case 6: case 7: case 11: case 12: case 13:
    case 14: case 15: case 16: case 23: case 24: case 25: case 26: case 28: case 29:
        return true;
    default: return false;
    }
}

static std::optional<NativeHistoryPageData> snapshot_native_history_page_reputation(
        int32_t figure_id, int32_t related, size_t occurrence) {
    const uintptr_t figure = native_history_find_subject(native_history_profile_base(),
        NativeHistoryObjectKind::Figure, figure_id);
    uintptr_t info = 0, reputation = 0;
    NativeBorrowedVector<uintptr_t> entities;
    if (!figure || !native_history_copy(figure + 0x130, info) || !info ||
        !native_history_copy(info + 0x58, reputation) || !reputation ||
        !native_history_read_vector(reputation, entities)) return std::nullopt;
    for (size_t index = 0; index < entities.size(); ++index) {
        const uintptr_t entry = native_history_vector_at(entities, index);
        int32_t target = -1;
        if (!entry || !native_history_copy(entry, target)) return std::nullopt;
        if (target != related) continue;
        NativeBorrowedVector<int32_t> types, values;
        if (!native_history_copy(entry + 8, types) || !types.valid(1048576) ||
            !native_history_copy(entry + 0x20, values) || !values.valid(1048576) ||
            types.size() != values.size()) return std::nullopt;
        for (size_t at = 0; at < types.size(); ++at) {
            int32_t type = -1, value = -1;
            if (!native_history_copy(reinterpret_cast<uintptr_t>(types.begin) + at * 4, type) ||
                !native_history_copy(reinterpret_cast<uintptr_t>(values.begin) + at * 4, value)) return std::nullopt;
            if (value <= 0 || !native_history_page_reputation_visible(type)) continue;
            if (occurrence-- != 0) continue;
            NativeHistoryPageData page;
            page.kind = NativeHistoryPageKind::RelatedEntity;
            page.data.entity_id = related;
            page.data.fields["related_kind"] = {3};
            page.data.fields["reputation_type"] = {type};
            page.data.fields["reputation_value"] = {value};
            if (!populate_native_history_subjects(page.data)) return std::nullopt;
            return page;
        }
    }
    return std::nullopt;
}

static std::optional<NativeHistoryPageData> snapshot_native_history_page_site_link(
        int32_t figure_id, int32_t related, size_t occurrence) {
    const uintptr_t figure = native_history_find_subject(native_history_profile_base(),
        NativeHistoryObjectKind::Figure, figure_id);
    NativeBorrowedVector<uintptr_t> links;
    if (!figure || !native_history_read_vector(figure + 0x100, links)) return std::nullopt;
    std::vector<int32_t> types;
    for (size_t index = 0; index < links.size(); ++index) {
        const uintptr_t link = native_history_vector_at(links, index);
        int32_t target = -1, type = -1;
        if (!link || !native_history_copy(link + 8, target) ||
            !native_history_page_getter(link, 0, type)) return std::nullopt;
        if (target == related) types.push_back(type);
    }
    const bool has_home = std::find(types.begin(), types.end(), 3) != types.end();
    for (int32_t type : types) {
        // b921e7 suppresses the duplicate type-6 row when type 3 exists.
        if (type == 6 && has_home) continue;
        if (occurrence-- != 0) continue;
        NativeHistoryPageData page;
        page.kind = NativeHistoryPageKind::RelatedSite;
        page.data.site_id = related;
        page.data.fields["link_type"] = {type};
        if (!populate_native_history_subjects(page.data)) return std::nullopt;
        return page;
    }
    return std::nullopt;
}

static std::optional<NativeHistoryPageData> snapshot_native_history_page_battle(
        uintptr_t battle, int32_t figure_id) {
    // b9010b..b9026d: attacker/defender participants and scouts are distinct
    // vectors. Flag bit 0 is hired; bit 1 gives a hiring organization.
    if (!battle || figure_id < 0) return std::nullopt;
    NativeHistoryPageData page;
    page.kind = NativeHistoryPageKind::MilitaryParticipation;
    auto &data = page.data;
    data.actor_id = figure_id;
    bool valid = true;
    const auto attacker = native_history_page_find_int(battle + 0x120, figure_id, valid);
    const auto defender = native_history_page_find_int(battle + 0x150, figure_id, valid);
    const auto attack_scout = native_history_page_find_int(battle + 0x1a8, figure_id, valid);
    const auto defend_scout = native_history_page_find_int(battle + 0x1c0, figure_id, valid);
    if (!valid || (!attacker && !defender && !attack_scout && !defend_scout)) return std::nullopt;
    bool hired = attack_scout.has_value() || defend_scout.has_value();
    int32_t employer = -1;
    const auto participant = [&](const std::optional<size_t> &index,
                                 size_t flags_offset, size_t employer_offset) {
        if (!index) return true;
        int32_t flags = 0;
        if (!native_history_page_int_at(battle + flags_offset, *index, flags)) return false;
        if (flags & 2) {
            hired = true;
            return native_history_copy(battle + employer_offset, employer);
        }
        if (flags & 1) hired = true;
        return true;
    };
    if (!participant(attacker, 0x138, 0x19c) ||
        !participant(defender, 0x168, 0x1a0) ||
        !native_history_copy(battle + 0x38, data.year) ||
        !native_history_copy(battle + 0x40, data.seconds) ||
        !native_history_copy(battle + 0xe4, data.site_id)) return std::nullopt;
    int32_t region = -1, layer = -1;
    if (!native_history_copy(battle + 0xdc, region) ||
        !native_history_copy(battle + 0xe0, layer)) return std::nullopt;
    data.entity_id = employer;
    data.fields["hired"] = {hired ? 1 : 0};
    data.fields["scout"] = {attack_scout || defend_scout ? 1 : 0};
    data.fields["assault"] = {attacker || attack_scout ? 1 : 0};
    data.fields["region"] = {region};
    data.fields["layer"] = {layer};
    if (data.site_id < 0) {
        if (region >= 0) data.references.emplace_back(NativeHistoryObjectKind::Region, region);
        else if (layer >= 0) data.references.emplace_back(NativeHistoryObjectKind::Underground, layer);
    }
    // The language_name passed at b90394 belongs to this real collection.
    // Reuse the same typed title record as HEC pages and embedded summaries.
    int32_t collection_id = -1;
    if (!native_history_copy(battle + 0x58, collection_id) || collection_id < 0 ||
        native_history_collection_type(battle) != 1 ||
        !capture_native_history_collection_title(collection_id, data)) return std::nullopt;
    data.fields["collection"] = {collection_id};
    if (!populate_native_history_subjects(data)) return std::nullopt;
    return page;
}
#include "native_history_page_kills.inc"
