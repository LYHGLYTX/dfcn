// The performance chooser owns typed story subjects. Bind a borrowed caption
// to its live entry before resolving the native Unknown name placeholder.
static std::optional<NativePerformanceChoice> capture_native_performance_choice(
        uintptr_t caption_address) {
#ifdef _WIN32
    const uintptr_t base = native_history_profile_base();
    if (!base || !caption_address) return std::nullopt;
    // 53.16 PE: b0340e passes this global to 870260. Its draw at 8709c4
    // passes entry+8 directly; the search filter borrows entry+0x28.
    const uintptr_t perform = native_reference_address(base, 0x18a85b0);
    uint8_t open = 0;
    NativeBorrowedVector<uintptr_t> choices;
    if (!perform || !native_history_copy(perform, open) || open != 1 ||
            !native_history_read_vector(perform + 0x20, choices) ||
            choices.size() == 0 || choices.size() > 65536) return std::nullopt;
    std::vector<uintptr_t> entries(choices.size());
    if (!native_history_copy_bytes(reinterpret_cast<uintptr_t>(choices.begin),
            entries.data(), entries.size() * sizeof(uintptr_t))) return std::nullopt;
    const auto found = std::find_if(entries.begin(), entries.end(), [&](uintptr_t entry) {
        return entry && entry <= UINTPTR_MAX - 0x78 &&
            (caption_address == entry + 8 || caption_address == entry + 0x28);
    });
    if (found == entries.end()) return std::nullopt;
    const uintptr_t entry = *found;
    NativePerformanceChoice result;
    std::string complete;
    if (!native_history_copy(entry, result.type) ||
            !native_history_copy(entry + 0x68, result.id) ||
            !native_history_copy_string(entry + 0x28, complete) || complete != "Unknown")
        return std::nullopt;
    // STORY_SITE, STORY_HF, STORY_ENTITY and STORY_SUBREGION use separate
    // native enum values despite sharing the same display placeholder.
    if (result.type < 8 || result.type > 11) return std::nullopt;
    if (result.type != 9) return result;
    uintptr_t identity = 0;
    if (!native_history_copy(entry + 0x70, identity)) return std::nullopt;
    // A known assumed identity never authorizes revealing the real figure's
    // name or species. Retain only the chooser's visible subject category.
    if (identity) return result;
    const uintptr_t figure = native_history_find_subject(
        base, NativeHistoryObjectKind::Figure, result.id);
    uint8_t has_name = 0;
    if (!figure || !native_history_copy(native_history_object_field(
            figure, "historical_figure", 0xaa), has_name)) return std::nullopt;
    if (has_name) return result;
    result.unnamed = true;
    int16_t race = -1, caste = -1;
    if (native_history_copy(native_history_object_field(
                figure, "historical_figure", 2, sizeof(race)), race) &&
            native_history_copy(native_history_object_field(
                figure, "historical_figure", 4, sizeof(caste)), caste))
        capture_native_history_creature_label(base, race, caste, false, result.species, false);
    return result;
#else
    // The current ELF bindings do not expose adventure_interfacest::perform.
    // Do not apply PE globals or chooser offsets to an unbound native layout.
    (void)caption_address;
    return std::nullopt;
#endif
}
