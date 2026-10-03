// Capture IDs and their actual name[0] on the render side through existing
// edition/structure bindings. No Console callback reaches native world memory.
static std::shared_ptr<const DfhackRawCreatureLabels> native_dfhack_raw_creature_labels() {
    static std::mutex mutex;
    static std::array<uintptr_t, 5> stamp{};
    static std::shared_ptr<const DfhackRawCreatureLabels> cached;
    std::lock_guard<std::mutex> lock(mutex);
    const uintptr_t address = native_history_page_address(NativeHistoryPageSymbol::Creatures);
    NativeBorrowedVector<uintptr_t> creatures;
    uintptr_t world = 0;
    if (!address || !native_history_read_vector(address, creatures) || creatures.size() > 262144 ||
            !native_history_copy(native_history_global(0x24ebb58), world)) {
        stamp = {};
        cached.reset();
        return {};
    }
    const std::array<uintptr_t, 5> current{world, reinterpret_cast<uintptr_t>(creatures.begin),
        reinterpret_cast<uintptr_t>(creatures.end),
        creatures.size() ? native_history_vector_at(creatures, 0) : 0,
        creatures.size() ? native_history_vector_at(creatures, creatures.size() - 1) : 0};
    if (cached && current == stamp) return cached;
    auto labels = std::make_shared<DfhackRawCreatureLabels>();
    labels->reserve(creatures.size());
    for (size_t index = 0; index < creatures.size(); ++index) {
        const uintptr_t creature = native_history_vector_at(creatures, index);
        std::string id, name;
        if (!creature || !native_history_copy_string(native_history_object_field(
                creature, "creature_raw", 0, sizeof(NativeString)), id) ||
                !native_history_copy_string(native_history_object_field(
                    creature, "creature_raw", 0x20, sizeof(NativeString)), name)) {
            stamp = {};
            cached.reset();
            return {};
        }
        if (!id.empty() && !name.empty()) labels->insert_or_assign(id, native_text_to_utf8(name));
    }
    stamp = current;
    cached = std::move(labels);
    return cached;
}

// creature_raw.name is a bound array of three consecutive NativeString values.
// Resolve both elements through that array field, rather than assuming an
// edition-specific object offset. This owned map is captured on the render side.
static std::shared_ptr<const DfhackRawCreatureLabels> native_dfhack_raw_creature_adjectives() {
    static std::mutex mutex;
    static std::array<uintptr_t, 5> stamp{};
    static std::shared_ptr<const DfhackRawCreatureLabels> cached;
    std::lock_guard<std::mutex> lock(mutex);
    const uintptr_t address = native_history_page_address(NativeHistoryPageSymbol::Creatures);
    NativeBorrowedVector<uintptr_t> creatures;
    uintptr_t world = 0;
    if (!address || !native_history_read_vector(address, creatures) || creatures.size() > 262144 ||
            !native_history_copy(native_history_global(0x24ebb58), world)) {
        stamp = {};
        cached.reset();
        return {};
    }
    const std::array<uintptr_t, 5> current{world, reinterpret_cast<uintptr_t>(creatures.begin),
        reinterpret_cast<uintptr_t>(creatures.end),
        creatures.size() ? native_history_vector_at(creatures, 0) : 0,
        creatures.size() ? native_history_vector_at(creatures, creatures.size() - 1) : 0};
    if (cached && current == stamp) return cached;
    auto labels = std::make_shared<DfhackRawCreatureLabels>();
    labels->reserve(creatures.size());
    std::unordered_set<std::string> ambiguous;
    constexpr size_t name_coordinate = 0x20;
    constexpr size_t adjective_coordinate = name_coordinate + 2 * sizeof(NativeString);
    for (size_t index = 0; index < creatures.size(); ++index) {
        const uintptr_t creature = native_history_vector_at(creatures, index);
        std::string name, adjective;
        if (!creature || !native_history_copy_string(native_history_object_field(
                creature, "creature_raw", name_coordinate, sizeof(NativeString)), name) ||
                !native_history_copy_string(native_history_object_field(
                    creature, "creature_raw", adjective_coordinate, sizeof(NativeString)), adjective)) {
            stamp = {};
            cached.reset();
            return {};
        }
        std::string key = lower(native_text_to_utf8(adjective));
        std::string value = native_text_to_utf8(name);
        if (key.empty() || value.empty() || ambiguous.contains(key)) continue;
        const auto found = labels->find(key);
        if (found == labels->end()) {
            labels->emplace(std::move(key), std::move(value));
        } else if (found->second != value) {
            labels->erase(found);
            ambiguous.insert(std::move(key));
        }
    }
    stamp = current;
    cached = std::move(labels);
    return cached;
}
