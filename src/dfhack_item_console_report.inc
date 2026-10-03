// item.lua:330-364, before launcher replaces native tabs for WrappedLabel.
// The caller proves the local launcher print and supplies its owned command
// and complete original output argument. The extra println endl belongs to
// that ticket, not this report. No GUI Match/native-wrap reconstruction is
// applied to these hard lines, and Console captions are already UTF-8.
static std::optional<std::string> translate_dfhack_item_console_report(
        const DfhackOutputSnapshot &catalog, std::string_view command,
        std::string_view raw) {
    constexpr size_t maximum_bytes = 1048576, maximum_rows = 16384;
    const auto options = dfhack_item_output_options(command, false);
    if (!options || raw.empty() || raw.size() > maximum_bytes || raw.back() != '\n' ||
            std::any_of(raw.begin(), raw.end(), [](unsigned char ch) {
                return (ch < ' ' && ch != '\n' && ch != '\t') || ch == 0x7f;
            })) return std::nullopt;
    struct Span { size_t begin, end; };
    std::vector<Span> lines;
    for (size_t at = 0; at < raw.size();) {
        const size_t newline = raw.find('\n', at);
        if (newline == std::string_view::npos || lines.size() == maximum_rows)
            return std::nullopt;
        lines.push_back({at, newline});
        at = newline + 1;
    }
    const auto text = [&](Span span) { return raw.substr(span.begin, span.end - span.begin); };
    const std::string_view suffix = options->action == "count"
        ? "items matched the filter options"
        : options->dry_run ? "items would be modified" : "items were modified";
    // executeWithPrinting omits both the verbose separator and --by-type
    // table when nothing matched. This is its exact single-line zero family.
    if (lines.size() == 1 && text(lines.front()) == "0\t" + std::string(suffix)) {
        const auto target = catalog.gui_fields.find("DFHack GUI Item footer: " + std::string(suffix));
        if (target != catalog.gui_fields.end() && contains_cjk_utf8(target->second) &&
                std::none_of(target->second.begin(), target->second.end(), [](unsigned char ch) {
                    return ch < ' ' || ch == 0x7f;
                })) return "0\t" + target->second + '\n';
        return std::string(raw);
    }
    // Positive verbose output has descriptions and one print() separator.
    // Non-verbose output begins at its actual two-argument footer, with the
    // same optional type/count table. Zero has its separate exact family.
    size_t separator = 0;
    if (options->verbose) {
        while (separator < lines.size() && !text(lines[separator]).empty()) ++separator;
        if (!separator || separator + 1 >= lines.size()) return std::nullopt;
    }
    const size_t footer = options->verbose ? separator + 1 : 0;
    const auto footer_line = text(lines[footer]);
    const size_t tab = footer_line.find('\t');
    uint64_t total = 0;
    if (tab == std::string_view::npos ||
            !dfhack_item_positive_count(footer_line.substr(0, tab), total)) return std::nullopt;
    if (footer_line.substr(tab + 1) != suffix) return std::nullopt;

    std::vector<Span> captions;
    std::unordered_set<std::string_view> descriptions;
    uint64_t description_sum = 0;
    constexpr uint64_t maximum_count = static_cast<uint64_t>(std::numeric_limits<int64_t>::max());
    for (size_t row = 0; row < separator; ++row) {
        const auto line = text(lines[row]);
        size_t begin = 0;
        while (begin < line.size() && line[begin] == ' ') ++begin;
        size_t end = begin;
        while (end < line.size() && line[end] >= '0' && line[end] <= '9') ++end;
        uint64_t count = 0;
        const size_t digits = end - begin;
        if (!dfhack_item_positive_count(line.substr(begin, digits), count) ||
                begin != (digits < 4 ? 4 - digits : 0) ||
                end >= line.size() || line[end] != ' ' || end + 1 == line.size() ||
                count > maximum_count - description_sum) return std::nullopt;
        const auto caption = line.substr(end + 1);
        if (caption.find('\t') != std::string_view::npos ||
                std::all_of(caption.begin(), caption.end(), [](char ch) { return ch == ' '; }) ||
                !descriptions.insert(caption).second) return std::nullopt;
        description_sum += count;
        captions.push_back({lines[row].begin + end + 1, lines[row].end});
    }
    if (options->verbose && description_sum != total) return std::nullopt;

    std::optional<Span> type_title, count_title;
    if (!options->by_type) {
        if (footer + 1 != lines.size()) return std::nullopt;
    } else {
        // print(("\n%-14s %5s\n"):format("TYPE", "COUNT"))
        // contributes one blank before the header and one after it. A final
        // print() contributes exactly one closing blank after enum rows.
        const size_t header_at = footer + 2, table_at = footer + 4;
        const std::string header = "TYPE" + std::string(11, ' ') + "COUNT";
        if (table_at >= lines.size() || !text(lines[footer + 1]).empty() ||
                text(lines[header_at]) != header || !text(lines[header_at + 1]).empty())
            return std::nullopt;
        type_title = Span{lines[header_at].begin, lines[header_at].begin + 4};
        count_title = Span{lines[header_at].begin + 15, lines[header_at].begin + 20};
        std::unordered_set<std::string_view> tokens;
        uint64_t type_sum = 0, previous_count = total;
        size_t at = table_at;
        for (; at < lines.size() && !text(lines[at]).empty(); ++at) {
            const auto line = text(lines[at]);
            size_t enum_end = 0;
            while (enum_end < line.size() &&
                    ((line[enum_end] >= 'A' && line[enum_end] <= 'Z') || line[enum_end] == '_' ||
                    (enum_end && line[enum_end] >= '0' && line[enum_end] <= '9'))) ++enum_end;
            if (!enum_end || enum_end > 64) return std::nullopt;
            const auto token = line.substr(0, enum_end);
            if (!tokens.insert(token).second) return std::nullopt;
            size_t number_at = enum_end;
            while (number_at < line.size() && line[number_at] == ' ') ++number_at;
            const auto number = line.substr(number_at);
            uint64_t count = 0;
            if (!dfhack_item_positive_count(number, count) || count > total - type_sum ||
                    count > previous_count) return std::nullopt;
            const std::string expected = std::string(token) +
                std::string(enum_end < 14 ? 14 - enum_end : 0, ' ') + ' ' +
                std::string(number.size() < 5 ? 5 - number.size() : 0, ' ') + std::string(number);
            if (line != expected) return std::nullopt;
            type_sum += count;
            previous_count = count;
        }
        if (at == table_at || at + 1 != lines.size() || type_sum != total)
            return std::nullopt;
    }

    // Resolve only after all descriptions, counts, separators and optional
    // enum rows have passed the complete family proof. Unknown captions and
    // all enum/count fields are copied verbatim, outside generic word rules.
    struct Replacement { Span span; std::string target; };
    std::vector<Replacement> replacements;
    const auto usable = [](std::string_view target) {
        return !target.empty() && contains_cjk_utf8(std::string(target)) &&
            std::none_of(target.begin(), target.end(), [](unsigned char ch) {
                return ch < ' ' || ch == 0x7f;
            });
    };
    for (const auto caption : captions) {
        // The report size limit is distinct from the grammar's single-field
        // budget. An oversized caption stays native without losing ownership.
        if (caption.end - caption.begin > 65536) continue;
        if (auto target = translate_dfhack_caption_utf8(catalog, "item", text(caption));
                target && usable(*target)) replacements.push_back({caption, std::move(*target)});
    }
    const Span footer_suffix{lines[footer].begin + tab + 1, lines[footer].end};
    std::optional<std::string> footer_target;
    const auto scoped = catalog.gui_fields.find("DFHack GUI Item footer: " + std::string(suffix));
    if (scoped != catalog.gui_fields.end() && usable(scoped->second)) footer_target = scoped->second;
    if (!footer_target) {
        const auto literal = catalog.literals.find(std::string(suffix));
        if (literal != catalog.literals.end() && usable(literal->second)) footer_target = literal->second;
    }
    if (!footer_target) {
        // Existing whole-footer templates are usable only if they retain
        // the original leading count and separator. Never guess a suffix
        // from a translation which puts words before that count.
        for (const auto &rule : catalog.templates) {
            if ((rule.source != "{s} " + std::string(suffix) &&
                    rule.source != "{d} " + std::string(suffix)) ||
                    rule.template_kinds.size() != 1 || rule.target_capture_order.size() != 1 ||
                    (rule.template_kinds[0] != 's' && rule.template_kinds[0] != 'd') ||
                    rule.target_capture_order[0] != 0 || rule.target_template_literals.size() != 2 ||
                    !rule.target_template_literals[0].empty() ||
                    !rule.target_template_literals[1].starts_with(' ')) continue;
            const auto target = std::string_view(rule.target_template_literals[1]).substr(1);
            if (usable(target)) { footer_target = std::string(target); break; }
        }
    }
    if (footer_target) replacements.push_back({footer_suffix, std::move(*footer_target)});
    if (type_title && count_title) {
        for (const auto &[span, title] : {std::pair{*type_title, std::string_view("TYPE")},
                std::pair{*count_title, std::string_view("COUNT")}}) {
            const auto target = catalog.gui_fields.find("DFHack GUI Item type counts: " + std::string(title));
            if (target != catalog.gui_fields.end() && usable(target->second))
                replacements.push_back({span, target->second});
        }
    }
    std::string output;
    size_t copied = 0;
    for (const auto &replacement : replacements) {
        if (replacement.span.begin < copied || replacement.span.end < replacement.span.begin ||
                replacement.span.end > raw.size()) return std::nullopt;
        output.append(raw.substr(copied, replacement.span.begin - copied));
        output += replacement.target;
        copied = replacement.span.end;
    }
    output.append(raw.substr(copied));
    return output;
}
