// The Allegro render thread can only consume owned, already translated text.
// The normal Overlay render publishes this small tail of complete reports
// while it already owns TranslationStateScope, before any Stonesense lookup.
using DfhackStonesenseAnnouncementMap = std::unordered_map<std::string, std::string>;
static std::atomic<std::shared_ptr<const DfhackStonesenseAnnouncementMap>>
    g_dfhack_stonesense_announcements;

struct DfhackStonesenseAnnouncementRow {
    uintptr_t address = 0;
    uint64_t group = 0;
    int32_t id = -1;
    int type = -1;
    int repeats = 0;
    bool continued = false;
    std::array<int32_t, 5> identity{};
    uint64_t pool = 0;
    std::string source;
    bool operator==(const DfhackStonesenseAnnouncementRow &) const = default;
};
struct DfhackStonesenseAnnouncementKey {
    uintptr_t world = 0;
    std::vector<DfhackStonesenseAnnouncementRow> tail;
    bool operator==(const DfhackStonesenseAnnouncementKey &) const = default;
};
struct DfhackStonesenseAnnouncementGroup {
    uint64_t id = 0;
    uintptr_t head = 0;
    int32_t head_id = -1;
    int type = -1;
    std::string source;
    std::vector<DfhackStonesenseAnnouncementRow> rows;
    bool complete = false;
};
// Only the normal render/dictionary lifecycle touches this memo. It is never
// read by a Stonesense callback and contains no borrowed game storage.
static std::optional<DfhackStonesenseAnnouncementKey>
    g_dfhack_stonesense_announcement_key;

static void clear_dfhack_stonesense_announcements() noexcept {
    g_dfhack_stonesense_announcements.store({}, std::memory_order_release);
    g_dfhack_stonesense_announcement_key.reset();
}

static std::optional<std::string> lookup_dfhack_stonesense_announcement(
        std::string_view source) {
    if (source.empty() || source.size() > 65536 ||
            source.find('\0') != std::string_view::npos) return std::nullopt;
    const auto snapshot = g_dfhack_stonesense_announcements.load(std::memory_order_acquire);
    if (!snapshot) return std::nullopt;
    const auto found = snapshot->find(std::string(source));
    return found == snapshot->end() ? std::nullopt
        : std::optional<std::string>(found->second);
}

static DfhackStonesenseAnnouncementRow copy_dfhack_stonesense_announcement_row(
        const NativeAnnouncementCachedRow &source) {
    return {source.address, source.group, source.row.id, source.row.type,
        source.row.repeats, source.row.continued, source.row.identity,
        source.row.pool, source.row.source};
}

void Overlay::publish_dfhack_stonesense_announcements() const {
    // This function is a render-side operation. The caller already holds
    // TranslationStateScope; it must never be entered by an Allegro hook.
    if (!translation_enabled() || !native_dfhack_stonesense_window_active()) {
        clear_dfhack_stonesense_announcements();
        return;
    }
    try {
        // Refresh the normal owned history before taking a small copy. This
        // is the only game-backed step and occurs on the normal render side.
        native_announcement_sources();
        DfhackStonesenseAnnouncementKey key;
        // Stonesense draws world.status.announcements, which is a display
        // subset of reports. Resolve this generated vector field explicitly;
        // the last ten entries of the full report history are not its tail.
        std::vector<uintptr_t> addresses;
        if (!native_announcement_display_tail(addresses)) {
            clear_dfhack_stonesense_announcements();
            return;
        }
        const size_t count = addresses.size();
        key.tail.reserve(count);
        for (size_t at = 0; at < count; ++at) {
            NativeAnnouncementCachedRow row;
            row.address = addresses[at];
            if (!native_announcement_history_row(row.address, row.row)) {
                clear_dfhack_stonesense_announcements();
                return;
            }
            key.tail.push_back(copy_dfhack_stonesense_announcement_row(row));
        }
        std::map<uint64_t, DfhackStonesenseAnnouncementGroup> groups;
        {
            std::lock_guard<std::mutex> lock(g_native_announcement_mutex);
            if (g_native_announcement_history_full_refresh) {
                // A failed history refresh cannot prove that a retained tail
                // belongs to the current world or that its heads still exist.
                clear_dfhack_stonesense_announcements();
                return;
            }
            key.world = g_native_announcement_history_world;
            const auto &rows = g_native_announcement_rows;
            if (g_dfhack_stonesense_announcement_key &&
                    *g_dfhack_stonesense_announcement_key == key) return;
            std::unordered_map<uintptr_t, const DfhackStonesenseAnnouncementRow *> wanted;
            for (const auto &row : key.tail) wanted.emplace(row.address, &row);
            // The displayed reports can be older than the latest history
            // reports. Walk backwards only until their addresses are found,
            // and validate their complete owned identity before using a group.
            for (auto it = rows.rbegin(); it != rows.rend() && !wanted.empty(); ++it) {
                const auto display = wanted.find(it->address);
                if (display == wanted.end()) continue;
                auto owned = copy_dfhack_stonesense_announcement_row(*it);
                owned.group = 0;
                // Repeating a report changes its live repeat_count without
                // replacing the cached physical source row or its identity.
                owned.repeats = display->second->repeats;
                const bool same = owned == *display->second;
                wanted.erase(display);
                if (!same || !it->group || groups.contains(it->group)) continue;
                const auto found = g_native_announcement_groups.find(it->group);
                if (found == g_native_announcement_groups.end()) continue;
                const auto &group = found->second;
                groups.emplace(it->group, DfhackStonesenseAnnouncementGroup{
                    it->group, group.head, group.row.id, group.row.type,
                    group.source, {}, false});
            }
            // Each selected group has a true native head. Walk back only as
            // far as those heads, including their continuations outside the
            // visible last ten rows; do not copy or scan unrelated history.
            size_t unfinished = groups.size();
            for (auto it = rows.rbegin(); it != rows.rend() && unfinished; ++it) {
                const auto found = groups.find(it->group);
                if (found == groups.end() || found->second.complete) continue;
                auto &group = found->second;
                group.rows.push_back(copy_dfhack_stonesense_announcement_row(*it));
                if (it->address == group.head && it->row.id == group.head_id) {
                    group.complete = true;
                    --unfinished;
                }
            }
        }
        // The native capture lock is released before any grammar, color
        // mapping or UTF-8 work. Readers see only the final owned map.
        auto output = std::make_shared<DfhackStonesenseAnnouncementMap>();
        std::unordered_set<std::string> ambiguous;
        bool retry = false;
        dfcn::TranslationWorkScope work;
        for (auto &[id, group] : groups) {
            if (!group.complete || group.rows.empty() || group.source.empty()) continue;
            std::reverse(group.rows.begin(), group.rows.end());
            bool valid = !group.rows.front().continued;
            size_t cursor = 0, weight = 0;
            for (size_t at = 0; valid && at < group.rows.size(); ++at) {
                const auto &row = group.rows[at];
                if (row.type != group.type || row.group != id ||
                        (at && !row.continued)) { valid = false; break; }
                if (at) {
                    if (cursor >= group.source.size() || group.source[cursor] != ' ') {
                        valid = false; break;
                    }
                    ++cursor;
                }
                if (row.source.size() > group.source.size() - cursor ||
                        group.source.compare(cursor, row.source.size(), row.source) != 0) {
                    valid = false; break;
                }
                cursor += row.source.size();
                weight += row.source.size();
            }
            if (!valid || cursor != group.source.size() || !weight) continue;
            std::optional<std::string> target;
            try {
                std::vector<int> source_colors(group.source.size(), 0), target_colors;
                target = translate_complete_announcement(group.source, source_colors, target_colors);
            } catch (const dfcn::TranslationWorkLimit &) {
                // Cached completed groups are cheap on the next frame. Do
                // not memoize budget exhaustion as a permanent missing text.
                retry = true;
                break;
            }
            if (!target) {
                // An unresolved complete report must not inherit another
                // report's translated fragment merely because a row matches.
                for (const auto &row : group.rows) {
                    auto source = native_text_to_utf8(row.source);
                    output->erase(source);
                    ambiguous.insert(std::move(source));
                }
                continue;
            }
            std::vector<uint32_t> codepoints;
            if (!decode_utf8(*target, codepoints)) continue;
            std::vector<size_t> boundaries{0};
            boundaries.reserve(codepoints.size() + 1);
            for (size_t at = 0; at < target->size(); ++at)
                if (at + 1 == target->size() ||
                        (static_cast<unsigned char>((*target)[at + 1]) & 0xc0) != 0x80)
                    boundaries.push_back(at + 1);
            size_t consumed = 0, first = 0;
            for (const auto &row : group.rows) {
                consumed += row.source.size();
                // Apportion complete translated codepoints, never UTF-8
                // bytes. The last row owns the exact remaining suffix.
                const size_t last = consumed == weight ? codepoints.size()
                    : std::min(codepoints.size(), static_cast<size_t>(
                        static_cast<long double>(consumed) * codepoints.size() / weight));
                std::string line = target->substr(boundaries[first],
                    boundaries[last] - boundaries[first]);
                first = last;
                if (line.empty()) line = " "; // suppress a proved empty owned row
                std::string source = native_text_to_utf8(row.source);
                if (source.empty() || ambiguous.contains(source)) continue;
                const auto existing = output->find(source);
                if (existing == output->end()) output->emplace(std::move(source), std::move(line));
                else if (existing->second != line) {
                    ambiguous.insert(source);
                    output->erase(existing);
                }
            }
        }
        if (retry) {
            // A pending group might share a source row with a completed one.
            // Publish only after all selected groups can take part in the
            // ambiguity decision; retain completed parser cache work to retry.
            clear_dfhack_stonesense_announcements();
            return;
        }
        g_dfhack_stonesense_announcements.store(std::move(output), std::memory_order_release);
        g_dfhack_stonesense_announcement_key = std::move(key);
    } catch (...) {
        // No partial map or dangling source escapes a failed render update.
        // Clearing the memo lets the next normal frame recover automatically.
        clear_dfhack_stonesense_announcements();
    }
}
