// Compact relationship events have a real history ID but no history_eventst
// vtable. The native b619e0 formatter reads one row from parallel arrays in
// its relationship chunk; these records must not depend on getSentence hooks.
// Include after native_history_event.inc, before the formatter hook adapters.
static std::optional<NativeHistoryEventData> snapshot_native_history_relationship(
        const void *history, const void *chunk, int32_t index, const void *context) {
    if (!history || !chunk || index < 0 || index >= 1024 ||
            !native_history_profile_base()) return std::nullopt;
    const uintptr_t address = reinterpret_cast<uintptr_t>(chunk);
    const uintptr_t history_address = reinterpret_cast<uintptr_t>(history);
    if (address > UINTPTR_MAX - 0x4804 || history_address > UINTPTR_MAX - 0x48)
        return std::nullopt;
    int32_t count = 0;
    if (!native_history_copy(address + 0x4800, count) || count < 0 ||
            count > 1024 || index >= count) return std::nullopt;
    const size_t row = static_cast<size_t>(index);
    int16_t type = -1;
    int32_t first = -1, second = -1;
    NativeHistoryEventData result;
    result.kind = NativeHistoryEventKind::PackedRelationship;
    // A compact record is not one of the 133 polymorphic event types.
    result.native_type = -1;
    if (!native_history_copy(address + row * 4, result.id) || result.id < 0 ||
            !native_history_copy(address + 0x1000 + row * 2, type) ||
            !native_history_copy(address + 0x1800 + row * 4, first) ||
            !native_history_copy(address + 0x2800 + row * 4, second) ||
            !native_history_copy(address + 0x3800 + row * 4, result.year) ||
            !capture_native_history_context(context, result)) return std::nullopt;
    // This formatter has year precision, independently of ordinary events'
    // seasonal timestamps. It does not append a site or collection location.
    result.seconds = -1;
    result.fields.emplace("relationship.type", std::vector<int32_t>{type});
    result.fields.emplace("relationship.first", std::vector<int32_t>{first});
    result.fields.emplace("relationship.second", std::vector<int32_t>{second});
    result.fields.emplace("relationship.support", std::vector<int32_t>{0});
    if (type >= 0 && type <= 15) {
        if (first >= 0) result.references.emplace_back(NativeHistoryObjectKind::Figure, first);
        if (second >= 0) result.references.emplace_back(NativeHistoryObjectKind::Figure, second);
    }
    if (type == 6 || type == 7) {
        // b61a1f..b61b5f searches history.relationship_event_supplements
        // by this row's real ID. b62099 calls the common reason/circumstance
        // dispatcher only for scholarly and artistic friendship records.
        uintptr_t supplement = 0;
        if (!native_history_find_structure_id(history_address + 0x48, 0,
                result.id, supplement)) return std::nullopt;
        if (supplement) {
            if (supplement > UINTPTR_MAX - 0x14 ||
                    !native_history_copy(supplement + 0x04, result.circumstance) ||
                    !native_history_copy(supplement + 0x08, result.circumstance_data) ||
                    !native_history_copy(supplement + 0x0c, result.reason) ||
                    !native_history_copy(supplement + 0x10, result.reason_data)) return std::nullopt;
            result.fields.at("relationship.support").front() = 1;
            result.fields.emplace("circumstance", std::vector<int32_t>{result.circumstance});
            result.fields.emplace("circumstance_data", std::vector<int32_t>{result.circumstance_data});
            result.fields.emplace("reason", std::vector<int32_t>{result.reason});
            result.fields.emplace("reason_data", std::vector<int32_t>{result.reason_data});
            capture_native_history_clause_collections(result);
        }
    }
    return result;
}
