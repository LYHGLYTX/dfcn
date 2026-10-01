// Incoming call signatures only; every adapter enters the common callback.
#ifdef _WIN32
static void capture_native_history_relationship(void *history, void *chunk,
        int32_t index, NativeString *source, void *context) {
    capture_native_history_relationship_call(history, chunk, index, source, context, [&] {
        reinterpret_cast<void (*)(void *, void *, int32_t, NativeString *, void *)>(
            native_history_page_address(NativeHistoryPageSymbol::Relationship))(
            history, chunk, index, source, context);
    });
}
static int32_t capture_native_history_war_choice(int32_t count, void *collection,
        const void *categories, const void *indices) {
    NativeHistoryCallbackScope callback;
    const int32_t selected = reinterpret_cast<int32_t (*)(int32_t)>(
        native_history_profile_base() + 0x71f30)(count);
    record_native_history_war_choice(selected, count, collection, categories, indices);
    return selected;
}
#else
static void capture_native_history_relationship(void *history, void *chunk,
        int32_t index, NativeString *source, void *context, bool translated, bool glyphs) {
    capture_native_history_relationship_call(history, chunk, index, source, context, [&] {
        reinterpret_cast<void (*)(void *, void *, int32_t, NativeString *, void *, bool, bool)>(
            native_history_page_address(NativeHistoryPageSymbol::Relationship))(
            history, chunk, index, source, context, translated, glyphs);
    });
}

// SysV returns these two INTEGER classes in RAX/RDX. The replaced move
// does not alter either register; retain both while observing the chosen
// array offset. No RNG call or random-index algorithm is duplicated.
struct NativeHistorySelectedRegisters { uintptr_t offset, category; };
static NativeHistorySelectedRegisters capture_native_elf_war_choice(void *collection,
        const void *frame, uintptr_t offset, uintptr_t category) {
    NativeHistoryCallbackScope callback;
    uintptr_t categories = 0, end = 0, indices = 0;
    const uintptr_t address = reinterpret_cast<uintptr_t>(frame);
    if (address >= 0x250 && native_history_copy(address - 0x250, categories) &&
        native_history_copy(address - 0x1a8, end) &&
        native_history_copy(address - 0x190, indices) && end >= categories &&
        (end - categories) % 4 == 0 && (end - categories) / 4 <= 1048576 &&
        offset % 4 == 0 && offset < end - categories && category == categories + offset) {
        record_native_history_war_choice(static_cast<int32_t>(offset / 4),
            static_cast<int32_t>((end - categories) / 4), collection,
            reinterpret_cast<const void *>(categories), reinterpret_cast<const void *>(indices));
    }
    return {offset, category};
}

static NativeString *capture_native_elf_page_end(NativeString *source, const char *literal) {
    return capture_native_history_page_counted_end(source, literal, std::strlen(literal));
}

template<int Section>
static NativeString *capture_native_elf_section_heading(NativeString *source, const char *literal) {
    return capture_native_history_section_heading<Section>(source, literal, std::strlen(literal));
}

static void capture_native_elf_related_entity(NativeString *source, int32_t id, int32_t flags) {
    capture_native_history_related_entity_begin(nullptr, source, id, flags);
}

static void capture_native_elf_related_figure(NativeString *source, int32_t id,
        void *context, int16_t first, int16_t second) {
    capture_native_history_related_figure_name(nullptr, source, id, context, first, second);
}

template<int Producer>
static void capture_native_elf_related_extra(NativeString *source, int32_t id, int32_t flags) {
    capture_native_history_related_extra_begin<Producer>(nullptr, source, id, flags);
}

#endif
