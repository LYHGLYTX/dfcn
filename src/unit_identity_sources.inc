// These associations are emitted only by unit formatters after reading a
// unit's semantic fields. Text equality binds a capture; it never determines
// whether a field is a nickname, profession, or species.
static std::string native_text_to_utf8(std::string_view input);
struct NativeUnitIdentitySource {
    std::string source, target;
    uintptr_t unit_owner = 0;
    bool english_name = false;
    bool character_header = false;
};
static std::mutex g_native_unit_identity_mutex;
static uint64_t g_native_unit_identity_epoch = 0;
static std::unordered_map<uintptr_t, NativeUnitIdentitySource> g_native_unit_identity_owners;
static std::unordered_map<std::string, std::optional<std::string>> g_native_unit_identity_sources;
static bool &native_unit_identity_rendering() {
    return reloadable_thread_state<bool, struct NativeUnitIdentityRenderingTag>();
}

static void clear_native_unit_identities() {
    std::lock_guard<std::mutex> lock(g_native_unit_identity_mutex);
    g_native_unit_identity_owners.clear();
    g_native_unit_identity_sources.clear();
    g_native_unit_identity_epoch = 0;
}

static void remember_native_unit_identity(uintptr_t owner, std::string_view source,
        std::string_view target, uintptr_t unit_owner = 0, bool english_name = false,
        bool character_header = false) {
    if (!owner || source.empty() || source.size() > 65536 || target.size() > 262144) return;
    // A formatter can emit a nonempty name through a branch whose semantic
    // fields were not captured. An empty translation must never claim and
    // suppress that native name. Replace any old binding for this owner with
    // its current native spelling instead.
    const std::string resolved_target = target.empty()
        ? native_text_to_utf8(source) : std::string(target);
    std::lock_guard<std::mutex> lock(g_native_unit_identity_mutex);
    const auto epoch = g_embark_item_capture_epoch.load(std::memory_order_acquire);
    if (g_native_unit_identity_epoch != epoch) {
        g_native_unit_identity_owners.clear();
        g_native_unit_identity_sources.clear();
        g_native_unit_identity_epoch = epoch;
    }
    if (g_native_unit_identity_owners.size() >= 8192 &&
        !g_native_unit_identity_owners.contains(owner)) return;
    g_native_unit_identity_owners[owner] = {
        std::string(source), resolved_target, unit_owner, english_name, character_header};
    if (g_native_unit_identity_sources.size() >= 16384 &&
            !g_native_unit_identity_sources.contains(std::string(source))) return;
    const auto [entry, inserted] = g_native_unit_identity_sources.try_emplace(
        std::string(source), resolved_target);
    // Ambiguous spelling must not assign one unit's custom name to another
    // unit's species. Their per-draw owner bindings remain authoritative.
    if (!inserted && entry->second && *entry->second != resolved_target) entry->second.reset();
}

static std::optional<NativeUnitIdentitySource> native_unit_identity_source_binding(
        std::string_view source, uintptr_t owner) {
    if (!owner || native_unit_identity_rendering()) return std::nullopt;
    std::lock_guard<std::mutex> lock(g_native_unit_identity_mutex);
    const auto found = g_native_unit_identity_owners.find(owner);
    if (found == g_native_unit_identity_owners.end() || found->second.source != source)
        return std::nullopt;
    return found->second;
}

static std::optional<std::string> native_unit_identity_source_target(
        std::string_view source, uintptr_t owner = 0) {
    if (native_unit_identity_rendering()) return std::nullopt;
    if (owner) {
        if (const auto binding = native_unit_identity_source_binding(source, owner))
            return binding->target;
        return std::nullopt;
    }
    std::lock_guard<std::mutex> lock(g_native_unit_identity_mutex);
    const auto found = g_native_unit_identity_sources.find(std::string(source));
    if (found == g_native_unit_identity_sources.end()) return std::nullopt;
    return found->second ? found->second : std::optional<std::string>(native_text_to_utf8(source));
}

struct NativeUnitIdentityRenderScope {
    bool previous = native_unit_identity_rendering();
    NativeUnitIdentityRenderScope() { native_unit_identity_rendering() = true; }
    ~NativeUnitIdentityRenderScope() { native_unit_identity_rendering() = previous; }
};
