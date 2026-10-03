// scripts/workorder.lua:577-592 and 595-632 emit bounded milk/shear reports.
// Milk rows contain unit.id, getRaceName()'s RAW ID, and an int32 MilkCounter value or
// the authored status. Shear rows contain the active-vector index (not ID),
// getRaceName()'s RAW ID, a Lua boolean, and the compared int32 modifier/threshold.
// Only a complete hard-line header/table/footer family establishes the roles.
static std::optional<std::string> translate_dfhack_workorder_output(
        const DfhackOutputSnapshot &catalog, std::string_view raw,
        bool console_utf8) {
    // This producer prints game strings without df2console in either sink.
    // Its owned display result is UTF-8; all machine fields are ASCII bytes.
    (void)console_utf8;
    constexpr size_t maximum_bytes = 262144, maximum_rows = 16384;
    if (raw.empty() || raw.size() > maximum_bytes) return std::nullopt;
    const auto horizontal = [](unsigned char ch) { return ch == ' ' || ch == '\t'; };
    if (std::any_of(raw.begin(), raw.end(), [](unsigned char ch) {
            return (ch < ' ' && ch != '\t' && ch != '\r' && ch != '\n') || ch == 0x7f;
        })) return std::nullopt;
    struct Span { size_t begin = 0, end = 0; };
    struct Replacement { size_t begin, end; std::string target; };
    std::vector<Span> lines;
    for (size_t at = 0; at < raw.size();) {
        const size_t newline = raw.find('\n', at);
        const size_t line_end = newline == std::string_view::npos ? raw.size() : newline;
        size_t ink_begin = at, ink_end = line_end;
        if (newline != std::string_view::npos && ink_end > at && raw[ink_end - 1] == '\r')
            --ink_end;
        // An isolated CR or another physical line inside a field is not a
        // recoverable WrappedLabel split and cannot join this record family.
        if (raw.substr(at, ink_end - at).find('\r') != std::string_view::npos)
            return std::nullopt;
        while (ink_begin < ink_end && horizontal(static_cast<unsigned char>(raw[ink_begin])))
            ++ink_begin;
        while (ink_end > ink_begin && horizontal(static_cast<unsigned char>(raw[ink_end - 1])))
            --ink_end;
        lines.push_back({ink_begin, ink_end});
        if (lines.size() > maximum_rows + 4) return std::nullopt;
        at = newline == std::string_view::npos ? raw.size() : newline + 1;
    }
    size_t first = 0, after = lines.size();
    while (first < after && lines[first].begin == lines[first].end) ++first;
    while (after > first && lines[after - 1].begin == lines[after - 1].end) --after;
    if (after - first < 2 || after - first - 2 > maximum_rows) return std::nullopt;
    const auto text = [&](Span span) { return raw.substr(span.begin, span.end - span.begin); };
    const auto header = text(lines[first]);
    const bool milk = header == "Milkable units:";
    if (!milk && header != "Shearable units:") return std::nullopt;
    const std::string_view footer_prefix = milk ? "Milking jobs needed:" : "Shearing jobs needed:";
    const std::string_view footer_template = milk ? "Milking jobs needed: {d}" : "Shearing jobs needed: {d}";
    const auto integer = [](std::string_view value, bool signed_value) -> std::optional<long long> {
        if (value.empty()) return std::nullopt;
        const bool negative = value.front() == '-';
        const size_t begin = negative ? 1 : 0;
        if ((negative && !signed_value) || begin == value.size() ||
                (value.size() - begin > 1 && value[begin] == '0')) return std::nullopt;
        const long long limit = negative ? 2147483648LL : 2147483647LL;
        long long number = 0;
        for (size_t at = begin; at < value.size(); ++at) {
            const unsigned char ch = static_cast<unsigned char>(value[at]);
            if (ch < '0' || ch > '9') return std::nullopt;
            const unsigned digit = ch - '0';
            if (number > (limit - digit) / 10) return std::nullopt;
            number = number * 10 + digit;
        }
        if (negative && number == 0) return std::nullopt;
        return negative ? -number : number;
    };
    const auto footer_span = lines[after - 1];
    const auto footer = text(footer_span);
    if (!footer.starts_with(footer_prefix) || footer.size() <= footer_prefix.size() ||
            !horizontal(static_cast<unsigned char>(footer[footer_prefix.size()])))
        return std::nullopt;
    size_t count_begin = footer_span.begin + footer_prefix.size();
    while (count_begin < footer_span.end && horizontal(static_cast<unsigned char>(raw[count_begin])))
        ++count_begin;
    const auto expected_count = integer(raw.substr(count_begin, footer_span.end - count_begin), false);
    if (!expected_count || *expected_count > static_cast<long long>(maximum_rows))
        return std::nullopt;
    const auto header_target = catalog.literals.find(std::string(header));
    if (header_target == catalog.literals.end() || !contains_cjk_utf8(header_target->second) ||
            header_target->second.find_first_of("\r\n\t") != std::string::npos)
        return std::nullopt;
    const Rule *footer_rule = nullptr;
    for (const auto &rule : catalog.templates) {
        if (rule.source == footer_template && rule.template_kinds.size() == 1 &&
                rule.template_kinds[0] == 'd' && rule.target_capture_order.size() == 1 &&
                rule.target_capture_order[0] == 0 && rule.target_template_literals.size() == 2 &&
                contains_cjk_utf8(rule.target) && rule.target.find_first_of("\r\n\t") == std::string::npos) {
            footer_rule = &rule;
            break;
        }
    }
    if (!footer_rule) return std::nullopt;
    std::vector<Replacement> replacements;
    replacements.push_back({lines[first].begin, lines[first].end, header_target->second});
    std::unordered_set<long long> identifiers;
    size_t eligible_count = 0;
    std::optional<bool> tab_columns;
    constexpr std::string_view unmilked = "not milked recently";
    const auto trim_end = [&](size_t begin, size_t end) {
        while (end > begin && horizontal(static_cast<unsigned char>(raw[end - 1]))) --end;
        return end;
    };
    const auto last_word = [&](size_t begin, size_t end) {
        size_t at = end;
        while (at > begin && !horizontal(static_cast<unsigned char>(raw[at - 1]))) --at;
        return at;
    };
    for (size_t row = first + 1; row + 1 < after; ++row) {
        const auto line = lines[row];
        if (line.begin == line.end) return std::nullopt;
        const auto native = text(line);
        const bool has_tabs = native.find('\t') != std::string_view::npos;
        if (tab_columns && *tab_columns != has_tabs) return std::nullopt;
        tab_columns = has_tabs;
        std::vector<Span> fields;
        if (has_tabs) {
            size_t begin = line.begin;
            for (size_t tab = raw.find('\t', begin); tab < line.end;
                    tab = raw.find('\t', begin)) {
                fields.push_back({begin, tab});
                begin = tab + 1;
            }
            fields.push_back({begin, line.end});
            if (fields.size() != (milk ? 3 : 4)) return std::nullopt;
        } else {
            // GUI callers can preserve complete physical rows after native
            // tab expansion/normalization. Split numeric/status tails from
            // the right and retain getRaceName() as an opaque RAW ID field.
            const size_t id_end = raw.find(' ', line.begin);
            if (id_end == std::string_view::npos || id_end >= line.end) return std::nullopt;
            size_t caption_begin = id_end;
            while (caption_begin < line.end && raw[caption_begin] == ' ') ++caption_begin;
            fields.push_back({line.begin, id_end});
            if (milk) {
                const bool has_status = native.ends_with(unmilked);
                const size_t value_begin = has_status ? line.end - unmilked.size()
                    : last_word(caption_begin, line.end);
                if (value_begin <= caption_begin ||
                        !horizontal(static_cast<unsigned char>(raw[value_begin - 1])))
                    return std::nullopt;
                fields.push_back({caption_begin, trim_end(caption_begin, value_begin)});
                fields.push_back({value_begin, line.end});
            } else {
                const size_t ratio_begin = last_word(caption_begin, line.end);
                if (ratio_begin <= caption_begin) return std::nullopt;
                const size_t boolean_end = trim_end(caption_begin, ratio_begin);
                const size_t boolean_begin = last_word(caption_begin, boolean_end);
                if (boolean_begin <= caption_begin) return std::nullopt;
                fields.push_back({caption_begin, trim_end(caption_begin, boolean_begin)});
                fields.push_back({boolean_begin, boolean_end});
                fields.push_back({ratio_begin, line.end});
            }
        }
        const auto identifier = integer(text(fields[0]), false);
        const auto raw_id = text(fields[1]);
        if (!identifier || !identifiers.insert(*identifier).second || raw_id.empty() ||
                horizontal(static_cast<unsigned char>(raw_id.front())) ||
                horizontal(static_cast<unsigned char>(raw_id.back()))) return std::nullopt;
        if (milk) {
            const auto value = text(fields[2]);
            if (value == unmilked) {
                ++eligible_count;
                const auto status = catalog.gui_fields.find(
                    "DFHack GUI Workorder milk: not milked recently");
                if (status == catalog.gui_fields.end() || !contains_cjk_utf8(status->second) ||
                        status->second.find_first_of("\r\n\t") != std::string::npos)
                    return std::nullopt;
                replacements.push_back({fields[2].begin, fields[2].end, status->second});
                continue;
            }
            if (!integer(value, true)) return std::nullopt;
        } else {
            const auto boolean = text(fields[2]);
            if (boolean != "true" && boolean != "false") return std::nullopt;
            const auto ratio = text(fields[3]);
            const size_t slash = ratio.find('/');
            if (slash == std::string_view::npos || ratio.find('/', slash + 1) != std::string_view::npos)
                return std::nullopt;
            const auto value = integer(ratio.substr(0, slash), true);
            const auto threshold = integer(ratio.substr(slash + 1), false);
            if (!value || !threshold || *threshold <= 0 ||
                    ((boolean == "true") != (*value >= *threshold))) return std::nullopt;
            if (boolean == "true") ++eligible_count;
        }
    }
    if (eligible_count != static_cast<size_t>(*expected_count)) return std::nullopt;
    // Keep the source's separator before the count, its exact digits, and all
    // trailing indentation/EOL bytes. Resolve only authored footer literals.
    std::string footer_target_prefix = footer_rule->target_template_literals[0];
    while (!footer_target_prefix.empty() && horizontal(
            static_cast<unsigned char>(footer_target_prefix.back()))) footer_target_prefix.pop_back();
    replacements.push_back({footer_span.begin, footer_span.begin + footer_prefix.size(),
        std::move(footer_target_prefix)});
    if (!footer_rule->target_template_literals[1].empty())
        replacements.push_back({footer_span.end, footer_span.end, footer_rule->target_template_literals[1]});
    std::string target;
    size_t copied = 0;
    for (const auto &part : replacements) {
        if (part.begin < copied || part.end < part.begin || part.end > raw.size())
            return std::nullopt;
        const auto original = raw.substr(copied, part.begin - copied);
        target += native_text_to_utf8(original);
        target += part.target;
        copied = part.end;
    }
    const auto tail = raw.substr(copied);
    target += native_text_to_utf8(tail);
    return target;
}
