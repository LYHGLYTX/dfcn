// Native entity-position title lookup shared by event adapters.
static bool native_history_position_name(uintptr_t image, int32_t entity_id,
        int32_t position_id, int variant, std::string &title) {
    title.clear();
    if (entity_id < 0 || position_id < 0) return true;
    // getSentence at RVA b79490 uses site_civ, not the creator's civ.
    // historical_entity.positions.own is +0x10c0; entity_position.id is +0x20.
    const uintptr_t entity = native_history_find_subject(image,
        NativeHistoryObjectKind::Entity, entity_id);
    if (!entity || entity > UINTPTR_MAX - 0x10c0) return false;
    NativeBorrowedVector<uintptr_t> positions;
    if (!native_history_read_vector(entity + 0x10c0, positions)) return false;
    const auto position_at = [&](size_t index, uintptr_t &position, int32_t &id) {
        position = native_history_vector_at(positions, index);
        return position && position <= UINTPTR_MAX - 0x98 &&
            native_history_copy(position + 0x20, id);
    };
    // Reproduce RVA 1ba140's sorted-ID narrowing and final <=64-entry scan.
    // Keeping that last scan also preserves its first match for duplicate IDs.
    size_t begin = 0, count = positions.size();
    while (count > 64) {
        const size_t half = count / 2;
        uintptr_t position = 0;
        int32_t id = -1;
        if (!position_at(begin + half, position, id)) return false;
        if (position_id >= id) begin += half;
        count -= half;
    }
    for (size_t index = begin; index < begin + count; ++index) {
        uintptr_t position = 0;
        int32_t id = -1;
        if (!position_at(index, position, id)) return false;
        if (id != position_id) continue;
        // 0 = neutral, 1 = female, 2 = male, 3 = spouse title. Native
        // gender-specific empty labels fall back to the neutral singular.
        const size_t offset = variant == 1 ? 0xd8 : variant == 2 ? 0x118 :
            variant == 3 ? 0x218 : 0x98;
        if (!native_history_copy_string(position + offset, title)) return false;
        return !title.empty() || variant == 0 || variant == 3 ||
            native_history_copy_string(position + 0x98, title);
    }
    return true;
}
