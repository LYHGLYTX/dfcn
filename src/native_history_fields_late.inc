// Reviewed against df-structures 1dd01aad and the installed 53.16 getSentence.
// These cases copy every event field used by the complete native paragraph.
case 89: { // regionpop_incorporated_into_entity: RVA b68300
    captured = field("race", 0x28) && field("population", 0x2c) &&
        field("region", 0x30, 'r') && field("layer", 0x34, 'u') &&
        field("entity", 0x38, 'p') && field("site", 0x3c, 's');
    std::string race;
    if (captured) captured = capture_native_history_creature_label(native_history_profile_base(),
        fields.at("race").front(), -1, true, race);
    if (captured) result.texts["race"] = std::move(race);
    break;
}
case 90: // poetic_form_created: RVA b88a40
case 91: // musical_form_created: RVA b88e70
case 92: // dance_form_created: RVA b89390
case 93: { // written_content_composed: RVA b898b0
    captured = field("creator", 0x28, 'n') && field("form", 0x2c) &&
        field("site", 0x30, 's') && field("region", 0x34, 'r') && field("layer", 0x38, 'u') &&
        field("circumstance", 0x3c) && field("circumstance_data", 0x40) &&
        field("reason", 0x44) && field("reason_data", 0x48);
    const NativeHistoryObjectKind kind = result.native_type == 90 ? NativeHistoryObjectKind::Poem :
        result.native_type == 91 ? NativeHistoryObjectKind::Music :
        result.native_type == 92 ? NativeHistoryObjectKind::Dance : NativeHistoryObjectKind::WrittenContent;
    if (captured) captured = native_history_form_reference(result, kind, fields.at("form").front());
    break;
}
case 94: // change_hf_mood: RVA b76dc0
    // The dispatcher receives reason_data/circumstance/data as literal -1.
    captured = field("histfig", 0x28, 'n') && field("mood", 0x2c, 0, 2) &&
        field("reason", 0x30) && field("site", 0x34, 's') &&
        field("region", 0x38, 'r') && field("layer", 0x3c, 'u');
    break;
case 95: { // artifact_claim_formed: RVA b88500
    captured = field("artifact", 0x28, 'i') && field("histfig", 0x2c, 'n') &&
        field("entity", 0x30, 'p') && field("assignment", 0x34) && field("claim", 0x38) &&
        field("circumstance", 0x3c) && field("circumstance_data", 0x40) &&
        field("reason", 0x44) && field("reason_data", 0x48);
    if (!captured) break;
    std::string title;
    int16_t count = -1, landholder = -1;
    int32_t title_present = 0, title_site = -1;
    const uintptr_t base = native_history_profile_base();
    if (fields.at("claim").front() == 0 && fields.at("assignment").front() != -1) {
        uintptr_t position = 0;
        captured = capture_native_history_assignment_position(base, fields.at("entity").front(),
            fields.at("assignment").front(), position);
        if (!captured) break;
        if (position) {
            captured = position <= UINTPTR_MAX - 0x2d8 &&
                native_history_copy_string(position + 0x98, title) &&
                native_history_copy(position + 0x2d8, count) &&
                native_history_copy(position + 0x2c8, landholder);
            if (!captured) break;
            title_present = 1;
            if (landholder > 0) {
                const uintptr_t entity = native_history_find_subject(base, NativeHistoryObjectKind::Entity,
                    fields.at("entity").front());
                NativeBorrowedVector<uintptr_t> links;
                if (!entity || entity > UINTPTR_MAX - 0xd0 ||
                    !native_history_read_vector(entity + 0xd0, links)) { captured = false; break; }
                for (size_t index = 0; index < links.size(); ++index) {
                    const uintptr_t link = native_history_vector_at(links, index);
                    uint32_t flags = 0;
                    int32_t assignment = -1;
                    if (!link || link > UINTPTR_MAX - 0x1c ||
                        !native_history_copy(link + 0x1c, flags) ||
                        !native_history_copy(link + 0x0c, assignment)) { captured = false; break; }
                    if (!(flags & 0x200) || assignment != fields.at("assignment").front()) continue;
                    int32_t site_id = -1;
                    uintptr_t world = 0, site = 0;
                    if (!native_history_copy(link, site_id) || !native_history_copy(native_history_global(0x24ebb58), world) ||
                        (world && !native_history_find_structure_id(native_history_object_field(world, "world_data", 0x178), 0x88, site_id, site))) {
                        captured = false; break;
                    }
                    if (site) title_site = site_id;
                    break; // A missing first matching site does not select a later link.
                }
                if (!captured) break;
            }
        }
    }
    fields.emplace("title_present", std::vector<int32_t>{title_present});
    fields.emplace("title_count", std::vector<int32_t>{count});
    fields.emplace("title_site", std::vector<int32_t>{title_site});
    reference('s', title_site);
    result.texts.emplace("position_title", std::move(title));
    break;
}
case 96: // artifact_given: RVA b880e0
    captured = field("artifact", 0x28, 'i') && field("giver_histfig", 0x2c, 'n') &&
        field("giver_entity", 0x30, 'p') && field("receiver_histfig", 0x34, 'n') &&
        field("receiver_entity", 0x38, 'p') && field("circumstance", 0x3c) &&
        field("circumstance_data", 0x40) && field("reason", 0x44) &&
        field("reason_data", 0x48) && field("transfer_flags", 0x4c);
    break;
case 97: // hf_act_on_artifact: RVA b698b0
    captured = field("action", 0x28) && field("artifact", 0x2c, 'i') &&
        field("histfig", 0x30, 'n') && field("site", 0x34, 's') && field("structure", 0x38);
    if (captured && fields.at("structure").front() != -1)
        captured = native_history_structure_reference(result, fields.at("site").front(),
            fields.at("structure").front());
    break;
case 98: { // hf_recruited_unit_type_for_entity: RVA b7a150
    captured = field("entity", 0x28, 'p') && field("histfig", 0x2c, 'n') &&
        field("profession", 0x30, 0, 2) && field("site", 0x34, 's') &&
        field("region", 0x38, 'r') && field("layer", 0x3c, 'u');
    std::string profession;
    // 132cc10 returns two empty captions for PEASANT without a race. This
    // caller does not use the career wrapper that inserts "peasants".
    if (captured && fields.at("profession").front() != 102)
        captured = capture_native_history_profession(native_history_profile_base(),
            fields.at("profession").front(), -1, -1, true, profession);
    if (captured) result.texts["profession"] = std::move(profession);
    break;
}
case 100: // artifact_copied: RVA b89fc0
    captured = field("artifact", 0x28, 'i') && field("destination_entity", 0x2c, 'p') &&
        field("source_entity", 0x30, 'p') && field("destination_site", 0x34, 's') &&
        field("source_site", 0x38, 's') && field("destination_structure", 0x3c) &&
        field("source_structure", 0x40) && field("copy_flags", 0x44);
    if (captured) captured = native_history_structure_reference(result,
        fields.at("source_site").front(), fields.at("source_structure").front()) &&
        native_history_structure_reference(result, fields.at("destination_site").front(),
            fields.at("destination_structure").front());
    break;
case 101: // sneak_into_site: RVA b659e0
case 110: // site_surrendered: RVA b675f0
    captured = field("attacker_civ", 0x28, 'p') &&
        field("defender_civ", 0x2c, 'p') &&
        field("site_civ", 0x30, 'p') && field("site", 0x34, 's');
    break;
case 102: // spotted_leaving_site: RVA b679f0
    captured = field("spotter", 0x28, 'n') &&
        field("leaver_civ", 0x2c, 'p') &&
        field("site_civ", 0x30, 'p') && field("site", 0x34, 's');
    break;
case 103: // entity_searched_site: RVA b65870
    captured = field("entity", 0x28, 'p') &&
        field("site", 0x2c, 's') && field("result", 0x30);
    break;
case 104: // hf_freed: RVA b664e0
    captured = field("freeing_civ", 0x28, 'p') && field("freeing_histfig", 0x2c, 'n') &&
        field("holding_civ", 0x30, 'p') && field("site_civ", 0x34, 'p') &&
        field("site", 0x38, 's') && list("rescued", 0x40, 'n');
    break;
case 105: // hfs_act_on_site: RVA b6dcb0
    captured = list("histfigs", 0x28, 'n') && field("action", 0x40) && field("entity", 0x44, 'p') &&
        field("site", 0x48, 's') && field("structure", 0x4c) &&
        field("region", 0x50, 'r') && field("layer", 0x54, 'u');
    if (captured && fields.at("site").front() != -1 && fields.at("structure").front() != -1)
        captured = native_history_structure_reference(result, fields.at("site").front(), fields.at("structure").front());
    break;
case 106: // entity_rampaged_in_site: RVA b655d0
case 107: // entity_fled_site: RVA b65720
    captured = field("entity", 0x28, 'p') && field("site", 0x2c, 's');
    break;
case 108: // tactical_situation: RVA b6c4a0
    captured = field("attacker_tactician", 0x28, 'n') && field("defender_tactician", 0x2c, 'n') &&
        field("attacker_roll", 0x30) && field("defender_roll", 0x34) && field("situation", 0x38) &&
        field("site", 0x3c, 's') && field("structure", 0x40) && field("region", 0x44, 'r') &&
        field("layer", 0x48, 'u') && field("tactics_flags", 0x4c);
    if (captured && fields.at("site").front() != -1 && fields.at("structure").front() != -1)
        captured = native_history_structure_reference(result, fields.at("site").front(),
            fields.at("structure").front());
    break;
case 111: // entity_expels_hf: RVA b7a060
    captured = field("entity", 0x28, 'p') &&
        field("expelled", 0x2c, 'n') && field("site", 0x30, 's');
    break;
case 113: // add_entity_site_profile_flag: RVA b67460
    captured = field("entity", 0x28, 'p') &&
        field("site", 0x2c, 's') && field("added_flags", 0x30);
    break;
case 114: // hf_gamble: RVA b84e70
    captured = field("histfig", 0x28, 'n') && field("site", 0x2c, 's') &&
        field("structure", 0x30) && field("account_before", 0x34) && field("account_after", 0x38);
    if (captured && fields.at("site").front() != -1 && fields.at("structure").front() != -1)
        captured = native_history_structure_reference(result, fields.at("site").front(),
            fields.at("structure").front());
    break;
case 109: { // squad_vs_squad: RVA b6cd90
    captured = field("site", 0x98, 's') && field("structure", 0x9c) &&
        field("region", 0xa0, 'r') && field("layer", 0xa4, 'u');
    if (captured && fields.at("site").front() != -1 && fields.at("structure").front() != -1)
        captured = native_history_structure_reference(result, fields.at("site").front(),
            fields.at("structure").front());
    const uintptr_t base = native_history_profile_base();
    for (int side = 0; captured && side < 2; ++side) {
        const std::string prefix = side ? "second_" : "first_";
        const size_t offset = side ? 0x60 : 0x28;
        captured = field(prefix + "leader", offset, 'n') && field(prefix + "leadership", offset + 4) &&
            list(prefix + "histfigs", offset + 8, 'n') && field(prefix + "squad", offset + 0x20) &&
            field(prefix + "race", offset + 0x24) && field(prefix + "interaction", offset + 0x28) &&
            field(prefix + "effect", offset + 0x2c) && field(prefix + "count", offset + 0x30) &&
            field(prefix + "deaths", offset + 0x34);
        if (!captured) break;
        const auto &histfigs = fields.at(prefix + "histfigs");
        const int32_t squad = fields.at(prefix + "squad").front();
        if (squad != -1 && histfigs.size() >= 2) {
            bool present = false;
            captured = native_history_squad_reference(result, squad, present);
            fields.emplace(prefix + "squad_present", std::vector<int32_t>{present});
        } else if (histfigs.empty()) {
            std::string race;
            bool animated = false;
            captured = capture_native_history_creature_label(base, fields.at(prefix + "race").front(),
                -1, fields.at(prefix + "count").front() > 1, race) &&
                capture_native_history_animated_effect(base, fields.at(prefix + "interaction").front(),
                    fields.at(prefix + "effect").front(), animated);
            if (captured) {
                fields.emplace(prefix + "animated", std::vector<int32_t>{animated});
                result.texts.emplace(prefix + "race", std::move(race));
            }
        }
    }
    break;
}
case 112: // hf_trade: RVA b85190
    captured = field("histfig", 0x28, 'n') && field("entity", 0x2c, 'p') &&
        field("source", 0x30, 's') && field("destination", 0x34, 's') &&
        field("production_zone", 0x38) && field("allotment", 0x3c) &&
        field("allotment_index", 0x40) && field("account_shift", 0x44);
    if (captured) captured = capture_native_history_commodity(result, fields,
        fields.at("production_zone").front(), fields.at("allotment").front(),
        fields.at("allotment_index").front(), "commodity.");
    break;
case 116: // entity_dissolved: RVA b7ab20
    captured = field("entity", 0x28, 'p') &&
        field("circumstance", 0x2c) && field("circumstance_data", 0x30) &&
        field("reason", 0x34) && field("reason_data", 0x38);
    break;
case 117: // entity_equipment_purchase: RVA b7ac70
    captured = field("entity", 0x28, 'p') && field("quality", 0x2c) &&
        list("recipients", 0x30, 'n');
    break;
case 118: // modified_building: RVA b7af80
    captured = field("site", 0x28, 's') && field("structure", 0x2c) &&
        field("histfig", 0x30, 'n') && field("modification_type", 0x34) &&
        field("modification", 0x38);
    if (captured) captured = native_history_structure_reference(result,
        fields.at("site").front(), fields.at("structure").front());
    break;
case 119: { // building_profile_acquired: RVA b7b230
    captured = field("site", 0x28, 's') && field("property", 0x2c) &&
        field("histfig", 0x30, 'n') && field("entity", 0x34, 'p') &&
        field("acquisition", 0x38) && field("former_histfig", 0x3c, 'n') &&
        field("former_entity", 0x40, 'p');
    int32_t building = -1;
    if (captured) captured = native_history_property_reference(result,
        fields.at("site").front(), fields.at("property").front(), "property", building);
    if (captured) fields.emplace("resolved_structure", std::vector<int32_t>{building});
    break;
}
case 120: // hf_preach: RVA b7b540
    captured = field("speaker", 0x28, 'n') && field("site", 0x2c, 's') &&
        field("topic", 0x30, 0, 2) && field("audience", 0x34, 'p') &&
        field("target", 0x38, 'p');
    break;
case 122: // entity_breach_feature_layer: RVA b7c0d0
    captured = field("site", 0x28, 's') && field("site_civ", 0x2c, 'p') &&
        field("civ", 0x30, 'p') && field("layer", 0x34, 'u');
    break;
case 123: // entity_alliance_formed: RVA b7c2c0
    captured = field("entity", 0x28, 'p') && list("joining_entities", 0x30, 'p') &&
        capture_native_history_support(event, result, fields, references);
    break;
case 124: // hf_ransomed: RVA b7c6e0
    // Upstream XML's payer names are swapped; the installed formatter calls
    // the entity helper for +0x30 and the historical-figure helper for +0x34.
    captured = field("ransomed", 0x28, 'n') && field("ransomer", 0x2c, 'n') &&
        field("payer_entity", 0x30, 'p') && field("payer_histfig", 0x34, 'n') &&
        field("site", 0x38, 's');
    break;
case 125: // hf_enslaved: RVA b7ca00
    captured = field("enslaved", 0x28, 'n') && field("seller", 0x2c, 'n') &&
        field("payer_entity", 0x30, 'p') && field("site", 0x34, 's');
    break;
case 126: // sabotage: RVA b7cc30
    captured = field("saboteur", 0x28, 'n') && field("target_histfig", 0x2c, 'n') &&
        field("target_entity", 0x30, 'p') && field("site", 0x34, 's');
    break;
case 127: // entity_overthrown: RVA b79d20
    // The position-profile field at +0x38 is not used by getSentence.
    captured = field("overthrown", 0x28, 'n') && field("successor", 0x2c, 'n') &&
        field("instigator", 0x30, 'n') && field("entity", 0x34, 'p') &&
        list("conspirators", 0x40, 'n') && field("site", 0x58, 's');
    break;
case 99: // hfs_formed_reputation_relationship: RVA b798c0
case 128: // hfs_formed_intrigue_relationship: RVA 2a9e40
case 129: { // failed_intrigue_corruption: RVA 2aa700
    const size_t location = result.native_type == 129 ? 0x38 : 0x40;
    captured = field("corruptor", 0x28, 'n') && field("corruptor_identity", 0x2c) &&
        field("target", 0x30, 'n') && field("target_identity", 0x34) &&
        field("site", location, 's') && field("region", location + 4, 'r') &&
        field("layer", location + 8, 'u');
    if (captured) captured = result.native_type == 99 ?
        field("first_relationship", 0x38) && field("second_relationship", 0x3c) :
        capture_native_history_support(event, result, fields, references);
    if (!captured) break;
    for (const char *key : {"corruptor_identity", "target_identity"}) {
        const int32_t id = fields.at(key).front();
        if (id == -1) continue;
        NativeHistoryIdentityInfo info;
        if (!native_history_identity_reference(result, id, info)) { captured = false; break; }
        fields.emplace(std::string(key) + "_real_figure", std::vector<int32_t>{info.real_figure});
        reference('n', info.real_figure);
        if (info.real_figure < 0) {
            fields.emplace(std::string(key) + "_named", std::vector<int32_t>{info.named});
            fields.emplace(std::string(key) + "_entity", std::vector<int32_t>{info.entity});
            reference('p', info.entity);
            result.texts.emplace(std::string(key) + "_species", std::move(info.species));
            result.texts.emplace(std::string(key) + "_profession", std::move(info.profession));
        }
    }
    break;
}
case 132: // hf_interrogated: RVA b7ce60
    captured = field("target", 0x28, 'n') && field("arresting_entity", 0x2c, 'p') &&
        field("interrogator", 0x30, 'n') && list("implicated", 0x38, 'n') &&
        field("interrogation_flags", 0x50);
    break;
