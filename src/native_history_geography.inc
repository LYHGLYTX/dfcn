// Names of native geographical objects that do not expose rich-box links.
static bool native_history_peak_reference(NativeHistoryEventData &event, int32_t x, int32_t y) {
    for (const auto &value : event.subjects)
        if (value.kind == NativeHistoryObjectKind::Peak && value.id == x && value.subid == y) return true;
    const uintptr_t base = native_history_profile_base();
    uintptr_t world = 0;
    if (!base || !native_history_copy(native_history_global(0x24ebb58), world) || !world) return false;
    NativeHistorySubject value;
    value.kind = NativeHistoryObjectKind::Peak;
    value.id = x;
    value.subid = y;
    value.label_key = "an unknown peak";
    int32_t width = 0, height = 0;
    if (!native_history_copy(native_history_object_field(world, "world_data", 0xa0), width) || !native_history_copy(native_history_object_field(world, "world_data", 0xa4), height)) return false;
    // f89280 validates coordinates, then scans peaks in native vector order.
    if (x >= 0 && y >= 0 && x < width && y < height) {
        NativeBorrowedVector<uintptr_t> peaks;
        if (!native_history_read_vector(native_history_object_field(world, "world_data", 0x280), peaks)) return false;
        for (size_t i = 0; i < peaks.size(); ++i) {
            const uintptr_t object = native_history_vector_at(peaks, i);
            int16_t px = -1, py = -1;
            if (!object || !native_history_copy(object + 0x78, px) ||
                !native_history_copy(object + 0x7a, py)) return false;
            if (px != x || py != y) continue;
            if (!capture_native_history_name(base, object, value.name)) return false;
            value.label_key.clear();
            break;
        }
    }
    event.subjects.push_back(std::move(value));
    return true;
}

static bool native_history_construction_reference(NativeHistoryEventData &event, int32_t id) {
    for (const auto &value : event.subjects)
        if (value.kind == NativeHistoryObjectKind::Construction && value.id == id) return true;
    const uintptr_t base = native_history_profile_base();
    uintptr_t world = 0;
    if (!base || !native_history_copy(native_history_global(0x24ebb58), world) || !world) return false;
    NativeHistorySubject value;
    value.kind = NativeHistoryObjectKind::Construction;
    value.id = id;
    value.label_key = "an unknown construction";
    NativeBorrowedVector<uintptr_t> objects;
    if (!native_history_read_vector(native_history_object_field(world, "world_data", 0x138), objects)) return false;
    uintptr_t object = 0;
    size_t low = 0, high = id < 0 ? 0 : objects.size();
    while (low < high) {
        const size_t mid = low + (high - low) / 2;
        const uintptr_t candidate = native_history_vector_at(objects, mid);
        int32_t candidate_id = -1;
        if (!candidate || !native_history_copy(candidate + 8, candidate_id)) return false;
        if (id == candidate_id) { object = candidate; break; }
        if (candidate_id < id) low = mid + 1;
        else high = mid;
    }
    if (object) {
        static constexpr const char *classes[] = {"world_construction_roadst", "world_construction_tunnelst",
            "world_construction_bridgest", "world_construction_wallst"};
        static constexpr const char *labels[] = {"a road", "a tunnel", "a bridge", "a wall"};
        size_t type = 0;
        while (type < std::size(classes) && !native_history_object_is(object, classes[type])) ++type;
        if (type == std::size(classes) || !capture_native_history_name(base,
                native_history_object_field(object, {}, 0x58), value.name)) return false;
        value.native_type = static_cast<int32_t>(type);
        value.label_key = labels[type];
    }
    event.subjects.push_back(std::move(value));
    return true;
}
