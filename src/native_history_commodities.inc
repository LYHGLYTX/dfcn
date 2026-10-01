// Production-zone commodities, as selected by b85510's 44-entry allotment
// table. Only typed material/plant fields are copied; no event prose is read.
static bool capture_native_history_commodity(NativeHistoryEventData &event,
        decltype(NativeHistoryEventData::fields) &fields, int32_t zone_id,
        int32_t allotment, int32_t index, const std::string &prefix) {
    const uintptr_t base = native_history_profile_base();
    if (!base) return false;
    uintptr_t world = 0, zone = 0;
    if (!native_history_copy(native_history_global(0x24ebb58), world)) return false;
    if (world && !native_history_find_structure_id(native_history_object_field(world, "world_data", 0x1a8), 0, zone_id, zone))
        return false;
    fields[prefix + "present"] = {zone ? 1 : 0};
    if (!zone) return true; // The native formatter emits "goods" here.
    if (allotment < 0 || allotment >= 44 || index < 0) return false;

    NativeBorrowedVector<uintptr_t> entries;
    if (!native_history_read_vector(zone + 8 + static_cast<size_t>(allotment) * 24, entries) ||
            static_cast<size_t>(index) >= entries.size()) return false;
    const uintptr_t entry = native_history_vector_at(entries, static_cast<size_t>(index));
    if (!entry) return false;
    fields[prefix + "allotment"] = {allotment};
    fields[prefix + "owner"] = {0};
    event.texts[prefix + "prefix"] = "";
    event.texts[prefix + "state"] = "";
    if (allotment == 0) {
        // The plant allotment stores an index, and uses plant.name_plural.
        int32_t plant_index = -1;
        if (!native_history_copy(entry + 0x18, plant_index)) return false;
        fields[prefix + "plant"] = {plant_index};
        NativeBorrowedVector<uintptr_t> plants;
        if (!native_history_read_vector(native_history_global(0x24ec8f8), plants)) return false;
        if (plant_index >= 0 && static_cast<size_t>(plant_index) < plants.size()) {
            const uintptr_t plant = native_history_vector_at(plants, static_cast<size_t>(plant_index));
            if (!plant || !native_history_copy_string(plant + 0x70,
                    event.texts[prefix + "state"])) return false;
        }
        return true;
    }

    int16_t material_type = -1;
    int32_t material_index = -1;
    if (!native_history_copy(entry + 0x18, material_type) ||
            !native_history_copy(entry + 0x1c, material_index)) return false;
    // 39 chooses liquid (+d8); 42 chooses powder (+118). Every other
    // material allotment chooses solid (+b8). Allotment 1 first prefers
    // the material's independent generic-name RAW field (+60).
    const int32_t state = allotment == 39 ? 1 : allotment == 42 ? 3 : 0;
    fields[prefix + "material"] = {material_type, material_index, state};
    NativeHistoryName owner;
    bool possessive = false;
    if (!capture_native_history_material_parts(base, material_type, material_index,
            state, allotment == 1, event.texts[prefix + "prefix"],
            event.texts[prefix + "state"], owner, possessive)) return false;
    if (possessive) {
        NativeHistorySubject copy;
        copy.kind = NativeHistoryObjectKind::MaterialOwner;
        copy.id = zone_id;
        copy.subid = index;
        copy.name = std::move(owner);
        fields[prefix + "owner"] = {1};
        fields[prefix + "owner_id"] = {zone_id};
        fields[prefix + "owner_subid"] = {index};
        fields[prefix + "owner_has_name"] = {copy.name.has_name ? 1 : 0};
        event.subjects.push_back(std::move(copy));
    }
    return true;
}
