// False identities are separate native objects, never historical-figure IDs.
struct NativeHistoryIdentityInfo {
    int32_t real_figure = -1, entity = -1;
    bool named = false, show_species = false;
    std::string species, profession;
};

static bool native_history_identity_reference(NativeHistoryEventData &event, int32_t id,
        NativeHistoryIdentityInfo &info) {
    const uintptr_t base = native_history_profile_base();
    NativeBorrowedVector<uintptr_t> identities;
    if (!base || id < 0 || !native_history_read_vector(native_history_global(0x24e7ce8), identities)) return false;
    uintptr_t object = 0;
    // 072570 finds identity.id at +0 in this sorted native vector.
    size_t begin = 0, end = identities.size();
    while (begin < end) {
        const size_t middle = begin + (end - begin) / 2;
        const uintptr_t candidate = native_history_vector_at(identities, middle);
        int32_t candidate_id = -1;
        if (!candidate || !native_history_copy(candidate, candidate_id)) return false;
        if (candidate_id == id) { object = candidate; break; }
        if (candidate_id < id) begin = middle + 1; else end = middle;
    }
    if (!object || object > UINTPTR_MAX - 0xb0 ||
        !native_history_copy(object + 0x88, info.real_figure)) return false;
    // c3a5e0: an identity pointing at an existing HF uses the ordinary HF
    // formatter exclusively, before inspecting its false name/profession.
    if (info.real_figure >= 0) return true;
    NativeHistorySubject name;
    name.kind = NativeHistoryObjectKind::Identity;
    name.id = id;
    int32_t race = -1;
    int16_t caste = -1, profession = -1;
    if (!capture_native_history_name(base, object + 8, name.name) ||
        !native_history_copy(object + 0x80, race) ||
        !native_history_copy(object + 0x84, caste) ||
        !native_history_copy(object + 0xac, profession) ||
        !native_history_copy(object + 0xb0, info.entity)) return false;
    info.named = name.name.has_name;
    int32_t context_id = -1;
    uintptr_t observer = 0;
    for (const char *key : {"speaker_id", "histfig_id"}) {
        const auto found = event.context.find(key);
        if (found == event.context.end()) return false;
        context_id = found->second;
        observer = native_history_find_subject(base, NativeHistoryObjectKind::Figure, context_id);
        if (observer) break;
    }
    int16_t observer_race = -1;
    if (observer && !native_history_copy(observer + 2, observer_race)) return false;
    // Type 63 calls c3a590 with both grammatical flags zero and no disguise
    // shortening. Unnamed identities always emit a species; named ones omit
    // it when the native observer belongs to the same race.
    info.show_species = !info.named || (race >= 0 && (!observer || race != observer_race));
    if (info.show_species && !capture_native_history_creature_label(base,
            static_cast<int16_t>(race), caste, false, info.species)) return false;
    if (profession >= 0 && profession != 102 &&
        !capture_native_history_profession(base, profession, static_cast<int16_t>(race),
            caste, false, info.profession, true)) return false;
    if (info.named) event.subjects.push_back(std::move(name));
    return true;
}
