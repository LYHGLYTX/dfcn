// scripts/lever.lua assembles a lever head, zero or more PullLever jobs,
// and complete linked-building rows. Parse that authored record before
// resolving its role-specific words; names, enums, coordinates and the
// slash/backslash switch glyph never enter a word or caption translator.
static std::optional<std::string> translate_dfhack_lever_output(
        const DfhackOutputSnapshot &catalog, std::string_view source,
        bool console_utf8) {
    if (source.empty() || source.size() > 65536) return std::nullopt;
    struct Replacement {
        size_t begin, end;
        std::string target;
    };
    std::vector<Replacement> replacements;
    const auto space = [](unsigned char ch) { return native_prose_space(ch); };
    const auto skip_space = [&](size_t &at) {
        const size_t begin = at;
        while (at < source.size() && space(static_cast<unsigned char>(source[at]))) ++at;
        return at != begin;
    };
    const auto literal = [&](size_t &at, std::string_view text) {
        const size_t begin = at;
        for (size_t word = 0; word < text.size();) {
            if (space(static_cast<unsigned char>(text[word]))) {
                while (word < text.size() && space(static_cast<unsigned char>(text[word]))) ++word;
                if (!skip_space(at)) { at = begin; return false; }
            } else {
                if (at == source.size() || source[at] != text[word]) {
                    at = begin;
                    return false;
                }
                ++at;
                ++word;
            }
        }
        return true;
    };
    const auto integer = [&](size_t &at, bool signed_value) {
        const size_t begin = at;
        if (signed_value && at < source.size() && source[at] == '-') ++at;
        const size_t digits = at;
        while (at < source.size() && source[at] >= '0' && source[at] <= '9') ++at;
        if (at == digits) { at = begin; return false; }
        return true;
    };
    const auto coordinates = [&](size_t &at) {
        const size_t begin = at;
        if (literal(at, "@[") && integer(at, true) && literal(at, ", ") &&
                integer(at, true) && literal(at, ", ") && integer(at, true) &&
                literal(at, "]")) return true;
        at = begin;
        return false;
    };
    const auto replace = [&](std::string_view role, std::string_view word,
            size_t begin, size_t end) {
        const std::string key = "DFHack GUI Lever " + std::string(role) + ": " + std::string(word);
        const auto found = catalog.gui_fields.find(key);
        if (found == catalog.gui_fields.end() || !contains_cjk_utf8(found->second)) return false;
        replacements.push_back({begin, end, found->second});
        return true;
    };
    const auto phase = [&](size_t &at, std::initializer_list<std::string_view> allowed,
            std::string_view *matched = nullptr) {
        const size_t begin = at;
        while (at < source.size() && source[at] >= 'a' && source[at] <= 'z') ++at;
        const auto word = source.substr(begin, at - begin);
        if (std::find(allowed.begin(), allowed.end(), word) == allowed.end() ||
                !replace("phase", word, begin, at)) {
            at = begin;
            return false;
        }
        if (matched) *matched = word;
        return true;
    };
    const auto linked_row = [&](size_t &at) {
        const size_t caption_begin = at;
        if (!literal(at, "linked to")) return false;
        const size_t caption_end = at;
        if (!skip_space(at) || !replace("caption", "linked to", caption_begin, caption_end))
            return false;
        std::string_view state;
        if (!phase(at, {"raised", "retracted", "closed"}, &state)) return false;
        if (at < source.size() && source[at] == ',') {
            ++at;
            if (!skip_space(at)) return false;
            const bool known = state == "raised" ? phase(at, {"raising", "lowering"})
                : state == "retracted" ? phase(at, {"retracting", "unretracting"})
                : phase(at, {"closing", "opening"});
            if (!known || !literal(at, " (") || !integer(at, true) || !literal(at, ")"))
                return false;
        }
        if (!skip_space(at)) return false;
        const auto identifier_start = [](unsigned char ch) {
            return (ch >= 'A' && ch <= 'Z') || (ch >= 'a' && ch <= 'z') || ch == '_';
        };
        if (at == source.size() || !identifier_start(static_cast<unsigned char>(source[at])))
            return false;
        ++at;
        while (at < source.size() && (identifier_start(static_cast<unsigned char>(source[at])) ||
                (source[at] >= '0' && source[at] <= '9'))) ++at;
        // df.building_type is an enum token, not a generated building name.
        return literal(at, " #") && integer(at, false) && literal(at, " ") && coordinates(at);
    };
    const auto jobs = [&](size_t &at) {
        for (;;) {
            size_t next = at;
            if (!skip_space(next) || next == source.size() || source[next] != '(') return true;
            if (!literal(next, "(")) return false;
            const size_t caption_begin = next;
            if (!literal(next, "pull order")) return false;
            const size_t caption_end = next;
            if (!replace("caption", "pull order", caption_begin, caption_end)) return false;
            constexpr std::string_view flags[] = {"now", "repeat", "suspended"};
            size_t flag_after = 0;
            while (next < source.size() && source[next] == ',') {
                ++next;
                if (!skip_space(next)) return false;
                const size_t begin = next;
                while (next < source.size() && source[next] >= 'a' && source[next] <= 'z') ++next;
                const auto flag = source.substr(begin, next - begin);
                const auto found = std::find(std::begin(flags) + flag_after, std::end(flags), flag);
                if (found == std::end(flags) || !replace("job state", flag, begin, next)) return false;
                flag_after = static_cast<size_t>(found - std::begin(flags)) + 1;
            }
            if (!literal(next, ")")) return false;
            at = next;
        }
    };
    size_t begin = 0;
    skip_space(begin);
    size_t at = begin;
    if (source.substr(at).starts_with("linked")) {
        // Complete linked rows can remain visible after their lever head has
        // scrolled away. Their state/enum/ID/three-coordinate signature is
        // still required; an isolated word or a numeric table cannot match.
        if (!linked_row(at)) return std::nullopt;
    } else {
        if (at < source.size() && source[at] == '#') {
            ++at;
            if (!integer(at, false) || !literal(at, ": ")) return std::nullopt;
        }
        const size_t caption_begin = at;
        if (!literal(at, "lever")) return std::nullopt;
        const size_t caption_end = at;
        if (!literal(at, " #") || !integer(at, false)) return std::nullopt;
        const size_t name_begin = at;
        if (at == source.size() || !space(static_cast<unsigned char>(source[at]))) return std::nullopt;
        const size_t name_break = source.find_first_of("\r\n\t", name_begin);
        std::optional<size_t> switch_end;
        for (size_t candidate = source.find("@[", at); candidate != std::string_view::npos;
                candidate = source.find("@[", candidate + 2)) {
            if (candidate <= name_begin || !space(static_cast<unsigned char>(source[candidate - 1])))
                continue;
            // A native name is one unbroken source field. Joined GUI wrapping
            // may add spaces, but real newlines here would consume a second
            // output record as though it were the first lever's custom name.
            if (name_break != std::string_view::npos && name_break < candidate) continue;
            size_t end = candidate;
            if (!coordinates(end) || !skip_space(end) || end == source.size() ||
                    (source[end] != '/' && source[end] != '\\')) continue;
            ++end;
            if (end != source.size() && !space(static_cast<unsigned char>(source[end]))) continue;
            // A custom name can itself contain a coordinate-and-switch form.
            // Reject that ambiguity instead of interpreting any of its words
            // as a job, link, or another normalized adjacent output message.
            if (switch_end) return std::nullopt;
            switch_end = end;
        }
        if (!switch_end || !replace("caption", "lever", caption_begin, caption_end))
            return std::nullopt;
        at = *switch_end;
        if (!jobs(at)) return std::nullopt;
    }
    for (;;) {
        size_t next = at;
        const bool separated = skip_space(next);
        if (next == source.size()) break;
        if (!separated || !linked_row(next)) return std::nullopt;
        at = next;
    }
    std::string target;
    size_t copied = 0;
    for (const auto &part : replacements) {
        if (part.begin < copied || part.end < part.begin || part.end > source.size())
            return std::nullopt;
        const auto original = source.substr(copied, part.begin - copied);
        target += console_utf8 ? std::string(original) : native_text_to_utf8(original);
        target += part.target;
        copied = part.end;
    }
    const auto tail = source.substr(copied);
    target += console_utf8 ? std::string(tail) : native_text_to_utf8(tail);
    return replacements.empty() ? std::nullopt : std::optional<std::string>(std::move(target));
}
