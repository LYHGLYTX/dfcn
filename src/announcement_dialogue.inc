// Native speech wrappers and the NUMBER field produced by 0x14052e360.
// Small-number values share data/runtime/instrument-translations.tsv's c namespace.
std::optional<std::string> Overlay::translate_announcement_number(
        std::string_view raw) const {
    const std::string normalized = lower(std::string(trim_view(raw)));
    std::string_view source(normalized);
    bool negative = false;
    if (source.starts_with("negative ")) {
        negative = true;
        source.remove_prefix(9);
    }
    if (source.empty()) return std::nullopt;
    auto small = [&](std::string_view word) -> std::optional<int64_t> {
        if (word == "zero") return 0;
        if (word.empty() || word.find_first_of(" -") != std::string_view::npos)
            return std::nullopt;
        const auto found = instrument_terms_.find("c:" + std::string(word));
        if (found == instrument_terms_.end() || found->second.empty() ||
            !std::all_of(found->second.begin(), found->second.end(),
                [](unsigned char c) { return c >= '0' && c <= '9'; }))
            return std::nullopt;
        const int value = parse_int(found->second, -1);
        if (value < 0 || value > 90) return std::nullopt;
        return value;
    };
    auto below_hundred = [&](std::string_view text) -> std::optional<int64_t> {
        if (auto value = small(text)) return value;
        const size_t hyphen = text.find('-');
        if (hyphen == std::string_view::npos) return std::nullopt;
        const auto tens = small(text.substr(0, hyphen));
        const auto units = small(text.substr(hyphen + 1));
        if (!tens || !units || *tens < 20 || *tens % 10 ||
            *units < 1 || *units > 9) return std::nullopt;
        return *tens + *units;
    };
    auto below_thousand = [&](std::string_view text) -> std::optional<int64_t> {
        const size_t hundred = text.find(" hundred");
        if (hundred == std::string_view::npos) return below_hundred(text);
        const auto leading = small(text.substr(0, hundred));
        if (!leading || *leading < 1 || *leading > 9) return std::nullopt;
        std::string_view tail = text.substr(hundred + 8);
        if (tail.empty()) return *leading * 100;
        if (!tail.starts_with(' ')) return std::nullopt;
        tail.remove_prefix(1);
        const auto remainder = below_hundred(tail);
        if (!remainder || *remainder < 1) return std::nullopt;
        return *leading * 100 + *remainder;
    };
    int64_t value = 0;
    bool grouped = false;
    for (const auto &[suffix, scale] : std::array<std::pair<
             std::string_view, int64_t>, 3>{{
             {" billion", 1000000000}, {" million", 1000000},
             {" thousand", 1000}}}) {
        const size_t at = source.find(suffix);
        if (at == std::string_view::npos) continue;
        const auto group = below_thousand(source.substr(0, at));
        if (!group || *group < 1) return std::nullopt;
        value += *group * scale;
        grouped = true;
        source.remove_prefix(at + suffix.size());
        if (!source.empty()) {
            if (!source.starts_with(' ')) return std::nullopt;
            source.remove_prefix(1);
            if (source.empty()) return std::nullopt;
        }
    }
    if (!source.empty()) {
        const auto tail = below_thousand(source);
        if (!tail || (grouped && *tail == 0)) return std::nullopt;
        value += *tail;
    } else if (!grouped) {
        return std::nullopt;
    }
    if (value > (negative ? int64_t{2147483648} : int64_t{2147483647}))
        return std::nullopt;
    if (negative) value = -value;
    return std::to_string(value);
}

// 0x140b92640 emits a year, one of twelve season/year phrases, or before-time.
std::optional<std::string> Overlay::translate_announcement_date(
        std::string_view source) const {
    source = trim_view(source);
    if (source == "a time before time")
        return exact_literal_translation("Announcement date: before time");
    std::string season;
    if (source.starts_with("the ")) {
        const size_t of = source.find(" of ", 4);
        if (of == std::string_view::npos) return std::nullopt;
        std::string name(source.substr(4, of - 4));
        bool valid = false;
        for (const std::string_view part : {"early ", "mid", "late "}) {
            for (const std::string_view period : {"spring", "summer", "autumn", "winter"}) {
                if (name == std::string(part) + std::string(period)) {
                    const std::string key = part == "mid"
                        ? "mid-" + std::string(period) : name;
                    const auto target = exact_literal_translation(key);
                    if (!target || target->empty()) return std::nullopt;
                    season = *target;
                    valid = true;
                }
            }
        }
        if (!valid) return std::nullopt;
        source.remove_prefix(of + 4);
    }
    if (source.empty() || !std::all_of(source.begin(), source.end(),
            [](unsigned char c) { return c >= '0' && c <= '9'; }) ||
        parse_int(std::string(source), 0) < 1) return std::nullopt;
    auto result = exact_literal_translation("Announcement date: year");
    if (!result) return std::nullopt;
    const size_t field = result->find("{d}");
    if (field == std::string::npos) return std::nullopt;
    result->replace(field, 3, source);
    return *result + season;
}

// 0x140684a10 submits either ACTOR: BODY or ACTOR (to RECIPIENT): BODY.
// BODY is passed intact through 0x140685d00 before submission, so translate it
// against the complete reviewed paragraph catalog, never as an arbitrary name.
// This wrapper is called from the dedicated announcement entry, outside the
// generic paragraph matcher, so inner catalog translation cannot recurse here.
std::optional<std::string> Overlay::translate_announcement_dialogue(
        std::string_view source) const {
    auto actor = [&](std::string_view value) -> std::optional<std::string> {
        if (value == "You") return std::string("你");
        return translate_ui_message_capture(value, true);
    };
    for (size_t colon = source.find(": "); colon != std::string_view::npos;
         colon = source.find(": ", colon + 2)) {
        std::string_view prefix = source.substr(0, colon);
        const std::string_view body = source.substr(colon + 2);
        if (prefix.empty() || body.empty()) continue;
        std::optional<std::string> recipient;
        const size_t to = prefix.find(" (to ");
        if (to != std::string_view::npos) {
            if (!prefix.ends_with(')')) continue;
            recipient = actor(prefix.substr(to + 5, prefix.size() - to - 6));
            if (!recipient || recipient->empty()) continue;
            prefix = prefix.substr(0, to);
        }
        const auto speaker = actor(prefix);
        if (!speaker || speaker->empty()) continue;
        const std::vector<int> source_colors(body.size(), 0xffffff);
        std::vector<int> target_colors;
        const auto translated = translate_complete_announcement(
            body, source_colors, target_colors);
        if (!translated || translated->empty()) continue;
        return *speaker + (recipient ? "（对" + *recipient + "）" : "") +
               "：" + *translated;
    }
    return std::nullopt;
}
