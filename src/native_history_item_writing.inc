// c77d8f/cc6a10 and c75a35/cc7020 select writing improvements and book
// pages. The IDs point to complete written_content records in world memory.
static bool capture_native_history_item_writing(uintptr_t object,
        NativeHistoryEventData &data, const std::string &prefix) {
    data.fields[prefix + ".writing"] = {};
    data.fields[prefix + ".pages"] = {};
    int32_t type = -1, constructed = 0;
    if (!native_history_item_scalar(object, 0, type, 2) ||
        !native_history_item_scalar(object, 0x5a8, constructed, 1)) return false;
    if (!constructed) return true;
    NativeBorrowedVector<uintptr_t> entries;
    if (!native_history_read_vector(native_history_object_field(object, "", 0xd0), entries)) return false;
    for (size_t i = 0; i < entries.size(); ++i) {
        const auto entry = native_history_vector_at(entries, i);
        int32_t kind = -1;
        if (!entry || !native_history_item_scalar(entry, 0x28, kind)) return false;
        if (kind != 12 && !(type == 89 && kind == 9)) continue;
        std::vector<int32_t> ids;
        if (!native_history_written_values(native_history_object_field(entry, {}, kind == 12 ? 0x28 : 0x30), ids)) return false;
        if (kind == 12 && ids.empty()) continue;
        const std::string key = prefix + "." + std::to_string(i);
        data.fields[prefix + (kind == 12 ? ".writing" : ".pages")].push_back(static_cast<int32_t>(i));
        data.fields[key + ".blank"] = {ids.empty() ? 1 : 0};
        data.fields[key + ".multiple"] = {ids.size() > 1 ? 1 : 0};
        if (ids.size() != 1) continue;
        uintptr_t content = 0;
        if (!native_history_material_find_id(native_history_global(0x24e7cb8),
                0, ids.front(), content) ||
            !capture_native_history_written_content(content, data, key)) return false;
    }
    return true;
}
