// Read-only access to the native world-map artifact paragraph cache. The
// caller must prove the current hover frame and match its visible text before
// using any of these owned lines; a cached paragraph alone does not own UI.
static std::optional<std::vector<std::string>> native_world_artifact_description_lines() {
#ifdef _WIN32
    const uintptr_t base = native_history_profile_base();
    if (!base) return std::nullopt;
    const auto current_screen = [&]() -> uintptr_t {
        const uintptr_t view = native_reference_address(base, native_history_layout::gview_rva);
        if (!view || view > UINTPTR_MAX - 8) return 0;
        uintptr_t screen = view + 8;
        std::array<uintptr_t, 64> visited{};
        for (size_t depth = 0; depth < visited.size(); ++depth) {
            if (!screen || screen > UINTPTR_MAX - 8 ||
                    std::find(visited.begin(), visited.begin() + depth, screen) !=
                        visited.begin() + depth) return 0;
            visited[depth] = screen;
            uintptr_t child = 0;
            if (!native_history_copy(screen + 8, child)) return 0;
            if (child) { screen = child; continue; }
            uintptr_t table = 0;
            // Pinned Steam 53.16 symbols.xml: viewscreen_worldst. Its render
            // entry is RVA 0x1c17e0; other screens must not lend cached data.
            return native_history_copy(screen, table) &&
                table == native_reference_address(base, 0x1603050) ? screen : 0;
        }
        return 0;
    };
    const uintptr_t screen = current_screen();
    if (!screen || screen > UINTPTR_MAX - 0x8468) return std::nullopt;
    uintptr_t artifact = 0, item = 0;
    NativeBorrowedVector<uintptr_t> native_lines;
    // The native hover-change branch at 0x1d1c94 stores the artifact at
    // +0x8448, then calls 0x1d9c30. That builder reads artifact+0x90 for
    // getDescription (0x1d9dc9) and inlines wrapping into +0x8450. There is
    // no add_paragraph call for the shared paragraph hook to intercept.
    // The no-hover branch clears +0x8448 (0x1d2348) but retains the vector.
    if (!native_history_copy(screen + 0x8448, artifact) || !artifact ||
            artifact > UINTPTR_MAX - 0x98 ||
            !native_history_copy(artifact + 0x90, item) || !item ||
            !native_history_copy(screen + 0x8450, native_lines) ||
            !native_lines.valid(4096) || !native_lines.size()) return std::nullopt;
    std::vector<uintptr_t> pointers(native_lines.size());
    if (!native_history_copy_bytes(reinterpret_cast<uintptr_t>(native_lines.begin),
            pointers.data(), pointers.size() * sizeof(uintptr_t))) return std::nullopt;
    std::vector<std::string> lines;
    lines.reserve(pointers.size());
    size_t bytes = 0;
    for (const uintptr_t address : pointers) {
        GameString text{};
        // The builder tests length > 53 after every appended byte at
        // 0x1d9ebd, removes at least one byte before emitting at 0x1d9fa3,
        // and emits the remaining <=53-byte tail at 0x1da05a. Even a long
        // unbroken word passes through that same wrapping path.
        if (!native_history_copy(address, text) || text.size > text.capacity ||
                text.size > 53 || (text.capacity <= 15 && text.size > 15) ||
                text.size > 65536 - bytes) return std::nullopt;
        const uintptr_t data = text.capacity <= 15 ? address
            : reinterpret_cast<uintptr_t>(text.storage.heap);
        std::string line(text.size, '\0');
        if (text.size && !native_history_copy_bytes(data, line.data(), text.size))
            return std::nullopt;
        if (std::any_of(line.begin(), line.end(), [](char ch) {
                return ch == '\0' || ch == '\r' || ch == '\n';
            })) return std::nullopt;
        bytes += line.size();
        lines.push_back(std::move(line));
    }
    uintptr_t current_artifact = 0, current_item = 0;
    NativeBorrowedVector<uintptr_t> current_lines;
    // No state survives this call. Reject selection changes, replaced
    // vectors and detached world screens instead of accepting a stale cache.
    if (!bytes || current_screen() != screen ||
            !native_history_copy(screen + 0x8448, current_artifact) ||
            current_artifact != artifact ||
            !native_history_copy(artifact + 0x90, current_item) || current_item != item ||
            !native_history_copy(screen + 0x8450, current_lines) ||
            current_lines.begin != native_lines.begin || current_lines.end != native_lines.end ||
            current_lines.capacity != native_lines.capacity) return std::nullopt;
    return lines;
#else
    // ELF calls the shared add_paragraph entry and uses its captured source.
    return std::nullopt;
#endif
}
