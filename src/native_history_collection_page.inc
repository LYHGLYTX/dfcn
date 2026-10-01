struct NativeHistoryWarSelection {
    uintptr_t collection = 0;
    int32_t id = -1, category = -1, index = -1, count = 0;
};

static std::optional<NativeHistoryWarSelection> &pending_native_history_war_selection() {
    return reloadable_thread_state<std::optional<NativeHistoryWarSelection>, struct HistoryWarSelectionTag>();
}

static bool native_history_war_selection(uintptr_t collection, int32_t &category,
        int32_t &index, int32_t &count) {
    auto &pending = pending_native_history_war_selection();
    if (!pending) return false;
    // A constructor's selection belongs to its next page capture only; do not
    // reuse an address after closing a world or building another description.
    const auto selected = *pending;
    pending.reset();
    if (selected.collection != collection) return false;
    int32_t id = -1;
    if (!native_history_copy(collection + 0x58, id) || id != selected.id) return false;
    category = selected.category;
    index = selected.index;
    count = selected.count;
    return true;
}

// Native Legends page paragraphs that are produced outside history_eventst.
// These snapshots borrow collection/age fields; no formatted prose is parsed.
static int32_t native_history_collection_type(uintptr_t collection);
static bool capture_native_history_schedule_features(uintptr_t program, NativeHistoryEventData &event);
static bool capture_native_history_page_event(int32_t id, NativeHistoryEventData &event);
static bool capture_native_history_page_program(uintptr_t program, NativeHistoryEventData &event, int32_t mode);
static bool native_history_war_selection(uintptr_t collection, int32_t &category, int32_t &index, int32_t &count);

template<typename T>
static bool native_history_page_values(uintptr_t address, std::vector<T> &out) {
    NativeBorrowedVector<T> values;
    if (!native_history_copy(address, values) || !values.valid(1048576)) return false;
    out.resize(values.size());
    return out.empty() || native_history_copy_bytes(reinterpret_cast<uintptr_t>(values.begin),
        out.data(), out.size() * sizeof(T));
}

static bool capture_native_history_battle_introduction(uintptr_t collection,
        NativeHistoryEventData &event) {
    const uintptr_t base = native_history_profile_base();
    if (!base) return false;
    std::array<std::vector<int32_t>, 2> figures;
    if (!native_history_page_values(native_history_object_field(collection, {}, 0x120), figures[0]) ||
            !native_history_page_values(native_history_object_field(collection, {}, 0x150), figures[1])) return false;
    std::array<int32_t, 2> losses{};
    const auto add_losses = [&](uintptr_t owner) {
        std::vector<int32_t> ids;
        if (!native_history_page_values(owner + 8, ids)) return false;
        for (int32_t id : ids) {
            uintptr_t occurrence = 0;
            if (!native_history_find_structure_id(native_history_global(0x24f9cb8), 0x20, id, occurrence)) return false;
            if (!occurrence) continue;
            int32_t type = -1, victim = -1;
            if (!capture_native_history_event_identity(reinterpret_cast<void *>(occurrence), type)) return false;
            if (type != 3) continue;
            if (!native_history_copy(native_history_event_field(reinterpret_cast<void *>(occurrence), 3, 0x28, 4), victim)) return false;
            for (size_t side = 0; side < figures.size(); ++side)
                if (std::find(figures[side].begin(), figures[side].end(), victim) != figures[side].end())
                    ++losses[side];
        }
        return true;
    };
    // The original page counts deaths in this collection and its immediate
    // child collections. It does not recursively count descendants twice.
    if (!add_losses(collection)) return false;
    std::vector<int32_t> children;
    if (!native_history_page_values(native_history_object_field(collection, {}, 0x20), children)) return false;
    for (int32_t id : children) {
        uintptr_t child = 0;
        if (!native_history_material_find_id(native_history_global(0x24f9d30), 0x58, id, child)) return false;
        if (child && !add_losses(child)) return false;
    }
    for (size_t side = 0; side < figures.size(); ++side) {
        const std::string key = side ? "defender." : "attacker.";
        struct Group { int16_t race; int32_t flags, count; };
        std::vector<Group> groups;
        int32_t unknown = 0, total = static_cast<int32_t>(figures[side].size());
        const auto add = [&](int16_t race, int32_t flags, int32_t count) {
            const auto found = std::find_if(groups.begin(), groups.end(),
                [&](const auto &group) { return group.race == race && group.flags == flags; });
            if (found == groups.end()) groups.push_back({race, flags, count});
            else found->count += count;
        };
        for (auto at = figures[side].rbegin(); at != figures[side].rend(); ++at) {
            const uintptr_t figure = native_history_find_subject(base, NativeHistoryObjectKind::Figure, *at);
            if (!figure) { ++unknown; continue; }
            int16_t race = -1;
            uintptr_t info = 0, state = 0;
            std::string undead_name;
            if (!native_history_copy(figure + 2, race) || !native_history_copy(figure + 0x130, info) ||
                    (info && !native_history_copy(info + 0x48, state)) ||
                    (state && !native_history_copy_string(state + 0x150, undead_name))) return false;
            add(race, undead_name.empty() ? 0 : 1, 1);
        }
        const uintptr_t offset = side ? 0x268 : 0x1d8;
        std::vector<int32_t> populations, counts, deaths, races, flags;
        if (!native_history_page_values(native_history_object_field(collection, {}, offset), populations) ||
                !native_history_page_values(native_history_object_field(collection, {}, offset + 0x18), counts) ||
                !native_history_page_values(native_history_object_field(collection, {}, offset + 0x30), deaths) ||
                !native_history_page_values(native_history_object_field(collection, {}, offset + 0x48), races) ||
                !native_history_page_values(native_history_object_field(collection, {}, offset + 0x78), flags) ||
                counts.size() != populations.size() || deaths.size() != populations.size() ||
                races.size() != populations.size() || flags.size() != populations.size()) return false;
        for (size_t index = populations.size(); index-- > 0;) {
            total += counts[index];
            losses[side] += deaths[index];
            add(static_cast<int16_t>(races[index]), flags[index], counts[index]);
        }
        event.fields[key + "total"] = {total};
        event.fields[key + "losses"] = {losses[side]};
        event.fields[key + "unknown"] = {unknown};
        event.fields[key + "groups"] = {static_cast<int32_t>(groups.size())};
        for (size_t index = 0; index < groups.size(); ++index) {
            const auto &group = groups[index];
            const std::string item = key + std::to_string(index) + ".";
            event.fields[item + "count"] = {group.count};
            event.fields[item + "animated"] = {group.flags & 1};
            if (!capture_native_history_creature_label(base, group.race, -1, group.count != 1,
                    event.texts[item + "species"])) return false;
        }
    }
    int16_t outcome = -1;
    if (!native_history_copy(native_history_object_field(collection, {}, 0x2f8), outcome)) return false;
    event.fields["outcome"] = {outcome};
    return true;
}

static bool capture_native_history_age_introduction(uintptr_t age,
        NativeHistoryEventData &event) {
    const uintptr_t base = native_history_profile_base();
    int16_t type = -1;
    int32_t ordinal = 0;
    if (!base || !age || !native_history_copy(age + 8, type) || type < 0 || type > 12 ||
            !native_history_copy(age + 0x14, ordinal) ||
            !native_history_copy_string(age + 0x18, event.texts["age_title"])) return false;
    event.fields["type"] = {type};
    event.fields["ordinal"] = {ordinal};
    NativeBorrowedVector<uintptr_t> ages;
    if (!native_history_read_vector(native_history_global(0x24f9ef8), ages)) return false;
    size_t index = 0;
    while (index < ages.size() && native_history_vector_at(ages, index) != age) ++index;
    if (index == ages.size()) return false;
    int16_t previous_type = -1;
    if (index && !native_history_copy(native_history_vector_at(ages, index - 1) + 8, previous_type)) return false;
    event.fields["age_index"] = {static_cast<int32_t>(index)};
    event.fields["previous_type"] = {previous_type};
    if (type <= 2) {
        const size_t count = type == 0 ? 3 : type == 1 ? 2 : 1;
        const size_t offset = type == 0 ? 0x4c : 0x0c;
        for (size_t item = 0; item < count; ++item) {
            int32_t id = -1;
            if (!native_history_copy(age + offset + item * sizeof(int32_t), id)) return false;
            event.fields["power." + std::to_string(item)] = {id};
            if (id >= 0) event.references.emplace_back(NativeHistoryObjectKind::Figure, id);
        }
    } else if (type == 7) {
        int32_t race = -1;
        if (!native_history_copy(age + 0x0c, race) ||
                !capture_native_history_creature_label(base, race, -1, true, event.texts["ruling_species"])) return false;
    }
    return populate_native_history_subjects(event);
}

static bool capture_native_history_beast_introduction(uintptr_t collection, NativeHistoryEventData &event) {
    std::vector<int32_t> figures;
    if (!native_history_page_values(native_history_object_field(collection, {}, 0x78), figures)) return false;
    const uintptr_t base = native_history_profile_base();
    int16_t common = -1;
    for (auto at = figures.rbegin(); at != figures.rend(); ++at) {
        const uintptr_t figure = native_history_find_subject(base, NativeHistoryObjectKind::Figure, *at);
        if (!figure) continue;
        int16_t race = -1;
        if (!native_history_copy(figure + 2, race)) return false;
        if (common == -1) common = race;
        else if (common != race) { common = -1; break; }
    }
    event.fields["count"] = {static_cast<int32_t>(figures.size())};
    event.texts["species"] = figures.size() > 1 ? "beasts" : "beast";
    return common == -1 || capture_native_history_creature_label(base, common, -1,
        figures.size() > 1, event.texts["species"]);
}

static bool capture_native_history_war_introduction(uintptr_t collection, NativeHistoryEventData &event,
        int32_t category, int32_t index, int32_t candidate_count) {
    const uintptr_t base = native_history_profile_base();
    int32_t id = -1;
    std::vector<int32_t> attackers, defenders;
    if (!native_history_copy(native_history_object_field(collection, {}, 0x58), id) ||
            !native_history_page_values(native_history_object_field(collection, {}, 0xd8), attackers) ||
            !native_history_page_values(native_history_object_field(collection, {}, 0xf0), defenders)) return false;
    event.fields["collection_id"] = {id};
    event.fields["war_sides"] = {!attackers.empty() && !defenders.empty() ? 1 : 0};
    if (!attackers.empty() && !defenders.empty()) {
        if (!capture_native_history_collection_title(id, event)) return false;
        event.fields["war_attacker"] = {attackers.front()};
        event.fields["war_defender"] = {defenders.front()};
        event.references.emplace_back(NativeHistoryObjectKind::Entity, attackers.front());
        event.references.emplace_back(NativeHistoryObjectKind::Entity, defenders.front());
    }
    event.fields["war_candidates"] = {candidate_count};
    if (!candidate_count) return populate_native_history_subjects(event);
    if (category < 0 || category > 2 || index < 0) return false;
    static constexpr size_t type_offsets[]{0x120, 0x1a0, 0x208};
    static constexpr size_t data_offsets[]{0x138, 0x1b8, 0x220};
    std::vector<int16_t> types;
    std::vector<int32_t> values;
    if (!native_history_page_values(native_history_object_field(collection, {}, type_offsets[category]), types) ||
            !native_history_page_values(native_history_object_field(collection, {}, data_offsets[category]), values) ||
            static_cast<size_t>(index) >= types.size() || static_cast<size_t>(index) >= values.size()) return false;
    const int32_t type = types[index], value = values[index];
    event.fields["war_category"] = {category};
    event.fields["war_type"] = {type};
    event.fields["war_value"] = {value};
    if (category == 0) {
        event.references.emplace_back(NativeHistoryObjectKind::Figure, value);
        if (type >= 1 && type <= 4) {
            std::vector<int32_t> spheres;
            if (!native_history_page_values(native_history_object_field(collection, {}, 0x150), spheres) ||
                    static_cast<size_t>(index) >= spheres.size()) return false;
            event.fields["war_sphere"] = {static_cast<int16_t>(spheres[index])};
        }
    } else if (category == 2 && type == 5) {
        uintptr_t occurrence = 0;
        int32_t native_type = -1, dispute = -1;
        if (!native_history_find_structure_id(native_history_global(0x24f9cb8), 0x20, value, occurrence)) return false;
        if (occurrence) {
            if (!capture_native_history_event_identity(reinterpret_cast<void *>(occurrence), native_type)) return false;
            if (native_type == 76 && !native_history_copy(native_history_event_field(reinterpret_cast<void *>(occurrence), 76, 0x28, 4), dispute)) return false;
        }
        event.fields["war_event_type"] = {native_type};
        event.fields["war_dispute"] = {dispute};
    } else if (category == 2 && type == 6) {
        uintptr_t previous = 0;
        if (!native_history_material_find_id(native_history_global(0x24f9d30), 0x58, value, previous)) return false;
        const int32_t native_type = previous ? native_history_collection_type(previous) : -1;
        if (previous && native_type < 0) return false;
        event.fields["war_collection_type"] = {native_type};
    } else if (category == 2 && type == 10) {
        event.references.emplace_back(NativeHistoryObjectKind::Artifact, value);
    }
    return populate_native_history_subjects(event);
}

static bool capture_native_history_war_introduction(uintptr_t collection, NativeHistoryEventData &event) {
    // The producer chooses one of its significant causes with its RNG. Its
    // captured native category/index is authoritative; never pick a cause by
    // scanning the English paragraph or by making another random draw.
    int32_t category = -1, index = -1, count = 0;
    if (!native_history_war_selection(collection, category, index, count)) {
        std::array<std::vector<int32_t>, 3> ratings;
        int32_t minimum = -1;
        for (size_t group = 0; group < ratings.size(); ++group) {
            const size_t offset = group == 0 ? 0x180 : group == 1 ? 0x1e8 : 0x238;
            if (!native_history_page_values(native_history_object_field(collection, {}, offset), ratings[group]) || ratings[group].size() > INT16_MAX)
                return false;
            for (int32_t rating : ratings[group]) minimum = std::min(minimum, rating);
        }
        const int32_t threshold = minimum / 2 - 1;
        for (size_t group = 0; group < ratings.size(); ++group)
            for (size_t at = ratings[group].size(); at-- > 0;)
                if (ratings[group][at] <= threshold) {
                    category = static_cast<int32_t>(group);
                    index = static_cast<int32_t>(at);
                    ++count;
                }
        // A zero/one-candidate page has no unresolved presentation choice.
        if (count > 1) return false;
    }
    return capture_native_history_war_introduction(collection, event, category, index, count);
}

static bool capture_native_history_occasion_introduction(uintptr_t collection, int32_t type,
        NativeHistoryEventData &event) {
    const uintptr_t base = native_history_profile_base();
    int32_t entity_id = -1, occasion_id = -1;
    if (!native_history_copy(native_history_object_field(collection, {}, (type == 9 ? 0x60 : 0x64)), entity_id) ||
            !native_history_copy(native_history_object_field(collection, {}, (type == 9 ? 0x64 : 0x68)), occasion_id) ||
            !native_history_copy(native_history_object_field(collection, {}, 0x38), event.year) ||
            !native_history_copy(native_history_object_field(collection, {}, 0x40), event.seconds)) return false;
    const uintptr_t entity = native_history_find_subject(base, NativeHistoryObjectKind::Entity, entity_id);
    uintptr_t definitions = 0, occasion = 0;
    if (!entity || !native_history_copy(entity + 0x1310, definitions) || !definitions ||
            !native_history_find_structure_id(definitions, 0, occasion_id, occasion) || !occasion) return false;
    if (type == 9) {
        int32_t kind = -1, data = -1, sphere = -1;
        if (!native_history_copy(occasion + 0x90, kind)) return false;
        event.fields["occasion_type"] = {kind};
        if (kind == 0 || kind == 2) {
            if (!native_history_copy(occasion + 0x94, data)) return false;
            if (kind == 0) {
                uintptr_t child = 0;
                if (!native_history_find_structure_id(native_history_global(0x24f9cb8), 0x20, data, child)) return false;
                if (!child) data = -1;
                else if (!capture_native_history_page_event(data, event)) return false;
            } else {
                if (!native_history_copy(occasion + 0x98, sphere)) return false;
                event.references.emplace_back(NativeHistoryObjectKind::Figure, data);
            }
        }
        event.fields["occasion_value"] = {data};
        event.fields["sphere"] = {sphere};
        return populate_native_history_subjects(event);
    }
    int32_t index = -1, kind = -1, value = -1, extra = -1;
    std::vector<uintptr_t> programs;
    if (!native_history_copy(native_history_object_field(collection, {}, 0x6c), index) || index < 0 ||
            !native_history_page_values(occasion + 0xa0, programs) ||
            static_cast<size_t>(index) >= programs.size()) return false;
    const uintptr_t program = programs[index];
    if (!program || !native_history_copy(program, kind) ||
            !native_history_copy(program + 4, value) || !native_history_copy(program + 8, extra)) return false;
    event.fields["schedule_type"] = {kind};
    event.fields["schedule_value"] = {value};
    event.fields["schedule_extra"] = {extra};
    if (type == 10 && kind == 3) {
        uintptr_t child = 0;
        if (!native_history_find_structure_id(native_history_global(0x24f9cb8), 0x20, value, child)) return false;
        if (!child) event.fields["schedule_value"] = {-1};
        else if (!capture_native_history_page_event(value, event)) return false;
    }
    if ((type == 10 && kind >= 0 && kind <= 2) || (type == 11 && kind >= 4 && kind <= 6)) {
        const int form = type == 10 ? kind : kind - 4;
        if (!native_history_form_reference(event, form == 0 ? NativeHistoryObjectKind::Dance :
                form == 1 ? NativeHistoryObjectKind::Music : NativeHistoryObjectKind::Poem, value)) return false;
    }
    if (type == 11 && kind == 9 && !capture_native_history_creature_label(base,
            static_cast<int16_t>(value), static_cast<int16_t>(extra), false, event.texts["race_species"])) return false;
    if (type == 11 && kind == 11) {
        int16_t item_type = -1, subtype = -1, material = -1;
        int32_t material_index = -1;
        if (!native_history_copy(program + 4, item_type) || !native_history_copy(program + 8, subtype) ||
                !native_history_copy(program + 0xc, material) ||
                !native_history_copy(program + 0x10, material_index)) return false;
        event.fields["throwing"] = {item_type, subtype, material, material_index};
        if (!capture_native_history_page_item(event.fields.at("throwing"), event, "prize", 1)) return false;
    }
    if (type == 12) {
        int32_t site = -1;
        if (!native_history_copy(occasion + 8, site)) return false;
        const bool present = native_history_find_subject(base, NativeHistoryObjectKind::Site, site) != 0;
        event.fields["site"] = {site};
        event.fields["route_present"] = {present ? 1 : 0};
        if (present && ((value != -1 && !native_history_structure_reference(event, site, value)) ||
                (extra != -1 && !native_history_structure_reference(event, site, extra)))) return false;
    }
    return capture_native_history_schedule_features(program, event) &&
        capture_native_history_page_program(program, event, 2) && populate_native_history_subjects(event);
}

static std::optional<NativeHistoryPageData> snapshot_native_history_collection_introduction(
        void *age, void *collection) {
    NativeHistoryPageData page;
    auto &event = page.data;
    const auto finish = [&]() -> std::optional<NativeHistoryPageData> {
        if (!capture_native_history_subject_item_labels(event) || !native_history_tree_within_limits(event, true))
            return std::nullopt;
        return std::move(page);
    };
    if (age && !collection) {
        page.kind = NativeHistoryPageKind::AgeIntroduction;
        if (!capture_native_history_age_introduction(reinterpret_cast<uintptr_t>(age), event)) return std::nullopt;
        return finish();
    }
    if (!collection || age) return std::nullopt;
    const uintptr_t address = reinterpret_cast<uintptr_t>(collection);
    const int32_t type = native_history_collection_type(address);
    page.kind = NativeHistoryPageKind::CollectionIntroduction;
    event.fields["marker"] = {0};
    event.fields["type"] = {type};
    if (type == 0 && capture_native_history_war_introduction(address, event)) return finish();
    if (type == 1 && capture_native_history_battle_introduction(address, event)) return finish();
    if (type == 6 && capture_native_history_beast_introduction(address, event)) return finish();
    if (type >= 9 && type <= 13 && capture_native_history_occasion_introduction(address, type, event)) return finish();
    return std::nullopt;
}

static std::optional<NativeHistoryPageData> snapshot_native_history_collection_marker(
        uintptr_t address, int32_t marker, int32_t year, int32_t seconds) {
    int32_t id = -1;
    if (!address || marker < 1 || marker > 4 || !native_history_copy(address + 0x58, id) || id < 0)
        return std::nullopt;
    NativeHistoryPageData page;
    page.kind = NativeHistoryPageKind::CollectionIntroduction;
    page.data.fields["marker"] = {marker};
    if (marker == 3) {
        int32_t start_year = -1, end_year = -1, start_seconds = -1, end_seconds = -1;
        if (!native_history_copy(address + 0x38, start_year) ||
                !native_history_copy(address + 0x3c, end_year) ||
                !native_history_copy(address + 0x40, start_seconds) ||
                !native_history_copy(address + 0x44, end_seconds)) return std::nullopt;
        page.data.fields["marker"] = {
            start_year == end_year && start_seconds == end_seconds ? 3 : 4};
    }
    page.data.fields["collection_id"] = {id};
    page.data.year = year;
    page.data.seconds = seconds;
    if (!capture_native_history_collection_title(id, page.data) || !populate_native_history_subjects(page.data) ||
            !capture_native_history_subject_item_labels(page.data) || !native_history_tree_within_limits(page.data, true))
        return std::nullopt;
    return page;
}
