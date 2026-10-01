// Reviewed native event fields, types 45..88.
// DFHack 53.16-r1 field order, checked against each installed getSentence.
case 45: { // change_hf_job, RVA b75660
    captured = field("histfig", 0x28, 'n') && field("new_job", 0x2c, 0, 2) &&
        field("old_job", 0x2e, 0, 2) && field("site", 0x30, 's') &&
        field("region", 0x34, 'r') && field("layer", 0x38, 'u');
    if (!captured) break;
    const int32_t new_job = fields.at("new_job").front();
    // These native branches supply their complete predicate without asking
    // the race/caste profession formatter for either profession caption.
    if (new_job == 101 || (new_job >= 106 && new_job <= 110)) break;
    const uintptr_t image = native_history_profile_base();
    const uintptr_t figure = native_history_find_subject(image,
        NativeHistoryObjectKind::Figure, fields.at("histfig").front());
    int16_t race = -1, caste_id = -1;
    captured = figure && native_history_copy(figure + 2, race) &&
        native_history_copy(figure + 4, caste_id);
    if (!captured) break;
    decltype(result.texts) captions;
    const auto caption = [&](std::string_view key, int32_t profession) {
        std::string value;
        if (!capture_native_history_profession(image, profession, race, caste_id, false, value, true))
            return false;
        captions.emplace(std::string(key), std::move(value));
        return true;
    };
    const int32_t old_job = fields.at("old_job").front();
    captured = (new_job == 102 || old_job == 102 || caption("old_job", old_job)) &&
        (new_job == 102 && old_job != 102 ? caption("old_job", old_job) : caption("new_job", new_job));
    if (captured) result.texts = std::move(captions);
    break;
}
case 46: // war_field_battle, RVA b651f0
    captured = field("attacker_civ", 0x28, 'p') &&
        field("defender_civ", 0x2c, 'p') && field("region", 0x30, 'r') &&
        field("layer", 0x34, 'u') && field("attacker_general", 0x3c, 'n') &&
        field("defender_general", 0x40, 'n') && field("attacker_merc", 0x44, 'p') &&
        field("defender_merc", 0x48, 'p') && field("merc_roles", 0x4c);
    break;
case 47: // war_plundered_site, RVA b661d0
    captured = field("attacker_civ", 0x28, 'p') &&
        field("defender_civ", 0x2c, 'p') && field("site_civ", 0x30, 'p') &&
        field("site", 0x34, 's') && field("plunder_flags", 0x38);
    break;
case 49: // war_site_tribute_forced, RVA b66ec0
    captured = field("attacker_civ", 0x28, 'p') &&
        field("defender_civ", 0x2c, 'p') && field("site_civ", 0x30, 'p') &&
        field("site", 0x34, 's') && field("tribute_season", 0x38) &&
        field("tribute_flags", 0x3c);
    break;
case 48: // war_site_new_leader, RVA b668e0
    captured = field("attacker_civ", 0x28, 'p') &&
        field("new_site_civ", 0x2c, 'p') && field("defender_civ", 0x30, 'p') &&
        field("site_civ", 0x34, 'p') && field("site", 0x38, 's') &&
        list("new_leaders", 0x40, 'n');
    break;
case 50: // war_site_taken_over, RVA b67220
    captured = field("attacker_civ", 0x28, 'p') &&
        field("new_site_civ", 0x2c, 'p') && field("defender_civ", 0x30, 'p') &&
        field("site_civ", 0x34, 'p') && field("site", 0x38, 's');
    break;
case 72: // entity_law, RVA b68d50
    captured = field("entity", 0x28, 'p') && field("histfig", 0x2c, 'n') &&
        field("add_flags", 0x30) && field("remove_flags", 0x34);
    break;
case 52: // hist_figure_abducted, RVA b75350
    captured = field("target", 0x28, 'n') && field("snatcher", 0x2c, 'n') &&
        field("site", 0x30, 's') && field("region", 0x34, 'r') &&
        field("layer", 0x38, 'u');
    break;
case 51: { // body_abused, RVA b83d10; six-way table at b84460
    captured = list("bodies", 0x28, 'n') && field("civ", 0x44, 'p') &&
        field("histfig", 0x48, 'n') && field("site", 0x4c, 's') &&
        field("region", 0x50, 'r') && field("layer", 0x54, 'u') &&
        field("abuse_type", 0x5c, 0, 2) && field("abuse_data", 0x60);
    if (!captured) break;
    const int32_t type = fields.at("abuse_type").front();
    if (type == 2) {
        captured = native_history_structure_reference(result,
            fields.at("site").front(), fields.at("abuse_data").front());
    } else if (type == 3) {
        // The native hanging branch selects plant_raw.name (not wood material).
        NativeBorrowedVector<uintptr_t> plants;
        const int32_t index = fields.at("abuse_data").front();
        captured = native_history_read_vector(native_history_global(0x24ec8f8), plants);
        const uintptr_t plant = captured && index >= 0 ?
            native_history_vector_at(plants, static_cast<size_t>(index)) : 0;
        std::string name;
        captured = plant && plant <= UINTPTR_MAX - 0x50 &&
            native_history_copy_string(plant + 0x50, name) && !name.empty();
        if (captured) result.texts.emplace("tree", std::move(name));
    } else if (type < 0 || type > 5) captured = false;
    break;
}
case 53: { // item_stolen, RVA b8b080
    // b8b1ca..b8b207 passes these native object fields to a82c10. Keep
    // the original object identity even if its live item no longer exists.
    captured = field("item_type", 0x28, 0, 2) && field("item_subtype", 0x2a, 0, 2) &&
        field("item_material", 0x2c, 0, 2) && field("item_material_index", 0x30) &&
        field("item_id", 0x34) && field("histfig", 0x3c, 'n') &&
        field("site", 0x40, 's') && field("structure", 0x44) &&
        field("region", 0x48, 'r') && field("layer", 0x4c, 'u') &&
        field("stash_site", 0x54, 's') && field("circumstance", 0x58) &&
        field("circumstance_data", 0x5c) && field("reason", 0x60) &&
        field("reason_data", 0x64) && field("theft_method", 0x68);
    if (!captured) break;
    int32_t artifact_id = -1;
    captured = native_history_item_artifact(native_history_profile_base(),
        fields.at("item_id").front(), artifact_id);
    if (!captured) break;
    fields.emplace("artifact", std::vector<int32_t>{artifact_id});
    reference('i', artifact_id);
    if (fields.at("site").front() >= 0 && fields.at("structure").front() >= 0)
        captured = native_history_structure_reference(result,
            fields.at("site").front(), fields.at("structure").front());
    break;
}
case 56: { // hist_figure_wounded, RVA b6b190
    captured = field("woundee", 0x28, 'n') && field("wounder", 0x2c, 'n') &&
        field("woundee_race", 0x3c, 0, 2) && field("woundee_caste", 0x40, 0, 2) &&
        field("body_part", 0x42, 0, 2) && field("injury", 0x44, 0, 2) &&
        field("part_lost", 0x46, 0, 1) && field("injury_flags", 0x48);
    if (!captured) break;
    const int32_t race = fields.at("woundee_race").front();
    const int32_t caste = fields.at("woundee_caste").front();
    const int32_t part = fields.at("body_part").front();
    NativeBorrowedVector<uintptr_t> creatures, castes, parts, names;
    captured = race >= 0 && caste >= 0 && part >= 0 &&
        native_history_read_vector(native_history_global(0x24eca68), creatures);
    const uintptr_t creature = captured ? native_history_vector_at(creatures, race) : 0;
    captured = creature && creature <= UINTPTR_MAX - 0x178 &&
        native_history_read_vector(creature + 0x178, castes);
    const uintptr_t caste_ptr = captured ? native_history_vector_at(castes, caste) : 0;
    captured = caste_ptr && caste_ptr <= UINTPTR_MAX - 0x6c0 &&
        native_history_read_vector(caste_ptr + 0x6c0, parts);
    const uintptr_t body = captured ? native_history_vector_at(parts, part) : 0;
    captured = body && body <= UINTPTR_MAX - 0x90 &&
        native_history_read_vector(body + 0x90, names);
    const uintptr_t name = captured ? native_history_vector_at(names, 0) : 0;
    std::string caption;
    int32_t flag_bytes = 0;
    uintptr_t flags = 0;
    uint8_t first = 0;
    captured = name && native_history_copy_string(name, caption) && !caption.empty() &&
        native_history_copy(body + 0x50, flag_bytes);
    if (captured && flag_bytes > 0)
        captured = native_history_copy(body + 0x48, flags) && flags &&
            native_history_copy(flags, first);
    if (captured) {
        result.texts.emplace("body_part", std::move(caption));
        fields.emplace("internal", std::vector<int32_t>{(first & 0x10) != 0});
    }
    break;
}
case 66: { // hist_figure_revived, RVA b70360
    captured = field("histfig", 0x28, 'n') && field("site", 0x2c, 's') &&
        field("region", 0x30, 'r') && field("layer", 0x34, 'u') &&
        field("ghost", 0x38, 0, 2) && field("revival_flags", 0x3c) &&
        field("actor", 0x40, 'n') && field("interaction", 0x44) && field("effect", 0x48);
    if (!captured || fields.at("ghost").front() >= 0) break;
    std::string form;
    captured = capture_native_history_revival_form(native_history_profile_base(),
        fields.at("interaction").front(), fields.at("effect").front(), form);
    if (captured) result.texts.emplace("revival_form", std::move(form));
    break;
}
case 63: { // assume_identity, RVA b79060
    captured = field("histfig", 0x28, 'n') && field("identity", 0x2c) &&
        field("target_entity", 0x30, 'p');
    if (!captured) break;
    NativeHistoryIdentityInfo identity;
    captured = native_history_identity_reference(result, fields.at("identity").front(), identity);
    if (!captured) break;
    fields.emplace("identity_real_figure", std::vector<int32_t>{identity.real_figure});
    reference('n', identity.real_figure);
    if (identity.real_figure < 0) {
        fields.emplace("identity_named", std::vector<int32_t>{identity.named});
        fields.emplace("identity_entity", std::vector<int32_t>{identity.entity});
        reference('p', identity.entity);
        result.texts.emplace("identity_species", std::move(identity.species));
        result.texts.emplace("identity_profession", std::move(identity.profession));
    }
    break;
}
case 85: // knowledge_discovered, RVA b6f500
    captured = field("histfig", 0x28, 'n') && field("knowledge_category", 0x2c) &&
        field("knowledge_flag", 0x30) && field("discovery_flags", 0x34);
    break;
case 77: // agreement_concluded, RVA b81f00
    captured = field("agreement_id", 0x28) && field("agreement_subject", 0x2c) &&
        field("conclusion_reason", 0x30) && field("concluder", 0x34, 'n');
    if (captured) captured = capture_native_history_agreement(fields.at("agreement_id").front(),
        fields, references);
    break;
case 75: // agreement_formed, shared native narrative RVA 2aaf70
    captured = field("agreement_id", 0x28) && field("agreement_flags", 0x2c);
    if (captured) captured = capture_native_history_agreement(fields.at("agreement_id").front(),
        fields, references) && capture_native_history_agreement_formation(result, fields, references) &&
        capture_native_history_support(event, result, fields, references);
    break;
case 57: // hist_figure_simple_battle_event, RVA b6ec90
    captured = list("group_1", 0x28, 'n') && list("group_2", 0x40, 'n') &&
        field("battle_subtype", 0x64, 0, 2);
    break;
case 55: { // creature_devoured, RVA b6ab80
    captured = field("victim", 0x28, 'n') && field("victim_race", 0x2c) &&
        field("victim_caste", 0x30, 0, 2) && field("eater", 0x34, 'n') &&
        field("victim_entity", 0x38) && field("site", 0x3c, 's') &&
        field("region", 0x40, 'r') && field("layer", 0x44, 'u');
    if (!captured || fields.at("victim").front() >= 0) break;
    std::string species;
    captured = capture_native_history_creature_label(native_history_profile_base(),
        static_cast<int16_t>(fields.at("victim_race").front()),
        static_cast<int16_t>(fields.at("victim_caste").front()), false, species, false);
    if (captured) {
        result.texts.emplace("victim_species", std::move(species));
        reference('p', fields.at("victim_entity").front());
    }
    break;
}
case 54: { // hf_razed_building, RVA b69670
    captured = field("histfig", 0x28, 'n') && field("site", 0x2c, 's') &&
        field("structure", 0x30);
    if (captured) captured = native_history_structure_reference(result,
        fields.at("site").front(), fields.at("structure").front());
    break;
}
case 59: // hist_figure_reunion, RVA b74e00
    captured = list("missing", 0x28, 'n') && list("reunited_with", 0x40, 'n') &&
        field("assistant", 0x58, 'n') && field("site", 0x5c, 's') &&
        field("region", 0x60, 'r') && field("layer", 0x64, 'u');
    break;
case 58: { // created_world_construction, RVA b68fb0
    captured = field("civ", 0x28, 'p') && field("site_civ", 0x2c, 'p') &&
        field("construction", 0x30) && field("master_construction", 0x34) &&
        field("site_1", 0x38, 's') && field("site_2", 0x3c, 's');
    if (!captured) break;
    captured = native_history_construction_reference(result, fields.at("construction").front());
    if (captured && fields.at("master_construction").front() >= 0)
        captured = native_history_construction_reference(result, fields.at("master_construction").front());
    break;
}
case 60: { // hist_figure_reach_summit, RVA b6b8e0
    captured = list("group", 0x28, 'n') && field("region", 0x40, 'r') &&
        field("layer", 0x44, 'u') && field("peak_x", 0x48, 0, 2) && field("peak_y", 0x4a, 0, 2);
    if (captured) captured = native_history_peak_reference(result,
        fields.at("peak_x").front(), fields.at("peak_y").front());
    break;
}
case 61: // hist_figure_travel, RVA b6bf50
    captured = list("group", 0x28, 'n') && field("site", 0x40, 's') &&
        field("region", 0x44, 'r') && field("layer", 0x48, 'u') &&
        field("travel_flags", 0x4c);
    break;
case 62: { // hist_figure_new_pet, RVA b6e600
    captured = list("group", 0x28, 'n') && field("site", 0x58, 's') &&
        field("region", 0x5c, 'r') && field("layer", 0x60, 'u');
    if (!captured) break;
    NativeBorrowedVector<int16_t> pets;
    captured = native_history_copy(native_history_event_field(event, result.native_type, 0x40, sizeof(pets)), pets) && pets.valid(remaining);
    if (!captured) break;
    std::vector<int16_t> races(pets.size());
    captured = races.empty() || native_history_copy_bytes(
        reinterpret_cast<uintptr_t>(pets.begin), races.data(), races.size() * sizeof(int16_t));
    if (!captured) break;
    fields.emplace("pets", std::vector<int32_t>(races.begin(), races.end()));
    // Native names one/two species and uses 'wild beasts' for longer lists.
    decltype(result.texts) labels;
    if (races.size() <= 2) {
        for (size_t index = 0; index < races.size(); ++index) {
            std::string label;
            if (!capture_native_history_creature_label(native_history_profile_base(),
                    races[index], -1, true, label)) { captured = false; break; }
            labels.emplace("pet_species_" + std::to_string(index), std::move(label));
        }
    }
    if (captured) result.texts = std::move(labels);
    break;
}
case 65: { // change_creature_type, RVA b78c30
    captured = field("changee", 0x28, 'n') && field("changer", 0x2c) &&
        field("old_race", 0x30) && field("old_caste", 0x34) &&
        field("new_race", 0x38) && field("new_caste", 0x3c);
    if (!captured) break;
    // b78d43 tests the resolved changer pointer, not just its stored ID.
    const int32_t changer = fields.at("changer").front();
    const bool changer_present = native_history_find_subject(native_history_profile_base(),
        NativeHistoryObjectKind::Figure, changer) != 0;
    fields.emplace("changer_present", std::vector<int32_t>{changer_present});
    if (changer_present) reference('n', changer);
    decltype(result.texts) labels;
    for (const auto prefix : {"old", "new"}) {
        const std::string key = prefix;
        std::string label;
        if (!capture_native_history_creature_label(native_history_profile_base(),
                fields.at(key + "_race").front(),
                static_cast<int16_t>(fields.at(key + "_caste").front()), false, label)) {
            captured = false;
            break;
        }
        labels.emplace(key + "_species", std::move(label));
    }
    if (captured) result.texts = std::move(labels);
    break;
}
case 68: { // change_hf_body_state, RVA b76120
    captured = field("histfig", 0x28, 'n') && field("body_state", 0x2c, 0, 1) &&
        field("site", 0x30, 's') && field("structure", 0x34) &&
        field("region", 0x38, 'r') && field("layer", 0x3c, 'u');
    if (captured && fields.at("site").front() >= 0 && fields.at("structure").front() >= 0)
        captured = native_history_structure_reference(result,
            fields.at("site").front(), fields.at("structure").front());
    break;
}
case 67: { // hf_learns_secret, RVA b78270
    captured = field("student", 0x28, 'n') && field("teacher", 0x2c) &&
        field("artifact", 0x30, 'i') && field("interaction", 0x34);
    if (!captured) break;
    const uintptr_t base = native_history_profile_base();
    const int32_t teacher = fields.at("teacher").front();
    const bool teacher_present = native_history_find_subject(base, NativeHistoryObjectKind::Figure, teacher) != 0;
    fields.emplace("teacher_present", std::vector<int32_t>{teacher_present});
    if (teacher_present) reference('n', teacher);
    std::string secret;
    captured = capture_native_history_secret(base, fields.at("interaction").front(), secret);
    if (captured) result.texts.emplace("secret", std::move(secret));
    break;
}
case 69: { // hf_act_on_building, RVA b69760
    captured = field("building_action", 0x28) && field("histfig", 0x2c, 'n') &&
        field("site", 0x30, 's') && field("structure", 0x34);
    if (captured) captured = native_history_structure_reference(result,
        fields.at("site").front(), fields.at("structure").front());
    break;
}
case 74: { // artifact_stored, RVA b87ad0
    captured = field("artifact", 0x28, 'i') && field("histfig", 0x30, 'n') &&
        field("site", 0x34, 's') && field("structure", 0x38);
    if (captured && fields.at("structure").front() >= 0)
        captured = native_history_structure_reference(result,
            fields.at("site").front(), fields.at("structure").front());
    break;
}
case 70: { // hf_does_interaction, RVA b78660
    captured = field("doer", 0x28) && field("target", 0x2c, 'n') &&
        field("interaction", 0x30) && field("interaction_source", 0x34) &&
        field("site", 0x38, 's') && field("region", 0x3c, 'r') && field("layer", 0x40, 'u');
    if (!captured) break;
    const uintptr_t base = native_history_profile_base();
    const int32_t doer = fields.at("doer").front();
    const bool doer_present = native_history_find_subject(base, NativeHistoryObjectKind::Figure, doer) != 0;
    fields.emplace("doer_present", std::vector<int32_t>{doer_present});
    if (doer_present) reference('n', doer);
    std::string before, after;
    captured = capture_native_history_interaction_action(base, fields.at("interaction").front(),
        fields.at("interaction_source").front(), before, after);
    if (captured) {
        // The installed Lua generator stores its animal-name parameter in
        // these two RAW source templates (creatures.lua:1067 and :1100).
        // Bind only those authored placeholders, never the rendered event.
        std::string_view prefix, suffix;
        const char *key = nullptr;
        if (before == " cursed ") {
            prefix = " to assume the form of a ";
            suffix = "-like monster every full moon";
            key = "{a} cursed {a} to assume the form of a {s}-like monster every full moon";
        } else if (before == " bit ") {
            prefix = " passing on the ";
            suffix = " monster curse";
            key = "{a} bit {a} passing on the {s} monster curse";
        }
        if (key && after.starts_with(prefix) && after.ends_with(suffix) &&
                after.size() > prefix.size() + suffix.size()) {
            result.texts.emplace("interaction_form", after.substr(prefix.size(),
                after.size() - prefix.size() - suffix.size()));
            result.texts.emplace("interaction_key", key);
        } else result.texts.emplace("interaction_key", "");
        result.texts.emplace("interaction_before", std::move(before));
        result.texts.emplace("interaction_after", std::move(after));
    }
    break;
}
case 71: // hf_confronted, RVA b76980
    captured = field("target", 0x28, 'n') && field("situation", 0x2c) &&
        list("suspicion_reasons", 0x30) && field("site", 0x48, 's') &&
        field("region", 0x4c, 'r') && field("layer", 0x50, 'u');
    break;
case 76: // site_dispute, RVA b83300
    captured = field("dispute_type", 0x28) && field("entity_1", 0x2c, 'p') &&
        field("entity_2", 0x30, 'p') && field("site_1", 0x34, 's') &&
        field("site_2", 0x38, 's');
    break;
case 78: // insurrection_started, RVA b6a480
    captured = field("target_civ", 0x28, 'p') && field("site", 0x2c, 's');
    break;
case 79: // insurrection_ended, RVA b6a600
    captured = field("target_civ", 0x28, 'p') && field("site", 0x2c, 's') &&
        field("outcome", 0x30);
    break;
case 80: // hf_attacked_site, RVA b67bf0
    captured = field("attacker_hf", 0x28, 'n') &&
        field("defender_civ", 0x2c, 'p') && field("site_civ", 0x30, 'p') &&
        field("site", 0x34, 's');
    break;
case 87: // artifact_destroyed, RVA b8ab30
    captured = field("artifact", 0x28, 'i') && field("site", 0x2c, 's') &&
        field("destroyer_hf", 0x30, 'n') && field("destroyer_civ", 0x34, 'p');
    break;
case 86: { // artifact_transformed, RVA b8a2d0
    captured = field("artifact", 0x28, 'i') && list("source_artifacts", 0x30, 'i') &&
        field("histfig", 0x4c, 'n') && field("site", 0x50, 's');
    if (!captured) break;
    const auto has_item = [&](int32_t id, int32_t &present) {
        const uintptr_t artifact = native_history_find_subject(native_history_profile_base(),
            NativeHistoryObjectKind::Artifact, id);
        uintptr_t item = 0;
        if (!artifact || artifact > UINTPTR_MAX - 0x90 || !native_history_copy(artifact + 0x90, item))
            return false;
        present = item != 0;
        return true;
    };
    int32_t present = 0;
    captured = has_item(fields.at("artifact").front(), present);
    if (!captured) break;
    fields.emplace("artifact_has_item", std::vector<int32_t>{present});
    std::vector<int32_t> sources;
    for (int32_t id : fields.at("source_artifacts")) {
        if (!has_item(id, present)) { captured = false; break; }
        sources.push_back(present);
    }
    if (captured) fields.emplace("source_artifacts_have_items", std::move(sources));
    break;
}
case 88: // hf_relationship_denied, RVA b76550
    captured = field("seeker", 0x28, 'n') && field("target", 0x2c, 'n') &&
        field("relationship", 0x30) && field("denial_reason", 0x34) &&
        field("denial_reason_data", 0x38, 'n') && field("site", 0x3c, 's') &&
        field("region", 0x40, 'r') && field("layer", 0x44, 'u');
    break;
