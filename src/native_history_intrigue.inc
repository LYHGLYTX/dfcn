// intrigue_corruption_resultst, df-structures 1dd01aad and PE RVA 2a81f0.
// The snapshot preserves the formatter's decisions, never its English output.
static bool capture_native_history_assignment_position(uintptr_t base,
        int32_t entity_id, int32_t assignment_id, uintptr_t &position) {
    position = 0;
    if (entity_id == -1 || assignment_id == -1) return true;
    uintptr_t entity = 0, assignment = 0;
    if (!base || !native_history_find_structure_id(native_history_global(0x23d17f8), 4,
            entity_id, entity)) return false;
    if (!entity) return true;
    if (entity > UINTPTR_MAX - 0x1110 ||
        !native_history_find_structure_id(entity + 0x1110, 0,
            assignment_id, assignment)) return false;
    if (!assignment) return true;
    int32_t id = -1, cached_index = -1;
    if (assignment > UINTPTR_MAX - 0x10 ||
        !native_history_copy(assignment + 0x0c, id) ||
        !native_history_copy(assignment + 0x10, cached_index)) return false;
    NativeBorrowedVector<uintptr_t> positions;
    if (!native_history_read_vector(entity + 0x10c0, positions)) return false;
    if (id == -1 || !positions.size()) return true;
    const auto inspect = [&](size_t index, uintptr_t &candidate, int32_t &candidate_id) {
        candidate = native_history_vector_at(positions, index);
        return candidate && candidate <= UINTPTR_MAX - 0x20 &&
            native_history_copy(candidate + 0x20, candidate_id);
    };
    // RVA bbe40 first accepts a matching cached slot, then performs a full
    // binary search. Do not replace this with the other position lookup.
    if (cached_index >= 0 && static_cast<size_t>(cached_index) < positions.size()) {
        uintptr_t candidate = 0;
        int32_t candidate_id = -1;
        if (!inspect(cached_index, candidate, candidate_id)) return false;
        if (candidate_id == id) { position = candidate; return true; }
    }
    int64_t left = 0, right = static_cast<int64_t>(positions.size()) - 1;
    while (left <= right) {
        const int64_t middle = (left + right) / 2;
        uintptr_t candidate = 0;
        int32_t candidate_id = -1;
        if (!inspect(static_cast<size_t>(middle), candidate, candidate_id)) return false;
        if (candidate_id == id) { position = candidate; return true; }
        if (candidate_id > id) right = middle - 1;
        else left = middle + 1;
    }
    return true;
}

static bool capture_native_history_intrigue(uintptr_t record,
        NativeHistoryEventData &result, decltype(NativeHistoryEventData::fields) &fields,
        decltype(NativeHistoryEventData::references) &references, const std::string &prefix) {
    if (!record || record > UINTPTR_MAX - 0x64) return false;
    struct Field { const char *key; size_t offset; char reference; };
    static constexpr Field schema[] = {
        {"action", 0x00, 0}, {"corruptor", 0x04, 'n'}, {"target", 0x08, 'n'},
        {"target_entity", 0x10, 'p'},
        {"lurer", 0x14, 'n'}, {"method", 0x18, 0}, {"method_perceived_modifier", 0x1c, 0},
        {"method_modifier", 0x20, 0}, {"facet", 0x24, 0}, {"facet_roll", 0x2c, 0},
        {"value", 0x30, 0}, {"value_rating", 0x34, 0}, {"value_roll", 0x38, 0},
        {"emotion", 0x3c, 0}, {"emotion_rating", 0x40, 0}, {"emotion_roll", 0x44, 0},
        {"flags", 0x48, 0}, {"position_entity", 0x4c, 'p'}, {"position_assignment", 0x50, 0},
        {"offered", 0x54, 'n'}, {"offered_relationship", 0x58, 0},
        {"corruptor_ally_roll", 0x5c, 0}, {"target_ally_roll", 0x60, 0},
    };
    for (const auto &entry : schema) {
        int32_t value = -1;
        if (!native_history_copy(record + entry.offset, value) ||
            !fields.emplace(prefix + entry.key, std::vector<int32_t>{value}).second) return false;
        if (entry.reference && value >= 0)
            references.emplace_back(entry.reference == 'n' ? NativeHistoryObjectKind::Figure :
                NativeHistoryObjectKind::Entity, value);
    }
    int16_t relationship = -1;
    if (!native_history_copy(record + 0x0c, relationship) ||
        !fields.emplace(prefix + "target_relationship", std::vector<int32_t>{relationship}).second) return false;
    int16_t entity_type = -1;
    if (relationship == 25) {
        uintptr_t entity = 0;
        if (!native_history_find_structure_id(native_history_global(0x23d17f8), 4,
                fields.at(prefix + "target_entity").front(), entity) ||
            (entity && !native_history_copy(entity, entity_type))) return false;
    }
    if (!fields.emplace(prefix + "target_entity_type", std::vector<int32_t>{entity_type}).second) return false;
    int16_t facet_rating = 0;
    if (!native_history_copy(record + 0x28, facet_rating) ||
        !fields.emplace(prefix + "facet_rating", std::vector<int32_t>{facet_rating}).second) return false;
    std::string title;
    int32_t position_present = 0;
    const int32_t method = fields.at(prefix + "method").front();
    if (method == 2 || method == 3) {
        uintptr_t position = 0;
        if (!capture_native_history_assignment_position(native_history_profile_base(),
                fields.at(prefix + "position_entity").front(),
                fields.at(prefix + "position_assignment").front(), position)) return false;
        if (position) {
            if (position > UINTPTR_MAX - 0x98 ||
                !native_history_copy_string(position + 0x98, title)) return false;
            position_present = 1;
        }
    }
    result.texts[prefix + "position_title"] = std::move(title);
    return fields.emplace(prefix + "position_present", std::vector<int32_t>{position_present}).second;
}
