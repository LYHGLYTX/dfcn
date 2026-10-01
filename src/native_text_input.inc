// Input editing and translated search policy is identical on both hosts.
// Native adapters own string mutation, picker storage and its original filter.
using NativeArenaCandidate = std::pair<std::int16_t, std::int16_t>;
static bool native_arena_open();
static NativeString *native_arena_query();
static bool native_arena_candidates(std::vector<NativeArenaCandidate> &candidates);
static const NativeString *native_arena_candidate_name(std::int16_t race, std::int16_t caste);
static bool native_arena_filter_reset(std::string_view saved_query);
static bool native_arena_filter_assign(const std::vector<NativeArenaCandidate> &candidates);
static bool g_arena_translated_search_dirty = false;
static void capture_name_editor_search_input(NativeString *, int, unsigned int);
static void clear_name_editor_search();

static bool contains_non_ascii_codepoint(std::string_view text) {
    std::vector<uint32_t> codepoints;
    return decode_utf8(text, codepoints) &&
        std::any_of(codepoints.begin(), codepoints.end(),
            [](uint32_t value) { return value > 0x7f; });
}

// Native search fields share a CP437 case converter. Unicode queries must
// keep every multibyte character intact while retaining ASCII case folding.
// Return false for legacy input so the caller uses its original converter.
static bool fold_native_unicode_search_query(NativeString *text) {
    std::string_view query;
    if (!native_string_view(text, &query, 4096) ||
        !contains_non_ascii_codepoint(query)) return false;
    char *bytes = native_string_data(text);
    for (size_t i = 0; i < query.size(); ++i)
        if (bytes[i] >= 'A' && bytes[i] <= 'Z') bytes[i] += 'a' - 'A';
    return true;
}

static size_t bounded_text_input_length(const char *text) {
    if (!text) return 0;
    size_t length = 0;
    while (length + 1 < SDL_TEXTINPUTEVENT_TEXT_SIZE && text[length]) ++length;
    return length;
}

static size_t utf8_prefix_bytes(std::string_view text, size_t count) {
    size_t cursor = 0;
    while (cursor < text.size() && count) {
        const auto decoded = decode_utf8_at(text, cursor);
        if (!decoded) return 0;
        cursor += decoded->second;
        --count;
    }
    return cursor;
}

static size_t utf8_aware_logical_length(std::string_view text) {
    size_t cursor = 0, count = 0;
    while (cursor < text.size()) {
        const auto decoded = decode_utf8_at(text, cursor);
        cursor += decoded ? decoded->second : 1;
        ++count;
    }
    return count;
}

template<typename Original>
static char capture_native_text_input(NativeString *target, int maximum,
        unsigned int flags, void *keys, const char *input_text,
        Original original, NativeInputCallbackScope &callback) {
    if (!original) return 0;
    std::string before;
    std::string_view current;
    bool safe_target = false;
    std::string forwarded;
    const char *forwarded_text = input_text;
    int forwarded_maximum = maximum;
    unsigned int forwarded_flags = flags;
    try {
    safe_target = native_string_view(target, &current, (1u << 20) - 1);
    if (safe_target) before.assign(current);
    const size_t input_length = bounded_text_input_length(input_text);
    if (safe_target && input_length && maximum >= 0) {
        const std::string_view input(input_text, input_length);
        std::vector<uint32_t> codepoints;
        if (decode_utf8(input, codepoints)) {
            const size_t logical_size = utf8_aware_logical_length(before);
            const size_t remaining = logical_size < static_cast<size_t>(maximum)
                ? static_cast<size_t>(maximum) - logical_size : 0;
            const size_t accepted = std::min(remaining, codepoints.size());
            const size_t bytes = utf8_prefix_bytes(input, accepted);
            forwarded.assign(input.substr(0, bytes));
            forwarded_text = forwarded.c_str();
            if (before.size() != logical_size || bytes != accepted)
                forwarded_maximum = static_cast<int>(std::min<size_t>(
                    INT32_MAX, before.size() + bytes));
            // STRINGENTRY_SYMBOLS is the native arbitrary-byte mode. Its
            // filename exclusion check still applies before accepting bytes.
            if (bytes != accepted) forwarded_flags |= 0x10;
        }
    }
    } catch (...) {
        safe_target = false;
        forwarded_text = input_text;
        forwarded_maximum = maximum;
        forwarded_flags = flags;
    }
    const char handled = callback.call_native([&] {
        return original(target, forwarded_maximum, forwarded_flags, keys, forwarded_text);
    });

    try {
    std::string_view after;
    if (safe_target && native_string_view(target, &after, 1u << 20)) {
        std::vector<uint32_t> previous_codepoints;
        if (!before.empty() && after.size() + 1 == before.size() &&
            std::string_view(before).substr(0, after.size()) == after &&
            decode_utf8(before, previous_codepoints)) {
            // The native operation removes one byte. Complete a deletion
            // only when the old string proves it was valid UTF-8; legacy
            // single-byte game text must retain its native editing behavior.
            size_t start = before.size() - 1;
            while (start && (static_cast<unsigned char>(before[start]) & 0xc0) == 0x80) --start;
            if (start < after.size()) native_string_set_length(target, start);
        }
        if (target == native_arena_query() &&
            native_string_view(target, &after, 4096) && before != after)
            g_arena_translated_search_dirty = true;
    }
    } catch (...) {
        // Plugin bookkeeping must not throw through the game ABI.
    }
    return handled;
}

static void apply_pending_arena_translated_search() {
    if (!g_arena_translated_search_dirty) return;
    g_arena_translated_search_dirty = false;
    try {
    if (!native_arena_open()) return;
    std::string_view current;
    if (!native_string_view(native_arena_query(), &current, 4096) ||
        current.empty() || !contains_non_ascii_codepoint(current)) return;
    const std::string query(current);
    std::vector<NativeArenaCandidate> candidates;
    if (!native_arena_candidates(candidates) || !native_arena_filter_reset(query)) {
        log_line("WARN", "Cannot restore the complete native Arena creature list");
        return;
    }
    const size_t total = candidates.size();
    std::erase_if(candidates, [&](const NativeArenaCandidate &candidate) {
        std::string_view source;
        return !native_string_view(native_arena_candidate_name(candidate.first, candidate.second),
                                   &source, 4096) || source.empty() ||
               !g_overlay.translated_search_matches(source, query);
    });
    if (!native_arena_filter_assign(candidates)) {
        log_line("WARN", "Cannot publish translated Arena creature search results");
        return;
    }
    log_line("INFO", "Arena complete creature translated search `" + query + "` matched " +
        std::to_string(candidates.size()) + " of " + std::to_string(total) + " candidates");
    } catch (...) {
        // Leave the native list usable if translation/allocation fails.
    }
}

static void capture_arena_translated_sdl_text(std::string_view committed) {
    try {
    if (native_arena_open() && contains_non_ascii_codepoint(committed))
        g_arena_translated_search_dirty = true;
    } catch (...) {
    }
}
