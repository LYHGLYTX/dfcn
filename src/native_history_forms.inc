// Creative forms and written works are read by their native IDs. In event
// formatters 90..93 these names have no LPAGE markup; never infer a token link.
static bool capture_native_history_form(uintptr_t base, NativeHistoryObjectKind kind,
        int32_t id, NativeHistorySubject &result) {
    if (!base) return false;
    uintptr_t vector = 0;
    const char *missing = nullptr;
    switch (kind) {
    case NativeHistoryObjectKind::Poem:
        // b88a9d -> 72570; ID +0, language_name +8.
        vector = native_history_global(0x24e7ec8); missing = "a poetic form"; break;
    case NativeHistoryObjectKind::Music:
        // b88ed0..b88f90 inlines the same lookup/name conversion.
        vector = native_history_global(0x24e7ef8); missing = "a musical form"; break;
    case NativeHistoryObjectKind::Dance:
        // b893f0..b894b0.
        vector = native_history_global(0x24e7f28); missing = "a dance form"; break;
    case NativeHistoryObjectKind::WrittenContent:
        // b8990d..b89a38: this object's title is an owned MSVC string +8,
        // not language_name and not a fragment of the formatted event.
        vector = native_history_global(0x24e7cb8); missing = "a work"; break;
    default: return false;
    }
    NativeHistorySubject copy;
    copy.kind = kind;
    copy.id = id;
    uintptr_t object = 0;
    if (!native_history_find_structure_id(vector, 0, id, object)) return false;
    if (!object) copy.label_key = missing;
    else if (kind == NativeHistoryObjectKind::WrittenContent) {
        if (!native_history_copy_string(object + 8, copy.raw_title)) return false;
    } else if (!capture_native_history_name(base, object + 8, copy.name)) return false;
    result = std::move(copy);
    return true;
}

static bool native_history_form_reference(NativeHistoryEventData &event,
        NativeHistoryObjectKind kind, int32_t id) {
    for (const auto &subject : event.subjects)
        if (subject.kind == kind && subject.id == id && subject.subid == -1) return true;
    NativeHistorySubject copy;
    if (!capture_native_history_form(native_history_profile_base(), kind, id, copy)) return false;
    event.subjects.push_back(std::move(copy));
    return true;
}

static bool native_history_squad_reference(NativeHistoryEventData &event,
        int32_t id, bool &present) {
    // b6ce58 / b6d191: this is the named group, not the active squad object.
    // The formatter uses a full inclusive binary search and emits nothing
    // for a missing ID, including no leadership clause.
    present = false;
    const uintptr_t base = native_history_profile_base();
    NativeBorrowedVector<uintptr_t> squads;
    if (!base || !native_history_read_vector(native_history_global(0x24e37c0), squads)) return false;
    if (id == -1 || squads.size() > INT32_MAX) return true;
    int64_t left = 0, right = static_cast<int64_t>(squads.size()) - 1;
    while (left <= right) {
        const int64_t middle = (left + right) / 2;
        const uintptr_t object = native_history_vector_at(squads, static_cast<size_t>(middle));
        int32_t observed = -1;
        if (!object || !native_history_copy(object, observed)) return false;
        if (observed < id) { left = middle + 1; continue; }
        if (observed > id) { right = middle - 1; continue; }
        present = true;
        for (const auto &subject : event.subjects)
            if (subject.kind == NativeHistoryObjectKind::Squad && subject.id == id) return true;
        NativeHistorySubject copy;
        copy.kind = NativeHistoryObjectKind::Squad;
        copy.id = id;
        if (!capture_native_history_name(base, object + 8, copy.name)) return false;
        event.subjects.push_back(std::move(copy));
        return true;
    }
    return true;
}
