// Native history identity adapter. Host-specific globals are verified against
// the supported 53.16 PE/ELF; borrowed name/WORD/figure layouts are shared.
// Borrowed addresses are used only while the original event formatter runs;
// the public snapshot contains owned strings and WORD identities only.
static bool native_history_copy_bytes(uintptr_t address, void *destination, size_t size) {
    if (!address || size > UINTPTR_MAX - address) return false;
#ifdef _WIN32
    SIZE_T copied = 0;
    return ReadProcessMemory(GetCurrentProcess(), reinterpret_cast<const void *>(address),
        destination, size, &copied) && copied == size;
#else
    iovec local{destination, size}, remote{reinterpret_cast<void *>(address), size};
    return process_vm_readv(getpid(), &local, 1, &remote, 1, 0) == static_cast<ssize_t>(size);
#endif
}

template<typename T>
static bool native_history_copy(uintptr_t address, T &value) {
    return native_history_copy_bytes(address, &value, sizeof(T));
}

// Decode a string header that was already copied with its containing record.
// Inline bytes belong to this snapshot; only external storage needs another
// guarded native read. No game-owned STL object is constructed or retained.
static bool native_history_copy_string_snapshot(uintptr_t address,
        const unsigned char *snapshot, std::string &value) {
    if (!address || !snapshot) return false;
#ifdef _WIN32
    GameString native{};
    std::memcpy(&native, snapshot, sizeof(native));
    if (native.size > native.capacity ||
        native.size > 262144 || (native.capacity <= 15 && native.size > 15)) return false;
    if (native.capacity <= 15) value.assign(native.storage.small, native.size);
    else {
        value.resize(native.size);
        if (native.size && !native_history_copy_bytes(
                reinterpret_cast<uintptr_t>(native.storage.heap), value.data(), native.size)) return false;
    }
#else
    // libstdc++ C++11 string: pointer, length, union(capacity, inline[16]).
    // Never construct or destroy the borrowed game's representation.
    std::array<uintptr_t, 4> native{};
    std::memcpy(native.data(), snapshot, sizeof(native));
    if (native[1] > 262144 ||
        (!native[0] && native[1]) ||
        native[1] > (native[0] == address + 16 ? 15 : native[2])) return false;
    if (native[0] == address + 16)
        value.assign(reinterpret_cast<const char *>(snapshot + 16), native[1]);
    else {
        value.resize(native[1]);
        if (native[1] && !native_history_copy_bytes(native[0], value.data(), native[1])) return false;
    }
#endif
    return value.find('\0') == std::string::npos;
}

static bool native_history_copy_string(uintptr_t address, std::string &value) {
    std::array<unsigned char, 32> snapshot{};
    return native_history_copy_bytes(address, snapshot.data(), snapshot.size()) &&
        native_history_copy_string_snapshot(address, snapshot.data(), value);
}

static bool native_history_read_vector(uintptr_t address,
        NativeBorrowedVector<uintptr_t> &value) {
    return native_history_copy(address, value) && value.valid(1u << 24);
}

static uintptr_t native_history_vector_at(
        const NativeBorrowedVector<uintptr_t> &values, size_t index) {
    uintptr_t result = 0;
    if (index < values.size()) native_history_copy(
        reinterpret_cast<uintptr_t>(values.begin) + index * sizeof(uintptr_t), result);
    return result;
}

static uintptr_t native_history_profile_base() {
    static const uintptr_t base = []() -> uintptr_t {
#ifdef _WIN32
        if (!native_validate_game() || !native_pe_supported()) return 0;
        const auto address = reinterpret_cast<uintptr_t>(GetModuleHandleW(nullptr));
        if (!address) return 0;
        // RVA d2cb50 is the game's English WORD/POS resolver. These loads
        // establish the actual runtime word table, independent of RAW order.
        static constexpr unsigned char word_table_loads[] = {
            0x48, 0x8b, 0x05, 0x16, 0x0c, 0x7c, 0x01,
            0x4c, 0x8b, 0x0d, 0x07, 0x0c, 0x7c, 0x01,
        };
        if (!native_pe_match(address, 0xd2cb5b, word_table_loads,
                sizeof(word_table_loads))) return 0;
        return address;
#else
        ModuleBuildId module;
        dl_iterate_phdr(find_main_build_id, &module);
        if (!module.found || !native_validate_game()) return 0;
        return module.base + 0x400000; // Nonzero anchor for ET_EXEC (bias 0).
#endif
    }();
    return base;
}

#ifndef _WIN32
static uintptr_t native_elf_history_address(uintptr_t va) {
    const auto base = native_history_profile_base();
    return base && va >= 0x400000 ? native_reference_address(base, va - 0x400000) : 0;
}
#endif

#include "native_history_memory.inc"

// Runtime-generated instruments are not confined to the installed language
// dictionaries. Read only their actual name fields; translation and name
// admission remain in the shared instrument resolver, never in ABI bindings.
static bool capture_native_instrument_names(
        std::vector<std::pair<std::string, std::string>> &names) {
    names.clear();
    NativeBorrowedVector<uintptr_t> definitions;
    if (!native_history_read_vector(native_history_global(0x24ecdf8), definitions) ||
        definitions.size() > 65536) return false;
    names.reserve(definitions.size());
    for (size_t i = 0; i < definitions.size(); ++i) {
        const uintptr_t definition = native_history_vector_at(definitions, i);
        std::string singular, plural;
        if (!definition ||
            !native_history_copy_string(native_history_object_field(
                definition, "itemdef_instrumentst", 0x68), singular) ||
            !native_history_copy_string(native_history_object_field(
                definition, "itemdef_instrumentst", 0x88), plural)) return false;
        names.emplace_back(std::move(singular), std::move(plural));
    }
    return true;
}

static uintptr_t native_history_find_subject(uintptr_t base,
        NativeHistoryObjectKind kind, int32_t id) {
    if (!base || id < 0) return 0;
    uintptr_t vector = 0;
    size_t id_offset = 0;
    switch (kind) {
    case NativeHistoryObjectKind::Figure:
        // RVA 67dc0: history.figures at +0x60; figure ID at +0xe0.
        vector = native_history_global(0x24f9d18);
        id_offset = 0xe0;
        break;
    case NativeHistoryObjectKind::Entity:
        // RVA b92900 calls ba0a0 on this vector; IDs are at +4.
        vector = native_history_global(0x23d17f8);
        id_offset = 4;
        break;
    case NativeHistoryObjectKind::Site: {
        // RVA b9395e -> 7db20: world_data.sites at +0x178, ID +0x88.
        uintptr_t world_data = 0;
        if (!native_history_copy(native_history_global(0x24ebb58), world_data) || !world_data) return 0;
        vector = native_history_object_field(world_data, "world_data", 0x178);
        id_offset = 0x88;
        break;
    }
    case NativeHistoryObjectKind::World: {
        uintptr_t world_data = 0;
        if (id != 0 || !native_history_copy(native_history_global(0x24ebb58), world_data)) return 0;
        return world_data;
    }
    case NativeHistoryObjectKind::Artifact:
        // RVA b94400 performs the same sorted-ID search on artifact records.
        vector = native_history_global(0x23e6180);
        break;
    case NativeHistoryObjectKind::Building: return 0; // Site-scoped capture adapter.
    case NativeHistoryObjectKind::Peak:
    case NativeHistoryObjectKind::Construction:
    case NativeHistoryObjectKind::Poem:
    case NativeHistoryObjectKind::Music:
    case NativeHistoryObjectKind::Dance:
    case NativeHistoryObjectKind::WrittenContent:
    case NativeHistoryObjectKind::ArtImage:
    case NativeHistoryObjectKind::MaterialOwner:
    case NativeHistoryObjectKind::Identity:
    case NativeHistoryObjectKind::Occasion:
    case NativeHistoryObjectKind::Collection:
    case NativeHistoryObjectKind::Squad: return 0; // Typed object adapter.
    case NativeHistoryObjectKind::Region:
    case NativeHistoryObjectKind::Underground: {
        // b94a40 -> bc080 and b94940 -> e1560 use these independent
        // world_data vectors and IDs, not positions within the vectors.
        uintptr_t world_data = 0;
        if (!native_history_copy(native_history_global(0x24ebb58), world_data) || !world_data) return 0;
        const bool layer = kind == NativeHistoryObjectKind::Underground;
        vector = native_history_object_field(world_data, "world_data", layer ? 0x250 : 0x238);
        id_offset = layer ? 0x80 : 0x78;
        break;
    }
    }
    NativeBorrowedVector<uintptr_t> values;
    if (!native_history_read_vector(vector, values)) return 0;
    if (kind == NativeHistoryObjectKind::Entity || kind == NativeHistoryObjectKind::Site ||
            kind == NativeHistoryObjectKind::Region || kind == NativeHistoryObjectKind::Underground) {
        // These two native lookups narrow only until at most 64 entries
        // remain, then inspect each remaining ID (ba0a0 / 7db20). Preserve
        // that behavior instead of assuming a fully sorted short vector.
        size_t begin = 0, count = values.size();
        while (count > 64) {
            const size_t half = count / 2;
            const size_t middle = begin + half;
            const uintptr_t candidate = native_history_vector_at(values, middle);
            int32_t candidate_id = -1;
            if (!candidate || !native_history_copy(candidate + id_offset, candidate_id)) return 0;
            if (id >= candidate_id) begin = middle;
            count -= half;
        }
        for (size_t index = begin; index < begin + count; ++index) {
            const uintptr_t candidate = native_history_vector_at(values, index);
            int32_t candidate_id = -1;
            if (!candidate || !native_history_copy(candidate + id_offset, candidate_id)) return 0;
            if (candidate_id == id) return candidate;
        }
        return 0;
    }
    size_t begin = 0, end = values.size();
    while (begin < end) {
        const size_t middle = begin + (end - begin) / 2;
        const uintptr_t candidate = native_history_vector_at(values, middle);
        int32_t candidate_id = -1;
        if (!candidate || !native_history_copy(candidate + id_offset, candidate_id)) return 0;
        if (candidate_id == id) return candidate;
        if (candidate_id < id) begin = middle + 1;
        else end = middle;
    }
    return 0;
}

static bool capture_native_history_name(uintptr_t base, uintptr_t address,
        NativeHistoryName &result, std::array<int32_t, 7> *native_indices = nullptr) {
    // The fields are contiguous in both supported name layouts. Read them
    // once instead of issuing separate process-memory calls for seven WORD
    // indices, seven POS values and each scalar/string header. Generated
    // bindings retain the reviewed PE offsets and compiler-owned ELF offsets.
    constexpr auto &fields = native_history_layout::f_language_name_fields;
    constexpr size_t snapshot_size = [] {
        size_t result = 0;
        for (const auto &field : native_history_layout::f_language_name_fields)
            result = std::max(result, field.native + field.size);
        return result;
    }();
    std::array<unsigned char, snapshot_size> snapshot{};
    if (!native_history_copy_bytes(address, snapshot.data(), snapshot.size())) return false;
    uint8_t has_name = 0;
    NativeHistoryName copy;
    std::memcpy(&has_name, snapshot.data() + fields[6].native, sizeof(has_name));
    if (has_name > 1) return false;
    copy.has_name = has_name != 0;
    if (!copy.has_name) { result = std::move(copy); return true; }
    if (!native_history_copy_string_snapshot(address + fields[0].native,
            snapshot.data() + fields[0].native, copy.first_name) ||
        !native_history_copy_string_snapshot(address + fields[1].native,
            snapshot.data() + fields[1].native, copy.nickname)) return false;
    std::memcpy(&copy.language, snapshot.data() + fields[4].native, sizeof(copy.language));
    std::memcpy(&copy.type, snapshot.data() + fields[5].native, sizeof(copy.type));
    std::array<int32_t, 7> indices;
    std::array<int16_t, 7> parts_of_speech;
    std::memcpy(indices.data(), snapshot.data() + fields[2].native, sizeof(indices));
    std::memcpy(parts_of_speech.data(), snapshot.data() + fields[3].native, sizeof(parts_of_speech));
    if (native_indices) *native_indices = indices;
    if (!copy.nickname.empty()) {
        int32_t game_mode = -1;
        const uintptr_t mode_address = native_reference_address(base, native_history_layout::gametype_rva);
        const uintptr_t policy_address = native_reference_address(base, native_history_layout::d_init_rva) + 0x10;
        if (!native_history_copy(mode_address, game_mode)) return false;
        // RVA a94729: unsupported modes use the initialized policy 0.
        copy.nickname_mode = 0;
        if (game_mode >= 0 && game_mode <= 10 &&
            !native_history_copy(policy_address + size_t(game_mode) * 4,
                copy.nickname_mode)) return false;
        if (copy.nickname_mode < 0 || copy.nickname_mode > 2) return false;
        if (copy.nickname_mode == 2) { result = std::move(copy); return true; }
    }
    NativeBorrowedVector<uintptr_t> words;
    const uintptr_t words_address = native_history_global(0x24ed770);
    if (!native_history_read_vector(words_address, words)) return false;
    for (size_t slot = 0; slot < copy.words.size(); ++slot) {
        const int32_t index = indices[slot];
        auto &word = copy.words[slot];
        word.part_of_speech = parts_of_speech[slot];
        if (index == -1) continue;
        if (index < 0 || word.part_of_speech < 0 || word.part_of_speech > 8) return false;
        const uintptr_t raw = native_history_vector_at(words, static_cast<size_t>(index));
        // language_word.word at +0 is its stable WORD_ID. The nine English
        // forms at +0x20 are deliberately not parsed to recover that ID.
        if (!raw || !native_history_copy_string(raw, word.id) || word.id.empty()) return false;
        std::string form;
        if (!native_history_copy_string(raw + 0x20 + size_t(word.part_of_speech) * 0x20,
                form)) return false;
        word.has_form = !form.empty();
    }
    result = std::move(copy);
    return true;
}

static bool capture_native_history_species(uintptr_t base, uintptr_t figure,
        std::string &result) {
    // RVA b93391..b93472: HF race/caste -> creature/caste singular raw name.
    int16_t race = -1, caste = -1;
    if (!native_history_copy(figure + 2, race) ||
        !native_history_copy(figure + 4, caste)) return false;
    if (race < 0) { result.clear(); return true; }
    NativeBorrowedVector<uintptr_t> creatures;
    const uintptr_t creatures_address = native_history_global(0x24eca68);
    if (!native_history_read_vector(creatures_address, creatures)) return false;
    const uintptr_t creature = native_history_vector_at(creatures, static_cast<size_t>(race));
    if (!creature) return false;
    std::string species;
    if (caste >= 0) {
        NativeBorrowedVector<uintptr_t> castes;
        if (!native_history_read_vector(creature + 0x178, castes)) return false;
        const uintptr_t raw = native_history_vector_at(castes, static_cast<size_t>(caste));
        if (raw && !native_history_copy_string(raw + 0x20, species)) return false;
    }
    if (species.empty() && !native_history_copy_string(creature + 0x20, species)) return false;

    // Preserve the same typed creature modifiers as the native HF formatter
    // (b931be / b9332a / b93488), including a stored curse display name.
    uintptr_t info = 0, curse = 0;
    std::string undead_name;
    uint8_t named_curse = 0;
    if (!native_history_copy(figure + 0x130, info)) return false;
    if (info && !native_history_copy(info + 0x48, curse)) return false;
    if (curse && (!native_history_copy_string(curse + 0x150, undead_name) ||
        !native_history_copy(curse + 0x88, named_curse))) return false;
    std::string prefix;
    if (!undead_name.empty()) prefix = "zombie ";
    int32_t flag_count = 0;
    uint8_t first = 0;
    if (!native_history_copy(figure + 0xd0, flag_count)) return false;
    if (flag_count > 0) {
        uintptr_t flags = 0;
        if (!native_history_copy(figure + 0xc8, flags) || !flags ||
            !native_history_copy(flags, first)) return false;
    }
    // RVA b93166 suppresses the race label for these figure flags; explicit
    // zombie/curse identity restores it at b931d3. Preserve that decision.
    uint8_t has_name = 0;
    if (!native_history_copy(figure + 0xaa, has_name)) return false;
    // b932ed jumps directly to the nameless race branch at b93741. The
    // deity/force suppression only controls a named figure's extra label.
    if (has_name && (first & 0x0c) && undead_name.empty() && !named_curse) { result.clear(); return true; }
    if ((first & 0x80) && !named_curse) prefix += "ghostly ";
    if (named_curse) {
        std::string suffix;
        if (!native_history_copy_string(curse + 0x90, suffix)) return false;
        if (!suffix.empty()) species += " " + suffix;
    }
    result = prefix + species;
    return true;
}

// Defined by the item adapter after these shared native name primitives.
static bool capture_native_history_artifact_subject(uintptr_t base, uintptr_t artifact,
        NativeHistorySubject &subject);

static bool populate_native_history_subjects(NativeHistoryEventData &event) {
    const uintptr_t base = native_history_profile_base();
    if (!base) return false;
    bool complete = true;
    auto append = [&](NativeHistoryObjectKind kind, int32_t id) {
        if (id < 0) return;
        if (std::any_of(event.subjects.begin(), event.subjects.end(),
                [&](const NativeHistorySubject &subject) {
                    return subject.kind == kind && subject.id == id;
                })) return;
        const uintptr_t object = native_history_find_subject(base, kind, id);
        if (!object) {
            NativeHistorySubject missing;
            missing.kind = kind;
            missing.id = id;
            missing.label_key = native_history_unknown_subject(kind);
            event.subjects.push_back(std::move(missing));
            return;
        }
        size_t name_offset = 0;
        switch (kind) {
        case NativeHistoryObjectKind::Figure: name_offset = 0x38; break;
        case NativeHistoryObjectKind::Entity: name_offset = 0x20; break;
        case NativeHistoryObjectKind::Site: break;
        case NativeHistoryObjectKind::Artifact: name_offset = 8; break;
        case NativeHistoryObjectKind::Region: break;
        case NativeHistoryObjectKind::World: break;
        case NativeHistoryObjectKind::Underground: name_offset = 8; break;
        case NativeHistoryObjectKind::Building: complete = false; return;
        default: complete = false; return;
        }
        NativeHistorySubject subject;
        subject.kind = kind;
        subject.id = id;
        if (kind == NativeHistoryObjectKind::Underground) {
            // The native layer formatter only names these unnamed layer
            // types. Its has_name branch emits no name; do not invent one.
            uint8_t has_name = 0;
            int16_t type = -1;
            if (!native_history_copy(object + 0x7a, has_name) || has_name ||
                    !native_history_copy(object, type) || type < 0 || type > 2) {
                complete = false;
                return;
            }
            static constexpr const char *labels[] = {
                "the depths of the world", "the magma sea", "the Underworld"};
            subject.label_key = labels[type];
            event.subjects.push_back(std::move(subject));
            return;
        }
        if (!capture_native_history_name(base, object + name_offset, subject.name) ||
            (kind == NativeHistoryObjectKind::Figure &&
                !capture_native_history_species(base, object, subject.species)) ||
            (kind == NativeHistoryObjectKind::Artifact &&
                !capture_native_history_artifact_subject(base, object, subject)
            )) {
            complete = false;
            return;
        }
        event.subjects.push_back(std::move(subject));
    };
    append(NativeHistoryObjectKind::Figure, event.actor_id);
    append(NativeHistoryObjectKind::Artifact, event.artifact_id);
    append(NativeHistoryObjectKind::Entity, event.entity_id);
    append(NativeHistoryObjectKind::Site, event.site_id);
    append(NativeHistoryObjectKind::Entity, event.site_entity_id);
    for (const auto &[kind, id] : event.references) append(kind, id);
    const auto append_clause_subject = [&](const std::optional<HistoryEventClause> &clause,
            int32_t id) {
        if (!clause) return;
        // Capture and composition consume the same enum-to-field table;
        // adding a clause cannot silently leave its participant unrecorded.
        switch (clause->field) {
        case 'n': append(NativeHistoryObjectKind::Figure, id); break;
        case 'p': append(NativeHistoryObjectKind::Entity, id); break;
        case 's': append(NativeHistoryObjectKind::Site, id); break;
        case 'i': append(NativeHistoryObjectKind::Artifact, id); break;
        default: break;
        }
    };
    if (event.kind == NativeHistoryEventKind::ArtifactCreated ||
            event.kind == NativeHistoryEventKind::HfGainsSecretGoal ||
            event.fields.contains("reason") || event.fields.contains("circumstance")) {
        append_clause_subject(history_event_reason_clause(event.reason), event.reason_data);
        append_clause_subject(history_event_circumstance_clause(event.circumstance),
            event.circumstance_data);
    }
    return complete;
}
