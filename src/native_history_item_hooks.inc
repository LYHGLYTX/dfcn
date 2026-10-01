// Object descriptions have a typed ABI of their own. Capture only the bytes
// appended by that call, never identify an item by searching an event sentence.
struct NativeHistoryActiveCapture {
    NativeHistoryEventData *event = nullptr;
    bool page_root = false;
};
static NativeHistoryActiveCapture &active_native_history_capture() {
    return reloadable_thread_state<NativeHistoryActiveCapture, struct HistoryActiveCaptureTag>();
}
struct NativeHistoryActiveScope {
    NativeHistoryActiveCapture previous;
    explicit NativeHistoryActiveScope(NativeHistoryEventData *event, bool page_root = false)
        : previous(active_native_history_capture()) {
        active_native_history_capture().event = event;
        active_native_history_capture().page_root = page_root;
    }
    ~NativeHistoryActiveScope() { active_native_history_capture() = previous; }
};

using NativeHistoryItemFn = void (*)(NativeString *, int16_t, int16_t, int16_t,
    int32_t, int32_t, int32_t, bool, void *, int32_t, int32_t, bool, int32_t, int32_t);
static NativeHistoryItemFn g_real_native_history_item = nullptr;
using NativeHistoryArtifactItemFn = void (*)(void *, NativeString *, bool, int32_t);
static NativeHistoryArtifactItemFn g_real_native_history_artifact_item = nullptr;
using NativeHistoryBuildingLabelFn = void (*)(NativeString *, int16_t, int16_t, int16_t, int32_t);
using NativeHistoryMaterialNameFn = void (*)(void *, NativeString *, bool, int32_t);
static NativeHistoryBuildingLabelFn g_real_native_history_building_label = nullptr;
static constexpr const char *native_history_item_roles[] = {
    "item", "item", "item", "weapon", "shooter", "item", "item", "prize", "item", "item", "item", "feature.give", "feature.sacrifice", "weapon", "shooter", "item", "item", "prize", "collection.throwing"
};
static void capture_native_history_craft_parts(NativeHistoryEventData &event,
        const std::string &key, int16_t type, int16_t material, int32_t material_index,
        int32_t count, int32_t description_flags, void *materials,
        int32_t material_category, int32_t extra_flags) {
    event.fields.erase(key + ".components");
    event.texts.erase(key + ".type");
    event.texts.erase(key + ".material_prefix");
    event.texts.erase(key + ".material_state");
    // a82c10's jump table at a880e0 selects these plain craft branches.
    // They all use the material's solid adjective, then this enum noun;
    // no subtype, item-name text or event-sentence matching is involved.
    const char *noun = nullptr;
    switch (type) {
    case 37: noun = "amulet"; break;   // a85d2e
    case 38: noun = "scepter"; break;  // a86007
    case 40: noun = "crown"; break;    // a86077
    case 41: noun = "ring"; break;     // a863d8
    case 42: noun = "earring"; break;  // a86442
    case 43: noun = "bracelet"; break; // a864b2
    default: return;
    }
    if (count < 1 || description_flags || materials || material_category || extra_flags) return;
    std::string prefix, state;
    NativeHistoryName owner;
    bool possessive = false;
    if (material != -1 && !capture_native_history_material_parts(native_history_profile_base(),
            material, material_index, 0, false, prefix, state, owner, possessive, true)) return;
    // Named-person materials require their own possessive name component.
    // Leave those to the existing typed description path until captured here.
    if (possessive) return;
    event.texts[key + ".type"] = noun;
    event.texts[key + ".material_prefix"] = std::move(prefix);
    event.texts[key + ".material_state"] = std::move(state);
    event.fields[key + ".components"] = {1};
}

// Item tuples are typed native arguments, not MATERIALs for every family.
// FISH (49) / FISH_RAW (50) store race in mattype and caste in matindex.
// ELF 12b9300 / 12b88c0 select the RAW caste name, 0x15b8 sex byte,
// description bit 0x100 (rotten), and the type-50 raw prefix. The common
// layout adapter supplies those fields for both host ABIs.
static bool capture_native_history_item_parts(NativeHistoryEventData &event,
        const std::string &key, int16_t type, int16_t material, int32_t material_index,
        int32_t count, int32_t description_flags, void *materials,
        int32_t material_category, int32_t extra_flags) {
    event.fields.erase(key + ".fish");
    event.texts.erase(key + ".fish_caste");
    event.fields.erase(key + ".parts_incomplete");
    capture_native_history_craft_parts(event, key, type, material, material_index,
        count, description_flags, materials, material_category, extra_flags);
    if (type != 49 && type != 50) return true;

    // The formatter explicitly emits the generic fish noun for race=-1.
    // Other absent/invalid RAW data must remain an incomplete typed item,
    // never fall back to classifying its formatted English description.
    std::string caste;
    int8_t sex = -1;
    if (material != -1 && !capture_native_history_creature_label(
            native_history_profile_base(), material, static_cast<int16_t>(material_index),
            false, caste, false, &sex)) {
        event.fields[key + ".parts_incomplete"] = {1};
        return false;
    }
    event.texts[key + ".fish_caste"] = std::move(caste);
    event.fields[key + ".fish"] = {
        description_flags, extra_flags, sex, material == -1};
    return true;
}
template<size_t Index>
static void capture_native_history_item(NativeString *output, int16_t type, int16_t subtype,
        int16_t material, int32_t material_index, int32_t count, int32_t quality,
        bool append, void *materials, int32_t shape, int32_t item_id,
        bool historical, int32_t extra1, int32_t extra2) {
    NativeHistoryCallbackScope scope;
    size_t before = SIZE_MAX;
    auto *event = active_native_history_capture().event;
    try {
        std::string_view value;
        // a82d5c tests the eighth argument: false clears output, true
        // appends to it. Legends' append buffer contains the entire page,
        // so its preceding bytes must not consume this object's limit.
        if (event && !append) before = 0;
        else if (event && native_string_view(output, &value, kNativeHistorySourceLimit))
            before = value.size();
    } catch (...) {}
    g_real_native_history_item(output, type, subtype, material, material_index, count,
        quality, append, materials, shape, item_id, historical, extra1, extra2);
    if (!event || before == SIZE_MAX) return;
    try {
        std::string_view value;
        if (!native_string_view(output, &value, append ? kNativeHistorySourceLimit :
                kNativeHistoryStringLimit) || value.size() < before ||
                value.size() - before > kNativeHistoryStringLimit) return;
        if constexpr (Index == 18) {
            // A throwing-competition title receives the exact native item
            // tuple. Associate its object description with every captured
            // collection using that tuple, never with matching prose.
            std::vector<std::string> destinations;
            for (const auto &[field, tuple] : event->fields)
                if (field.starts_with("collection.") && field.ends_with(".throwing") &&
                    tuple.size() == 4 && tuple[0] == type && tuple[1] == subtype &&
                    tuple[2] == material && tuple[3] == material_index)
                    destinations.push_back("item." + field);
            for (const auto &key : destinations) {
                event->texts[key] = std::string(value.substr(before));
                event->fields[key] = {type, subtype, material, material_index, count, item_id};
                capture_native_history_item_parts(*event, key, type, material, material_index,
                    count, quality, materials, extra1, extra2);
            }
            return;
        }
        std::string key = std::string("item.") + native_history_item_roles[Index];
        if (key.starts_with("item.feature.")) {
            size_t index = 0;
            while (event->texts.contains(key + "." + std::to_string(index))) ++index;
            key += "." + std::to_string(index);
        }
        event->texts[key] = std::string(value.substr(before));
        event->fields[key] = {type, subtype, material, material_index, count, item_id};
        capture_native_history_item_parts(*event, key, type, material, material_index,
            count, quality, materials, extra1, extra2);
    } catch (...) {}
}

static void capture_native_history_artifact_item(void *item, NativeString *output,
        bool generic, int32_t mode) {
    NativeHistoryCallbackScope scope;
    auto *event = active_native_history_capture().event;
    g_real_native_history_artifact_item(item, output, generic, mode);
    if (!event) return;
    try {
        std::string_view value;
        // c65469 clears this independent item buffer before its description.
        if (!native_string_view(output, &value, kNativeHistoryStringLimit)) return;
        const uintptr_t base = native_history_profile_base();
        std::vector<int32_t> ids;
        if (event->artifact_id >= 0) ids.push_back(event->artifact_id);
        const auto reason = history_event_reason_clause(event->reason);
        const auto circumstance = history_event_circumstance_clause(event->circumstance);
        if (reason && reason->field == 'i' && event->reason_data >= 0) ids.push_back(event->reason_data);
        if (circumstance && circumstance->field == 'i' && event->circumstance_data >= 0)
            ids.push_back(event->circumstance_data);
        for (const auto &[kind, id] : event->references)
            if (kind == NativeHistoryObjectKind::Artifact && id >= 0) ids.push_back(id);
        for (const auto &subject : event->subjects)
            if (subject.kind == NativeHistoryObjectKind::Artifact && subject.id >= 0) ids.push_back(subject.id);
        for (int32_t id : ids) {
            const uintptr_t artifact = native_history_find_subject(base, NativeHistoryObjectKind::Artifact, id);
            uintptr_t native_item = 0;
            if (!artifact || !native_history_copy(artifact + 0x90, native_item) ||
                native_item != reinterpret_cast<uintptr_t>(item)) continue;
            // c65450 clears its output buffer before describing this item.
            // This includes b94400's unnamed-artifact fallback, as well as
            // the extra descriptions in a transformation's full paragraph.
            // b94583 requests generic=false, mode=1; b8a415/b8a5d4
            // request mode=-1. Keep the short object label distinct from
            // its extra full description when both occur in one paragraph.
            const char *prefix = !generic && mode == 1 ? "artifact_label." : "artifact_item.";
            event->texts[std::string(prefix) + std::to_string(id)] = std::string(value);
        }
    } catch (...) {}
}

static void capture_native_history_building_label(NativeString *output, int16_t type,
        int16_t subtype, int16_t race, int32_t custom) {
    NativeHistoryCallbackScope scope;
    auto *event = active_native_history_capture().event;
    g_real_native_history_building_label(output, type, subtype, race, custom);
    if (!event) return;
    try {
        std::string_view value;
        // 54d32c..54d33d clears this independent building-name buffer.
        if (native_string_view(output, &value, kNativeHistoryStringLimit))
            event->texts["construction"] = std::string(value);
    } catch (...) {}
}

static const void *native_history_item_callback(size_t index) {
    static const void *item_wrappers[] = {
        reinterpret_cast<const void *>(&capture_native_history_item<0>),
        reinterpret_cast<const void *>(&capture_native_history_item<1>),
        reinterpret_cast<const void *>(&capture_native_history_item<2>),
        reinterpret_cast<const void *>(&capture_native_history_item<3>),
        reinterpret_cast<const void *>(&capture_native_history_item<4>),
        reinterpret_cast<const void *>(&capture_native_history_item<5>),
        reinterpret_cast<const void *>(&capture_native_history_item<6>),
        reinterpret_cast<const void *>(&capture_native_history_item<7>),
        reinterpret_cast<const void *>(&capture_native_history_item<8>),
        reinterpret_cast<const void *>(&capture_native_history_item<9>),
        reinterpret_cast<const void *>(&capture_native_history_item<10>),
        reinterpret_cast<const void *>(&capture_native_history_item<11>),
        reinterpret_cast<const void *>(&capture_native_history_item<12>),
        reinterpret_cast<const void *>(&capture_native_history_item<13>),
        reinterpret_cast<const void *>(&capture_native_history_item<14>),
        reinterpret_cast<const void *>(&capture_native_history_item<15>),
        reinterpret_cast<const void *>(&capture_native_history_item<16>),
        reinterpret_cast<const void *>(&capture_native_history_item<17>),
        reinterpret_cast<const void *>(&capture_native_history_item<18>),
    };
    return index < std::size(item_wrappers) ? item_wrappers[index] : nullptr;
}
