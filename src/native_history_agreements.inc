// The modern agreement graph is distinct from diplomatic negotiation records.
static bool capture_native_history_agreement(int32_t id,
        decltype(NativeHistoryEventData::fields) &fields,
        decltype(NativeHistoryEventData::references) &references) {
    const uintptr_t base = native_history_profile_base();
    NativeBorrowedVector<uintptr_t> agreements;
    if (!base || !native_history_read_vector(native_history_global(0x24e7e98), agreements)) return false;
    uintptr_t agreement = 0;
    size_t begin = 0, end = agreements.size();
    while (begin < end) {
        const size_t middle = begin + (end - begin) / 2;
        const uintptr_t object = native_history_vector_at(agreements, middle);
        int32_t candidate = -1;
        if (!object || !native_history_copy(object, candidate)) return false;
        if (candidate == id) { agreement = object; break; }
        if (candidate < id) begin = middle + 1; else end = middle;
    }
    fields.emplace("agreement_present", std::vector<int32_t>{agreement != 0});
    if (!agreement) return true;
    const auto scalar = [&](const std::string &key, uintptr_t address) {
        int32_t value = -1;
        if (!native_history_copy(address, value)) return false;
        fields.emplace(key, std::vector<int32_t>{value});
        return true;
    };
    size_t remaining = 16384;
    const auto list = [&](const std::string &key, uintptr_t address,
            std::optional<NativeHistoryObjectKind> kind = std::nullopt) {
        NativeBorrowedVector<int32_t> native;
        if (!native_history_copy(address, native) || !native.valid(remaining)) return false;
        std::vector<int32_t> ids(native.size());
        if (!ids.empty() && !native_history_copy_bytes(reinterpret_cast<uintptr_t>(native.begin),
                ids.data(), ids.size() * sizeof(int32_t))) return false;
        remaining -= ids.size();
        if (kind) for (int32_t value : ids) if (value >= 0) references.emplace_back(*kind, value);
        fields.emplace(key, std::move(ids));
        return true;
    };
    NativeBorrowedVector<uintptr_t> parties, details;
    if (agreement > UINTPTR_MAX - 0x28 ||
        !native_history_read_vector(agreement + 8, parties) || parties.size() > 16384 ||
        !native_history_read_vector(agreement + 0x28, details)) return false;
    std::vector<int32_t> party_ids;
    for (size_t i = 0; i < parties.size(); ++i) {
        const uintptr_t party = native_history_vector_at(parties, i);
        int32_t party_id = -1;
        if (!party || party > UINTPTR_MAX - 0x20 || !native_history_copy(party, party_id)) return false;
        party_ids.push_back(party_id);
        const std::string prefix = "agreement.party." + std::to_string(party_id);
        // e2b80 always lists all figures first, then all entities.
        if (!list(prefix + ".figures", party + 8, NativeHistoryObjectKind::Figure) ||
            !list(prefix + ".entities", party + 0x20, NativeHistoryObjectKind::Entity)) return false;
    }
    fields.emplace("agreement_parties", std::move(party_ids));
    if (details.size() == 0) {
        fields.emplace("agreement_type", std::vector<int32_t>{-1});
        return true;
    }
    const uintptr_t detail = native_history_vector_at(details, 0);
    int32_t type = -1;
    uintptr_t data = 0;
    if (!detail || !native_history_copy(detail + 0x18, type) ||
        !native_history_copy(detail + 0x10, data)) return false;
    fields.emplace("agreement_type", std::vector<int32_t>{type});
    // 2ad64f has an explicit generic agreement branch for unknown subjects.
    if (type < 0 || type > 17) return true;
    if (!data) return false;
    static constexpr size_t counts[] = {8, 6, 6, 5, 6, 6, 4, 4, 4, 4, 6, 0, 6, 4, 5, 4, 3, 5};
    std::vector<int32_t> values(counts[type]);
    if (!values.empty() && !native_history_copy_bytes(data, values.data(), values.size() * 4)) return false;
    fields.emplace("agreement_data", std::move(values));
    if (type == 7) {
        if (!list("agreement_messengers", data + 0x10) ||
            !scalar("agreement_entity", data + 0x28)) return false;
    } else if (type == 11) {
        if (!list("agreement_criminals", data) ||
            !scalar("agreement_corruption", data + 0x18)) return false;
    } else if (type == 12) {
        if (!scalar("agreement_location_tier", data + 0x1c)) return false;
    }
    // Only native object IDs occurring in the corresponding union branch
    // become references. Party IDs remain local to this agreement.
    const auto ref = [&](NativeHistoryObjectKind kind, size_t index) {
        const auto &data = fields.at("agreement_data");
        if (index < data.size() && data[index] >= 0) references.emplace_back(kind, data[index]);
    };
    switch (type) {
    case 0: break; // Branch-specific unions are registered by the event below.
    case 1: ref(NativeHistoryObjectKind::Site, 3); ref(NativeHistoryObjectKind::Artifact, 4); break;
    case 2: case 4: ref(NativeHistoryObjectKind::Site, 3); break;
    case 3: ref(NativeHistoryObjectKind::Site, 2); break;
    case 5: ref(NativeHistoryObjectKind::Entity, 4); break;
    case 6: ref(NativeHistoryObjectKind::Artifact, 3); break;
    case 8: case 9: ref(NativeHistoryObjectKind::Figure, 3); break;
    case 10: ref(NativeHistoryObjectKind::Figure, 3); ref(NativeHistoryObjectKind::Entity, 4);
        ref(NativeHistoryObjectKind::Site, 5); break;
    case 12: ref(NativeHistoryObjectKind::Site, 2); break;
    case 13: ref(NativeHistoryObjectKind::Entity, 2); break;
    case 14: ref(NativeHistoryObjectKind::Figure, 2); ref(NativeHistoryObjectKind::Figure, 3); break;
    case 15: ref(NativeHistoryObjectKind::Entity, 2); ref(NativeHistoryObjectKind::Entity, 3); break;
    case 16: ref(NativeHistoryObjectKind::Entity, 2); break;
    case 17: ref(NativeHistoryObjectKind::Artifact, 2); ref(NativeHistoryObjectKind::Entity, 3);
        ref(NativeHistoryObjectKind::Entity, 4); break; // Native b82432/2ad615 uses entity formatter.
    default: break;
    }
    return true;
}

static bool capture_native_history_agreement_formation(NativeHistoryEventData &result,
        decltype(NativeHistoryEventData::fields) &fields,
        decltype(NativeHistoryEventData::references) &references) {
    if (!fields.at("agreement_present").front()) return true;
    const int32_t type = fields.at("agreement_type").front();
    if (type < 0 || type > 17) return true;
    const auto &data = fields.at("agreement_data");
    const auto ref = [&](NativeHistoryObjectKind kind, int32_t id) {
        if (id >= 0) references.emplace_back(kind, id);
    };
    if (type == 0) {
        // The join-party union's +10 is an entity for insurrection, but an
        // identity for guide/rescue. 2acf85/2ad0a8 call c3a590, not b92900.
        if (data[0] == 0) {
            ref(NativeHistoryObjectKind::Entity, data[4]);
            ref(NativeHistoryObjectKind::Site, data[3]);
        } else if (data[0] == 2 || data[0] == 24) {
            if (data[5] >= 0) ref(NativeHistoryObjectKind::Figure, data[5]);
            else if (data[4] >= 0) {
                NativeHistoryIdentityInfo info;
                if (!native_history_identity_reference(result, data[4], info)) return false;
                fields.emplace("agreement_identity_real_figure", std::vector<int32_t>{info.real_figure});
                ref(NativeHistoryObjectKind::Figure, info.real_figure);
                if (info.real_figure < 0) {
                    fields.emplace("agreement_identity_named", std::vector<int32_t>{info.named});
                    fields.emplace("agreement_identity_entity", std::vector<int32_t>{info.entity});
                    ref(NativeHistoryObjectKind::Entity, info.entity);
                    result.texts.emplace("agreement_identity_species", std::move(info.species));
                    result.texts.emplace("agreement_identity_profession", std::move(info.profession));
                }
            } else if (data[0] == 2) ref(NativeHistoryObjectKind::Site, data[3]);
        }
    } else if (type == 5) {
        uintptr_t position = 0;
        const uintptr_t base = native_history_profile_base();
        // 2ac7f0..2ac8be omits the office when the assignment/position is
        // absent, and for passing funds (thought 249). Its native helper
        // bbe40 resolves assignment.position_id, including the cached slot.
        if (data[0] != 249 && data[4] >= 0 && data[5] >= 0 &&
            !capture_native_history_assignment_position(base, data[4], data[5], position)) return false;
        fields.emplace("agreement_position_present", std::vector<int32_t>{position != 0});
        if (position) {
            int16_t number = -1;
            std::string title;
            if (position > UINTPTR_MAX - 0x2d8 ||
                !native_history_copy(position + 0x2d8, number) ||
                !native_history_copy_string(position + 0x98, title)) return false;
            fields.emplace("agreement_position_unique", std::vector<int32_t>{number == 1});
            result.texts.emplace("agreement_position", std::move(title));
        }
    } else if (type == 7) {
        ref(NativeHistoryObjectKind::Entity, fields.at("agreement_entity").front());
    }
    return true;
}
