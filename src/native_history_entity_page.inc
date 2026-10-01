// history::describe's entity introduction precedes the event loop. Its
// subjects, type, race and optional worship details come from native records,
// never from the English paragraph or the current world's proper names.
static std::optional<NativeHistoryPageData> snapshot_native_history_entity_introduction(
        uintptr_t context) {
    int32_t id = -1;
    if (!context || !native_history_copy(context + 0x1c, id) || id < 0)
        return std::nullopt;
    for (size_t offset : {0x18, 0x20, 0x28, 0x2c, 0x30, 0x34, 0x38, 0x68}) {
        int32_t other = -1;
        if (!native_history_copy(context + offset, other) || other != -1) return std::nullopt;
    }
    const uintptr_t base = native_history_profile_base();
    const uintptr_t entity = native_history_find_subject(base, NativeHistoryObjectKind::Entity, id);
    const auto field = [&](size_t offset) {
        return native_history_object_field(entity, "historical_entity", offset);
    };
    int16_t type = -1, race = -1;
    uint32_t flags = 0;
    if (!entity || !native_history_copy(field(0), type) ||
        !native_history_copy(field(0x98), race) || !native_history_copy(field(0x9c), flags))
        return std::nullopt;
    // The native default for site governments, vessel crews and migrating
    // groups is "group from". Do not restrict this paragraph to religions.
    // Military organizations retain their own type and all optional details;
    // guilds have a separate profession-based producer.
    if (type < 0 || type > 9) return std::nullopt;

    NativeHistoryPageData page;
    page.kind = NativeHistoryPageKind::EntityIntroduction;
    auto &data = page.data;
    data.entity_id = id;
    data.fields["entity_type"] = {type};
    data.references.emplace_back(NativeHistoryObjectKind::World, 0);
    data.texts["species"] = "";
    if (!(flags & (1u << 10)) && !capture_native_history_creature_label(
            base, race, -1, false, data.texts["species"])) return std::nullopt;
    if (type == 6) {
        // describe a5e4bc / b8eeb0: native values choose the military
        // adjective and honors choose order/company/band. Store typed
        // inputs, not an English type label or a save-specific name.
        for (const auto &[key, offset] : std::initializer_list<std::pair<const char *, size_t>>{
                {"cunning", 0xd30}, {"tradition", 0xd40},
                {"martial_prowess", 0xd6c}, {"skill", 0xd70}}) {
            int32_t value = 0;
            if (!native_history_copy(field(offset), value)) return std::nullopt;
            data.fields[key] = {value};
        }
        NativeBorrowedVector<uintptr_t> honors;
        NativeBorrowedVector<int32_t> deities;
        NativeBorrowedVector<int16_t> weapons, skills;
        if (!native_history_read_vector(field(0x1330), honors) ||
            !native_history_copy(field(0xfc8), deities) || !deities.valid() ||
            !native_history_copy(field(0x148), weapons) || !weapons.valid() ||
            !native_history_copy(field(0x1c50), skills) || !skills.valid()) return std::nullopt;
        data.fields["has_honors"] = {honors.size() != 0};
        data.fields["worship_count"] = {0};
        data.fields["linked_religion"] = {-1};
        if ((flags & (1u << 25)) && deities.size() != 0) {
            data.fields["worship_count"] = {deities.size() > 1 ? 2 : 1};
            // A linked religion takes precedence over the deity list. The
            // producer selects the first RELIGIOUS link to a religion.
            NativeBorrowedVector<uintptr_t> links;
            if (!native_history_read_vector(field(0xb8), links)) return std::nullopt;
            for (size_t index = 0; index < links.size(); ++index) {
                const uintptr_t link = native_history_vector_at(links, index);
                int16_t link_type = -1, target_type = -1;
                int32_t target_id = -1;
                if (!link || !native_history_copy(native_history_object_field(
                        link, "entity_entity_link", 0), link_type)) return std::nullopt;
                if (link_type != 2) continue;
                if (!native_history_copy(native_history_object_field(
                        link, "entity_entity_link", 4), target_id)) return std::nullopt;
                const uintptr_t target = native_history_find_subject(base,
                    NativeHistoryObjectKind::Entity, target_id);
                if (!target) continue;
                if (!native_history_copy(native_history_object_field(
                        target, "historical_entity", 0), target_type)) return std::nullopt;
                if (target_type != 5) continue;
                data.fields["linked_religion"] = {target_id};
                data.references.emplace_back(NativeHistoryObjectKind::Entity, target_id);
                break;
            }
            if (data.fields["linked_religion"].front() < 0 && deities.size() == 1 &&
                !native_history_copy(reinterpret_cast<uintptr_t>(deities.begin), data.actor_id))
                return std::nullopt;
        }
        // The optional specialty is emitted only for <=3 weapon RAWs and
        // a nonempty proficiency vector. The no-weapon branch names its
        // first unarmed skill; weapon names use the RAW plural fields.
        data.fields["specialty"] = {weapons.size() <= 3 && skills.size() != 0 &&
            (data.fields["skill"].front() > 10 || data.fields["tradition"].front() > 10)};
        data.fields["weapon_count"] = {static_cast<int32_t>(weapons.size())};
        if (data.fields["specialty"].front()) {
            if (weapons.size() == 0) {
                int16_t skill = -1;
                if (!native_history_copy(reinterpret_cast<uintptr_t>(skills.begin), skill))
                    return std::nullopt;
                data.fields["unarmed_skill"] = {skill};
            } else {
                NativeBorrowedVector<uintptr_t> definitions;
                if (!native_history_read_vector(native_history_global(0x24ecb28), definitions))
                    return std::nullopt;
                for (size_t index = 0; index < weapons.size(); ++index) {
                    int16_t subtype = -1;
                    if (!native_history_copy(reinterpret_cast<uintptr_t>(weapons.begin) +
                            index * sizeof(int16_t), subtype) || subtype < 0 ||
                        static_cast<size_t>(subtype) >= definitions.size()) return std::nullopt;
                    const uintptr_t raw = native_history_vector_at(definitions, subtype);
                    auto &label = data.texts["weapon." + std::to_string(index)];
                    if (!raw || !native_history_copy_string(native_history_object_field(
                            raw, "itemdef_weaponst", 0x88), label) || label.empty())
                        return std::nullopt;
                }
            }
        }
        if (!populate_native_history_subjects(data)) return std::nullopt;
        return page;
    }
    if (type != 5) {
        if (!populate_native_history_subjects(data)) return std::nullopt;
        return page;
    }
    NativeBorrowedVector<int32_t> deities;
    if (!native_history_copy(field(0xfc8), deities) || !deities.valid(1048576))
        return std::nullopt;
    data.fields["worship_count"] = {deities.size() > 1 ? 2 : 0};
    data.fields["deity"] = {0};
    data.fields["force"] = {0};
    data.fields["force_region"] = {-1};
    data.fields["sex"] = {-1};
    data.fields["spheres"] = {};
    data.texts["deity_species"] = "";
    // Confidence is supplied by the actual native producer callback.
    if (deities.size() == 1) {
        int32_t figure_id = -1;
        if (!native_history_copy(reinterpret_cast<uintptr_t>(deities.begin), figure_id))
            return std::nullopt;
        const uintptr_t figure = native_history_find_subject(base, NativeHistoryObjectKind::Figure, figure_id);
        if (figure) {
            data.actor_id = figure_id;
            data.fields["worship_count"] = {1};
            bool deity = false, force = false;
            if (!native_history_page_flag(figure, 0xc8, 0xd0, 2, deity) ||
                !native_history_page_flag(figure, 0xc8, 0xd0, 3, force)) return std::nullopt;
            data.fields["deity"] = {deity};
            data.fields["force"] = {force};
            if (deity) {
                int16_t deity_race = -1, caste = -1;
                int8_t sex = -1;
                uintptr_t info = 0;
                if (!native_history_copy(figure + 2, deity_race) ||
                    !native_history_copy(figure + 4, caste) || !native_history_copy(figure + 6, sex) ||
                    !native_history_copy(figure + 0x130, info) ||
                    !capture_native_history_figure_spheres(info, data.fields["spheres"]))
                    return std::nullopt;
                data.fields["sex"] = {sex};
                if (deity_race >= 0 && !capture_native_history_creature_label(
                        base, deity_race, caste, false, data.texts["deity_species"], false))
                    return std::nullopt;
            }
            if (force) {
                // The native producer chooses the last region associated
                // with this force. Use that region's ID, not its vector index.
                uintptr_t world = native_history_find_subject(base, NativeHistoryObjectKind::World, 0);
                NativeBorrowedVector<uintptr_t> regions;
                int32_t mode = -1;
                if (!world || !native_history_read_vector(native_history_object_field(
                        world, "world_data", 0x238), regions) || !regions.valid(1048576) ||
                    !native_history_copy(native_history_page_address(NativeHistoryPageSymbol::Mode), mode))
                    return std::nullopt;
                data.fields["force_past"] = {mode == 3};
                for (size_t index = regions.size(); index > 0; --index) {
                    const uintptr_t region = native_history_vector_at(regions, index - 1);
                    bool valid = true;
                    const auto found = native_history_page_find_int(native_history_object_field(
                        region, "world_region", 0x250), figure_id, valid);
                    if (!region || !valid) return std::nullopt;
                    if (!found) continue;
                    int32_t region_id = -1;
                    if (!native_history_copy(native_history_object_field(
                            region, "world_region", 0x78), region_id) || region_id < 0)
                        return std::nullopt;
                    data.fields["force_region"] = {region_id};
                    data.references.emplace_back(NativeHistoryObjectKind::Region, region_id);
                    break;
                }
            }
        }
    }
    if (!populate_native_history_subjects(data)) return std::nullopt;
    return page;
}
