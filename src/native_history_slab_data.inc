// 53.16 item_slabst source adapter. Generated inscriptions use interaction
// RAW sources or identity/binding records; saved writing is never parsed.
// Included after native_history_page_formatters.inc.
static bool capture_native_history_slab_secret(uintptr_t base, int32_t interaction_id,
        const std::string &writing, NativeHistoryEventData &data) {
    data.fields["slab.secret.interaction"] = {interaction_id};
    data.fields["slab.secret.source"] = {-1};
    const uintptr_t interaction = native_history_interaction(base, interaction_id);
    if (!interaction) return true;
    int32_t raw_id = -1;
    NativeBorrowedVector<uintptr_t> sources;
    if (interaction > UINTPTR_MAX - 0x68 ||
        !native_history_copy(interaction + 0x20, raw_id) ||
        !native_history_read_vector(interaction + 0x50, sources) ||
        !sources.valid(16384)) return false;
    if (raw_id != interaction_id) return true;
    // 5f7c80..5f7e21 selects an eligible SECRET source alongside its
    // interaction. 5f8142 persists only interaction.id, not source index.
    // Resolve that missing index by comparing each source's complete RAW
    // name after the same normalization used at creation; this is source
    // identity matching, not extraction from a formatted sentence.
    for (size_t index = 0; index < sources.size(); ++index) {
        const uintptr_t source = native_history_vector_at(sources, index);
        int32_t type = -1;
        if (!source || source > UINTPTR_MAX - 0x30 ||
            !native_history_typed_getter(source, 0, type)) return false;
        if (type != 1) continue;
        std::string label;
        if (!native_history_copy_string(native_history_object_field(source, "", 0x10), label)) return false;
        if (label.empty()) continue;
        // 5f8151..5f817b copies IS_NAME and capitalizes its first visible
        // character, including native bracket/quote and CP437 rules. Both
        // calls below operate exclusively on this owned temporary string.
        NativeHistoryPageString normalized;
        if (label.find('\0') != std::string::npos) return false;
        reinterpret_cast<NativeString * (*)(NativeString *, const char *)>(
            native_history_page_address(NativeHistoryPageSymbol::AppendLiteral))(
            &normalized.value, label.c_str());
        reinterpret_cast<void (*)(NativeString *)>(
            native_history_page_address(NativeHistoryPageSymbol::CapitalizeFirst))(&normalized.value);
        std::string_view generated;
        if (!native_string_view(&normalized.value, &generated, kNativeHistoryStringLimit)) return false;
        if (generated != writing) continue;
        data.fields["slab.structured"] = {2};
        data.fields["slab.secret.source"] = {static_cast<int32_t>(index)};
        data.texts["slab.secret.label"] = std::move(label);
        return true;
    }
    // Edited inscriptions or removed/changed RAW sources keep their stored
    // text without falsely assigning the first available secret source.
    return true;
}

static bool capture_native_history_slab_data(uintptr_t item, NativeHistoryEventData &data) {
    const uintptr_t base = native_history_profile_base();
    data.fields["slab.has_writing"] = {0};
    int32_t type = -1;
    if (!native_history_item_scalar(item, 0, type, 2)) return false;
    if (type != 87) return true;
    if (!base || !native_history_object_is(item, "item_slabst")) return false;
    int16_t subtype = -1;
    int32_t inscription_id = -1;
    if (!native_history_copy(native_history_object_field(item, "", 0x108), inscription_id) ||
        !native_history_copy(native_history_object_field(item, "", 0x10c), subtype)) return false;
    // Quality, material, makers, improvements and wear belong to the shared
    // item adapters. The meaning of +108 is selected only by slab subtype.
    data.fields["slab.subtype"] = {subtype};
    std::string writing;
    if (!native_history_copy_string(native_history_object_field(item, "", 0xe8), writing)) return false;
    data.fields["slab.has_writing"] = {!writing.empty()};
    data.fields["slab.structured"] = {0};
    if (writing.empty()) return true;
    // The saved inscription is itself original item data. Keep it separately
    // for custom writing and source records whose creation-time identity or
    // agreement no longer survives; never take it from the rendered page.
    data.texts["slab.saved_writing"] = writing;
    if (subtype == 6)
        return capture_native_history_slab_secret(base, inscription_id, writing, data);
    if (subtype != 26) return true;
    const int32_t figure_id = inscription_id;
    data.fields["slab.figure"] = {figure_id};
    data.fields["slab.true_identity"] = {-1};
    data.fields["slab.deity"] = {-1};
    data.fields["slab.alternate_name"] = {0};
    if (figure_id < 0 || data.artifact_id < 0) return true;

    const uintptr_t figure = native_history_find_subject(base, NativeHistoryObjectKind::Figure, figure_id);
    uintptr_t info = 0, reputation = 0;
    NativeBorrowedVector<int32_t> identities;
    if (!figure || !native_history_copy(figure + 0x130, info) || !info ||
        !native_history_copy(info + 0x58, reputation) || !reputation ||
        !native_history_copy(reputation + 0x38, identities) || !identities.valid(16384)) return false;
    uintptr_t true_identity = 0;
    int32_t true_identity_id = -1;
    // be18cf..be19a1 walks this HF's identity IDs in order, selecting type 2
    // owned by this HF. Its current public name is intentionally irrelevant.
    for (size_t i = 0; i < identities.size(); ++i) {
        int32_t id = -1, kind = -1, owner = -1;
        uintptr_t candidate = 0;
        if (!native_history_copy(reinterpret_cast<uintptr_t>(identities.begin) + i * 4, id) ||
            !native_history_material_find_id(native_history_global(0x24e7ce8), 0, id, candidate)) return false;
        if (!candidate) continue;
        if (!native_history_copy(candidate + 0x90, kind) ||
            !native_history_copy(candidate + 0x8c, owner)) return false;
        if (kind == 2 && owner == figure_id) {
            true_identity = candidate;
            true_identity_id = id;
            break;
        }
    }
    if (!true_identity) return true;
    NativeHistorySubject identity;
    identity.kind = NativeHistoryObjectKind::Identity;
    identity.id = true_identity_id;
    if (!capture_native_history_name(base, true_identity + 8, identity.name)) return false;
    // Only isolated names use the original language formatter. The prose,
    // identity choice and optional-alias branch come from the source fields.
    NativeHistoryPageString original, translated;
    reinterpret_cast<void (*)(void *, NativeString *)>(native_history_page_address(NativeHistoryPageSymbol::OriginalName))(
        reinterpret_cast<void *>(true_identity + 8), &original.value);
    reinterpret_cast<void (*)(void *, NativeString *, bool, int32_t)>(native_history_page_address(NativeHistoryPageSymbol::Name))(
        reinterpret_cast<void *>(true_identity + 8), &translated.value, true, 0);
    std::string_view native_name, translated_name;
    if (!native_string_view(&original.value, &native_name, kNativeHistoryStringLimit) ||
        !native_string_view(&translated.value, &translated_name, kNativeHistoryStringLimit) ||
        native_name.empty() || translated_name.empty()) return false;

    int32_t deity_id = -1;
    NativeBorrowedVector<uintptr_t> agreements;
    if (!native_history_read_vector(native_history_global(0x24e7e98), agreements)) return false;
    // be20a0..be2159 stores the exact selected deity in party data[2], the
    // bound HF in party data[1], and this slab artifact ID in data[4].
    for (size_t a = 0; a < agreements.size() && deity_id < 0; ++a) {
        const uintptr_t agreement = native_history_vector_at(agreements, a);
        NativeBorrowedVector<uintptr_t> details, parties;
        if (!agreement || !native_history_read_vector(agreement + 0x28, details)) return false;
        for (size_t d = 0; d < details.size() && deity_id < 0; ++d) {
            const uintptr_t detail = native_history_vector_at(details, d);
            int32_t kind = -1;
            uintptr_t detail_data = 0;
            if (!detail || !native_history_copy(detail + 0x18, kind)) return false;
            if (kind != 1) continue;
            std::array<int32_t, 6> values{};
            if (!native_history_copy(detail + 0x10, detail_data) || !detail_data ||
                !native_history_copy(detail_data, values)) return false;
            if (values[4] != data.artifact_id) continue;
            if (!native_history_read_vector(agreement + 8, parties)) return false;
            int32_t bound_figure = -1, candidate_deity = -1;
            for (size_t p = 0; p < parties.size(); ++p) {
                const uintptr_t party = native_history_vector_at(parties, p);
                int32_t party_id = -1;
                if (!party || !native_history_copy(party, party_id)) return false;
                if (party_id != values[1] && party_id != values[2]) continue;
                NativeBorrowedVector<int32_t> figures, entities;
                int32_t participant = -1;
                if (!native_history_copy(party + 8, figures) || !figures.valid(16384) ||
                    !native_history_copy(party + 0x20, entities) || !entities.valid(16384) ||
                    figures.size() != 1 || entities.size() ||
                    !native_history_copy(reinterpret_cast<uintptr_t>(figures.begin), participant)) return false;
                if (party_id == values[1]) bound_figure = participant;
                if (party_id == values[2]) candidate_deity = participant;
            }
            if (bound_figure != figure_id || candidate_deity < 0) return false;
            deity_id = candidate_deity;
        }
    }
    // A missing agreement does not prove that the optional deity was absent:
    // be1fde may omit the agreement even with a chosen deity. Preserve the
    // original complete region when its saved semantic source is unavailable.
    if (deity_id < 0) return true;
    data.fields["slab.structured"] = {1};
    data.fields["slab.true_identity"] = {true_identity_id};
    data.fields["slab.deity"] = {deity_id};
    data.fields["slab.alternate_name"] = {native_name != translated_name};
    data.texts["slab.native_name"] = std::string(native_name);
    data.subjects.push_back(std::move(identity));
    data.references.emplace_back(NativeHistoryObjectKind::Figure, deity_id);
    return true;
}
