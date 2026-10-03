// lever.lua writes one complete head and six-space-indented linked-building
// lines. Accept only complete physical lines that reproduce WrappedLabel's
// actual body layout; a soft-wrapped name or link is not reconstructed here.
static std::optional<std::string> translate_dfhack_lever_output_rows(
        const DfhackOutputSnapshot &catalog, const std::vector<Match> &rows,
        int body_left, int body_width, std::string *complete_source = nullptr) {
    if (complete_source) complete_source->clear();
    if (rows.empty() || rows.size() > 65536 || body_left < 0 || body_width <= 0 ||
            rows.front().y < 0) return std::nullopt;

    const auto head_start = [](std::string_view source) {
        if (source.starts_with("lever #")) return true;
        if (source.empty() || source.front() != '#') return false;
        size_t at = 1;
        while (at < source.size() && source[at] >= '0' && source[at] <= '9') ++at;
        return at > 1 && source.substr(at).starts_with(": lever #");
    };
    std::string report;
    bool seen_head = false;
    for (size_t at = 0; at < rows.size(); ++at) {
        const auto &row = rows[at];
        const std::string_view source(row.source);
        if (source.empty() || trim_view(source) != source ||
                source.find_first_of("\r\n\t") != std::string_view::npos ||
                static_cast<long long>(row.y) !=
                    static_cast<long long>(rows.front().y) + static_cast<long long>(at) ||
                row.x < body_left ||
                static_cast<long long>(row.x) - body_left +
                    static_cast<long long>(source.size()) > body_width)
            return std::nullopt;

        const bool head = head_start(source);
        if (head) {
            // A list's next lever is a new record, never part of this lever's
            // custom name. The caller can retry a shorter complete block.
            if (at != 0 || seen_head || row.x != body_left) return std::nullopt;
            seen_head = true;
            // The existing grammar also accepts complete links after a head
            // separated by generic whitespace. On a real head-only line the
            // last coordinate bracket must instead precede its switch glyph;
            // pull-order suffixes contain no closing square brackets.
            const size_t close = source.rfind(']');
            if (close == std::string_view::npos || close + 2 >= source.size() ||
                    source[close + 1] != ' ' ||
                    (source[close + 2] != '/' && source[close + 2] != '\\'))
                return std::nullopt;
        } else {
            if (!source.starts_with("linked to ") ||
                    static_cast<long long>(row.x) != static_cast<long long>(body_left) + 6)
                return std::nullopt;
            // No custom name is present in a link: its sole coordinate tuple
            // follows the native building enum and ID. Two tuples would be
            // two flattened links rather than a single authored hard line.
            const size_t coordinates = source.find("@[");
            if (coordinates == std::string_view::npos ||
                    source.find("@[", coordinates + 2) != std::string_view::npos ||
                    source.back() != ']') return std::nullopt;
        }

        std::string line(static_cast<size_t>(row.x - body_left), ' ');
        line.append(source);
        // Prove the entire head/job or state/enum/ID/coordinate grammar, not
        // just a familiar prefix. This also rejects all soft-wrap fragments.
        if (!translate_dfhack_lever_output(catalog, line, false)) return std::nullopt;
        if (report.size() + line.size() + (at ? 1 : 0) > 65536) return std::nullopt;
        if (at) report.push_back('\n');
        report += line;
    }

    const auto expected = dfhack_item_native_wrap(report, body_width);
    if (expected.size() != rows.size()) return std::nullopt;
    for (size_t at = 0; at < rows.size(); ++at) {
        const auto ink = trim_view(expected[at]);
        if (ink.empty() || ink != rows[at].source ||
                static_cast<long long>(rows[at].x) != static_cast<long long>(body_left) +
                    static_cast<long long>(ink.data() - expected[at].data()))
            return std::nullopt;
    }
    auto target = translate_dfhack_lever_output(catalog, report, false);
    if (!target || !contains_cjk_utf8(*target)) return std::nullopt;
    if (complete_source) *complete_source = std::move(report);
    return target;
}
