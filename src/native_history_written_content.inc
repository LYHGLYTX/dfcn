// DF 53.16 written_content. cc6a10/cc7020 select the carrier header;
// cc5d50..cc697a compose topics, styles, quality and chapters from this
// record. No complete English work description is called or parsed here.
static bool native_history_written_values(uintptr_t address, std::vector<int32_t> &out) {
    NativeBorrowedVector<int32_t> values;
    if (!native_history_copy(address, values) || !values.valid(65536)) return false;
    out.clear(); out.reserve(values.size());
    for (size_t i = 0; i < values.size(); ++i) {
        int32_t value = 0;
        if (!native_history_copy(reinterpret_cast<uintptr_t>(values.begin) + i * 4, value)) return false;
        out.push_back(value);
    }
    return true;
}

static bool native_history_site_type(uintptr_t site, NativeHistoryEventData &out,
        const std::string &prefix) {
    // Shared by written references and Legends site introductions. Complete
    // 10cbe50..10cc15f / 1fe86b0 site-type production, including all typed
    // substructures and the city flag. These are glossary keys, not prose.
    const auto field = [&](size_t offset) {
        return native_history_object_field(site, "world_site", offset);
    };
    int16_t type = -1, subtype = -1;
    if (!site || !native_history_copy(field(0x80), type)) return false;
    out.fields[prefix + ".site_type"] = {type};
    const char *key = "site";
    if (type == 0 || type == 3) {
        int32_t halls = 0, fortress = 0;
        if (!native_history_copy(field(0x348), halls) ||
            !native_history_copy(field(0x34c), fortress)) return false;
        key = halls > 0 ? "mountain halls" : halls == 0 && fortress > 0 ? "fortress" : "hillocks";
    } else if (type == 1 || type == 5) {
        bool city = false;
        const uintptr_t flags = field(0x2a0);
        if (!flags || !native_history_page_flag(flags, 0, 8, 3, city)) return false;
        key = type == 1 ? (city ? "fortress" : "pits") : (city ? "town" : "hamlet");
    } else if (type == 2) key = "cave";
    else if (type == 4) key = "forest retreat";
    else if (type == 6) key = "important location";
    else if (type == 9) key = "camp";
    else if (type == 7 || type == 8 || type == 10) {
        uintptr_t details = 0;
        if (!native_history_copy(field(0x310), details)) return false;
        if (details && !native_history_copy(details + (type == 7 ? 4 : type == 10 ? 2 : 0), subtype)) return false;
        if (type == 7) key = subtype == 2 ? "labyrinth" : subtype == 3 ? "shrine" : "lair";
        else if (type == 8) key = !details ? "fortress" : subtype == 1 ? "tower" :
            subtype == 2 ? "monastery" : subtype == 3 ? "fort" : "castle";
        else if (subtype == 0) key = "tomb";
        else if (subtype == 1) key = "vault";
        else if (subtype == 2) {
            int32_t size = 0;
            if (!native_history_copy(field(0x228), size)) return false;
            key = size >= 100 ? "mysterious palace" : size >= 15 ? "mysterious dungeon" : "mysterious lair";
        } else key = "monument";
    }
    out.fields[prefix + ".site_subtype"] = {subtype};
    out.texts[prefix + ".label"] = key;
    return true;
}

static bool capture_native_history_written_reference(uintptr_t ref, NativeHistoryEventData &out,
        const std::string &prefix) {
    const uintptr_t base = native_history_profile_base();
    // Stable semantic IDs retained by the shared writing grammar. They are
    // not function addresses; native RTTI/schema ancestry supplies identity.
    static constexpr std::pair<std::string_view, int32_t> meanings[] = {
        {"general_ref_value_levelst", 0xee0380},
        {"general_ref_knowledge_scholar_flagst", 0xee0ca0},
        {"general_ref_spherest", 0xef14a0},
        {"general_ref_languagest", 0xee02b0},
        {"general_ref_interactionst", 0xee3560},
        {"general_ref_poetic_formst", 0xedfd50},
        {"general_ref_musical_formst", 0xedfe50},
        {"general_ref_dance_formst", 0xedffe0},
        {"general_ref_written_contentst", 0xee0170},
        {"general_ref_historical_eventst", 0xeedd40},
        {"general_ref_sitest", 0xef1770},
        {"general_ref_entity", 0xef5280},
        {"general_ref_subregionst", 0xef2d60},
        {"general_ref_feature_layerst", 0xef4350},
        {"general_ref_historical_figurest", 0xef0690},
        {"general_ref_abstract_buildingst", 0xeed3b0},
        {"general_ref_entity_popst", 0xef49a0},
        {"general_ref_creaturest", 0xef4c10},
        {"general_ref_item_type", 0xef4e10},
        {"general_ref_artifact", 0xeec6b0},
    };
    int32_t route = -1;
    const auto *layout = native_history_dynamic_layout(ref);
    if (!layout || !std::string_view(layout->name).starts_with("general_ref")) return false;
    if (native_history_empty_virtual(ref, 0x90)) route = 0x72280;
    for (size_t depth = 0; route < 0 && layout && depth < 64; ++depth) {
        for (const auto &[type, meaning] : meanings)
            if (type == layout->name) { route = meaning; break; }
        layout = native_history_object_layout(layout->parent);
    }
    if (route < 0) return false;
    out.fields[prefix + ".route"] = {route};
    out.fields[prefix + ".present"] = {1};
    out.fields[prefix + ".named"] = {0};
    out.fields[prefix + ".id"] = {-1};
    out.fields[prefix + ".subid"] = {-1};
    if (route == 0x72280) return true; // All native empty-description ref subclasses.
    int32_t id = -1, second = -1;
    if (!native_history_copy(native_history_object_field(ref, "", 8), id)) return false;
    out.fields[prefix + ".id"] = {id};
    const auto add = [&](NativeHistoryObjectKind kind, uintptr_t object, size_t name_offset) {
        out.fields[prefix + ".present"] = {object ? 1 : 0};
        if (!object) return true;
        NativeHistorySubject value;
        value.kind = kind; value.id = id;
        if (!capture_native_history_name(base, object + name_offset, value.name)) return false;
        out.fields[prefix + ".named"] = {value.name.has_name ? 1 : 0};
        if (std::none_of(out.subjects.begin(), out.subjects.end(), [&](const auto &s) {
                return s.kind == kind && s.id == id && s.subid == -1;
            })) out.subjects.push_back(std::move(value));
        return true;
    };
    switch (route) {
    case 0xee0380: // value_level: value enum +8, signed level +c.
    case 0xee0ca0: // knowledge: category +8, exact single flag +c.
        if (!native_history_copy(native_history_object_field(ref, "", 0xc), second)) return false;
        out.fields[prefix + ".subid"] = {second}; return true;
    case 0xef14a0: return true; // sphere +8, complete shared sphere enum.
    case 0xee02b0: { // language RAW token, not an English display paragraph.
        if (id == -1) { out.fields[prefix + ".present"] = {0}; return true; }
        NativeBorrowedVector<uintptr_t> languages;
        if (!native_history_read_vector(native_history_global(0x24ed7a0), languages)) return false;
        const uintptr_t language = native_history_vector_at(languages, static_cast<size_t>(id));
        return language && native_history_copy_string(language, out.texts[prefix + ".label"]);
    }
    case 0xee3560: { // interaction IS_NAME source: RAW interaction.sources[index].
        if (!native_history_copy(native_history_object_field(ref, "", 0xc), second)) return false;
        out.fields[prefix + ".subid"] = {second};
        out.texts[prefix + ".label"] = "";
        if (id == -1 || second == -1) return true;
        NativeBorrowedVector<uintptr_t> interactions, sources;
        if (!native_history_read_vector(native_history_global(0x24f74c8), interactions)) return false;
        const uintptr_t interaction = native_history_vector_at(interactions, static_cast<size_t>(id));
        if (!interaction || !native_history_read_vector(interaction + 0x50, sources)) return false;
        const uintptr_t source = native_history_vector_at(sources, static_cast<size_t>(second));
        int32_t type = -1;
        if (!source || !native_history_typed_getter(source, 0, type)) return false;
        return type != 1 || native_history_copy_string(native_history_object_field(source, "", 0x10), out.texts[prefix + ".label"]);
    }
    case 0xedfd50: case 0xedfe50: case 0xedffe0: case 0xee0170: {
        const auto kind = route == 0xedfd50 ? NativeHistoryObjectKind::Poem :
            route == 0xedfe50 ? NativeHistoryObjectKind::Music :
            route == 0xedffe0 ? NativeHistoryObjectKind::Dance : NativeHistoryObjectKind::WrittenContent;
        NativeHistorySubject value;
        if (!capture_native_history_form(base, kind, id, value)) return false;
        out.fields[prefix + ".present"] = {value.label_key.empty() ? 1 : 0};
        out.fields[prefix + ".named"] = {kind == NativeHistoryObjectKind::WrittenContent ?
            (!value.raw_title.empty() ? 1 : 0) : (value.name.has_name ? 1 : 0)};
        return native_history_form_reference(out, kind, id);
    }
    case 0xeedd40: {
        uintptr_t source = 0;
        if (!native_history_find_structure_id(native_history_global(0x24f9cb8), 0x20, id, source)) return false;
        out.fields[prefix + ".present"] = {source ? 1 : 0};
        return !source || capture_native_history_page_event(id, out);
    }
    case 0xef1770: {
        const uintptr_t site = native_history_find_subject(base, NativeHistoryObjectKind::Site, id);
        return add(NativeHistoryObjectKind::Site, site, 0) &&
            (!site || native_history_site_type(site, out, prefix));
    }
    case 0xef5280:
        return add(NativeHistoryObjectKind::Entity,
            native_history_find_subject(base, NativeHistoryObjectKind::Entity, id), 0x20);
    case 0xef2d60:
        return add(NativeHistoryObjectKind::Region,
            native_history_find_subject(base, NativeHistoryObjectKind::Region, id), 0);
    case 0xef4350: {
        const uintptr_t layer = native_history_find_subject(base, NativeHistoryObjectKind::Underground, id);
        int16_t type = -1;
        if (!add(NativeHistoryObjectKind::Underground, layer, 8) ||
            (layer && !native_history_copy(layer, type))) return false;
        out.fields[prefix + ".layer_type"] = {type}; return true;
    }
    case 0xef0690: {
        const uintptr_t figure = native_history_find_subject(base, NativeHistoryObjectKind::Figure, id);
        if (!add(NativeHistoryObjectKind::Figure, figure, 0x38) || !figure) return !figure;
        bool deity = false, force = false, ghost = false;
        if (!native_history_page_flag(figure, 0xc8, 0xd0, 2, deity) ||
            !native_history_page_flag(figure, 0xc8, 0xd0, 3, force) ||
            !native_history_page_flag(figure, 0xc8, 0xd0, 7, ghost)) return false;
        std::string &label = out.texts[prefix + ".label"];
        if (deity || force) { label = deity ? "deity" : "force"; return true; }
        uintptr_t info = 0, curse = 0;
        int32_t animated = -1;
        uint8_t named_curse = 0;
        if (!native_history_copy(figure + 0x130, info) ||
            (info && !native_history_copy(info + 0x48, curse)) ||
            (curse && (!native_history_copy(curse + 0x144, animated) ||
                !native_history_copy(curse + 0x88, named_curse)))) return false;
        if (animated != -1) return native_history_copy_string(curse + 0x150, label);
        int16_t race = -1, caste = -1;
        if (!native_history_copy(figure + 2, race) || !native_history_copy(figure + 4, caste) ||
            !capture_native_history_creature_label(base, race, caste, false, label)) return false;
        if (ghost && !named_curse) label = "ghostly " + label;
        if (named_curse) {
            std::string suffix;
            if (!native_history_copy_string(curse + 0x90, suffix)) return false;
            label += " " + suffix;
        }
        return true;
    }
    case 0xeed3b0: {
        if (!native_history_copy(native_history_object_field(ref, "", 0xc), second)) return false;
        out.fields[prefix + ".subid"] = {second};
        const uintptr_t site = native_history_find_subject(base, NativeHistoryObjectKind::Site, id);
        uintptr_t building = 0;
        if (site && !native_history_find_structure_id(site + 0x2b0, 8, second, building)) return false;
        out.fields[prefix + ".present"] = {building ? 1 : 0};
        if (!building) return true;
        NativeHistorySubject value;
        if (!capture_native_history_structure(base, id, second, value)) return false;
        out.fields[prefix + ".building_type"] = {value.native_type};
        out.fields[prefix + ".named"] = {1}; // +10 returns a name pointer, even when unnamed.
        out.fields[prefix + ".name_has_name"] = {value.name.has_name ? 1 : 0};
        int16_t subtype = -1;
        if (value.native_type == 6 && !native_history_copy(building + 0x130, subtype)) return false;
        out.fields[prefix + ".building_subtype"] = {subtype};
        value.label_key.clear();
        if (std::none_of(out.subjects.begin(), out.subjects.end(), [&](const auto &s) {
                return s.kind == value.kind && s.id == id && s.subid == second;
            })) out.subjects.push_back(std::move(value));
        return true;
    }
    case 0xef49a0: case 0xef4c10: {
        int32_t race = id; int16_t caste = -1; uint8_t flags = 0;
        if (route == 0xef49a0) {
            if (!native_history_copy(native_history_object_field(ref, "", 0xc), race) || !native_history_copy(native_history_object_field(ref, "", 0x14), flags)) return false;
        } else if (!native_history_copy(native_history_object_field(ref, "", 0xc), caste) || !native_history_copy(native_history_object_field(ref, "", 0x18), flags)) return false;
        out.fields[prefix + ".flags"] = {flags};
        out.fields[prefix + ".race"] = {race};
        out.fields[prefix + ".caste"] = {caste};
        return capture_native_history_creature_label(base, race, caste,
                false, out.texts[prefix + ".label"]);
    }
    case 0xef4e10: {
        int16_t type = -1, subtype = -1, material = -1, index = -1;
        if (!native_history_copy(native_history_object_field(ref, "", 8), type) || !native_history_copy(native_history_object_field(ref, "", 0xc), subtype) ||
            !native_history_copy(native_history_object_field(ref, "", 0x10), material) || !native_history_copy(native_history_object_field(ref, "", 0x12), index)) return false;
        return capture_native_history_page_item({type, subtype, material, index}, out, prefix, 1, -1);
    }
    case 0xeec6b0: {
        const uintptr_t artifact = native_history_find_subject(base, NativeHistoryObjectKind::Artifact, id);
        out.fields[prefix + ".present"] = {artifact ? 1 : 0};
        if (!artifact) return true;
        uintptr_t item = 0;
        int32_t item_type = -1;
        NativeHistorySubject value;
        value.kind = NativeHistoryObjectKind::Artifact; value.id = id;
        if (!capture_native_history_name(base, artifact + 8, value.name) ||
            !native_history_copy(artifact + 0x90, item) || !item ||
            !native_history_typed_getter(item, 0, item_type)) return false;
        if ((item_type == 86 || item_type == 87 || item_type == 89) &&
            !capture_native_history_artifact_subject(base, artifact, value)) return false;
        out.fields[prefix + ".named"] = {value.name.has_name ? 1 : 0};
        if (std::none_of(out.subjects.begin(), out.subjects.end(), [&](const auto &s) {
                return s.kind == value.kind && s.id == id;
            })) out.subjects.push_back(std::move(value));
        // eec786 uses the actual item-label producer with (true, 1).
        // A type/material tuple alone omits its per-item modifiers. This
        // isolated typed name is separate from the reference/work sentence.
        if (!g_real_native_history_artifact_item) return false;
        NativeHistoryPageString label;
        g_real_native_history_artifact_item(reinterpret_cast<void *>(item), &label.value, true, 1);
        std::string_view raw;
        if (!native_string_view(&label.value, &raw, kNativeHistoryStringLimit)) return false;
        out.texts["item." + prefix] = std::string(raw);
        return true;
    }
    default: return false;
    }
}

static bool capture_native_history_written_content(uintptr_t content, NativeHistoryEventData &out,
        const std::string &prefix) {
    const uintptr_t base = native_history_profile_base();
    if (!base || prefix.empty()) return false;
    out.fields[prefix + ".present"] = {content ? 1 : 0};
    if (!content) return true;
    int32_t id = -1, type = -1, author = -1, quality = 0, first_page = 0, last_page = 0;
    if (!native_history_copy(content, id) || !native_history_copy(content + 0x68, type) ||
        !native_history_copy(content + 0xa0, author) || !native_history_copy(content + 0xa4, quality) ||
        !native_history_copy(content + 0x28, first_page) || !native_history_copy(content + 0x2c, last_page) ||
        !native_history_copy_string(content + 8, out.texts[prefix + ".title"]) ||
        !native_history_written_values(content + 0x70, out.fields[prefix + ".styles"]) ||
        !native_history_written_values(content + 0x88, out.fields[prefix + ".strengths"]) ||
        !native_history_written_values(content + 0x48, out.fields[prefix + ".purposes"])) return false;
    out.fields[prefix + ".id"] = {id}; out.fields[prefix + ".type"] = {type};
    out.fields[prefix + ".author"] = {author}; out.fields[prefix + ".quality"] = {quality};
    out.fields[prefix + ".pages"] = {static_cast<int32_t>(static_cast<uint32_t>(last_page) -
        static_cast<uint32_t>(first_page) + 1u)};
    out.fields[prefix + ".author_present"] = {0};
    out.texts[prefix + ".author_name"] = "";
    uintptr_t figure = native_history_find_subject(base, NativeHistoryObjectKind::Figure, author);
    if (figure) {
        out.fields[prefix + ".author_present"] = {1};
        uintptr_t name = figure + 0x38, info = 0, reputation = 0, identity = 0;
        int32_t identity_id = -1;
        if (!native_history_copy(figure + 0x130, info) ||
            (info && !native_history_copy(info + 0x58, reputation)) ||
            (reputation && !native_history_copy(reputation + 0x30, identity_id))) return false;
        if (identity_id != -1) {
            if (!native_history_find_structure_id(native_history_global(0x24e7ce8), 0, identity_id, identity)) return false;
            if (identity) {
                int32_t real_id = -1;
                if (!native_history_copy(identity + 0x88, real_id)) return false;
                const uintptr_t real = native_history_find_subject(base, NativeHistoryObjectKind::Figure, real_id);
                uint8_t real_named = 0;
                if (real && !native_history_copy(real + 0xaa, real_named)) return false;
                name = real && real_named ? real + 0x38 : identity + 8;
            }
        }
        if (name) {
            uint8_t named = 0;
            if (!native_history_copy(name + 0x72, named)) return false;
            if (named) {
                NativeHistoryPageString spelling;
                // Isolated language-name orthography; titles, author choice
                // and all body clauses are still regenerated from fields.
                reinterpret_cast<void (*)(void *, NativeString *)>(native_history_page_address(NativeHistoryPageSymbol::OriginalName))(
                    reinterpret_cast<void *>(name), &spelling.value);
                std::string_view raw;
                if (!native_string_view(&spelling.value, &raw, kNativeHistoryStringLimit)) return false;
                out.texts[prefix + ".author_name"] = std::string(raw);
            }
        }
    }
    NativeBorrowedVector<uintptr_t> references;
    if (!native_history_read_vector(content + 0x30, references) || references.size() > 65536 ||
        references.size() != out.fields[prefix + ".purposes"].size() ||
        out.fields[prefix + ".strengths"].size() < std::min<size_t>(2, out.fields[prefix + ".styles"].size())) return false;
    for (size_t i = 0; i < references.size(); ++i) {
        const int32_t purpose = out.fields[prefix + ".purposes"][i];
        if (purpose != 0 && (purpose < 5 || purpose > 9)) continue;
        if (!capture_native_history_written_reference(native_history_vector_at(references, i), out,
            prefix + ".ref." + std::to_string(i))) return false;
    }
    return true;
}
