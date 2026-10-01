// Native site-property formatter b93cf0: property type/data select either
// an abstract building or one of the fixed site-property labels.
static bool native_history_property_reference(NativeHistoryEventData &result,
        int32_t site_id, int32_t property_id, const std::string &key,
        int32_t &resolved_building_id) {
    resolved_building_id = -1;
    const uintptr_t base = native_history_profile_base();
    if (!base) return false;
    std::string label = "an unknown building";
    uintptr_t world_data = 0, site = 0, property = 0;
    if (site_id != -1 && property_id != -1) {
        if (!native_history_copy(native_history_global(0x24ebb58), world_data)) return false;
        if (world_data && (!native_history_find_structure_id(native_history_object_field(world_data, "world_data", 0x178),
                0x88, site_id, site) || (site && !native_history_find_structure_id(
                    site + 0x2d0, 0, property_id, property)))) return false;
    }
    if (property) {
        int32_t type = -1, data = -1;
        if (property > UINTPTR_MAX - 12 || !native_history_copy(property + 4, type) ||
            !native_history_copy(property + 8, data)) return false;
        if (type == 0) {
            if (!native_history_structure_reference(result, site_id, data)) return false;
            resolved_building_id = data;
            label.clear();
        } else if (type == 1) {
            // Jump table b94004, including native unknown slots 15 and 30.
            static constexpr const char *labels[] = {
                "a cottage plot", "a castle wall", "a castle tower", "a castle courtyard",
                "a house", "a temple", "a tomb", "a shop", "a warehouse", "a market square",
                "a pasture", "a waste", "a yard", "a well", "a vault", "an unknown building",
                "a trenches", "a tree", "a hillock", "a mead hall", "a fortress entrance",
                "a library", "a tavern", "a counting house", "a guildhall", "a tower",
                "a shrine", "a meadow", "a dormitory", "a dining hall", "an unknown building",
                "a barrow", "a mythical palace", "a mythical dungeon", "a mythical lair",
            };
            if (data >= 0 && data < 35) label = labels[data];
        }
    }
    result.texts[key] = std::move(label);
    return true;
}
