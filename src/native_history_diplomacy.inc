// Native diplomatic support records, read while getSentence owns the event.
// RVA 2a71e0 consumes this typed negotiation record; no sentence is inspected.
static bool capture_native_history_negotiation(uintptr_t record,
        NativeHistoryEventData &result, decltype(NativeHistoryEventData::fields) &fields,
        decltype(NativeHistoryEventData::references) &references, const std::string &prefix) {
    struct Field { const char *key; size_t offset; char reference; bool short_value; };
    static constexpr Field schema[] = {
        {"speaker", 0x00, 'n', false}, {"speaker_entity", 0x04, 'p', false},
        {"recipient", 0x08, 'n', false}, {"recipient_entity", 0x0c, 'p', false},
        {"position", 0x10, 0, false}, {"position_entity", 0x14, 'p', false},
        {"topic", 0x18, 0, true}, {"result", 0x1c, 0, false},
        {"siege_site", 0x20, 's', false}, {"outcome", 0x24, 0, false},
        {"speaker_negotiation", 0x28, 0, false}, {"speaker_persuasion", 0x2c, 0, false},
        {"speaker_other", 0x30, 0, false}, {"speaker_rating", 0x34, 0, false},
        {"recipient_negotiation", 0x38, 0, false}, {"recipient_persuasion", 0x3c, 0, false},
        {"recipient_other", 0x40, 0, false}, {"recipient_rating", 0x44, 0, false},
    };
    for (const auto &entry : schema) {
        int32_t value = -1;
        if (entry.offset > UINTPTR_MAX - record) return false;
        if (entry.short_value) {
            int16_t narrowed = -1;
            if (!native_history_copy(record + entry.offset, narrowed)) return false;
            value = narrowed;
        } else if (!native_history_copy(record + entry.offset, value)) return false;
        fields.emplace(prefix + entry.key, std::vector<int32_t>{value});
        if (value >= 0 && entry.reference)
            references.emplace_back(entry.reference == 'n' ? NativeHistoryObjectKind::Figure :
                entry.reference == 'p' ? NativeHistoryObjectKind::Entity : NativeHistoryObjectKind::Site, value);
    }
    size_t count = 0;
    for (const auto &[key, offset] : {std::pair{"condition_kind", size_t{0x48}},
                                      std::pair{"condition_value", size_t{0x60}}}) {
        NativeBorrowedVector<int32_t> values;
        if (offset > UINTPTR_MAX - record || !native_history_copy(record + offset, values) ||
            !values.valid(16384)) return false;
        if (offset == 0x48) count = values.size();
        else if (values.size() != count) return false;
        std::vector<int32_t> copy(values.size());
        if (!copy.empty() && !native_history_copy_bytes(reinterpret_cast<uintptr_t>(values.begin),
                copy.data(), copy.size() * sizeof(int32_t))) return false;
        fields.emplace(prefix + key, std::move(copy));
    }
    std::string title;
    if (fields.at(prefix + "recipient_entity").front() != -1 &&
        fields.at(prefix + "position").front() != -1) {
        const uintptr_t base = native_history_profile_base();
        const int32_t entity = fields.at(prefix + "position_entity").front();
        // Missing position/entity is the native ordinary affiliation branch.
        if (native_history_find_subject(base, NativeHistoryObjectKind::Entity, entity) &&
            !native_history_position_name(base, entity, fields.at(prefix + "position").front(), 0, title))
            return false;
    }
    result.texts.emplace(prefix + "position_title", std::move(title));
    return true;
}

static bool capture_native_history_support(const void *event, NativeHistoryEventData &result,
        decltype(NativeHistoryEventData::fields) &fields,
        decltype(NativeHistoryEventData::references) &references) {
    fields.emplace("negotiation.present", std::vector<int32_t>{0});
    fields.emplace("intrigue.present", std::vector<int32_t>{0});
    fields.emplace("support.present", std::vector<int32_t>{0});
    const uintptr_t address = reinterpret_cast<uintptr_t>(event);
    uintptr_t bits = 0;
    int32_t bit_count = 0;
    if (!native_history_copy(address + 0x10, bits) ||
        !native_history_copy(address + 0x18, bit_count)) return false;
    if (bit_count <= 0) return true;
    uint8_t first = 0;
    if (!bits || !native_history_copy(bits, first)) return false;
    if ((first & 4) == 0) return true;
    int32_t id = -1;
    uintptr_t support = 0;
    const uintptr_t base = native_history_profile_base();
    if (!base || !native_history_copy(address + 0x20, id) ||
        !native_history_find_structure_id(native_history_global(0x24f9fa0), 0, id, support)) return false;
    if (!support) return true;
    fields.at("support.present").front() = 1;
    int32_t circumstance = -1, circumstance_data = -1;
    if (!native_history_copy(support + 0x20, circumstance) ||
        !native_history_copy(support + 0x24, circumstance_data)) return false;
    fields.emplace("support.circumstance", std::vector<int32_t>{circumstance});
    fields.emplace("support.circumstance_data", std::vector<int32_t>{circumstance_data});
    if (circumstance == 257 && circumstance_data >= 0)
        references.emplace_back(NativeHistoryObjectKind::Entity, circumstance_data);
    uintptr_t negotiation = 0, intrigue_record = 0;
    if (!native_history_copy(support + 8, negotiation) ||
        !native_history_copy(support + 0x10, intrigue_record)) return false;
    if (negotiation) {
        fields.at("negotiation.present").front() = 1;
        if (!capture_native_history_negotiation(negotiation, result, fields, references, "negotiation."))
            return false;
    }
    if (intrigue_record) {
        fields.at("intrigue.present").front() = 1;
        if (!capture_native_history_intrigue(intrigue_record, result, fields, references, "intrigue."))
            return false;
    }
    return true;
}
