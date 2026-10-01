// Native item references shared by event adapters. Item text itself is copied
// from the typed item formatter while DF builds the event, before its buffer dies.
static bool capture_native_history_artifact_subject(uintptr_t base, uintptr_t artifact,
        NativeHistorySubject &subject) {
    uintptr_t item = 0;
    if (!artifact || artifact > UINTPTR_MAX - 0x90 ||
        !native_history_copy(artifact + 0x90, item)) return false;
    // A name can survive its associated item. The native no-link name path
    // also uses that name without dereferencing the item.
    if (!item) return subject.name.has_name;
    int32_t type = -1;
    if (!native_history_page_getter(item, 0, type) || type < 0 || type > 90) return false;
    bool book = type == 89 || type == 87;
    if (type == 86) {
        if (!native_history_object_is(item, "item_toolst")) return false;
        uintptr_t raw = 0;
        NativeBorrowedVector<int16_t> uses;
        if (item > UINTPTR_MAX - 0xe8 || !native_history_copy(native_history_object_field(item, "item_toolst", 0xe8), raw) ||
            !raw || raw > UINTPTR_MAX - 0xc0 || !native_history_copy(native_history_object_field(raw, "itemdef_toolst", 0xc0), uses) ||
            !uses.valid(4096)) return false;
        size_t begin = 0, count = uses.size();
        const auto at = [&](size_t index, int16_t &value) {
            return native_history_copy(reinterpret_cast<uintptr_t>(uses.begin) + index * 2, value);
        };
        while (count > 64) {
            const size_t half = count / 2;
            int16_t value = -1;
            if (!at(begin + half, value)) return false;
            if (20 >= value) begin += half;
            count -= half;
        }
        for (size_t i = begin; i < begin + count; ++i) {
            int16_t value = -1;
            if (!at(i, value)) return false;
            if (value == 20) { book = true; break; }
        }
    }
    // Artifact-only caption discriminator: 0 language_name, 1 book name,
    // 2 the typed c65450 item fallback. The fields already cross reload.
    subject.native_type = book ? 1 : 0;
    bool named = subject.name.has_name && (!subject.name.first_name.empty() || !subject.name.nickname.empty());
    if (subject.name.has_name) for (const auto &word : subject.name.words)
        named = named || (!word.id.empty() && word.has_form);
    if (!named) {
        if (book) subject.label_key = "Untitled";
        else subject.native_type = 2;
    }
    return true;
}

static bool native_history_referenced_item_artifact(uintptr_t base,
        int32_t item_id, int32_t &artifact_id) {
    artifact_id = -1;
    if (item_id < 0) return true;
    NativeBorrowedVector<uintptr_t> artifacts;
    if (!native_history_read_vector(native_history_global(0x23e6180), artifacts)) return false;
    // b94710 resolves a historical ITEM ID by walking artifact records in
    // reverse, comparing record+90's item ID at +1c. The item can survive
    // here after leaving world.items.all, so this lookup must not require
    // the active item list, artifact flag, or general_ref_is_artifactst.
    // b9445d confirms the resulting artifact's own ID is at record+0.
    for (size_t index = artifacts.size(); index > 0; --index) {
        const uintptr_t artifact = native_history_vector_at(artifacts, index - 1);
        uintptr_t item = 0;
        if (!artifact || artifact > UINTPTR_MAX - 0x98 ||
                !native_history_copy(artifact + 0x90, item)) return false;
        if (!item) continue;
        int32_t referenced_item_id = -1;
        if (item > UINTPTR_MAX - 0x20 ||
                !native_history_copy(item + 0x1c, referenced_item_id)) return false;
        if (referenced_item_id != item_id) continue;
        return native_history_copy(artifact, artifact_id) && artifact_id >= 0;
    }
    return true;
}

static bool native_history_item_artifact(uintptr_t base, int32_t item_id, int32_t &artifact_id) {
    artifact_id = -1;
    if (item_id < 0) return true;
    NativeBorrowedVector<uintptr_t> items;
    if (!native_history_read_vector(native_history_global(0x23e5450), items)) return false;
    uintptr_t item = 0;
    size_t low = 0, high = items.size();
    while (low < high) {
        const size_t mid = low + (high - low) / 2;
        const uintptr_t candidate = native_history_vector_at(items, mid);
        int32_t id = -1;
        if (!candidate || !native_history_copy(candidate + 0x1c, id)) return false;
        if (id == item_id) { item = candidate; break; }
        if (id < item_id) low = mid + 1;
        else high = mid;
    }
    if (!item) return true;
    uint32_t flags = 0;
    if (!native_history_copy(item + 0x10, flags)) return false;
    if (!(flags & 0x40000)) return true;
    NativeBorrowedVector<uintptr_t> references;
    if (!native_history_read_vector(item + 0x38, references)) return false;
    // The reference class supplies the independent artifact ID.
    for (size_t i = 0; i < references.size(); ++i) {
        const uintptr_t reference = native_history_vector_at(references, i);
        uintptr_t table = 0;
        if (!reference || !native_history_copy(reference, table)) return false;
        if (!native_history_object_is(reference, "general_ref_is_artifactst")) continue;
        int32_t id = -1;
        if (!native_history_copy(native_history_object_field(reference, {}, 8), id)) return false;
        if (native_history_find_subject(base, NativeHistoryObjectKind::Artifact, id)) artifact_id = id;
        return true;
    }
    return true;
}
