// Material identities and state names are native RAW data. These readers
// reproduce 14add70 / 701e70 without invoking native mutating cache helpers.
static bool native_history_material_find_id(uintptr_t vector, size_t offset,
        int32_t id, uintptr_t &result) {
    result = 0;
    NativeBorrowedVector<uintptr_t> values;
    if (!native_history_read_vector(vector, values) || values.size() > INT32_MAX) return false;
    if (id == -1) return true;
    int64_t left = 0, right = static_cast<int64_t>(values.size()) - 1;
    while (left <= right) {
        const int64_t middle = (left + right) / 2;
        const uintptr_t object = native_history_vector_at(values, static_cast<size_t>(middle));
        int32_t observed = -1;
        if (!object || !native_history_copy(object + offset, observed)) return false;
        if (observed == id) { result = object; return true; }
        if (observed < id) left = middle + 1; else right = middle - 1;
    }
    return true;
}

static bool native_history_material_object(uintptr_t base, int16_t type,
        int32_t index, uintptr_t &result) {
    result = 0;
    if (!base) return false;
    const auto indexed = [&](uintptr_t address, int32_t slot, uintptr_t &object) {
        object = 0;
        NativeBorrowedVector<uintptr_t> values;
        if (!native_history_read_vector(address, values)) return false;
        if (slot < 0 || static_cast<size_t>(slot) >= values.size()) return true;
        return native_history_copy(reinterpret_cast<uintptr_t>(values.begin) +
            static_cast<size_t>(slot) * sizeof(uintptr_t), object);
    };
    if (type >= 419 && type <= 618) {
        uintptr_t plant = 0;
        if (!indexed(native_history_global(0x24ec8f8), index, plant)) return false;
        if (plant && !indexed(plant + 0x2a0, type - 419, result)) return false;
        return result || native_history_copy(native_history_global(0x24f8e40), result);
    }
    if (type >= 19 && type <= 418) {
        int32_t race = index;
        const int32_t material_index = type >= 219 ? type - 219 : type - 19;
        if (type >= 219) {
            // The game's race cache is derived from this historical figure.
            // Read its authoritative race instead of walking an STL hash
            // implementation or maintaining a second ABI-specific cache.
            uintptr_t figure = 0;
            if (!native_history_material_find_id(native_history_global(0x24f9d18), 0xe0, index, figure)) return false;
            int16_t native_race = -1;
            if (figure && !native_history_copy(figure + 2, native_race)) return false;
            race = native_race;
        }
        uintptr_t creature = 0;
        if (!indexed(native_history_global(0x24eca68), race, creature)) return false;
        if (creature && !indexed(creature + 0x1f0, material_index, result)) return false;
        return result || native_history_copy(native_history_global(0x24f81c0), result);
    }
    if (type == 0) {
        uintptr_t inorganic = 0;
        if (!indexed(native_history_global(0x24ec8c8), index, inorganic)) return false;
        if (inorganic) { result = inorganic + 0x1a8; return true; }
        return native_history_copy(native_history_global(0x24f8128), result);
    }
    if (static_cast<uint16_t>(type) > 658) return true;
    return native_history_copy(native_history_global(0x24f8128 + static_cast<size_t>(type) * 8), result);
}

static bool capture_native_history_material_owner(uintptr_t base, int16_t type,
        int32_t index, NativeHistoryName &name, bool &possessive) {
    name = {};
    possessive = false;
    if (!base) return false;
    if (type < 219 || type > 418) return true;
    uintptr_t figure = 0;
    if (!native_history_material_find_id(native_history_global(0x24f9d18), 0xe0, index, figure)) return false;
    if (!figure) return true;
    uint8_t named = 0;
    if (!native_history_copy(figure + 0xaa, named)) return false;
    if (!named) return true;
    possessive = true;
    uintptr_t address = figure + 0x38, info = 0, reputation = 0;
    int32_t identity_id = -1;
    if (!native_history_copy(figure + 0x130, info) ||
        (info && !native_history_copy(info + 0x58, reputation)) ||
        (reputation && !native_history_copy(reputation + 0x30, identity_id))) return false;
    if (identity_id != -1) {
        uintptr_t identity = 0;
        if (!native_history_material_find_id(native_history_global(0x24e7ce8), 0, identity_id, identity)) return false;
        if (identity) {
            // c3a4f0 prefers a linked HF's actual name only when named.
            address = identity + 8;
            int32_t real_id = -1;
            uintptr_t real = 0;
            if (!native_history_copy(identity + 0x88, real_id) ||
                !native_history_material_find_id(native_history_global(0x24f9d18), 0xe0, real_id, real)) return false;
            if (real) {
                if (!native_history_copy(real + 0xaa, named)) return false;
                if (named) address = real + 0x38;
            }
        }
    }
    return capture_native_history_name(base, address, name);
}

static bool capture_native_history_material_parts(uintptr_t base, int16_t type,
        int32_t index, int16_t state, bool prefer_generic, std::string &prefix,
        std::string &state_name, NativeHistoryName &owner, bool &possessive,
        bool adjective = false) {
    prefix.clear();
    state_name.clear();
    owner = {};
    possessive = false;
    if (state < 0 || state > 5) return false;
    uintptr_t material = 0;
    if (!native_history_material_object(base, type, index, material)) return false;
    // 14d16f0 leaves its output empty for a null material; 14d1920 and
    // the inline commodity branches instead append "unknown material".
    if (!material && prefer_generic) return true;
    if (material && prefer_generic) {
        if (!native_history_copy_string(material + 0x60, state_name)) return false;
        if (!state_name.empty()) return true;
    }
    if (!capture_native_history_material_owner(base, type, index, owner, possessive)) return false;
    if (!material) { state_name = "unknown material"; return true; }
    // 14d1920 selects state_adj at +178 for a material modifying an item,
    // while independent material nouns continue to use state_name at +b8.
    return native_history_copy_string(material + 0x520, prefix) &&
        native_history_copy_string(material + (adjective ? 0x178 : 0xb8) +
            static_cast<size_t>(state) * 0x20, state_name);
}
