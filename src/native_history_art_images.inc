// Art images are held in chunks of 500 image pointers. The native 1458b0
// getter may populate a missing chunk; capture only observes resident data.
static bool native_history_art_image_reference(NativeHistoryEventData &result,
        int32_t chunk_id, int32_t image_id, bool &present) {
    present = false;
    if (chunk_id == -1 || image_id < 0 || image_id >= 500) return true;
    const uintptr_t base = native_history_profile_base();
    if (!base) return false;
    NativeBorrowedVector<uintptr_t> chunks;
    if (!native_history_read_vector(native_history_global(0x23e5160), chunks)) return false;
    uintptr_t chunk = 0;
    // 1458b0 uses a linear ID search; this vector is not assumed sorted.
    for (size_t index = 0; index < chunks.size(); ++index) {
        const uintptr_t candidate = native_history_vector_at(chunks, index);
        int32_t id = -1;
        if (!candidate || !native_history_copy(candidate, id)) return false;
        if (id == chunk_id) { chunk = candidate; break; }
    }
    if (!chunk) return true;
    const size_t offset = 8 + static_cast<size_t>(image_id) * sizeof(uintptr_t);
    uintptr_t image = 0;
    if (offset > UINTPTR_MAX - chunk || !native_history_copy(chunk + offset, image)) return false;
    if (!image) return true;
    for (const auto &subject : result.subjects)
        if (subject.kind == NativeHistoryObjectKind::ArtImage && subject.id == chunk_id &&
            subject.subid == image_id) { present = true; return true; }
    NativeHistorySubject subject;
    subject.kind = NativeHistoryObjectKind::ArtImage;
    subject.id = chunk_id;
    subject.subid = image_id;
    if (image > UINTPTR_MAX - 0x38 ||
        !capture_native_history_name(base, image + 0x38, subject.name)) return false;
    result.subjects.push_back(std::move(subject));
    present = true;
    return true;
}
