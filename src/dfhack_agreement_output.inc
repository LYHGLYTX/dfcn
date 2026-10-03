// list-agreements.lua has four authored location tiers. This is a record
// boundary, not a general "Establish" prose or named-entity recognizer.
static bool dfhack_agreement_record_start(std::string_view source) {
    source = trim_view(source);
    constexpr std::string_view heads[] = {
        "Establish a Temple for \"",
        "Establish a Temple Complex for \"",
        "Establish a Guildhall for \"",
        "Establish a Grand Guildhall for \""
    };
    return std::any_of(std::begin(heads), std::end(heads),
        [&](std::string_view head) { return source.starts_with(head); });
}

// This is the launcher's verified dfhack.lua string:wrap algorithm. It
// preserves hard line breaks, leading indentation and internal padding;
// unlike the help paragraph wrapper, it does not flatten the date line.
static std::vector<std::string> dfhack_agreement_native_wrap(
        std::string_view text, int width) {
    std::vector<std::string> wrapped;
    if (width <= 0) return wrapped;
    const auto emit = [&](std::string &line) {
        while (!line.empty() && native_prose_space(
                static_cast<unsigned char>(line.back()))) line.pop_back();
        wrapped.push_back(std::move(line));
        line.clear();
    };
    for (size_t at = 0; at <= text.size();) {
        const size_t newline = text.find('\n', at);
        const auto source = text.substr(at,
            (newline == std::string_view::npos ? text.size() : newline) - at);
        std::string line;
        const auto word = [&](std::string_view token) {
            if (line.size() + token.size() <= static_cast<size_t>(width)) {
                line.append(token);
                return;
            }
            const auto trimmed = trim_view(token);
            if (line.size() + trimmed.size() <= static_cast<size_t>(width)) {
                line.append(trimmed);
                emit(line);
                return;
            }
            if (token.size() <= static_cast<size_t>(width)) {
                emit(line);
                line.assign(token);
                return;
            }
            size_t consumed = 0;
            do {
                if (!line.empty()) emit(line);
                line.assign(token.substr(consumed, width));
                consumed += line.size();
            } while (consumed < trimmed.size());
        };
        size_t cursor = 0;
        while (cursor < source.size() && native_prose_space(
                static_cast<unsigned char>(source[cursor]))) ++cursor;
        if (cursor > 0) word(source.substr(0, cursor));
        while (cursor < source.size()) {
            const size_t begin = cursor;
            while (cursor < source.size() && !native_prose_space(
                    static_cast<unsigned char>(source[cursor]))) ++cursor;
            while (cursor < source.size() && native_prose_space(
                    static_cast<unsigned char>(source[cursor]))) ++cursor;
            word(source.substr(begin, cursor - begin));
        }
        emit(line);
        if (newline == std::string_view::npos) break;
        at = newline + 1;
    }
    return wrapped;
}

static std::optional<std::string> translate_dfhack_agreement_output_rows(
        const DfhackOutputSnapshot &catalog, const std::vector<Match> &rows,
        int native_width, std::string_view raw_visible) {
    if (rows.size() < 2 || native_width <= 0 || raw_visible.empty() ||
            raw_visible.size() > 65536 || !dfhack_agreement_record_start(raw_visible))
        return std::nullopt;
    // The caller must supply the unnormalized row join. In particular, a
    // proper name's internal spaces must not be recreated from a flat key.
    size_t joined = 0;
    for (size_t row = 0; row < rows.size(); ++row) {
        if (rows[row].source.empty() || (row > 0 && dfhack_agreement_record_start(rows[row].source)))
            return std::nullopt;
        if (row > 0 && (joined == raw_visible.size() || raw_visible[joined++] != ' '))
            return std::nullopt;
        if (raw_visible.substr(joined, rows[row].source.size()) != rows[row].source)
            return std::nullopt;
        joined += rows[row].source.size();
    }
    if (joined != raw_visible.size()) return std::nullopt;
    constexpr std::string_view date_marker = " as agreed on ";
    const size_t date = raw_visible.rfind(date_marker);
    if (date == std::string_view::npos || date == 0) return std::nullopt;
    const auto first = raw_visible.substr(0, date);
    std::string second(raw_visible.substr(date + 1));
    // The script writes '. \t' before the elapsed age. Launcher substitutes
    // that tab with one space. If wrapping discarded the two trailing spaces,
    // the raw row join restores only one; rebuild precisely this authored
    // date separator, without changing any captured name or date digits.
    size_t at = std::string_view("as agreed on ").size();
    const auto date_number = [&]() {
        if (at < second.size() && second[at] == '-') ++at;
        const size_t digits = at;
        while (at < second.size() && second[at] >= '0' && second[at] <= '9') ++at;
        return at != digits;
    };
    const auto date_dash = [&]() {
        if (at == second.size() || second[at] != '-') return false;
        ++at;
        return true;
    };
    if (!date_number() || !date_dash() || !date_number() || !date_dash() || !date_number() ||
            at == second.size() || second[at++] != '.') return std::nullopt;
    const size_t spaces = at;
    while (at < second.size() && second[at] == ' ') ++at;
    if (at - spaces == 1) second.insert(spaces, 1, ' ');
    else if (at - spaces != 2) return std::nullopt;
    std::string complete(first);
    complete += "\n ";
    complete += second;
    const auto expected = dfhack_agreement_native_wrap(complete, native_width);
    if (expected.size() != rows.size()) return std::nullopt;
    for (size_t row = 0; row < rows.size(); ++row) {
        const auto ink = trim_view(expected[row]);
        if (ink.empty() || ink != rows[row].source ||
                rows[row].y != rows.front().y + static_cast<int>(row) ||
                rows[row].x != rows.front().x + static_cast<int>(ink.data() - expected[row].data()))
            return std::nullopt;
    }
    // All sixteen complete tier/status templates already live in the output
    // catalog. Literal whitespace folding is allowed there; raw name captures
    // and every original date digit remain intact.
    auto target = translate_dfhack_output_message(catalog, raw_visible, 0, true, false, false);
    return target && contains_cjk_utf8(*target) ? target : std::nullopt;
}
