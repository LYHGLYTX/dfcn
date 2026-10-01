// Reviewed against df-structures 1dd01aad and the installed 53.16 getSentence.
// These cases copy every field used by the complete native paragraph.
case 6: // first_contact: RVA b81170
case 7: // first_contact_failed: RVA b814d0
    captured = field("source", 0x28, 'p') && field("destination", 0x2c, 'p') &&
        field("site", 0x30, 's') && capture_native_history_support(event, result, fields, references);
    break;
case 9: // topicagreement_rejected: RVA b81b60
case 10: // topicagreement_made: RVA b82720
case 11: // war_peace_accepted: RVA b83650
case 12: // war_peace_rejected: RVA b839b0
    captured = field("topic", 0x28, 0, 2) && field("source", 0x2c, 'p') &&
        field("destination", 0x30, 'p') && field("site", 0x34, 's') &&
        capture_native_history_support(event, result, fields, references);
    break;
case 0: // war_attacked_site: RVA b65b80
    captured = field("attacker", 0x28, 'p') &&
        field("defender_civ", 0x2c, 'p') && field("site_civ", 0x30, 'p') &&
        field("site", 0x34, 's') && field("attacker_general", 0x38, 'n') &&
        field("defender_general", 0x3c, 'n') && field("attacker_mercenary", 0x40, 'p') &&
        field("defender_mercenary", 0x44, 'p') && field("mercenary_roles", 0x48);
    break;
case 1: { // war_destroyed_site: RVA b65fa0
    captured = field("attacker", 0x28, 'p') &&
        field("defender_civ", 0x2c) &&
        field("site_civ", 0x30) && field("site", 0x34, 's') &&
        field("flags", 0x38);
    if (captured && (fields.at("flags").front() & 1) == 0) {
        reference('p', fields.at("site_civ").front());
        reference('p', fields.at("defender_civ").front());
    }
    break;
}
case 13: // diplomat_lost: RVA b84b70
    captured = field("entity", 0x28, 'p') &&
        field("involved", 0x2c, 'p') && field("site", 0x30, 's');
    break;
case 14: // agreements_voided: RVA b84d20
    captured = field("source", 0x28, 'p') && field("destination", 0x2c, 'p');
    break;
case 2: { // created_site: RVA b69a10
    captured = field("civ", 0x28) && field("site_civ", 0x2c) &&
        field("resident_civ", 0x30, 'p') && field("site", 0x34, 's') &&
        field("builder", 0x38, 'n');
    if (!captured) break;
    if (fields.at("builder").front() == -1) {
        reference('p', fields.at("civ").front());
        reference('p', fields.at("site_civ").front());
    }
    const uintptr_t site = native_history_find_subject(native_history_profile_base(),
        NativeHistoryObjectKind::Site, fields.at("site").front());
    int16_t type = -1, subtype = -1;
    if (!site || site > UINTPTR_MAX - 0x318 ||
        !native_history_copy(site + 0x80, type)) { captured = false; break; }
    // Site type 10 stores typed site data at +0x310; subtype 1 uses
    // "created". Its other subtypes and type 8 use "constructed".
    if (type == 10) {
        uintptr_t site_data = 0;
        if (!native_history_copy(site + 0x310, site_data) || !site_data ||
            site_data > UINTPTR_MAX - 4 || !native_history_copy(site_data + 2, subtype)) {
            captured = false;
            break;
        }
    }
    fields.emplace("site_type", std::vector<int32_t>{type});
    fields.emplace("site_subtype", std::vector<int32_t>{subtype});
    break;
}
case 15: { // merchant: RVA b875d0
    captured = field("source", 0x28, 'p') && field("destination", 0x2c, 'p') &&
        field("site", 0x30, 's') && field("flag_count", 0x40) &&
        field("goods_initial", 0x48) && field("goods_end", 0x4c);
    if (!captured) break;
    uint8_t flags = 0;
    if (fields.at("flag_count").front() > 0) {
        uintptr_t storage = 0;
        if (!native_history_copy(native_history_event_field(event, result.native_type, 0x38, sizeof(storage)), storage) ||
            !native_history_copy(storage, flags)) { captured = false; break; }
    }
    // Every native merchant text flag lives in the first byte. Empty flag
    // arrays mean all flags are clear; their storage pointer is not read.
    fields.emplace("merchant_flags", std::vector<int32_t>{flags});
    break;
}
case 4: // add_hf_entity_link: RVA b7ea50
case 5: { // remove_hf_entity_link: RVA b7eff0
    captured = field("entity", 0x28, 'p') && field("histfig", 0x2c, 'n') &&
        field("link_type", 0x30) && field("position", 0x34);
    if (result.native_type == 4)
        captured = captured && field("appointer", 0x38, 'n') && field("promise_to", 0x3c);
    if (!captured) break;
    const int32_t type = fields.at("link_type").front();
    if (type == 10 || type == 12 || type == 13) {
        int variant = type == 13 ? 3 : 0;
        const uintptr_t image = native_history_profile_base();
        if (type != 13) {
            const uintptr_t figure = native_history_find_subject(image,
                NativeHistoryObjectKind::Figure, fields.at("histfig").front());
            int8_t sex = -1;
            if (!figure || figure > UINTPTR_MAX - 7 ||
                !native_history_copy(figure + 6, sex)) { captured = false; break; }
            variant = sex == 0 ? 1 : sex == 1 ? 2 : 0;
        }
        std::string title;
        if (!native_history_position_name(image, fields.at("entity").front(),
                fields.at("position").front(), variant, title)) { captured = false; break; }
        result.texts.emplace("position", std::move(title));
    }
    if (result.native_type == 4 && fields.at("appointer").front() != -1 &&
        fields.at("appointer").front() != fields.at("histfig").front() &&
        fields.at("promise_to").front() != fields.at("histfig").front())
        reference('n', fields.at("promise_to").front());
    break;
}
case 16: // artifact_hidden: RVA b879d0
case 22: // artifact_dropped: RVA b8b990
    // Neither paragraph reads the unit ID at +0x2c. Dropped's injury flag
    // array is also absent from its getSentence; it selects no text branch.
    captured = field("artifact", 0x28, 'i') &&
        field("histfig", 0x30, 'n') && field("site", 0x34, 's');
    break;
case 17: { // artifact_possessed: RVA b87e20
    captured = field("artifact", 0x28, 'i') && field("histfig", 0x30, 'n') &&
        field("site", 0x34) && field("region", 0x38) && field("layer", 0x3c) &&
        field("circumstance", 0x40) && field("circumstance_data", 0x44) &&
        field("reason", 0x48) && field("reason_data", 0x4c);
    if (!captured) break;
    // The native location is site, otherwise layer, otherwise region.
    // Do not require identities for locations this paragraph does not use.
    const int32_t site = fields.at("site").front();
    const int32_t layer = fields.at("layer").front();
    if (site != -1) reference('s', site);
    else if (layer != -1) reference('u', layer);
    else reference('r', fields.at("region").front());
    break;
}
case 23: // reclaim_site: RVA b6a930
case 26: // site_retired: RVA b687e0
    captured = field("civ", 0x28, 'p') &&
        field("site_civ", 0x2c, 'p') && field("site", 0x30, 's') &&
        field("flags", 0x34);
    break;
case 25: { // site_died: RVA b67e00
    captured = field("civ", 0x28) && field("site_civ", 0x2c, 'p') &&
        field("site", 0x30, 's') && field("flags", 0x34);
    if (captured && (fields.at("flags").front() & 1) == 0)
        reference('p', fields.at("civ").front());
    break;
}
case 24: // hf_destroyed_site: RVA b677e0
    captured = field("attacker", 0x28, 'n') &&
        field("defender_civ", 0x2c, 'p') &&
        field("site_civ", 0x30, 'p') && field("site", 0x34, 's');
    break;
case 29: // entity_incorporated: RVA b68690
    captured = field("migrant_entity", 0x28, 'p') &&
        field("join_entity", 0x2c, 'p') && field("leader", 0x30, 'n') &&
        field("site", 0x34, 's') && field("flags", 0x38);
    break;
case 34: // add_hf_hf_link: RVA b77720
case 35: // remove_hf_hf_link: RVA b77b30
    captured = field("histfig", 0x28, 'n') && field("target", 0x2c, 'n') &&
        field("link_type", 0x30);
    break;
case 8: // topicagreement_concluded: RVA b81830
    captured = field("source", 0x28, 'p') && field("destination", 0x2c, 'p') &&
        field("site", 0x30, 's') && field("topic", 0x34, 0, 2) && field("outcome", 0x38);
    break;
case 44: { // change_hf_state: RVA b771d0
    captured = field("histfig", 0x28, 'n') && field("state", 0x2c, 0, 2) &&
        field("reason", 0x30) && field("site", 0x34) &&
        field("region", 0x38) && field("layer", 0x3c);
    if (!captured) break;
    const int32_t site = fields.at("site").front(), layer = fields.at("layer").front();
    if (site != -1) reference('s', site);
    else if (layer != -1) reference('u', layer);
    else reference('r', fields.at("region").front());
    break;
}
case 21: { // artifact_recovered: RVA b8b6b0
    captured = field("artifact", 0x28, 'i') && field("histfig", 0x30, 'n') &&
        field("site", 0x34) && field("structure", 0x38) &&
        field("region", 0x3c) && field("layer", 0x40);
    if (!captured) break;
    const int32_t site = fields.at("site").front(), layer = fields.at("layer").front();
    if (site != -1) {
        reference('s', site);
        if (fields.at("structure").front() != -1)
            captured = native_history_structure_reference(result, site,
                fields.at("structure").front());
    } else if (layer != -1) reference('u', layer);
    else reference('r', fields.at("region").front());
    break;
}
case 27: // entity_created: RVA b68020
case 28: { // entity_action: RVA b68180
    captured = field("entity", 0x28, 'p') && field("site", 0x2c, 's') &&
        field("structure", 0x30) && field(result.native_type == 27 ? "creator" : "action", 0x34,
            result.native_type == 27 ? 'n' : 0);
    if (captured && fields.at("site").front() != -1 && fields.at("structure").front() != -1)
        captured = native_history_structure_reference(result, fields.at("site").front(),
            fields.at("structure").front());
    break;
}
case 31: { // replaced_building: RVA b69450
    captured = field("civ", 0x28, 'p') && field("site_civ", 0x2c, 'p') &&
        field("site", 0x30, 's') && field("old_structure", 0x34) && field("new_structure", 0x38);
    if (captured)
        captured = native_history_structure_reference(result, fields.at("site").front(),
                fields.at("old_structure").front()) &&
            native_history_structure_reference(result, fields.at("site").front(),
                fields.at("new_structure").front());
    break;
}
case 36: { // entity_razed_building: RVA b69590
    captured = field("civ", 0x28, 'p') && field("site", 0x2c, 's') && field("structure", 0x30);
    if (captured) captured = native_history_structure_reference(result,
        fields.at("site").front(), fields.at("structure").front());
    break;
}
case 19: // artifact_lost: RVA b8a8c0
case 20: { // artifact_found: RVA b8ada0
    const size_t location_offset = result.native_type == 19 ? 0x2c : 0x34;
    captured = field("artifact", 0x28, 'i') && field("site", location_offset) &&
        field("property", location_offset + 4) && field("region", location_offset + 8) &&
        field("layer", location_offset + 12);
    if (result.native_type == 20) captured = captured && field("histfig", 0x30, 'n');
    if (!captured) break;
    const int32_t site = fields.at("site").front(), layer = fields.at("layer").front();
    if (site != -1) {
        reference('s', site);
        if (fields.at("property").front() != -1) {
            int32_t building = -1;
            captured = native_history_property_reference(result, site,
                fields.at("property").front(), "property_label", building);
            if (captured) fields.emplace("property_label", std::vector<int32_t>{building});
        }
    } else if (layer != -1) reference('u', layer);
    else reference('r', fields.at("region").front());
    break;
}
case 30: { // created_building: RVA b69280
    captured = field("civ", 0x28) && field("site_civ", 0x2c) &&
        field("site", 0x30, 's') && field("structure", 0x34) &&
        field("builder", 0x38, 'n') && field("flags", 0x3c);
    if (!captured) break;
    if (fields.at("builder").front() == -1) {
        reference('p', fields.at("site_civ").front());
        reference('p', fields.at("civ").front());
    }
    captured = native_history_structure_reference(result,
        fields.at("site").front(), fields.at("structure").front());
    break;
}
case 32: // add_hf_site_link: RVA b77ed0
case 33: { // remove_hf_site_link: RVA b780b0
    captured = field("site", 0x28, 's') && field("structure", 0x2c) &&
        field("histfig", 0x30, 'n') && field("civ", 0x34) && field("link_type", 0x38);
    if (captured && fields.at("structure").front() != -1) {
        reference('p', fields.at("civ").front());
        captured = native_history_structure_reference(result,
            fields.at("site").front(), fields.at("structure").front());
    }
    break;
}
case 3: { // hist_figure_died: RVA b70870
    captured = field("victim", 0x28, 'n') && field("slayer", 0x2c, 'n') &&
        field("slayer_race", 0x30) && field("slayer_caste", 0x34) &&
        field("weapon_id", 0x38) && field("weapon_type", 0x3c, 0, 2) &&
        field("weapon_subtype", 0x3e, 0, 2) && field("weapon_mat_type", 0x40, 0, 2) &&
        field("weapon_mat_index", 0x44) && field("shooter_id", 0x48) &&
        field("shooter_type", 0x4c, 0, 2) && field("shooter_subtype", 0x4e, 0, 2) &&
        field("shooter_mat_type", 0x50, 0, 2) && field("shooter_mat_index", 0x54) &&
        field("site", 0x58) && field("region", 0x5c) && field("layer", 0x60) &&
        field("death_cause", 0x64, 0, 2);
    if (!captured) break;
    const uintptr_t base = native_history_profile_base();
    for (const char *role : {"weapon", "shooter"}) {
        int32_t artifact = -1;
        if (!native_history_item_artifact(base,
                fields.at(std::string(role) + "_id").front(), artifact)) {
            captured = false; break;
        }
        fields.emplace(std::string(role) + "_artifact", std::vector<int32_t>{artifact});
        reference('i', artifact);
    }
    if (!captured) break;
    // b94ed0's singular species fallback uses a typed RAW caste name,
    // then creature.name[0]. It never inspects the death sentence.
    if (fields.at("slayer").front() == -1 && fields.at("slayer_race").front() != -1) {
        NativeBorrowedVector<uintptr_t> creatures;
        if (!native_history_read_vector(native_history_global(0x24eca68), creatures)) { captured = false; break; }
        const int32_t race = fields.at("slayer_race").front();
        std::string label = "creature";
        if (race >= 0 && static_cast<size_t>(race) < creatures.size()) {
            const uintptr_t creature = native_history_vector_at(creatures, static_cast<size_t>(race));
            if (!creature) { captured = false; break; }
            label.clear();
            const int16_t caste = static_cast<int16_t>(fields.at("slayer_caste").front());
            if (caste >= 0) {
                NativeBorrowedVector<uintptr_t> castes;
                if (!native_history_read_vector(creature + 0x178, castes)) { captured = false; break; }
                if (static_cast<size_t>(caste) < castes.size()) {
                    const uintptr_t raw = native_history_vector_at(castes, static_cast<size_t>(caste));
                    if (!raw || !native_history_copy_string(raw + 0x20, label)) { captured = false; break; }
                }
            }
            if (label.empty() && !native_history_copy_string(creature + 0x20, label)) {
                captured = false; break;
            }
        }
        result.texts.emplace("slayer_species", std::move(label));
    }
    const int32_t site = fields.at("site").front(), layer = fields.at("layer").front();
    if (site != -1) reference('s', site);
    else if (layer != -1) reference('u', layer);
    else reference('r', fields.at("region").front());
    break;
}
case 37: // masterpiece_created_arch_construct: RVA b623c0
    captured = field("maker", 0x28, 'n') && field("entity", 0x2c, 'p') &&
        field("site", 0x30, 's') && field("building_type", 0x38, 0, 2) &&
        field("building_subtype", 0x3a, 0, 2) && field("building_custom", 0x3c);
    break;
case 39: // masterpiece_created_dye_item: RVA b62860
case 40: { // masterpiece_created_item_improvement: RVA b62d20
    captured = field("maker", 0x28, 'n') && field("entity", 0x2c, 'p') &&
        field("site", 0x30, 's') && field("item_type", 0x38, 0, 2) &&
        field("item_subtype", 0x3a, 0, 2) && field("mat_type", 0x3c, 0, 2) &&
        field("mat_index", 0x40) && field("item_id", 0x44);
    if (!captured) break;
    if (result.native_type == 39)
        captured = field("dye_type", 0x48, 0, 2) && field("dye_index", 0x4c);
    else {
        captured = field("improvement", 0x48, 0, 2) && field("improvement_subtype", 0x4c) &&
            field("improvement_mat_type", 0x50, 0, 2) && field("improvement_mat_index", 0x54) &&
            field("art_chunk", 0x58) && field("art_image", 0x5c, 0, 2);
        if (!captured) break;
        bool present = false;
        captured = native_history_art_image_reference(result, fields.at("art_chunk").front(),
            fields.at("art_image").front(), present);
        if (captured) fields.emplace("art_present", std::vector<int32_t>{present ? 1 : 0});
    }
    if (captured) {
        const bool dye = result.native_type == 39;
        NativeHistoryName owner;
        bool possessive = false;
        captured = capture_native_history_material_parts(native_history_profile_base(),
            static_cast<int16_t>(fields.at(dye ? "dye_type" : "improvement_mat_type").front()),
            fields.at(dye ? "dye_index" : "improvement_mat_index").front(), dye ? 3 : 0, false,
            result.texts["material.prefix"], result.texts["material.state"], owner, possessive);
        if (captured && possessive) {
            NativeHistorySubject subject;
            subject.kind = NativeHistoryObjectKind::MaterialOwner;
            subject.id = 0;
            subject.name = std::move(owner);
            result.subjects.push_back(std::move(subject));
        }
    }
    break;
}
case 38: // masterpiece_created_item: RVA b62630
    captured = field("maker", 0x28, 'n') && field("entity", 0x2c, 'p') &&
        field("site", 0x30, 's') && field("item_type", 0x38, 0, 2) &&
        field("item_subtype", 0x3a, 0, 2) && field("mat_type", 0x3c, 0, 2) &&
        field("mat_index", 0x3e, 0, 2) && field("item_id", 0x40);
    break;
case 41: { // masterpiece_created_food: RVA b63490
    captured = field("maker", 0x28, 'n') && field("entity", 0x2c, 'p') &&
        field("site", 0x30, 's') && field("food_subtype", 0x38, 0, 2);
    if (!captured) break;
    NativeBorrowedVector<uintptr_t> foods;
    if (!native_history_read_vector(native_history_global(0x24eced0), foods)) {
        captured = false; break;
    }
    std::string label = "Prepared Food";
    // Native search walks the food definitions backwards by subtype ID.
    for (size_t index = foods.size(); index > 0; --index) {
        const uintptr_t raw = native_history_vector_at(foods, index - 1);
        int16_t subtype = -1;
        if (!raw || !native_history_copy(raw + 0x28, subtype)) { captured = false; break; }
        if (subtype != fields.at("food_subtype").front()) continue;
        if (!native_history_copy_string(raw + 0x68, label)) captured = false;
        break;
    }
    if (captured) result.texts.emplace("food", std::move(label));
    break;
}
case 42: { // masterpiece_created_engraving: RVA b636e0
    captured = field("maker", 0x28, 'n') && field("entity", 0x2c, 'p') &&
        field("site", 0x30, 's') && field("art_chunk", 0x38) && field("art_image", 0x3c, 0, 2);
    if (!captured) break;
    bool present = false;
    captured = native_history_art_image_reference(result, fields.at("art_chunk").front(),
        fields.at("art_image").front(), present);
    if (captured) fields.emplace("art_present", std::vector<int32_t>{present ? 1 : 0});
    break;
}
case 43: { // masterpiece_lost: RVA b638f0; linked creation title is typed.
    captured = field("creation_event", 0x28) && field("destroyer", 0x2c, 'n') &&
        field("site", 0x30, 's') && field("loss_cause", 0x34, 0, 2);
    if (!captured) break;
    uintptr_t creation_address = 0;
    const uintptr_t base = native_history_profile_base();
    captured = native_history_find_structure_id(native_history_global(0x24f9cb8), 0x20,
        fields.at("creation_event").front(), creation_address);
    if (!captured) break;
    int32_t type = -1;
    if (creation_address && !capture_native_history_event_identity(
            reinterpret_cast<const void *>(creation_address), type)) { captured = false; break; }
    fields.emplace("creation.type", std::vector<int32_t>{type});
    if (!creation_address) break;
    // Creation references are only these six concrete types; rejecting any
    // other type prevents recursion and avoids substituting a vague title.
    if (type < 37 || type > 42) { captured = false; break; }
    NativeHistoryEventData creation;
    creation.native_type = type;
    if (!native_history_copy(creation_address + 8, creation.year) ||
        !native_history_copy(creation_address + 0xc, creation.seconds) ||
        !capture_native_history_extra_fields(reinterpret_cast<const void *>(creation_address), creation)) {
        captured = false; break;
    }
    fields.emplace("creation.year", std::vector<int32_t>{creation.year});
    fields.emplace("creation.seconds", std::vector<int32_t>{creation.seconds});
    for (auto &[key, values] : creation.fields) fields.emplace("creation." + key, std::move(values));
    for (auto &[key, value] : creation.texts) {
        if (key == "material.prefix" || key == "material.state") result.texts.emplace(key, value);
        result.texts.emplace("creation." + key, std::move(value));
    }
    references.insert(references.end(), creation.references.begin(), creation.references.end());
    for (auto &subject : creation.subjects) result.subjects.push_back(std::move(subject));
    break;
}
