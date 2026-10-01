// Both native entry locators supply this context. Picker traversal, name
// selection, query restoration and result publication have one implementation.
using NativeArenaFilterFn = void (*)(unsigned char *);
struct NativeArenaContext {
    unsigned char *picker = nullptr;
    const void *raws = nullptr;
    NativeArenaFilterFn filter = nullptr;
    size_t raw_name = 0x20;
    size_t raw_castes = 0x178;
    size_t caste_name = 0x20;
};
static NativeArenaContext g_native_arena;

static void bind_native_arena_context(unsigned char *picker, const void *raws,
                                      NativeArenaFilterFn filter) {
    g_native_arena = {picker, raws, filter};
    g_arena_translated_search_dirty = true;
}
static void clear_native_arena_context() {
    g_native_arena = {};
    g_arena_translated_search_dirty = false;
}
static bool native_arena_open() {
    return g_native_arena.picker && g_native_arena.raws && g_native_arena.filter &&
        g_native_arena.picker[0] != 0;
}
static NativeString *native_arena_query() {
    return g_native_arena.picker ? reinterpret_cast<NativeString *>(g_native_arena.picker + 0x18) : nullptr;
}
static bool native_arena_candidates(std::vector<NativeArenaCandidate> &result) {
    if (!native_arena_open()) return false;
    const auto races = NativeBorrowedVector<int16_t>::read(g_native_arena.picker + 0x68);
    const auto castes = NativeBorrowedVector<int16_t>::read(g_native_arena.picker + 0x80);
    if (!races.valid(1u << 18) || !castes.valid(1u << 18) || races.size() != castes.size()) return false;
    result.reserve(races.size());
    for (size_t i = 0; i < races.size(); ++i) result.emplace_back(races.begin[i], castes.begin[i]);
    return true;
}
static const NativeString *native_arena_candidate_name(int16_t race, int16_t caste) {
    if (!g_native_arena.raws || race < 0) return nullptr;
    const auto raws = NativeBorrowedVector<unsigned char *>::read(g_native_arena.raws);
    if (!raws.valid(1u << 18) || static_cast<size_t>(race) >= raws.size()) return nullptr;
    const auto *raw = raws.begin[race];
    if (!raw) return nullptr;
    if (caste >= 0) {
        const auto castes = NativeBorrowedVector<unsigned char *>::read(raw + g_native_arena.raw_castes);
        if (castes.valid(1u << 16) && static_cast<size_t>(caste) < castes.size() && castes.begin[caste]) {
            const auto *name = reinterpret_cast<const NativeString *>(castes.begin[caste] + g_native_arena.caste_name);
            std::string_view text;
            if (native_string_view(name, &text, 4096) && !text.empty()) return name;
        }
    }
    return reinterpret_cast<const NativeString *>(raw + g_native_arena.raw_name);
}
static bool native_arena_filter_reset(std::string_view saved_query) {
    if (!native_arena_open()) return false;
    NativeString *query = native_arena_query();
    std::string_view current;
    if (!native_string_view(query, &current, 4096) || current != saved_query) return false;
    struct RestoreQuery {
        NativeString *query;
        std::string_view saved;
        ~RestoreQuery() {
            if (!native_string_set_length(query, saved.size())) return;
            char *data = native_string_data(query);
            std::memcpy(data, saved.data(), saved.size());
            data[saved.size()] = '\0';
        }
    } restore{query, saved_query};
    if (!native_string_set_length(query, 0)) return false;
    g_native_arena.filter(g_native_arena.picker);
    return true;
}
static bool native_arena_filter_assign(const std::vector<NativeArenaCandidate> &result) {
    if (!native_arena_open()) return false;
    const auto races = NativeBorrowedVector<int16_t>::read(g_native_arena.picker + 0x38);
    const auto castes = NativeBorrowedVector<int16_t>::read(g_native_arena.picker + 0x50);
    if (!races.valid(1u << 18) || !castes.valid(1u << 18) ||
        result.size() > races.size() || result.size() > castes.size()) return false;
    for (size_t i = 0; i < result.size(); ++i) {
        races.begin[i] = result[i].first;
        castes.begin[i] = result[i].second;
    }
    int16_t *race_end = races.begin ? races.begin + result.size() : nullptr;
    int16_t *caste_end = castes.begin ? castes.begin + result.size() : nullptr;
    std::memcpy(g_native_arena.picker + 0x40, &race_end, sizeof(race_end));
    std::memcpy(g_native_arena.picker + 0x58, &caste_end, sizeof(caste_end));
    return true;
}
