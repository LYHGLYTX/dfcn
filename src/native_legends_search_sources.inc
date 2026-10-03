// One complete-row source producer for every supported native image.
// Frame locations and resource/function addresses are declarative ABI data;
// row composition, ownership and failure handling never branch on the host.
static uintptr_t native_legends_search_frame_field(uintptr_t frame, ptrdiff_t offset) {
    if (offset < 0) {
        const auto distance = static_cast<uintptr_t>(-(offset + 1)) + 1;
        return distance <= frame ? frame - distance : 0;
    }
    return static_cast<uintptr_t>(offset) <= UINTPTR_MAX - frame ? frame + offset : 0;
}

template<typename Producer>
static bool native_legends_search_caption(Producer &&produce,
        std::string &result) {
    NativeSearchString caption(g_native_legends_search_sources.destroy);
    NativeString &value = caption.value;
    produce(&value);
    std::string_view text;
    if (!native_string_view(&value, &text, 65536) ||
        text.find('\0') != std::string_view::npos) return false;
    result.assign(text);
    return true;
}

static bool native_legends_search_id(uintptr_t screen, uintptr_t frame,
        size_t vector_offset, int32_t &id) {
    int32_t ordinal = -1;
    NativeBorrowedVector<int32_t> ids;
    // Every native branch publishes its current unfiltered ordinal here,
    // including rows that will later be excluded from the result vector.
    const uintptr_t ordinal_field = native_legends_search_frame_field(
        frame, g_native_legends_search_sources.ordinal);
    const uintptr_t vector_field = native_history_object_field(
        screen, "viewscreen_legendsst", vector_offset, sizeof(ids));
    if (!native_history_copy(ordinal_field, ordinal) || ordinal < 0 ||
        !native_history_copy(vector_field, ids) ||
        !ids.valid(1u << 24) || static_cast<size_t>(ordinal) >= ids.size()) return false;
    return native_history_copy(reinterpret_cast<uintptr_t>(ids.begin) +
        static_cast<size_t>(ordinal) * sizeof(int32_t), id) && id >= 0;
}

static bool native_legends_search_source(LegendsSearchKind kind, const void *frame, const void *screen,
        std::string &source, std::string &description) {
    source.clear();
    description.clear();
    if (!frame || !screen) return false;
    const auto address = reinterpret_cast<uintptr_t>(frame);
    const auto screen_address = reinterpret_cast<uintptr_t>(screen);
    const auto base = native_history_profile_base();
    const size_t index = static_cast<size_t>(kind);
    const auto &layout = g_native_legends_search_sources;
    if (!base || index >= layout.names.size()) return false;
    std::string_view name, gloss;
    if (!native_search_display_term(reinterpret_cast<const NativeString *>(
            native_legends_search_frame_field(address, layout.names[index])), &name, 16384) ||
        !native_search_display_term(reinterpret_cast<const NativeString *>(
            native_legends_search_frame_field(address, layout.glosses[index])), &gloss, 16384))
        return false;
    // Artifact lists leave the gloss scratch untouched on their Untitled
    // branch. The displayed row also suppresses that gloss; never retain a
    // previous artifact's identity or invent one for an unnamed item.
    const bool untitled = (kind == LegendsSearchKind::Artifact ||
        kind == LegendsSearchKind::WrittenContent) && name == "Untitled";
    if (!name.empty()) {
        source.assign(name);
        if (!gloss.empty() && !untitled &&
            ((kind != LegendsSearchKind::Artifact &&
              kind != LegendsSearchKind::WrittenContent) || gloss != name))
            source.append(", \"").append(gloss).append("\"");
    } else if (kind == LegendsSearchKind::Site) {
        source = "Unnamed"; // d4172f: the native site's nameless row label.
    }
    if (kind == LegendsSearchKind::Figure) {
        std::string_view species;
        if (!native_string_view(reinterpret_cast<const NativeString *>(
                native_legends_search_frame_field(address, layout.species)),
                &species, 16384)) return false;
        description.assign(species);
        // The native list labels a nameless figure with Unnamed before its
        // sex/species. Preserve that identity in translated search as well.
        // Descriptor-only searches also have an empty source, so establish
        // this fallback here, where the actual native name is known empty.
        if (source.empty() && !description.empty()) source = "Unnamed";
    }
    int32_t id = -1;
    switch (kind) {
    case LegendsSearchKind::Site: {
        if (!native_legends_search_id(screen_address, address, 0x1c8, id)) return !source.empty();
        const auto site = native_history_find_subject(base, NativeHistoryObjectKind::Site, id);
        if (!site) return !source.empty();
        int16_t type = -1;
        if (!native_history_copy(native_history_object_field(site, "world_site",
                0x80, sizeof(type)), type)) return !source.empty();
        // d4181d / d418a8: the two original type-column producers, before
        // its 19-byte clipping. Capitalization is the renderer's own helper.
        if (!native_legends_search_caption([&](NativeString *out) {
                layout.site_type(reinterpret_cast<const void *>(site), out);
                layout.capitalize(out);
            }, description)) return !source.empty();
        if (type == 1) description.insert(0, "Dark ");
        break;
    }
    case LegendsSearchKind::Artifact:
    case LegendsSearchKind::WrittenContent: {
        const size_t vector = kind == LegendsSearchKind::Artifact ? 0x1e0 : 0x1f8;
        if (!native_legends_search_id(screen_address, address, vector, id)) return !source.empty();
        const auto artifact = native_history_find_subject(base, NativeHistoryObjectKind::Artifact, id);
        uintptr_t item = 0;
        if (!artifact || !native_history_copy(native_history_object_field(artifact,
                "artifact_record", 0x90, sizeof(item)), item) || !item) return !source.empty();
        // Both lists use the same full material/item description producer.
        if (!native_legends_search_caption([&](NativeString *out) {
                reinterpret_cast<void (*)(const void *, NativeString *, bool, int32_t)>(
                    native_history_page_address(NativeHistoryPageSymbol::ArtifactItem))(
                        reinterpret_cast<const void *>(item), out, true, -1);
                layout.capitalize(out);
            }, description)) return !source.empty();
        break;
    }
    case LegendsSearchKind::Building: {
        int32_t building_id = -1;
        if (!native_legends_search_id(screen_address, address, 0x258, id) ||
            !native_legends_search_id(screen_address, address, 0x270, building_id)) return !source.empty();
        const auto site = native_history_find_subject(base, NativeHistoryObjectKind::Site, id);
        if (!site) return !source.empty();
        uintptr_t building = 0;
        if (!native_history_find_structure_id(native_history_object_field(
                site, "world_site", 0x2b0, sizeof(NativeBorrowedVector<uintptr_t>)),
                8, building_id, building)) return !source.empty();
        uintptr_t vtable = 0, type_function = 0;
        const size_t type_slot = native_history_virtual_slot(building, 0);
        if (!building || type_slot == SIZE_MAX ||
            !native_history_copy(building, vtable) || !vtable ||
            type_slot > UINTPTR_MAX - vtable ||
            !native_history_copy(vtable + type_slot, type_function) || !type_function)
            return !source.empty();
        const int16_t type = reinterpret_cast<int16_t (*)(const void *)>(type_function)(
            reinterpret_cast<const void *>(building));
        // d42bdb / d4379c: the renderer's structure-kind switch. These are
        // native English resources; translation remains in the shared policy.
        const auto &labels = layout.structure_labels;
        uintptr_t label = type >= 0 && static_cast<size_t>(type) < std::size(labels)
            ? labels[type] : 0;
        if (type == 6) {
            int16_t subtype = -1;
            if (!native_history_copy(native_history_object_field(building, {},
                    0x130, sizeof(subtype)), subtype)) return !source.empty();
            const auto &sublabels = layout.dungeon_labels;
            if (subtype >= 0 && static_cast<size_t>(subtype) < std::size(sublabels))
                label = sublabels[subtype];
        }
        if (label && !native_legends_search_caption([&](NativeString *out) {
                reinterpret_cast<void (*)(NativeString *, const char *)>(
                    native_history_page_address(NativeHistoryPageSymbol::AssignLiteral))(
                        out, reinterpret_cast<const char *>(base + label));
                layout.capitalize(out);
            }, description)) return !source.empty();
        break;
    }
    case LegendsSearchKind::Underground:
        if (source.empty()) {
            if (!native_legends_search_id(screen_address, address, 0x228, id)) return false;
            const auto region = native_history_find_subject(base, NativeHistoryObjectKind::Underground, id);
            int16_t type = -1;
            if (!region || !native_history_copy(region, type)) return false;
            // d430cd selects these exact native nameless-area captions.
            const uintptr_t label = type >= 0 && static_cast<size_t>(type) < layout.underground_labels.size()
                ? layout.underground_labels[type] : 0;
            if (label) source.assign(reinterpret_cast<const char *>(base + label));
        }
        break;
    case LegendsSearchKind::Population:
        if (!native_legends_search_id(screen_address, address, 0x288, id)) return false;
        // d43249: this row has a single native formatter, including the
        // nameless population's species and parent-region description.
        if (!native_legends_search_caption([&](NativeString *out) {
                layout.population(nullptr, out, id, 0);
            }, source)) return false;
        break;
    default: break;
    }
    return !source.empty() || !description.empty();
}

static bool native_legends_search_descriptors(const void *descriptor,
                                               std::vector<std::string_view> &texts) {
    if (!descriptor) return false;
    const auto address = reinterpret_cast<uintptr_t>(descriptor);
    const auto append = [&](size_t offset) {
        std::string_view text;
        if (!native_string_view(reinterpret_cast<const NativeString *>(address + offset),
                                &text, 16384)) return false;
        if (!text.empty()) texts.push_back(text);
        return true;
    };
    // The native filter searches both stored curse captions. The renderer
    // additionally substitutes the animation's name for the ordinary species
    // (or for an unnamed figure's identity) when animation type != -1.
    // Borrow these strings only for the current comparison; never retain the
    // descriptor address, or translate/edit fields belonging to the game.
    int32_t animation_type = -1;
    if (!native_history_copy(address + 0x144, animation_type) ||
        !append(0x90) || !append(0xd0)) return false;
    return animation_type == -1 || append(0x150);
}
