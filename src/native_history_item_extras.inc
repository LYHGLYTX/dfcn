// 53.16 item artwork, dice, currency, contaminants and raw effect descriptions.
// All grammar inputs are owned copies of native fields. No item paragraph is
// parsed, and the mutating art-image generators are never called here.
static bool native_history_item_extra_image(int32_t chunk_id, int16_t image_id,
        uintptr_t &image) {
    image = 0;
    if (chunk_id == -1 || image_id < 0 || image_id >= 500) return true;
    NativeBorrowedVector<uintptr_t> chunks;
    if (!native_history_read_vector(native_history_global(0x23e5160), chunks)) return false;
    for (size_t i = 0; i < chunks.size(); ++i) {
        const uintptr_t chunk = native_history_vector_at(chunks, i);
        int32_t id = -1;
        if (!chunk || !native_history_copy(chunk, id)) return false;
        if (id == chunk_id) return native_history_copy(chunk + 8 + size_t(image_id) * 8, image);
    }
    // A nonresident chunk would be loaded by the original producer. Capture
    // happens afterwards, so absence here cannot be silently called empty.
    return false;
}

static bool native_history_item_extra_name(uintptr_t address, NativeHistoryEventData &data,
        const std::string &key) {
    NativeHistorySubject name;
    name.kind = NativeHistoryObjectKind::Identity;
    name.id = -1;
    name.subid = -2 - static_cast<int32_t>(data.subjects.size());
    if (!capture_native_history_name(native_history_profile_base(), address, name.name)) return false;
    data.fields[key] = {name.id};
    data.fields[key + ".subid"] = {name.subid};
    data.subjects.push_back(std::move(name));
    return true;
}

static bool native_history_item_extra_shape(int32_t id, int32_t adjective, int32_t count,
        NativeHistoryEventData &data, const std::string &prefix) {
    NativeBorrowedVector<uintptr_t> shapes;
    if (!native_history_read_vector(native_history_global(0x24f70d0), shapes)) return false;
    const uintptr_t shape = id >= 0 ? native_history_vector_at(shapes, size_t(id)) : 0;
    data.texts[prefix + ".label"] = "";
    data.texts[prefix + ".adjective"] = "";
    if (!shape) return false;
    if (!native_history_copy_string(shape + (count == 1 ? 0x50 : 0x70),
            data.texts[prefix + ".label"])) return false;
    NativeBorrowedVector<uintptr_t> adjectives;
    if (!native_history_read_vector(shape + 0x90, adjectives)) return false;
    if (adjective >= 0 && size_t(adjective) < adjectives.size())
        return native_history_copy_string(native_history_vector_at(adjectives, adjective),
            data.texts[prefix + ".adjective"]);
    return true;
}

static bool capture_native_history_item_art_element(uintptr_t element,
        NativeHistoryEventData &data, const std::string &prefix, bool dice = false) {
    const uintptr_t base = native_history_profile_base();
    int32_t native_kind = -1, count = 0;
    if (!native_history_typed_getter(element, 0x10, native_kind) ||
        !native_history_copy(native_history_object_field(element, "", 8), count)) return false;
    using Kind = NativeHistoryArtElementKind;
    const auto kind = static_cast<Kind>(native_kind);
    data.fields[prefix + ".kind"] = {native_kind};
    data.fields[prefix + ".count"] = {count};
    data.fields[prefix + ".figure"] = {-1};
    data.fields[prefix + ".artifact"] = {-1};
    data.fields[prefix + ".deity"] = {0};
    data.fields[prefix + ".spheres"] = {};
    data.texts[prefix + ".label"] = "";
    data.texts[prefix + ".adjective"] = "";
    if (dice && kind != Kind::Creature && kind != Kind::Item) return true;
    if (kind == Kind::None) return true; // Base art_image_elementst has an empty label.
    if (kind == Kind::Shape) {
        int32_t shape = -1;
        int16_t adjective = -1;
        return native_history_copy(native_history_object_field(element, "", 0x10), shape) &&
            native_history_copy(native_history_object_field(element, "", 0x14), adjective) &&
            native_history_item_extra_shape(shape, adjective, count, data, prefix);
    }
    if (kind == Kind::Plant || kind == Kind::Tree) {
        int32_t plant_id = -1;
        NativeBorrowedVector<uintptr_t> plants;
        if (!native_history_copy(native_history_object_field(element, "", 0x10), plant_id) ||
            !native_history_read_vector(native_history_global(0x24ec8f8), plants)) return false;
        const uintptr_t plant = plant_id >= 0 ? native_history_vector_at(plants, plant_id) : 0;
        return !plant || native_history_copy_string(native_history_object_field(
            plant, "plant_raw", count == 1 ? 0x50 : 0x70),
            data.texts[prefix + ".label"]);
    }
    if (kind == Kind::Item) {
        int16_t type = -1, subtype = -1, material = -1, index = -1;
        int32_t item_id = -1;
        if (!native_history_copy(native_history_object_field(element, "", 0x10), type) ||
            !native_history_copy(native_history_object_field(element, "", 0x12), subtype) ||
            !native_history_copy(native_history_object_field(element, "", 0x14), material) ||
            !native_history_copy(native_history_object_field(element, "", 0x16), index) ||
            !native_history_copy(native_history_object_field(element, "", 0x1c), item_id)) return false;
        // The image stores an item ID, not an artifact ID. 147bca searches
        // artifact records by their associated item's +1c ID, in reverse.
        if (item_id != -1 && !dice) {
            NativeBorrowedVector<uintptr_t> artifacts;
            if (!native_history_read_vector(native_history_global(0x23e6180), artifacts)) return false;
            for (size_t i = artifacts.size(); i > 0; --i) {
                const uintptr_t artifact = native_history_vector_at(artifacts, i - 1);
                uintptr_t item_object = 0;
                int32_t candidate = -1, artifact_id = -1;
                if (!artifact || !native_history_copy(artifact + 0x90, item_object)) return false;
                if (!item_object) continue;
                if (!native_history_copy(item_object + 0x1c, candidate)) return false;
                if (candidate != item_id) continue;
                if (!native_history_copy(artifact, artifact_id)) return false;
                data.fields[prefix + ".artifact"] = {artifact_id};
                data.references.emplace_back(NativeHistoryObjectKind::Artifact, artifact_id);
                break;
            }
        }
        if (dice) return capture_native_history_page_item({type, subtype, -1, -1}, data,
            prefix + ".dice", count == 1 ? 0 : 1, -1);
        return capture_native_history_page_item({type, subtype, material, index},
            data, prefix, count == 1 ? 1 : -1, -1);
    }
    if (kind != Kind::Creature) return false;
    int32_t race = -1;
    int16_t caste = -1, figure_race = -1;
    int32_t figure_id = -1;
    if (!native_history_copy(native_history_object_field(element, "", 0x10), race) ||
        !native_history_copy(native_history_object_field(element, "", 0x14), caste) ||
        !native_history_copy(native_history_object_field(element, "", 0x18), figure_id)) return false;
    if (!capture_native_history_creature_label(base, race, caste, count != 1,
            data.texts[prefix + ".label"])) return false;
    if (dice) return true;
    const uintptr_t figure = native_history_find_subject(base, NativeHistoryObjectKind::Figure, figure_id);
    if (!figure) return true;
    uint8_t named = 0, flags = 0;
    int32_t flag_count = 0;
    uintptr_t flag_bytes = 0;
    if (!native_history_copy(figure + 0xaa, named) ||
        !native_history_copy(figure + 0xd0, flag_count) ||
        (flag_count > 0 && (!native_history_copy(figure + 0xc8, flag_bytes) ||
            !flag_bytes || !native_history_copy(flag_bytes, flags))) ||
        !native_history_copy(figure + 2, figure_race) || !native_history_copy(figure + 4, caste)) return false;
    race = figure_race;
    data.fields[prefix + ".figure"] = {figure_id};
    data.fields[prefix + ".named"] = {named};
    data.fields[prefix + ".deity"] = {flags & 4 ? 1 : 0};
    data.fields[prefix + ".flags"] = {flags};
    if (!native_history_item_extra_name(figure + 0x38, data, prefix + ".name") ||
        !capture_native_history_creature_label(base, race, caste, false,
            data.texts[prefix + ".figure_species"])) return false;
    if (!(flags & 4)) return true;
    uintptr_t info = 0, spheres = 0;
    NativeBorrowedVector<int16_t> values;
    if (!native_history_copy(figure + 0x130, info) || !info ||
        !native_history_copy(info, spheres) || !spheres ||
        !native_history_copy(spheres, values) || !values.valid(4096)) return false;
    for (size_t i = values.size(); i > 0; --i) {
        int16_t value = -1;
        if (!native_history_copy(reinterpret_cast<uintptr_t>(values.begin) + (i - 1) * 2, value)) return false;
        data.fields[prefix + ".spheres"].push_back(value);
    }
    // Gender is added only if no distinct caste display name already conveys it.
    data.texts[prefix + ".gender"] = "";
    NativeBorrowedVector<uintptr_t> races, castes;
    if (!native_history_read_vector(native_history_global(0x24eca68), races)) return false;
    const uintptr_t raw = race >= 0 ? native_history_vector_at(races, race) : 0;
    uintptr_t race_flags = 0;
    int32_t race_flag_count = 0;
    uint8_t gender_flag = 0;
    if (raw && (!native_history_copy(raw + 0x1b0, race_flag_count) ||
        (race_flag_count > 8 && (!native_history_copy(raw + 0x1a8, race_flags) || !race_flags ||
            !native_history_copy(race_flags + 8, gender_flag))))) return false;
    if (raw && caste >= 0 && (gender_flag & 4)) {
        if (!native_history_read_vector(raw + 0x178, castes)) return false;
        const uintptr_t caste_raw = native_history_vector_at(castes, caste);
        std::string main_name, caste_name;
        int8_t gender = -1;
        if (!native_history_copy(figure + 6, gender) ||
            !native_history_copy_string(raw + 0x20, main_name) ||
            (caste_raw && !native_history_copy_string(caste_raw + 0x20, caste_name))) return false;
        if (main_name == caste_name || caste_name.empty())
            data.texts[prefix + ".gender"] = gender == 0 ? "female" : gender == 1 ? "male" : "";
    }
    return true;
}

static bool capture_native_history_item_art_image(uintptr_t image,
        NativeHistoryEventData &data, const std::string &prefix) {
    const uintptr_t base = native_history_profile_base();
    data.fields[prefix + ".present"] = {image ? 1 : 0};
    if (!image) return true;
    int32_t type = -1, event_id = -1, creator = -1, mat_index = -1;
    int16_t quality = -1, mat_type = -1;
    uintptr_t source = 0;
    int32_t source_kind = -1;
    if (!native_history_copy(native_history_object_field(image, "art_image", 0xb0), type) || !native_history_copy(native_history_object_field(image, "art_image", 0x30), event_id) ||
        !native_history_copy(native_history_object_field(image, "art_image", 0xbc), quality) || !native_history_copy(native_history_object_field(image, "art_image", 0xc0), creator) ||
        !native_history_copy(native_history_object_field(image, "art_image", 0xb4), mat_type) || !native_history_copy(native_history_object_field(image, "art_image", 0xb8), mat_index) ||
        !native_history_copy(native_history_object_field(image, "art_image", 0xc8), source) ||
        (source && !native_history_typed_getter(source, 0x10, source_kind))) return false;
    data.fields[prefix + ".type"] = {type};
    data.fields[prefix + ".source_kind"] = {source_kind};
    data.fields[prefix + ".quality"] = {quality};
    data.fields[prefix + ".event"] = {-1};
    data.fields[prefix + ".collection"] = {-1};
    data.fields[prefix + ".entity"] = {-1};
    data.fields[prefix + ".elements"] = {};
    data.fields[prefix + ".properties"] = {};
    data.fields[prefix + ".material_present"] = {mat_type != -1 ? 1 : 0};
    if (!native_history_item_extra_name(native_history_object_field(image, "art_image", 0x38), data, prefix + ".name") ||
        !capture_native_history_improvement_maker(data, prefix + ".creator", creator)) return false;
    if (mat_type != -1 && !capture_native_history_improvement_material(data,
            prefix + ".material", mat_type, mat_index, 0, false)) return false;
    NativeBorrowedVector<uintptr_t> elements, properties;
    if (!native_history_read_vector(image, elements) || !native_history_read_vector(native_history_object_field(image, "art_image", 0x18), properties) ||
        !elements.valid(4096) || !properties.valid(4096)) return false;
    for (size_t i = 0; i < elements.size(); ++i) {
        const std::string key = prefix + ".element." + std::to_string(i);
        if (!capture_native_history_item_art_element(native_history_vector_at(elements, i), data, key)) return false;
        data.fields[prefix + ".elements"].push_back(int32_t(i));
    }
    for (size_t i = 0; i < properties.size(); ++i) {
        const uintptr_t property = native_history_vector_at(properties, i);
        int32_t kind = -1, first = -1, second = -1;
        int16_t verb = -1;
        if (!property || !native_history_typed_getter(property, 0x10, kind)) return false;
        if (kind != -1 && kind != 0 && kind != 1) return false;
        if (kind != -1 && (!native_history_copy(native_history_object_field(property, "", 0x18), first) ||
            !native_history_copy(native_history_object_field(property, {}, kind == 0 ? 0x20 : 0x1c), verb) ||
            (kind == 0 && !native_history_copy(native_history_object_field(property, "", 0x1c), second)))) return false;
        const std::string key = prefix + ".property." + std::to_string(i);
        data.fields[key] = {kind, first, second, verb};
        data.fields[prefix + ".properties"].push_back(int32_t(i));
    }
    if (event_id >= 0) {
        uintptr_t native_event = 0;
        if (!native_history_material_find_id(native_history_global(0x24f9cb8), 0x20, event_id, native_event)) return false;
        if (native_event) {
            if (!capture_native_history_page_event(event_id, data)) return false;
            data.fields[prefix + ".event"] = {event_id};
            NativeBorrowedVector<uintptr_t> collections;
            if (!native_history_read_vector(native_history_global(0x24f9d30), collections)) return false;
            for (size_t i = collections.size(); i > 0; --i) {
                const uintptr_t collection = native_history_vector_at(collections, i - 1);
                NativeBorrowedVector<int32_t> members;
                if (!collection || !native_history_copy(collection + 8, members) || !members.valid(1048576)) return false;
                bool contains = false;
                for (size_t j = 0; j < members.size(); ++j) {
                    int32_t id = -1;
                    if (!native_history_copy(reinterpret_cast<uintptr_t>(members.begin) + j * 4, id)) return false;
                    if (id == event_id) { contains = true; break; }
                }
                if (!contains) continue;
                int32_t id = -1;
                if (!native_history_copy(collection + 0x58, id) || !capture_native_history_collection_title(id, data)) return false;
                data.fields[prefix + ".collection"] = {id};
                break;
            }
        }
    }
    // The native 1452ba5 branch identifies a commissioned/group-symbol image.
    if (type == 24 && source) {
        int32_t entity_id = -1, symbol_index = -1;
        if (!native_history_copy(native_history_object_field(source, "", 8), entity_id) || !native_history_copy(native_history_object_field(source, "", 0xc), symbol_index)) return false;
        const uintptr_t entity = native_history_find_subject(base, NativeHistoryObjectKind::Entity, entity_id);
        if (entity && symbol_index >= 0) {
            NativeBorrowedVector<int16_t> categories;
            if (!native_history_copy(entity + 0xeb8, categories) || !categories.valid(65536)) return false;
            if (size_t(symbol_index) < categories.size()) {
                int16_t category = -1, entity_type = -1, race = -1;
                if (!native_history_copy(reinterpret_cast<uintptr_t>(categories.begin) + size_t(symbol_index) * 2, category) ||
                    !native_history_copy(entity, entity_type) || !native_history_copy(entity + 0x98, race)) return false;
                data.fields[prefix + ".entity"] = {entity_id};
                data.fields[prefix + ".entity_type"] = {entity_type};
                data.fields[prefix + ".entity_category"] = {category};
                data.texts[prefix + ".entity_species"] = "";
                data.texts[prefix + ".guild"] = "craft";
                data.references.emplace_back(NativeHistoryObjectKind::Entity, entity_id);
                if (race >= 0) {
                    NativeBorrowedVector<uintptr_t> races;
                    if (!native_history_read_vector(native_history_global(0x24eca68), races)) return false;
                    const uintptr_t raw = native_history_vector_at(races, race);
                    if (raw && !native_history_copy_string(raw + 0x60, data.texts[prefix + ".entity_species"])) return false;
                }
                if (entity_type == 10) {
                    NativeBorrowedVector<uintptr_t> professions;
                    if (!native_history_read_vector(entity + 0xa0, professions)) return false;
                    for (size_t i = 0; i < professions.size(); ++i) {
                        const uintptr_t entry = native_history_vector_at(professions, i);
                        int32_t kind = -1; int16_t skill = -1;
                        if (!entry || !native_history_copy(entry, kind)) return false;
                        if (kind != 0) continue;
                        if (!native_history_copy(entry + 4, skill)) return false;
                        data.fields[prefix + ".guild_skill"] = {skill};
                        // The shared profession label adapter takes the skill
                        // enum as a typed argument; no group prose is parsed.
                        if (skill >= 0) {
                            int16_t player_race = -1;
                            if (!native_history_copy(native_history_global(0x239367c), player_race)) return false;
                            // The guild entry stores a profession enum, despite
                            // the legacy field key's "skill" spelling.
                            if (skill == 102) data.texts[prefix + ".guild"].clear();
                            else if (!capture_native_history_profession(base, skill, player_race,
                                    -1, false, data.texts[prefix + ".guild"])) return false;
                        }
                        break;
                    }
                }
            }
        }
    }
    return true;
}

static bool capture_native_history_item_dice(uintptr_t set, uintptr_t item,
        NativeHistoryEventData &data, const std::string &prefix) {
    int32_t kind = -1, upward = -1;
    NativeBorrowedVector<uintptr_t> faces;
    if (!native_history_copy(set + 4, kind) || !native_history_read_vector(set + 8, faces) ||
        !faces.valid(4096)) return false;
    data.fields[prefix + ".kind"] = {kind};
    data.fields[prefix + ".faces"] = {};
    data.fields[prefix + ".upward"] = {-1};
    // Legends is the calling context (the native can_read gate is always true).
    if (kind == 0) {
        uint8_t flags = 0;
        if (!native_history_item_scalar(item, 0x750, upward) || !native_history_copy(native_history_object_field(item, "", 0x10), flags)) return false;
        if (upward >= 0 && size_t(upward) < faces.size() && (flags & 0x21))
            data.fields[prefix + ".upward"] = {upward};
        else upward = -1;
    }
    for (size_t i = 0; i < faces.size(); ++i) {
        const uintptr_t face = native_history_vector_at(faces, i);
        int32_t type = -1, first = -1, second = -1, count = 0;
        if (!face || !native_history_copy(face, type) || !native_history_copy(face + 4, first) ||
            !native_history_copy(face + 8, second) || !native_history_copy(face + 0xc, count)) return false;
        const std::string key = prefix + ".face." + std::to_string(i);
        data.fields[key] = {type, first, second, count};
        data.fields[prefix + ".faces"].push_back(int32_t(i));
        if (int32_t(i) != upward) continue;
        if (type == 2) {
            if (!native_history_item_extra_shape(first, second, count, data, key)) return false;
        } else if (type == 1) {
            NativeBorrowedVector<uintptr_t> words;
            if (!native_history_read_vector(native_history_global(0x24ed770), words)) return false;
            const uintptr_t word = second >= 0 ? native_history_vector_at(words, second) : 0;
            if (!word || !native_history_copy_string(word, data.texts[key + ".word"])) return false;
            data.fields[key + ".part"] = {-1};
            static constexpr int order[] = {0,1,2,4,5,6,7,8,3};
            for (int part : order) {
                std::string value;
                if (!native_history_copy_string(word + 0x20 + size_t(part) * 0x20, value)) return false;
                if (!value.empty()) { data.fields[key + ".part"] = {part}; break; }
            }
        } else if (type == 0) {
            uintptr_t image = 0;
            if (!native_history_item_extra_image(first, static_cast<int16_t>(second), image)) return false;
            const std::string image_key = key + ".image";
            data.fields[image_key + ".present"] = {image ? 1 : 0};
            data.fields[image_key + ".elements"] = {};
            data.fields[image_key + ".properties"] = {};
            if (!image) continue;
            // 85da20 reads only the first image element and, for a creature,
            // the first property. Unused artwork metadata is not a dependency.
            NativeBorrowedVector<uintptr_t> elements, properties;
            if (!native_history_read_vector(image, elements)) return false;
            if (!elements.size()) continue;
            if (!capture_native_history_item_art_element(native_history_vector_at(elements, 0),
                    data, image_key + ".element.0", true)) return false;
            data.fields[image_key + ".elements"] = {0};
            if (static_cast<NativeHistoryArtElementKind>(
                    data.fields[image_key + ".element.0.kind"].front()) !=
                    NativeHistoryArtElementKind::Creature) continue;
            if (!native_history_read_vector(native_history_object_field(image, "art_image", 0x18), properties)) return false;
            if (!properties.size()) continue;
            int32_t property_kind = -1;
            int16_t verb = -1;
            const uintptr_t property = native_history_vector_at(properties, 0);
            if (!property || !native_history_typed_getter(property, 0x10, property_kind) ||
                (property_kind == 1 && !native_history_copy(native_history_object_field(property, "", 0x1c), verb))) return false;
            data.fields[image_key + ".properties"] = {0};
            data.fields[image_key + ".property.0"] = {property_kind, -1, -1, verb};
        }
    }
    return true;
}

static bool capture_native_history_item_extras(uintptr_t item, NativeHistoryEventData &data,
        const std::string &prefix) {
    const uintptr_t base = native_history_profile_base();
    int32_t type = -1, constructed = 0;
    uintptr_t image = 0;
    if (!native_history_item_scalar(item, 0, type, 2)) return false;
    // The native getImageRef production belongs to both concrete classes;
    // neither inherits from the other. Their shared image fields use the
    // actual object's ABI layout, and the same art-image snapshot/rendering
    // path as improvements. Other item classes return no image reference.
    if (native_history_object_is(item, "item_statuest") ||
            native_history_object_is(item, "item_figurinest")) {
        int32_t chunk = -1; int16_t index = -1;
        if (!native_history_copy(native_history_object_field(item, "", 0xe8), chunk) || !native_history_copy(native_history_object_field(item, "", 0xec), index) ||
            !native_history_item_extra_image(chunk, index, image)) return false;
    }
    if (!capture_native_history_item_art_image(image, data, prefix + ".image")) return false;
    data.fields[prefix + ".dice"] = {};
    if (!native_history_item_scalar(item, 0x5a8, constructed, 1)) return false;
    if (constructed && type != 89) {
        NativeBorrowedVector<uintptr_t> improvements;
        if (!native_history_read_vector(native_history_object_field(item, "", 0xd0), improvements)) return false;
        for (size_t i = 0; i < improvements.size(); ++i) {
            const uintptr_t improvement = native_history_vector_at(improvements, i);
            int32_t kind = -1, set_id = -1;
            if (!improvement || !native_history_typed_getter(improvement, 0x28, kind)) return false;
            if (kind != 13) continue;
            uintptr_t set = 0;
            if (!native_history_copy(native_history_object_field(improvement, "", 0x28), set_id) ||
                !native_history_material_find_id(native_history_global(0x24e8018), 0, set_id, set)) return false;
            if (!set) continue;
            const std::string key = prefix + ".dice." + std::to_string(i);
            if (!capture_native_history_item_dice(set, item, data, key)) return false;
            data.fields[prefix + ".dice"].push_back(int32_t(i));
        }
    }
    data.fields[prefix + ".coin"] = {0};
    if (type == 74) {
        int16_t index = -1;
        NativeBorrowedVector<uintptr_t> coins;
        if (!native_history_copy(native_history_object_field(item, "", 0xe8), index) || !native_history_read_vector(native_history_global(0x23d1790), coins)) return false;
        const uintptr_t coin = index >= 0 ? native_history_vector_at(coins, index) : 0;
        if (coin) {
            const std::string key = prefix + ".currency";
            int16_t material = -1; int32_t mat_index = -1, entity_id = -1, ruler = -1, year = -1;
            if (!native_history_copy(coin, year) || !native_history_copy(coin + 4, material) ||
                !native_history_copy(coin + 8, mat_index) || !native_history_copy(coin + 0xc, entity_id) ||
                !native_history_copy(coin + 0x10, ruler)) return false;
            data.fields[prefix + ".coin"] = {1};
            data.fields[key + ".entity"] = {entity_id};
            data.fields[key + ".ruler"] = {ruler};
            data.fields[key + ".year"] = {year};
            data.fields[key + ".dated"] = {0};
            data.fields[key + ".ruler_present"] = {0};
            if (entity_id != -1) {
                const uintptr_t entity = native_history_find_subject(base, NativeHistoryObjectKind::Entity, entity_id);
                uintptr_t raw = 0, flags = 0; int32_t flag_count = 0; uint8_t flag = 0;
                if (!entity || !native_history_copy(entity + 8, raw) || !raw ||
                    !native_history_copy(raw + 0x3a8, flag_count) ||
                    (flag_count > 1 && (!native_history_copy(raw + 0x3a0, flags) || !flags ||
                        !native_history_copy(flags + 1, flag)))) return false;
                data.fields[key + ".dated"] = {flag & 4 ? 1 : 0};
                data.references.emplace_back(NativeHistoryObjectKind::Entity, entity_id);
                if (!(flag & 4) && ruler >= 0) {
                    const uintptr_t figure = native_history_find_subject(base, NativeHistoryObjectKind::Figure, ruler);
                    data.fields[key + ".ruler_present"] = {figure ? 1 : 0};
                    if (figure && !native_history_item_extra_name(figure + 0x38, data, key + ".ruler_name"))
                        return false;
                }
                if (!capture_native_history_improvement_material(data, key + ".material", material, mat_index, 0, true)) return false;
            }
            for (int side = 0; side < 2; ++side) {
                int32_t chunk = -1; int16_t image_id = -1;
                if (!native_history_copy(coin + 0x14 + side * 8, chunk) ||
                    !native_history_copy(coin + 0x18 + side * 8, image_id) ||
                    !native_history_item_extra_image(chunk, image_id, image) ||
                    !capture_native_history_item_art_image(image, data, key + (side ? ".back" : ".front"))) return false;
            }
        }
    }
    data.texts[prefix + ".dye"] = "";
    if (type == 70) {
        int32_t material_type = -1, material_index = -1;
        uintptr_t material = 0; int16_t color = -1;
        if (!native_history_item_scalar(item, 0x38, material_type, 2) ||
            !native_history_item_scalar(item, 0x40, material_index)) return false;
        if (material_type == 0 || (material_type >= 19 && material_type <= 618)) {
            if (!native_history_material_object(base, static_cast<int16_t>(material_type), material_index, material) ||
                (material && !native_history_copy(material + 0x4e0, color))) return false;
        }
        if (color >= 0) {
            NativeBorrowedVector<uintptr_t> colors;
            if (!native_history_read_vector(native_history_global(0x24f70b8), colors)) return false;
            const uintptr_t value = native_history_vector_at(colors, color);
            if (!value || !native_history_copy_string(value + 0x50, data.texts[prefix + ".dye"])) return false;
        }
    }
    data.fields[prefix + ".contaminants"] = {};
    int32_t contaminable = 0;
    if (!native_history_item_scalar(item, 0x448, contaminable, 1)) return false;
    if (contaminable && type != 75 && type != 73) {
        uintptr_t vector = 0;
        if (!native_history_copy(native_history_object_field(item, "", 0x98), vector)) return false;
        if (vector) {
            NativeBorrowedVector<uintptr_t> coatings;
            if (!native_history_read_vector(vector, coatings)) return false;
            for (size_t i = 0; i < coatings.size(); ++i) {
                const uintptr_t coating = native_history_vector_at(coatings, i);
                int16_t material = -1, state = -1; int32_t index = -1, amount = 0;
                if (!coating || !native_history_copy(coating, material) || !native_history_copy(coating + 4, index) ||
                    !native_history_copy(coating + 8, state) || !native_history_copy(coating + 0x10, amount)) return false;
                const std::string key = prefix + ".contaminant." + std::to_string(i);
                data.fields[key + ".amount"] = {amount};
                if (!capture_native_history_improvement_material(data, key, material, index, state, false)) return false;
                data.fields[prefix + ".contaminants"].push_back(int32_t(i));
            }
        }
    }
    data.fields[prefix + ".effects"] = {};
    uintptr_t effects_pointer = 0;
    if (!native_history_copy(native_history_object_field(item, "", 0x90), effects_pointer)) return false;
    if (effects_pointer) {
        NativeBorrowedVector<uintptr_t> effects, interactions;
        if (!native_history_read_vector(effects_pointer, effects) ||
            !native_history_read_vector(native_history_global(0x24f74c8), interactions)) return false;
        for (size_t i = 0; i < effects.size(); ++i) {
            const uintptr_t effect = native_history_vector_at(effects, i);
            int32_t interaction_id = -1, source_id = -1, source_kind = -1;
            if (!effect || !native_history_copy(effect, interaction_id) || !native_history_copy(effect + 4, source_id)) return false;
            if (interaction_id < 0 || size_t(interaction_id) >= interactions.size()) continue;
            const uintptr_t interaction = native_history_vector_at(interactions, interaction_id);
            NativeBorrowedVector<uintptr_t> sources;
            if (!interaction || !native_history_read_vector(interaction + 0x50, sources)) return false;
            const uintptr_t source = source_id >= 0 ? native_history_vector_at(sources, source_id) : 0;
            if (!source || !native_history_typed_getter(source, 0, source_kind)) return false;
            if (source_kind != 10) continue; // Other source kinds append no item text.
            const std::string key = prefix + ".effect." + std::to_string(i);
            if (!native_history_copy_string(native_history_object_field(source, "", 0x408), data.texts[key])) return false;
            data.fields[prefix + ".effects"].push_back(int32_t(i));
        }
    }
    data.texts[prefix + ".special"] = "";
    data.fields[prefix + ".special_type"] = {type};
    if (type == 86 || type == 13) {
        uintptr_t definition = 0;
        if (!native_history_copy(native_history_object_field(item, "", 0xe8), definition) || !definition ||
            !native_history_copy_string(native_history_object_field(definition, type == 86 ? "itemdef_toolst" : "itemdef_instrumentst",
                type == 86 ? 0x188 : 0x278),
                data.texts[prefix + ".special"])) return false;
    }
    return true;
}
