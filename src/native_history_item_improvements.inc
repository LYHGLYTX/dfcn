// 53.16 c75000 improvement and textile branches. Values are copied from
// typed native records; the English paragraph is never an input.
static bool capture_native_history_item_art_image(uintptr_t image,
    NativeHistoryEventData &data, const std::string &prefix);
static bool capture_native_history_improvement_material(NativeHistoryEventData &data,
        const std::string &key, int16_t type, int32_t index, int16_t state = 0,
        bool adjective = false) {
    NativeHistoryName owner;
    bool possessive = false;
    data.fields[key + ".material"] = {type, index, state};
    data.fields[key + ".components"] = {1};
    if (!capture_native_history_material_parts(native_history_profile_base(), type,
            index, state, false, data.texts[key + ".material_prefix"],
            data.texts[key + ".material_state"], owner, possessive, adjective)) return false;
    data.fields[key + ".owner"] = {possessive ? 1 : 0};
    data.fields[key + ".owner_id"] = {index};
    data.fields[key + ".owner_subid"] = {type};
    if (possessive) {
        const auto found = std::find_if(data.subjects.begin(), data.subjects.end(),
            [&](const auto &s) { return s.kind == NativeHistoryObjectKind::MaterialOwner &&
                s.id == index && s.subid == type; });
        if (found == data.subjects.end()) {
            NativeHistorySubject subject;
            subject.kind = NativeHistoryObjectKind::MaterialOwner;
            subject.id = index;
            subject.subid = type;
            subject.name = std::move(owner);
            data.subjects.push_back(std::move(subject));
        }
    }
    return true;
}

static bool capture_native_history_improvement_maker(NativeHistoryEventData &data,
        const std::string &key, int32_t id) {
    uintptr_t figure = 0;
    if (!native_history_material_find_id(native_history_global(0x24f9d18),
            0xe0, id, figure)) return false;
    data.fields[key] = {figure ? id : -1};
    if (figure) data.references.emplace_back(NativeHistoryObjectKind::Figure, id);
    return true;
}

static bool native_history_improvement_image_pointer(uintptr_t improvement,
        uintptr_t &image) {
    image = 0;
    int32_t chunk_id = -1;
    int16_t image_id = -1;
    if (!native_history_copy(native_history_object_field(improvement, "", 0x28), chunk_id) ||
        !native_history_copy(native_history_object_field(improvement, "", 0x2c), image_id)) return false;
    // cabd70 lazily generates this reference. Capture runs after the native
    // producer; a still absent reference takes its original null-image path.
    if (chunk_id == -1) return true;
    if (image_id < 0 || image_id >= 500) return true;
    NativeBorrowedVector<uintptr_t> chunks;
    if (!native_history_read_vector(native_history_global(0x23e5160), chunks))
        return false;
    for (size_t i = 0; i < chunks.size(); ++i) {
        const uintptr_t chunk = native_history_vector_at(chunks, i);
        int32_t id = -1;
        if (!chunk || !native_history_copy(chunk, id)) return false;
        if (id == chunk_id)
            return native_history_copy(chunk + 8 + size_t(image_id) * 8, image);
    }
    return false;
}

static bool capture_native_history_improvement_shape(NativeHistoryEventData &data,
        const std::string &key, int32_t shape_id, int16_t type, int32_t index) {
    data.fields[key + ".shape"] = {shape_id};
    if (shape_id < 0) return true;
    NativeBorrowedVector<uintptr_t> shapes;
    const uintptr_t base = native_history_profile_base();
    if (!native_history_read_vector(native_history_global(0x24f70d0), shapes) ||
        size_t(shape_id) >= shapes.size()) return false;
    const uintptr_t shape = native_history_vector_at(shapes, size_t(shape_id));
    int32_t flags = 0;
    if (!shape || !native_history_copy(shape + 0xa8, flags) ||
        !native_history_copy_string(shape + 0x70, data.texts[key + ".shape_plural"]))
        return false;
    data.fields[key + ".shape_flags"] = {flags};
    data.texts[key + ".shape_adjective"] = "";
    if (flags & (2 | 4)) {
        NativeBorrowedVector<uintptr_t> adjectives;
        if (!native_history_read_vector(shape + 0x90, adjectives)) return false;
        if (adjectives.size() && !native_history_copy_string(
                native_history_vector_at(adjectives, 0),
                data.texts[key + ".shape_adjective"])) return false;
    }
    // 14e1ec0 prefers the raw gem noun for cut gems. Glass has explicit
    // native enum nouns, while other material qualifiers retain RAW state.
    std::string gem;
    uintptr_t material = 0;
    if (!native_history_material_object(base, type, index, material)) return false;
    // The Chinese material name has no plural inflection; always retain the
    // independent singular gem noun rather than RAW plural codes NP/STP.
    if (material && !native_history_copy_string(material + 0x20, gem))
        return false;
    if (type >= 3 && type <= 5) gem = type == 3 ? "green glass" :
        type == 4 ? "clear glass" : "crystal glass";
    data.texts[key + ".gem"] = std::move(gem);
    data.fields[key + ".gem_suffix"] = {(!(flags & 7) ||
        ((flags & 2) && type >= 3 && type <= 5)) ? 1 : 0};
    return true;
}

static bool native_history_improvement_base_pattern(uintptr_t item, int32_t &pattern) {
    pattern = -1;
    int32_t type = -1, index = -1, descriptor = -1;
    uintptr_t material = 0;
    const uintptr_t base = native_history_profile_base();
    if (!native_history_item_scalar(item, 0x10, type, 2) ||
        !native_history_item_scalar(item, 0x18, index) ||
        !native_history_material_object(base, int16_t(type), index, material)) return false;
    if (!material) return true;
    if (!native_history_copy(material + 0x9c, descriptor)) return false;
    if (descriptor < 0) return true;
    NativeBorrowedVector<uintptr_t> descriptors;
    if (!native_history_read_vector(native_history_global(0x24f70e8), descriptors)) return false;
    if (size_t(descriptor) >= descriptors.size()) return true;
    const uintptr_t object = native_history_vector_at(descriptors, size_t(descriptor));
    NativeBorrowedVector<int16_t> colors;
    if (!object || !native_history_copy(object + 0x20, colors) || !colors.valid()) return false;
    int16_t first = -1;
    if (colors.size() && !native_history_copy(reinterpret_cast<uintptr_t>(colors.begin), first))
        return false;
    pattern = first;
    return true;
}

static bool capture_native_history_item_plain_color(int32_t pattern,
        NativeHistoryEventData &data, const std::string &key) {
    data.fields[key + ".present"] = {0};
    if (pattern < 0) return true;
    NativeBorrowedVector<uintptr_t> patterns;
    if (!native_history_read_vector(native_history_global(0x24f70b8), patterns))
        return false;
    if (size_t(pattern) >= patterns.size()) return true;
    const uintptr_t object = native_history_vector_at(patterns, size_t(pattern));
    if (!object || !native_history_copy_string(object + 0x50, data.texts[key + ".pattern_name"]))
        return false;
    data.fields[key + ".present"] = {1};
    // c782d0 (undyed THREAD 57), c787bc (undyed SKIN_TANNED 55),
    // and c77ffa (CLOTH 58 fallback) all say "The material is".
    // Only an active thread dye descriptor changes that subject to thread.
    data.fields[key + ".subject"] = {1};
    data.fields[key + ".pattern"] = {pattern};
    data.fields[key + ".quality"] = {0};
    data.fields[key + ".maker"] = {-1};
    data.fields[key + ".dyes"] = {};
    return true;
}

static bool capture_native_history_item_coloration(uintptr_t descriptor,
        int16_t material_type, int32_t material_index, int32_t maker, int16_t quality,
        NativeHistoryEventData &data, const std::string &key, int32_t subject_kind,
        int32_t undyed_pattern = -1, int32_t direct_dye_state = 0) {
    int32_t pattern = -1;
    NativeBorrowedVector<int32_t> types, indexes;
    if (!native_history_copy(descriptor, pattern) ||
        !native_history_copy(descriptor + 8, types) || !types.valid(65536) ||
        !native_history_copy(descriptor + 0x20, indexes) || !indexes.valid(65536) ||
        types.size() != indexes.size()) return false;
    const bool active = material_type != -1 || pattern != -1;
    data.fields[key + ".present"] = {active || undyed_pattern >= 0 ? 1 : 0};
    data.fields[key + ".subject"] = {subject_kind}; // 0 thread, 1 material, 2 object
    data.fields[key + ".quality"] = {active ? quality : 0};
    data.fields[key + ".dyes"] = {};
    if (!active && undyed_pattern < 0) return true;
    if (!active) pattern = undyed_pattern;
    if (pattern == -1 && material_type != -1) {
        uintptr_t material = 0;
        int16_t dye_pattern = -1;
        if (!native_history_material_object(native_history_profile_base(), material_type,
                material_index, material) || (material &&
                !native_history_copy(material + 0x4e0, dye_pattern))) return false;
        pattern = dye_pattern;
    }
    data.fields[key + ".pattern"] = {pattern};
    data.texts[key + ".pattern_name"] = "gray";
    if (pattern != -1) {
        NativeBorrowedVector<uintptr_t> patterns;
        if (!native_history_read_vector(native_history_global(0x24f70b8), patterns) ||
            pattern < 0 || size_t(pattern) >= patterns.size() ||
            !native_history_copy_string(native_history_vector_at(patterns, size_t(pattern)) +
                0x50, data.texts[key + ".pattern_name"])) return false;
    }
    if (!capture_native_history_improvement_maker(data, key + ".maker", maker)) return false;
    std::vector<std::pair<int32_t, int32_t>> unique;
    for (size_t i = 0; i < types.size(); ++i) {
        int32_t type = -1, index = -1;
        if (!native_history_copy(reinterpret_cast<uintptr_t>(types.begin) + i * 4, type) ||
            !native_history_copy(reinterpret_cast<uintptr_t>(indexes.begin) + i * 4, index))
            return false;
        const auto pair = std::make_pair(type, index);
        if (std::find(unique.begin(), unique.end(), pair) == unique.end()) unique.push_back(pair);
    }
    if (unique.empty() && active && material_type != -1)
        unique.emplace_back(material_type, material_index);
    for (size_t i = 0; i < unique.size(); ++i) {
        data.fields[key + ".dyes"].push_back(int32_t(i));
        // Mixed descriptor constituents use POWDER. The improvement helper's
        // direct dye branch uses SOLID (cadaba), while c78605/c78b23 pass
        // POWDER=3 for direct THREAD/SKIN_TANNED base dye as well.
        if (!capture_native_history_improvement_material(data, key + ".dye." +
                std::to_string(i), int16_t(unique[i].first), unique[i].second,
                types.size() ? 3 : direct_dye_state, false)) return false;
    }
    return true;
}

static bool capture_native_history_item_improvements(uintptr_t item,
        NativeHistoryEventData &data, const std::string &prefix) {
    const uintptr_t base = native_history_profile_base();
    int32_t item_type = -1, constructed = 0;
    uint32_t flags = 0;
    if (!base || !native_history_item_scalar(item, 0, item_type, 2) ||
        !native_history_item_scalar(item, 0x5a8, constructed, 1) ||
        !native_history_copy(native_history_object_field(item, "", 0x10), flags)) return false;
    data.fields[prefix + ".artifact"] = {flags & 0x08000000 ? 1 : 0};
    data.fields[prefix + ".entries"] = {};
    data.fields[prefix + ".color.present"] = {0};
    // c7827b selects THREAD (57), c78767 selects SKIN_TANNED (55).
    // CLOTH (58) gets coloration from its improvements and the fallback below.
    if (item_type == 57 || item_type == 55) {
        const size_t dye_offset = item_type == 57 ? 0xc0 : 0xc4;
        int16_t type = -1, quality = 0;
        int32_t index = -1, maker = -1, pattern = -1, raw_pattern = -1;
        if (!native_history_copy(native_history_object_field(item, {}, dye_offset), type) ||
            !native_history_copy(native_history_object_field(item, {}, dye_offset) + 4, index) ||
            !native_history_copy(native_history_object_field(item, {}, dye_offset) + 8, maker) ||
            !native_history_copy(native_history_object_field(item, {}, dye_offset) + 12, quality) ||
            !native_history_copy(native_history_object_field(item, "", 0xd8), raw_pattern)) return false;
        if (type == -1 && raw_pattern == -1) {
            if (!native_history_improvement_base_pattern(item, pattern) ||
                !capture_native_history_item_plain_color(pattern, data, prefix + ".color"))
                return false;
        } else
        if (!capture_native_history_item_coloration(native_history_object_field(item, "", 0xd8), type, index, maker,
                quality, data, prefix + ".color", item_type == 57 ? 0 : 1, pattern, 3)) return false;
    }
    if (!constructed) return true;
    NativeBorrowedVector<uintptr_t> entries;
    if (!native_history_read_vector(native_history_object_field(item, "", 0xd0), entries) || entries.size() > 65536) return false;
    for (size_t i = 0; i < entries.size(); ++i) {
        const uintptr_t improvement = native_history_vector_at(entries, i);
        const std::string key = prefix + "." + std::to_string(i);
        int32_t type = -1, index = -1, maker = -1;
        int16_t material_type = -1, quality = 0;
        if (!improvement || !native_history_item_scalar(improvement, 0x28, type) ||
            type < 0 || type > 14) return false;
        data.fields[prefix + ".entries"].push_back(int32_t(i));
        data.fields[key + ".type"] = {type};
        // These records' separate writers own all fields they consume.
        if (type == 9 || type == 10 || type == 12 || type == 13) continue;
        if (!native_history_copy(native_history_object_field(improvement, "", 8), material_type) ||
            !native_history_copy(native_history_object_field(improvement, "", 0xc), index) ||
            !native_history_copy(native_history_object_field(improvement, "", 0x10), maker) ||
            !native_history_copy(native_history_object_field(improvement, "", 0x18), quality)) return false;
        data.fields[key + ".quality"] = {quality};
        if (!capture_native_history_improvement_maker(data, key + ".maker", maker) ||
            !capture_native_history_improvement_material(data, key, material_type, index,
                0, false)) return false;
        int32_t shape = -1;
        if (type == 1 || type == 3) {
            if (!native_history_copy(native_history_object_field(improvement, {}, type == 1 ? 0x2c : 0x28), shape) ||
                !capture_native_history_improvement_shape(data, key, shape, material_type, index))
                return false;
        }
        if (type == 1) {
            uint8_t covered_flags = 0;
            uintptr_t material = 0;
            bool metal = false, wood = false, leather = false;
            if (!native_history_copy(native_history_object_field(improvement, "", 0x28), covered_flags) ||
                !native_history_material_object(base, material_type, index, material) ||
                !native_history_page_flag(material, 0x290, 0x298, 47, metal) ||
                !native_history_page_flag(material, 0x290, 0x298, 30, wood) ||
                !native_history_page_flag(material, 0x290, 0x298, 62, leather)) return false;
            data.fields[key + ".group"] = {(covered_flags & 1) ? 3 :
                material_type != 0 || wood || leather ? 2 : metal ? 1 : 0};
        } else if (type == 5) {
            int32_t component = -1;
            if (!native_history_copy(native_history_object_field(improvement, "", 0x28), component)) return false;
            data.fields[key + ".component"] = {component};
        } else if (type == 11) {
            std::string id;
            uintptr_t raw = 0;
            data.fields[key + ".component_present"] = {0};
            if (!native_history_copy_string(native_history_object_field(improvement, "", 0x28), id)) return false;
            data.texts[key + ".component_id"] = id;
            if (item_type == 13) {
                NativeBorrowedVector<uintptr_t> components;
                if (!native_history_copy(native_history_object_field(item, "", 0xe8), raw) || !raw ||
                    !native_history_read_vector(native_history_object_field(raw, "itemdef_instrumentst", 0xc8), components)) return false;
                for (size_t c = 0; c < components.size(); ++c) {
                    const uintptr_t component = native_history_vector_at(components, c);
                    std::string candidate;
                    uint8_t component_flags = 0;
                    if (!component || !native_history_copy_string(component, candidate)) return false;
                    if (candidate != id) continue;
                    if (!native_history_copy_string(component + 0x48,
                            data.texts[key + ".component_name"]) ||
                        !native_history_copy(component + 0x88, component_flags)) return false;
                    data.fields[key + ".component_present"] = {1};
                    data.fields[key + ".component_plural"] = {(component_flags & 2) ? 1 : 0};
                    break;
                }
            }
        }
        if (type == 6 || type == 14 || type == 8) {
            const size_t offset = type == 8 ? 0x40 : 0x28;
            int16_t dye_type = -1;
            int8_t dye_quality = 0;
            int32_t dye_index = -1, dyer = -1;
            if (!native_history_copy(native_history_object_field(improvement, {}, offset), dye_type) ||
                !native_history_copy(native_history_object_field(improvement, {}, offset + 4), dye_index) ||
                !native_history_copy(native_history_object_field(improvement, {}, offset + 8), dyer) ||
                !native_history_copy(native_history_object_field(improvement, {}, offset + 12), dye_quality) ||
                !capture_native_history_item_coloration(native_history_object_field(improvement, {}, offset + 0x18),
                    dye_type, dye_index, dyer, dye_quality, data, key + ".color",
                    type == 14 ? 2 : 0)) return false;
            if (type == 8 && dye_type == -1) data.fields[key + ".color.present"] = {0};
        }
        if (type == 0 || type == 8) {
            uintptr_t image = 0;
            if (!native_history_improvement_image_pointer(improvement, image)) return false;
            data.fields[key + ".image_present"] = {image ? 1 : 0};
            if (image && !capture_native_history_item_art_image(image, data, key + ".image"))
                return false;
            int32_t image_type = -1;
            if (image && !native_history_copy(native_history_object_field(image, "art_image", 0xb0), image_type)) return false;
            data.fields[key + ".image_type"] = {image_type};
            if (type == 8) {
                uintptr_t material = 0;
                bool silk = false, plant = false, yarn = false;
                int32_t weaver = -1;
                int8_t weave_quality = 0;
                if (!native_history_material_object(base, material_type, index, material) ||
                    !native_history_page_flag(material, 0x290, 0x298, 24, silk) ||
                    !native_history_page_flag(material, 0x290, 0x298, 30, plant) ||
                    !native_history_page_flag(material, 0x290, 0x298, 62, yarn) ||
                    !native_history_copy(native_history_object_field(improvement, "", 0x38), weaver) ||
                    !native_history_copy(native_history_object_field(improvement, "", 0x3c), weave_quality) ||
                    !capture_native_history_improvement_maker(data, key + ".weaver", weaver))
                    return false;
                data.fields[key + ".woven"] = {silk || plant || yarn ? 1 : 0};
                data.fields[key + ".weave_quality"] = {weave_quality};
                if (silk || plant || yarn) {
                    if (!capture_native_history_improvement_material(data, key + ".fabric",
                            material_type, index, 0, false)) return false;
                    data.fields[key + ".fabric.quality"] = {weave_quality};
                    data.fields[key + ".fabric.maker"] = data.fields[key + ".weaver"];
                }
            }
        }
        // Pages, writing, illustrations and image sets are also recorded in
        // the common list; their content/image renderers own those branches.
    }
    if (item_type == 58) {
        bool colored = false;
        for (int32_t id : data.fields[prefix + ".entries"]) {
            const std::string key = prefix + "." + std::to_string(id);
            const int32_t type = data.fields[key + ".type"].front();
            if ((type == 6 || type == 14) && data.fields[key + ".color.present"].front())
                colored = true;
        }
        // CLOTH: c77fc4 suppresses the fallback if thread/object coloration has
        // already emitted a paragraph. Otherwise getColor uses the first
        // pattern of the material's COLOR_DESCRIPTOR RAW object.
        int32_t pattern = -1;
        if (!colored && (!native_history_improvement_base_pattern(item, pattern) ||
                !capture_native_history_item_plain_color(pattern, data, prefix + ".color")))
            return false;
    }
    return true;
}
