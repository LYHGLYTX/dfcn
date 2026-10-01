// History-event collections have a separate ID space and vtable contract
// from history_eventst. Capture their meaning into the owning event only.
static int32_t native_history_collection_type(uintptr_t collection) {
    static constexpr const char *classes[] = {
        "history_event_collection_warst",
        "history_event_collection_battlest",
        "history_event_collection_duelst",
        "history_event_collection_site_conqueredst",
        "history_event_collection_abductionst",
        "history_event_collection_theftst",
        "history_event_collection_beast_attackst",
        "history_event_collection_journeyst",
        "history_event_collection_insurrectionst",
        "history_event_collection_occasionst",
        "history_event_collection_performancest",
        "history_event_collection_competitionst",
        "history_event_collection_processionst",
        "history_event_collection_ceremonyst",
        "history_event_collection_purgest",
        "history_event_collection_raidst",
        "history_event_collection_persecutionst",
        "history_event_collection_entity_overthrownst",
    };
    const auto *layout = native_history_dynamic_layout(collection);
    if (!layout) return -1;
    for (size_t i = 0; i < std::size(classes); ++i)
        if (std::string_view(layout->name) == classes[i]) return static_cast<int32_t>(i);
    return -1;
}

static void capture_native_history_theft_rampage_title(uintptr_t collection,
        int32_t type, int32_t id, NativeHistoryEventData &event) {
    const uintptr_t base = native_history_profile_base();
    if (!base) return;
    if (type == 5) {
        // RTTI history_event_collection_theftst: getType=5, title bc6520.
        // Its title reads the occurrence count directly at +1b8 and the
        // location at +64/+68/+6c; none is reconstructed from English.
        int32_t region = -1, layer = -1, site = -1, ordinal = -1, item_id = -1;
        NativeBorrowedVector<int32_t> stolen_items, attempted_items;
        if (!native_history_copy(native_history_object_field(collection, {}, 0x64), region) ||
                !native_history_copy(native_history_object_field(collection, {}, 0x68), layer) ||
                !native_history_copy(native_history_object_field(collection, {}, 0x6c), site) ||
                !native_history_copy(native_history_object_field(collection, {}, 0x1b8), ordinal) ||
                !native_history_copy(native_history_object_field(collection, {}, 0xf8), stolen_items) ||
                !stolen_items.valid(1u << 20)) return;
        const bool attempted = stolen_items.size() == 0;
        if (stolen_items.size() == 1) {
            if (!native_history_copy(reinterpret_cast<uintptr_t>(stolen_items.begin), item_id)) return;
        } else if (attempted) {
            if (!native_history_copy(native_history_object_field(collection, {}, 0x188), attempted_items) ||
                    !attempted_items.valid(1u << 20)) return;
            if (attempted_items.size() == 1 && !native_history_copy(
                    reinterpret_cast<uintptr_t>(attempted_items.begin), item_id)) return;
        }
        // bc66cf calls b94710 with an ITEM ID. Resolve the corresponding
        // artifact through its retained item pointer, including historical
        // items no longer present in world.items.all. Keep that ID space
        // separate from artifact IDs and never parse an English caption.
        int32_t artifact = -1;
        if (!native_history_referenced_item_artifact(base, item_id, artifact)) return;
        const std::string key = "collection." + std::to_string(id) + ".";
        event.fields[key + "ordinal"] = {ordinal};
        event.fields[key + "region"] = {region};
        event.fields[key + "layer"] = {layer};
        event.fields[key + "site"] = {site};
        event.fields[key + "attempted"] = {attempted ? 1 : 0};
        event.fields[key + "artifact"] = {artifact};
        event.fields[key + "item.present"] = {
            stolen_items.size() == 1 || (attempted && attempted_items.size() == 1) ? 1 : 0};
        if (artifact >= 0) {
            // b94710 always uses the artifact's language_name +8 and uses
            // Untitled for an empty name. It never calls the normal artifact
            // caption's book/item-description alternatives at b94400.
            const uintptr_t record = native_history_find_subject(base, NativeHistoryObjectKind::Artifact, artifact);
            NativeHistorySubject title_item;
            title_item.kind = NativeHistoryObjectKind::Collection;
            title_item.id = id;
            title_item.subid = artifact;
            if (!record || !capture_native_history_name(base, record + 8, title_item.name)) return;
            const bool has_words = std::any_of(title_item.name.words.begin(), title_item.name.words.end(),
                [](const auto &word) { return !word.id.empty() && word.has_form; });
            if (!title_item.name.has_name || (title_item.name.first_name.empty() &&
                    title_item.name.nickname.empty() && !has_words)) {
                title_item.name.has_name = false;
                title_item.label_key = "Untitled";
            }
            event.subjects.push_back(std::move(title_item));
        }
        if (site >= 0) event.references.emplace_back(NativeHistoryObjectKind::Site, site);
        else if (layer >= 0) event.references.emplace_back(NativeHistoryObjectKind::Underground, layer);
        else if (region >= 0) event.references.emplace_back(NativeHistoryObjectKind::Region, region);
        event.fields[key + "type"] = {5};
        return;
    }
    if (type != 6) return;
    int32_t region = -1, layer = -1, site = -1, ordinal = -1;
    NativeBorrowedVector<int32_t> beasts;
    if (!native_history_copy(native_history_object_field(collection, {}, 0x64), region) ||
            !native_history_copy(native_history_object_field(collection, {}, 0x68), layer) ||
            !native_history_copy(native_history_object_field(collection, {}, 0x6c), site) ||
            !native_history_copy(native_history_object_field(collection, {}, 0x90), ordinal) ||
            !native_history_copy(native_history_object_field(collection, {}, 0x78), beasts) || !beasts.valid(4096)) return;
    std::vector<int32_t> figures(beasts.size());
    if (!figures.empty() && !native_history_copy_bytes(reinterpret_cast<uintptr_t>(beasts.begin),
            figures.data(), figures.size() * sizeof(int32_t))) return;
    std::string species;
    if (figures.size() > 1) {
        // bc6780 walks the HF list backwards, skips missing figures, and
        // returns their shared race or -1 when different races occur.
        int16_t common_race = -1;
        for (auto at = figures.rbegin(); at != figures.rend(); ++at) {
            const uintptr_t figure = native_history_find_subject(base, NativeHistoryObjectKind::Figure, *at);
            if (!figure) continue;
            int16_t race = -1;
            if (!native_history_copy(figure + 2, race)) return;
            if (common_race == -1) common_race = race;
            else if (common_race != race) { common_race = -1; break; }
        }
        if (common_race == -1) species = "Monster";
        else {
            // bc69d5 names a same-species group with creature_raw.name[2],
            // the independent adjective at +60, not a parsed figure label.
            NativeBorrowedVector<uintptr_t> creatures;
            if (common_race < 0 || !native_history_read_vector(native_history_global(0x24eca68), creatures) ||
                    static_cast<size_t>(common_race) >= creatures.size()) return;
            const uintptr_t creature = native_history_vector_at(creatures, common_race);
            if (!creature || !native_history_copy_string(creature + 0x60, species)) return;
        }
    }
    const std::string key = "collection." + std::to_string(id) + ".";
    event.fields[key + "type"] = {6};
    event.fields[key + "ordinal"] = {ordinal};
    event.fields[key + "region"] = {region};
    event.fields[key + "layer"] = {layer};
    event.fields[key + "site"] = {site};
    event.fields[key + "figures"] = std::move(figures);
    event.texts[key + "species"] = std::move(species);
    const auto &captured = event.fields.at(key + "figures");
    if (captured.size() == 1 && captured.front() >= 0)
        event.references.emplace_back(NativeHistoryObjectKind::Figure, captured.front());
    if (site >= 0) event.references.emplace_back(NativeHistoryObjectKind::Site, site);
    else if (layer >= 0) event.references.emplace_back(NativeHistoryObjectKind::Underground, layer);
    else if (region >= 0) event.references.emplace_back(NativeHistoryObjectKind::Region, region);
}

// All eighteen HEC title families share this snapshot. Both circumstance 233
// and Legends collection/figure pages retain the same native ID and roles.
static bool capture_native_history_collection_title(int32_t id, NativeHistoryEventData &event) {
    const std::string key = "collection." + std::to_string(id) + ".";
    if (event.fields.contains(key + "type")) return true;
    const uintptr_t base = native_history_profile_base();
    uintptr_t collection = 0;
    // b5b543..b5b576 resolves the HEC ID at +58 and calls title slot +30.
    if (!base || id < 0 || !native_history_material_find_id(native_history_global(0x24f9d30), 0x58, id, collection) ||
            !collection || collection > UINTPTR_MAX - 0x1c0) return false;
    const int32_t type = native_history_collection_type(collection);
    if (type < 0) return false;
    if (type == 5 || type == 6) {
        capture_native_history_theft_rampage_title(collection, type, id, event);
        return event.fields.contains(key + "type");
    }
    const auto scalar = [&](const char *name, size_t offset) {
        int32_t value = -1;
        if (!native_history_copy(native_history_object_field(collection, {}, offset), value)) return false;
        event.fields[key + name] = {value};
        return true;
    };
    const auto list = [&](const char *name, size_t offset) {
        NativeBorrowedVector<int32_t> borrowed;
        if (!native_history_copy(native_history_object_field(collection, {}, offset), borrowed) || !borrowed.valid(4096)) return false;
        std::vector<int32_t> values(borrowed.size());
        if (!values.empty() && !native_history_copy_bytes(reinterpret_cast<uintptr_t>(borrowed.begin),
                values.data(), values.size() * sizeof(int32_t))) return false;
        event.fields[key + name] = std::move(values);
        return true;
    };
    const auto ref = [&](const char *name, NativeHistoryObjectKind kind) {
        const int32_t value = event.fields.at(key + name).front();
        event.references.emplace_back(kind, value);
    };
    const auto location = [&]() {
        if (!scalar("region", 0x64) || !scalar("layer", 0x68) || !scalar("site", 0x6c)) return false;
        const int32_t site = event.fields.at(key + "site").front();
        const int32_t layer = event.fields.at(key + "layer").front();
        const int32_t region = event.fields.at(key + "region").front();
        if (site >= 0) ref("site", NativeHistoryObjectKind::Site);
        else if (layer >= 0) ref("layer", NativeHistoryObjectKind::Underground);
        else if (region >= 0) ref("region", NativeHistoryObjectKind::Region);
        return true;
    };
    const auto name = [&](uintptr_t address) {
        NativeHistorySubject value;
        value.kind = NativeHistoryObjectKind::Collection;
        value.id = id;
        if (!capture_native_history_name(base, address, value.name)) return false;
        event.fields[key + "named"] = {value.name.has_name ? 1 : 0};
        event.subjects.push_back(std::move(value));
        return true;
    };
    event.fields[key + "ordinal"] = {1};
    switch (type) {
    case 0: case 1:
        // bc56b0 consumes language_name +60; it is not a rendered title.
        if (!name(native_history_object_field(collection, {}, 0x60))) return false;
        break;
    case 2:
        if (!scalar("ordinal", 0x7c) || !scalar("first", 0x74) || !scalar("second", 0x78)) return false;
        ref("first", NativeHistoryObjectKind::Figure);
        ref("second", NativeHistoryObjectKind::Figure);
        break;
    case 3: {
        int16_t outcome = -1;
        if (!scalar("ordinal", 0x9c) || !scalar("site", 0x64) ||
                !native_history_copy(native_history_object_field(collection, {}, 0x98), outcome)) return false;
        // bc5b4c maps 1 destruction, 47 pillaging, 48..50 conquest,
        // 110 surrender; other enum values append no action label.
        event.fields[key + "outcome"] = {outcome};
        ref("site", NativeHistoryObjectKind::Site);
        break;
    }
    case 4: {
        if (!scalar("ordinal", 0xc8) || !location() || !list("captured", 0x98)) return false;
        const auto &captured = event.fields.at(key + "captured");
        event.fields[key + "attempted"] = {captured.empty() ? 1 : 0};
        int32_t figure = -1;
        bool has_figure = captured.size() == 1;
        if (has_figure) figure = captured.front();
        else if (captured.empty()) {
            if (!list("attempted_figures", 0xb0)) return false;
            const auto &attempted = event.fields.at(key + "attempted_figures");
            has_figure = attempted.size() == 1;
            if (has_figure) figure = attempted.front();
        }
        event.fields[key + "figure"] = {figure};
        event.fields[key + "figure.present"] = {has_figure ? 1 : 0};
        if (has_figure) ref("figure", NativeHistoryObjectKind::Figure);
        break;
    }
    case 7: {
        if (!scalar("ordinal", 0x78) || !list("figures", 0x60)) return false;
        const auto &figures = event.fields.at(key + "figures");
        // Native bc6c6c prints the first traveler and prints a second only
        // when the vector has exactly two entries.
        if (!figures.empty()) event.references.emplace_back(NativeHistoryObjectKind::Figure, figures[0]);
        if (figures.size() == 2) event.references.emplace_back(NativeHistoryObjectKind::Figure, figures[1]);
        break;
    }
    case 8:
        if (!scalar("ordinal", 0x68) || !scalar("site", 0x60)) return false;
        ref("site", NativeHistoryObjectKind::Site);
        break;
    case 14:
        if (!scalar("ordinal", 0x88) || !scalar("site", 0x60) ||
                !native_history_copy_string(native_history_object_field(collection, {}, 0x68), event.texts[key + "modifier"])) return false;
        ref("site", NativeHistoryObjectKind::Site);
        break;
    case 15:
        if (!scalar("ordinal", 0x98) || !location()) return false;
        break;
    case 16: case 17:
        if (!scalar("ordinal", 0x68) || !scalar("site", 0x60) || !scalar("entity", 0x64)) return false;
        ref("entity", NativeHistoryObjectKind::Entity);
        if (type == 16 || event.fields.at(key + "site").front() >= 0) ref("site", NativeHistoryObjectKind::Site);
        break;
    case 9: case 10: case 11: case 12: case 13: {
        const bool occasion_title = type == 9;
        if (!scalar("entity", occasion_title ? 0x60 : 0x64) ||
                !scalar("occasion", occasion_title ? 0x64 : 0x68) ||
                !scalar("ordinal", occasion_title ? 0x68 : 0x70)) return false;
        const uintptr_t entity = native_history_find_subject(base, NativeHistoryObjectKind::Entity,
            event.fields.at(key + "entity").front());
        uintptr_t definitions = 0, occasion = 0;
        if (entity && (!native_history_copy(entity + 0x1310, definitions) ||
                (definitions && !native_history_find_structure_id(definitions, 0,
                    event.fields.at(key + "occasion").front(), occasion)))) return false;
        event.fields[key + "occasion.present"] = {occasion ? 1 : 0};
        event.fields[key + "schedule.present"] = {0};
        event.fields[key + "schedule.type"] = {-1};
        if (!occasion) break;
        if (!name(occasion + 0x10)) return false;
        if (type == 13) {
            int32_t start = -1, end = -1, occasion_start = -1, occasion_end = -1;
            if (!native_history_copy(native_history_object_field(collection, {}, 0x40), start) || !native_history_copy(native_history_object_field(collection, {}, 0x44), end) ||
                    !native_history_copy(occasion + 0x88, occasion_start) ||
                    !native_history_copy(occasion + 0x8c, occasion_end)) return false;
            event.fields[key + "ceremony"] = {
                start == occasion_start && end != occasion_end ? 0 :
                end == occasion_end && start != occasion_start ? 1 : 2};
        }
        if (type != 10 && type != 11) break;
        if (!scalar("schedule", 0x6c)) return false;
        NativeBorrowedVector<uintptr_t> schedules;
        if (!native_history_read_vector(occasion + 0xa0, schedules)) return false;
        const int32_t index = event.fields.at(key + "schedule").front();
        if (index < 0 || static_cast<size_t>(index) >= schedules.size()) break;
        const uintptr_t schedule = native_history_vector_at(schedules, index);
        int32_t schedule_type = -1;
        if (!schedule) break;
        if (!native_history_copy(schedule, schedule_type)) return false;
        event.fields[key + "schedule.present"] = {1};
        event.fields[key + "schedule.type"] = {schedule_type};
        if (type == 11 && schedule_type == 9) {
            int32_t race = -1;
            int16_t caste = -1;
            if (!native_history_copy(schedule + 4, race) || !native_history_copy(schedule + 8, caste)) return false;
            NativeBorrowedVector<uintptr_t> creatures;
            if (!native_history_read_vector(native_history_global(0x24eca68), creatures)) return false;
            std::string species = "creature";
            if (race >= 0 && static_cast<size_t>(race) < creatures.size() &&
                    !capture_native_history_creature_label(base, static_cast<int16_t>(race), caste, false, species)) return false;
            event.texts[key + "species"] = std::move(species);
        } else if (type == 11 && schedule_type == 11) {
            int16_t item_type = -1, subtype = -1, material = -1;
            int32_t material_index = -1;
            if (!native_history_copy(schedule + 4, item_type) || !native_history_copy(schedule + 8, subtype) ||
                    !native_history_copy(schedule + 0xc, material) ||
                    !native_history_copy(schedule + 0x10, material_index)) return false;
            // bc7624 passes count=-1. Retained pages may predate that hook,
            // so fill the same isolated typed description from its tuple.
            // The ordinary producer hook can subsequently refresh this field.
            const std::vector<int32_t> tuple{item_type, subtype, material, material_index};
            event.fields[key + "throwing"] = tuple;
            if (!capture_native_history_page_item(tuple, event, key + "throwing", -1)) return false;
        }
        break;
    }
    default: return false;
    }
    event.fields[key + "type"] = {type};
    return true;
}

static void capture_native_history_clause_collections(NativeHistoryEventData &event) {
    if (event.circumstance == 233 && event.circumstance_data >= 0)
        capture_native_history_collection_title(event.circumstance_data, event);
}
