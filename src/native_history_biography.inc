// Common biography fields; only native addresses and ABI getters vary by host.
static std::optional<size_t> native_history_page_find_int(uintptr_t address,
        int32_t value, bool &valid) {
    NativeBorrowedVector<int32_t> values;
    if (!native_history_copy(address, values) || !values.valid(1048576)) {
        valid = false;
        return std::nullopt;
    }
    for (size_t index = 0; index < values.size(); ++index) {
        int32_t current = -1;
        if (!native_history_copy(reinterpret_cast<uintptr_t>(values.begin) + index * 4,
                current)) { valid = false; return std::nullopt; }
        if (current == value) return index;
    }
    return std::nullopt;
}


static bool native_history_page_int_at(uintptr_t address, size_t index, int32_t &value) {
    NativeBorrowedVector<int32_t> values;
    return native_history_copy(address, values) && values.valid(1048576) &&
        index < values.size() && native_history_copy(
            reinterpret_cast<uintptr_t>(values.begin) + index * 4, value);
}


static bool native_history_page_flag(uintptr_t object, size_t pointer_offset,
        size_t count_offset, size_t bit, bool &value) {
    value = false;
    if (!object) return true;
    int32_t count = 0;
    uintptr_t flags = 0;
    if (!native_history_copy(object + count_offset, count) || count < 0 || count > 4096)
        return false;
    if (bit / 8 >= static_cast<size_t>(count)) return true;
    uint8_t byte = 0;
    if (!native_history_copy(object + pointer_offset, flags) || !flags ||
        !native_history_copy(flags + bit / 8, byte)) return false;
    value = (byte & (1u << (bit % 8))) != 0;
    return true;
}


// Deity domains use the native reverse display order in every page producer.
static bool capture_native_history_figure_spheres(uintptr_t info,
        std::vector<int32_t> &result) {
    result.clear();
    if (info) {
        uintptr_t spheres = 0;
        if (!native_history_copy(info, spheres)) return false;
        if (spheres) {
            NativeBorrowedVector<int16_t> values;
            if (!native_history_copy(spheres, values) || !values.valid(4096)) return false;
            for (size_t at = values.size(); at > 0; --at) {
                int16_t sphere = -1;
                if (!native_history_copy(reinterpret_cast<uintptr_t>(values.begin) + (at - 1) * 2, sphere))
                    return false;
                result.push_back(sphere);
            }
        }
    }
    return true;
}

static std::optional<NativeHistoryPageData> snapshot_native_history_page_biography(
        uintptr_t figure, int32_t figure_id) {
    // c2b870 is the complete figure-identity producer used by b8f0bf.
    const uintptr_t base = native_history_profile_base();
    if (!base || !figure || figure_id < 0) return std::nullopt;
    int32_t id = -1;
    int16_t race = -1, caste_id = -1;
    int8_t sex = -1;
    if (!native_history_copy(figure + 0xe0, id) || id != figure_id ||
        !native_history_copy(figure + 2, race) || !native_history_copy(figure + 4, caste_id) ||
        !native_history_copy(figure + 6, sex)) return std::nullopt;
    NativeHistoryPageData page;
    page.kind = NativeHistoryPageKind::FigureBiography;
    auto &data = page.data;
    data.actor_id = id;
    if (!native_history_copy(figure + 0x10, data.year)) return std::nullopt;
    data.fields["sex"] = {sex};
    data.fields["child_relation"] = {42};
    data.fields["confidence"] = {0};
    data.fields["force_region"] = {-1};
    data.fields["parents"] = {};
    data.fields["spheres"] = {};
    data.fields["first_kind"] = {-1};
    data.fields["fate"] = {-1};
    bool deity = false, force = false, ghost = false, skeletal = false, rotting = false;
    if (!native_history_page_flag(figure, 0xc8, 0xd0, 2, deity) ||
        !native_history_page_flag(figure, 0xc8, 0xd0, 3, force) ||
        !native_history_page_flag(figure, 0xc8, 0xd0, 4, skeletal) ||
        !native_history_page_flag(figure, 0xc8, 0xd0, 5, rotting) ||
        !native_history_page_flag(figure, 0xc8, 0xd0, 7, ghost)) return std::nullopt;
    uintptr_t info = 0, curse = 0, creature = 0, caste = 0;
    if (!native_history_copy(figure + 0x130, info) ||
        (info && !native_history_copy(info + 0x48, curse))) return std::nullopt;
    NativeBorrowedVector<uintptr_t> creatures;
    const uintptr_t creatures_address = native_history_page_address(NativeHistoryPageSymbol::Creatures);
    if (!native_history_read_vector(creatures_address, creatures)) return std::nullopt;
    if (race >= 0) creature = native_history_vector_at(creatures, static_cast<size_t>(race));
    if (creature && caste_id >= 0) {
        NativeBorrowedVector<uintptr_t> castes;
        if (!native_history_read_vector(creature + 0x178, castes)) return std::nullopt;
        caste = native_history_vector_at(castes, static_cast<size_t>(caste_id));
    }
    std::string species;
    if ((caste && !native_history_copy_string(caste + 0x20, species)) ||
        (species.empty() && creature && !native_history_copy_string(creature + 0x20, species)))
        return std::nullopt;
    data.texts["species"] = species;
    int32_t animated_id = -1, animation = -1;
    uint8_t named_curse = 0;
    if (curse && (!native_history_copy(curse + 0x144, animation) ||
        !native_history_copy(curse + 0x140, animated_id) ||
        !native_history_copy(curse + 0x88, named_curse))) return std::nullopt;
    const bool animated = curse && animation != -1;
    data.fields["identity"] = {deity ? 1 : force ? 2 : animated ? 3 : 0};
    data.fields["animated_id"] = {animated_id};
    if (animated) {
        if (!native_history_copy_string(curse + 0x150, data.texts["animated_label"])) return std::nullopt;
        if (native_history_find_subject(base, NativeHistoryObjectKind::Figure, animated_id))
            data.references.emplace_back(NativeHistoryObjectKind::Figure, animated_id);
        else data.fields["animated_id"] = {-1};
    }
    if (ghost && !named_curse) data.texts["species"] = "ghostly " + data.texts["species"];
    if (named_curse) {
        std::string label;
        if (!native_history_copy_string(curse + 0x90, label)) return std::nullopt;
        if (!label.empty()) data.texts["species"] += " " + label;
    }
    if (deity) {
        NativeBorrowedVector<uintptr_t> entities;
        const uintptr_t entities_address = native_history_page_address(NativeHistoryPageSymbol::Entities);
        if (!native_history_read_vector(entities_address, entities)) return std::nullopt;
        for (size_t at = 0; at < entities.size(); ++at) {
            const uintptr_t entity = native_history_vector_at(entities, at);
            bool valid = true;
            const auto found = native_history_page_find_int(entity + 0xfc8, id, valid);
            if (!entity || !valid) return std::nullopt;
            if (found) {
                if (!native_history_copy(entity + 4, data.entity_id)) return std::nullopt;
                break;
            }
        }
        std::string form = species;
        if (ghost) form = "ghostly " + form;
        if (rotting) form = "rotting " + form;
        if (skeletal) form = "skeletal " + form;
        bool gendered = false;
        if (!native_history_page_flag(creature, 0x1a8, 0x1b0, 66, gendered)) return std::nullopt;
        if (gendered && (sex == 0 || sex == 1)) form = (sex == 0 ? "female " : "male ") + form;
        data.texts["form"] = std::move(form);
    }
    bool raw_parent = false, raw_female = false, raw_male = false;
    if (!native_history_page_flag(creature, 0x1a8, 0x1b0, 67, raw_parent) ||
        !native_history_page_flag(creature, 0x1a8, 0x1b0, 68, raw_female) ||
        !native_history_page_flag(creature, 0x1a8, 0x1b0, 69, raw_male)) return std::nullopt;
    bool unknown_parentage = false;
    int32_t missing_parent = -1;
    if (!deity && !force && !animated && data.year >= 1) {
        NativeBorrowedVector<uintptr_t> links;
        if (!native_history_read_vector(figure + 0x118, links)) return std::nullopt;
        int32_t mother = -1, father = -1;
        for (size_t at = 0; at < links.size(); ++at) {
            const uintptr_t link = native_history_vector_at(links, at);
            int32_t type = -1, target = -1;
            if (!link || !native_history_page_getter(link, 0, type) ||
                !native_history_copy(link + 8, target)) return std::nullopt;
            if (type == 0 && mother < 0) mother = target;
            if (type == 1 && father < 0) father = target;
        }
        const bool has_mother = native_history_find_subject(base, NativeHistoryObjectKind::Figure, mother) != 0;
        const bool has_father = native_history_find_subject(base, NativeHistoryObjectKind::Figure, father) != 0;
        unknown_parentage = (mother < 0 && father < 0) ||
            (!has_mother && !has_father && raw_parent && raw_female && raw_male);
        for (int32_t parent : {has_mother ? mother : -1, has_father ? father : -1})
            if (parent >= 0) {
                data.fields["parents"].push_back(parent);
                data.references.emplace_back(NativeHistoryObjectKind::Figure, parent);
            }
        if ((has_mother != has_father) && raw_parent && raw_female && raw_male)
            missing_parent = has_mother ? 1 : 0;
    } else if (!deity && !force && !animated && data.year < 1) {
        bool mundane = false;
        if (!native_history_page_flag(creature, 0x1a8, 0x1b0, 8, mundane)) return std::nullopt;
        if (!mundane) {
            NativeBorrowedVector<uintptr_t> figures;
            int32_t same = 0, born = 0;
            const uintptr_t figures_address = native_history_page_address(NativeHistoryPageSymbol::Figures);
            if (!native_history_read_vector(figures_address, figures)) return std::nullopt;
            for (size_t at = 0; at < figures.size(); ++at) {
                const uintptr_t candidate = native_history_vector_at(figures, at);
                int16_t candidate_race = -1;
                int32_t candidate_birth = -1;
                if (!candidate || !native_history_copy(candidate + 2, candidate_race) ||
                    !native_history_copy(candidate + 0x10, candidate_birth)) return std::nullopt;
                if (candidate_race == race) { ++same; if (candidate_birth >= 1) ++born; }
            }
            data.fields["first_kind"] = {born > 0 ? (same - born <= 1 ? 0 : 1) : (same <= 1 ? 2 : 3)};
        }
    }
    data.fields["unknown_parentage"] = {unknown_parentage ? 1 : 0};
    data.fields["missing_parent"] = {missing_parent};
    // dde080 resolves the figure's nemesis ID+dc into world.nemesis.all.
    int32_t nemesis_id = -1;
    uintptr_t nemesis = 0;
    if (!native_history_copy(figure + 0xdc, nemesis_id)) return std::nullopt;
    if (nemesis_id >= 0 && !native_history_material_find_id(
            native_history_page_address(NativeHistoryPageSymbol::Nemeses), 0,
            nemesis_id, nemesis)) return std::nullopt;
    bool fated = false, unusual = false, vanguard = false;
    if (!native_history_page_flag(nemesis, 0x58, 0x60, 2, fated) ||
        !native_history_page_flag(nemesis, 0x58, 0x60, 9, unusual) ||
        !native_history_page_flag(nemesis, 0x58, 0x60, 10, vanguard)) return std::nullopt;
    if (fated) data.fields["fate"] = {vanguard ? 2 : unusual ? 1 : 0};
    bool description = false;
    if (!deity && caste) {
        for (size_t bit : {size_t(132), size_t(134), size_t(143), size_t(131)}) {
            bool set = false;
            if (!native_history_page_flag(caste, 0x6a8, 0x6b0, bit, set)) return std::nullopt;
            description |= set;
        }
        if (description && !native_history_copy_string(caste + 0x220, data.texts["description"]))
            return std::nullopt;
    }
    if (!capture_native_history_figure_spheres(info, data.fields["spheres"])) return std::nullopt;
    if (!populate_native_history_subjects(data)) return std::nullopt;
    return page;
}

