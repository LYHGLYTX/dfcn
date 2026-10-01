case 115: { // add_hf_entity_honor: RVA b7a420
    captured = field("entity", 0x28, 'p') && field("histfig", 0x2c, 'n') && field("honor", 0x30);
    if (!captured) break;
    const uintptr_t entity = native_history_find_subject(native_history_profile_base(),
        NativeHistoryObjectKind::Entity, fields.at("entity").front());
    uintptr_t honor = 0;
    if (!entity || !native_history_find_structure_id(entity + 0x1330, 0,
            fields.at("honor").front(), honor) || !honor) { captured = false; break; }
    std::string title;
    captured = native_history_copy_string(honor + 8, title);
    if (!captured) break;
    result.texts.emplace("honor.title", std::move(title));
    struct Field { const char *key; size_t offset; bool narrow; };
    static constexpr Field schema[] = {
        {"honor.flags", 4, false}, {"honor.skill", 0x2c, true},
        {"honor.skill_mask", 0x30, false}, {"honor.rating", 0x34, false},
        {"honor.kills", 0x38, false}, {"honor.battles", 0x3c, false}, {"honor.years", 0x40, false},
    };
    for (const auto &entry : schema) {
        int32_t value = 0;
        if (entry.narrow) {
            int16_t short_value = 0;
            if (!native_history_copy(honor + entry.offset, short_value)) { captured = false; break; }
            value = short_value;
        } else if (!native_history_copy(honor + entry.offset, value)) { captured = false; break; }
        fields.emplace(entry.key, std::vector<int32_t>{value});
    }
    break;
}
