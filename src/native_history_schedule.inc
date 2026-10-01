// The 21 typed schedule-feature variants are shared by occasion events and
// collection-page programs. Payloads always come from program+18, never from
// the surrounding producer output. d3bea0 is the native common formatter.
static bool capture_native_history_schedule_features(uintptr_t schedule,
        NativeHistoryEventData &event,
        decltype(NativeHistoryEventData::fields) &fields,
        decltype(NativeHistoryEventData::references) &references) {
    const uintptr_t base = native_history_profile_base();
    fields["features"] = {};
    NativeBorrowedVector<uintptr_t> features;
    if (!native_history_read_vector(schedule + 0x18, features) || features.size() > 4096) return false;
    auto &records = fields["features"];
    for (size_t index = 0; index < features.size(); ++index) {
        const uintptr_t feature = native_history_vector_at(features, index);
        int32_t kind = -1, data = -1, data2 = -1;
        if (!feature || !native_history_copy(feature, kind)) return false;
        // Only read the payload selected by the native discriminator.
        if ((kind >= 0 && kind <= 5) || kind == 10 || kind == 11 || kind == 12 ||
                kind == 19 || kind == 20) {
            if (!native_history_copy(feature + 4, data)) return false;
        }
        if (kind == 0 || kind == 1 || kind == 19) {
            int16_t caste = -1;
            if (!native_history_copy(feature + 8, caste)) return false;
            data2 = caste;
        } else if (kind == 11 || kind == 12) {
            if (!native_history_copy(feature + 8, data2)) return false;
        }
        records.insert(records.end(), {kind, data, data2});
        const std::string key = "feature." + std::to_string(index);
        if (kind == 0 || kind == 1 || kind == 19) {
            std::string species = "animals";
            if (data != -1 && !capture_native_history_creature_label(base, data,
                    static_cast<int16_t>(data2), true, species)) return false;
            event.texts[key] = std::move(species);
        } else if (kind == 2) {
            uintptr_t referenced = 0;
            if (!native_history_find_structure_id(native_history_global(0x24f9cb8), 0x20, data, referenced)) return false;
            if (!referenced) records[records.size() - 2] = -1;
        } else if (kind >= 3 && kind <= 5) {
            const auto form = kind == 3 ? NativeHistoryObjectKind::Poem :
                kind == 4 ? NativeHistoryObjectKind::Music : NativeHistoryObjectKind::Dance;
            if (!native_history_form_reference(event, form, data)) return false;
        } else if (kind == 10) {
            const bool exists = native_history_find_subject(base, NativeHistoryObjectKind::Figure, data) != 0;
            if (exists) references.emplace_back(NativeHistoryObjectKind::Figure, data);
            else records[records.size() - 2] = -1;
        } else if (kind == 11 || kind == 12 || kind == 20) {
            std::string label = data == -1 ? (kind == 20 ? "plants" : "flowers") : "";
            // Native guarded indices that do not resolve leave the label
            // empty. Only the -1 sentinel selects the generic RAW noun.
            if (data >= 0 && (kind == 20 || data2 >= 0)) {
                NativeBorrowedVector<uintptr_t> plants;
                if (!native_history_read_vector(native_history_global(0x24ec8f8), plants)) return false;
                if (static_cast<size_t>(data) < plants.size()) {
                    const uintptr_t plant = native_history_vector_at(plants, data);
                    if (!plant) return false;
                    if (kind == 20) {
                        if (!native_history_copy_string(plant + 0x70, label)) return false;
                    } else {
                        NativeBorrowedVector<uintptr_t> growths;
                        if (!native_history_read_vector(plant + 0x658, growths)) return false;
                        if (static_cast<size_t>(data2) < growths.size()) {
                            const uintptr_t growth = native_history_vector_at(growths, data2);
                            if (!growth || !native_history_copy_string(growth + 0x40, label)) return false;
                        }
                    }
                }
            }
            event.texts[key] = std::move(label);
        }
    }
    return true;
}

static bool capture_native_history_schedule_features(uintptr_t schedule,
        NativeHistoryEventData &event) {
    return capture_native_history_schedule_features(schedule, event, event.fields, event.references);
}
