// Local launcher-only item.lua reader. The caller supplies an actual complete,
// unwrapped "> command" echo and every output row up to the next echo/frame
// edge, including blank row placeholders. No command is run and no game or
// alias state is read here. A matching echo alone never establishes ownership:
// the authored output layout and the complete item/count family must agree.
struct DfhackItemOutputRecord {
    std::vector<Match> rows;
    std::string source;
    std::string target;
    int native_rows = 0;
};

struct DfhackItemOutputOptions {
    bool verbose = false;
    bool dry_run = false;
    bool by_type = false;
    bool help = false;
    std::string action;
};

// Core::cheap_tokenise quoted/verbatim semantics, not shell quoting. Quotes
// can occur inside a token; a backslash escapes only inside double quotes.
static std::vector<std::string> dfhack_item_command_tokens(std::string_view input) {
    std::vector<std::string> tokens;
    size_t at = 0;
    const auto space = [](unsigned char ch) { return native_prose_space(ch); };
    while (at < input.size() && space(static_cast<unsigned char>(input[at]))) ++at;
    if (at < input.size() && input[at] == ':') {
        const size_t begin = ++at;
        while (at < input.size() && !space(static_cast<unsigned char>(input[at]))) ++at;
        if (at != begin) tokens.emplace_back(input.substr(begin, at - begin));
        while (at < input.size() && space(static_cast<unsigned char>(input[at]))) ++at;
        if (at < input.size()) tokens.emplace_back(input.substr(at));
        return tokens;
    }
    bool current = false;
    for (; at < input.size(); ++at) {
        unsigned char ch = static_cast<unsigned char>(input[at]);
        if (space(ch)) { current = false; continue; }
        if (!current) { tokens.emplace_back(); current = true; }
        if (ch != '"') { tokens.back().push_back(static_cast<char>(ch)); continue; }
        for (++at; at < input.size(); ++at) {
            ch = static_cast<unsigned char>(input[at]);
            if (ch == '"') break;
            if (ch == '\\') {
                if (++at < input.size()) tokens.back().push_back(input[at]);
            } else tokens.back().push_back(static_cast<char>(ch));
        }
    }
    return tokens;
}

// Installed item.lua -> argparse.processArgsGetopt -> alt_getopt: options
// remain active after positionals, -- ends them, short clusters stop at a
// value-taking option, and the next token is a value even when it is "-v".
static std::optional<DfhackItemOutputOptions> dfhack_item_output_options(
        std::string_view command_text, bool require_verbose = true) {
    if (command_text.empty() || command_text.size() > 65536 ||
            std::any_of(command_text.begin(), command_text.end(), [](unsigned char ch) {
                return ch < ' ' && ch != '\t';
            })) return std::nullopt;
    const auto tokens = dfhack_item_command_tokens(command_text);
    if (tokens.empty() || tokens.front() != "item") return std::nullopt;
    struct Option { std::string_view name; char short_name; bool value; };
    constexpr Option options[] = {
        {"help", 'h', false}, {"verbose", 'v', false},
        {"include-artifacts", 'a', false}, {"include-owned", 0, false},
        {"ignore-webs", 0, false}, {"dry-run", 'n', false},
        {"by-type", 0, false}, {"total-quality", 0, false},
        {"inside", 'i', true}, {"outside", 'o', true},
        {"reachable", 'r', false}, {"unreachable", 'u', false},
        {"type", 't', true}, {"material", 'm', true},
        {"mat-category", 'c', true}, {"min-wear", 'w', true},
        {"max-wear", 'W', true}, {"min-quality", 'q', true},
        {"max-quality", 'Q', true}, {"stockpiled", 0, false},
        {"scattered", 0, false}, {"marked", 0, true},
        {"not-marked", 0, true}, {"visible", 0, false}
    };
    DfhackItemOutputOptions result;
    std::vector<std::string_view> positionals;
    const auto apply = [&](const Option &option) {
        if (option.name == "help") result.help = true;
        else if (option.name == "verbose") result.verbose = true;
        else if (option.name == "dry-run") result.dry_run = true;
        else if (option.name == "by-type") result.by_type = true;
    };
    for (size_t at = 1; at < tokens.size(); ++at) {
        const std::string_view token(tokens[at]);
        if (token == "--") {
            for (++at; at < tokens.size(); ++at) positionals.push_back(tokens[at]);
            break;
        }
        if (token.starts_with("--")) {
            const size_t equal = token.find('=');
            const auto name = token.substr(2,
                equal == std::string_view::npos ? token.size() - 2 : equal - 2);
            const auto found = std::find_if(std::begin(options), std::end(options),
                [&](const Option &option) { return option.name == name; });
            if (found == std::end(options) ||
                    (equal != std::string_view::npos && !found->value)) return std::nullopt;
            if (found->value && equal == std::string_view::npos && ++at == tokens.size())
                return std::nullopt;
            apply(*found);
        } else if (token.starts_with('-') &&
                !(token.size() > 1 && token[1] >= '0' && token[1] <= '9')) {
            // A single '-' executes an empty short-option loop in alt_getopt.
            for (size_t letter = 1; letter < token.size(); ++letter) {
                const auto found = std::find_if(std::begin(options), std::end(options),
                    [&](const Option &option) {
                        return option.short_name != 0 && option.short_name == token[letter];
                    });
                if (found == std::end(options)) return std::nullopt;
                apply(*found);
                if (!found->value) continue;
                if (letter + 1 == token.size() && ++at == tokens.size()) return std::nullopt;
                break;
            }
        } else positionals.push_back(token);
    }
    constexpr std::string_view actions[] = {
        "forbid", "unforbid", "dump", "undump", "melt", "unmelt", "count", "hide", "unhide"
    };
    if ((require_verbose && !result.verbose) || result.help || positionals.empty() ||
            std::find(std::begin(actions), std::end(actions), positionals.front()) ==
                std::end(actions)) return std::nullopt;
    result.action.assign(positionals.front());
    return result;
}

// Independent copy of the verified dfhack.lua string:wrap contract. Item
// output has no helpdb 58-column pass; only WrappedLabel's actual body width.
static std::vector<std::string> dfhack_item_native_wrap(std::string_view text, int width) {
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

static bool dfhack_item_positive_count(std::string_view source, uint64_t &value) {
    if (source.empty() || source.front() == '0') return false;
    value = 0;
    constexpr uint64_t maximum = static_cast<uint64_t>(std::numeric_limits<int64_t>::max());
    for (unsigned char ch : source) {
        if (ch < '0' || ch > '9' || value > (maximum - (ch - '0')) / 10) return false;
        value = value * 10 + ch - '0';
    }
    return value != 0;
}

static std::optional<std::vector<DfhackItemOutputRecord>> translate_dfhack_item_output_rows(
        const DfhackOutputSnapshot &catalog, std::string_view command_text,
        const std::vector<Match> &rows, int body_left, int body_width) {
    const auto options = dfhack_item_output_options(command_text);
    if (!options || rows.size() < 3 || rows.size() > 512 || body_width < 6 ||
            body_width > 4096 || body_left < 0) return std::nullopt;
    size_t bytes = 0;
    for (size_t row = 0; row < rows.size(); ++row) {
        const auto &physical = rows[row];
        bytes += physical.source.size();
        if (bytes > 65536 || physical.y != rows.front().y + static_cast<int>(row) ||
                (!physical.source.empty() && (physical.x < body_left ||
                    physical.source.size() > static_cast<size_t>(body_width) ||
                    physical.x - body_left + physical.source.size() >
                        static_cast<size_t>(body_width) ||
                    trim_view(physical.source) != physical.source ||
                    std::any_of(physical.source.begin(), physical.source.end(),
                        [](unsigned char ch) {
                            // Native item quality/magic marks are visible
                            // CP437 glyphs, not layout control characters.
                            return ch < ' ' && ch != 0x0f && ch != 0x10 && ch != 0x11;
                        })))) return std::nullopt;
    }
    const auto same_layout = [&](std::string_view source, size_t begin, size_t end) {
        const auto expected = dfhack_item_native_wrap(source, body_width);
        if (expected.size() != end - begin) return false;
        for (size_t row = 0; row < expected.size(); ++row) {
            const auto ink = trim_view(expected[row]);
            if (ink != rows[begin + row].source ||
                    (!ink.empty() && rows[begin + row].x != body_left +
                        static_cast<int>(ink.data() - expected[row].data()))) return false;
        }
        return true;
    };
    // The echo's required blank can either remain in the supplied block or
    // already have been consumed by its caller. Additional leading blanks
    // are not the installed item.lua verbose family.
    size_t first = !rows.front().source.empty() ? 0 : 1;
    if (first == rows.size() || rows[first].source.empty()) return std::nullopt;
    size_t separator = first;
    while (separator < rows.size() && !rows[separator].source.empty()) ++separator;
    if (separator == rows.size() || separator + 1 == rows.size() ||
            rows[separator + 1].source.empty()) return std::nullopt;
    const size_t footer = separator + 1;
    const auto footer_source = std::string_view(rows[footer].source);
    size_t footer_digits = 0;
    while (footer_digits < footer_source.size() && footer_source[footer_digits] >= '0' &&
            footer_source[footer_digits] <= '9') ++footer_digits;
    uint64_t total = 0;
    if (!dfhack_item_positive_count(footer_source.substr(0, footer_digits), total))
        return std::nullopt;
    const std::string_view ending = options->action == "count"
        ? " items matched the filter options"
        : options->dry_run ? " items would be modified" : " items were modified";
    const std::string complete_footer = std::string(footer_source.substr(0, footer_digits)) +
        std::string(ending);
    const size_t footer_end = footer + dfhack_item_native_wrap(complete_footer, body_width).size();
    if (footer_end > rows.size() || !same_layout(complete_footer, footer, footer_end))
        return std::nullopt;

    struct Head {
        size_t row;
        size_t digits;
        size_t caption;
        uint64_t count;
        std::string number;
    };
    std::vector<Head> heads;
    for (size_t row = first; row < separator; ++row) {
        const std::string_view source(rows[row].source);
        size_t digits = 0;
        while (digits < source.size() && source[digits] >= '0' && source[digits] <= '9') ++digits;
        uint64_t count = 0;
        if (!dfhack_item_positive_count(source.substr(0, digits), count) || count > total ||
                (digits != source.size() && source[digits] != ' ') ||
                rows[row].x != body_left + static_cast<int>(digits < 4 ? 4 - digits : 0)) continue;
        heads.push_back({row, digits, digits == source.size() ? source.size() : digits + 1,
            count, std::string(source.substr(0, digits))});
    }
    if (heads.empty() || heads.front().row != first || heads.size() > 128) return std::nullopt;
    struct CaptionRange { bool valid = false; std::string source; };
    std::map<std::pair<size_t, size_t>, CaptionRange> ranges;
    bool exhausted = false;
    const auto caption_range = [&](size_t head_index, size_t end) -> const CaptionRange & {
        const auto key = std::make_pair(head_index, end);
        if (const auto found = ranges.find(key); found != ranges.end()) return found->second;
        auto &result = ranges[key];
        if (ranges.size() > 8192) { exhausted = true; return result; }
        const auto &head = heads[head_index];
        size_t caption_row = head.row;
        std::string caption = rows[caption_row].source.substr(head.caption);
        if (caption.empty()) {
            if (++caption_row == end) return result;
            caption = rows[caption_row].source;
        }
        std::vector<std::string> candidates{std::move(caption)};
        for (size_t row = caption_row + 1; row < end; ++row) {
            std::vector<std::string> next;
            const bool split_word = rows[row - 1].x +
                static_cast<int>(rows[row - 1].source.size()) == body_left + body_width;
            for (const auto &candidate : candidates) {
                next.push_back(candidate + ' ' + rows[row].source);
                if (split_word) next.push_back(candidate + rows[row].source);
            }
            if (next.size() > 64) return result;
            candidates = std::move(next);
        }
        const std::string prefix(head.digits < 4 ? 4 - head.digits : 0, ' ');
        bool ambiguous = false;
        for (const auto &candidate : candidates) {
            if (!same_layout(prefix + head.number + ' ' + candidate, head.row, end)) continue;
            if (!result.valid) { result.valid = true; result.source = candidate; }
            else if (result.source != candidate) ambiguous = true;
        }
        // A fully occupied row can be either a long-word split or a real
        // word boundary. Both interpretations may have the same native ink.
        // Such a proven record is owned, but its caption is never guessed.
        if (ambiguous) result.source.clear();
        return result;
    };
    using Range = std::pair<size_t, size_t>;
    std::vector<Range> path, selected;
    size_t solutions = 0, work = 0;
    const auto search = [&](auto &&self, size_t head_index, uint64_t sum) -> void {
        if (++work > 65536) { exhausted = true; return; }
        if (solutions > 1 || exhausted) return;
        const auto &head = heads[head_index];
        if (head.count > total - sum) return;
        sum += head.count;
        for (size_t next = head_index + 1; next <= heads.size(); ++next) {
            const size_t end = next == heads.size() ? separator : heads[next].row;
            if (!caption_range(head_index, end).valid) continue;
            path.push_back({head_index, end});
            if (next == heads.size()) {
                if (sum == total) { ++solutions; if (solutions == 1) selected = path; }
            } else if (sum < total) self(self, next, sum);
            path.pop_back();
            if (solutions > 1 || exhausted) return;
        }
    };
    search(search, 0, 0);
    if (exhausted || solutions != 1) return std::nullopt;
    std::vector<DfhackItemOutputRecord> records;
    std::unordered_set<std::string> descriptions;
    for (const auto &[head_index, end] : selected) {
        const auto &head = heads[head_index];
        DfhackItemOutputRecord record;
        record.source = caption_range(head_index, end).source;
        record.native_rows = static_cast<int>(end - head.row);
        if (!record.source.empty() && !descriptions.insert(record.source).second)
            return std::nullopt; // execute aggregates each identical description.
        for (size_t row = head.row; row < end; ++row) {
            Match match = rows[row];
            if (row == head.row) {
                const auto caption = std::string_view(match.source).substr(head.caption);
                const auto ink = trim_view(caption);
                if (ink.empty()) continue;
                match.x += static_cast<int>(head.caption +
                    static_cast<size_t>(ink.data() - caption.data()));
                match.source.assign(ink);
                match.length = static_cast<int>(ink.size());
            }
            record.rows.push_back(std::move(match));
        }
        if (record.rows.empty()) return std::nullopt;
        records.push_back(std::move(record));
    }
    const size_t caption_count = records.size();
    const auto resolve_captions = [&]() {
        // Resolve only after the entire output family has been proved. The
        // immutable caption snapshot handles full item grammar; no filter,
        // command, enum, arbitrary numeric table or name is passed to it.
        for (size_t at = 0; at < caption_count; ++at)
            if (!records[at].source.empty())
                if (auto target = translate_dfhack_caption_utf8(catalog, "item",
                        native_text_to_utf8(records[at].source)))
                    records[at].target = std::move(*target);
    };

    if (!options->by_type) {
        if (std::any_of(rows.begin() + footer_end, rows.end(),
                [](const Match &row) { return !row.source.empty(); })) return std::nullopt;
        resolve_captions();
        return records;
    }
    // --by-type is a separate identity table after the footer. Prove its
    // real padded layout and total without ever submitting enum tokens to
    // item grammar. Empty-target identity records reserve all these y rows;
    // neither enum glyphs nor numeric glyphs are suppressed or translated.
    if (footer_end == rows.size() || !rows[footer_end].source.empty()) return std::nullopt;
    const std::string header = "TYPE" + std::string(11, ' ') + "COUNT";
    const size_t header_at = footer_end + 1;
    const size_t header_end = header_at + dfhack_item_native_wrap(header, body_width).size();
    if (header_end >= rows.size() || !same_layout(header, header_at, header_end) ||
            !rows[header_end].source.empty()) return std::nullopt;
    const size_t table_at = header_end + 1;
    size_t table_end = table_at;
    while (table_end < rows.size() && !rows[table_end].source.empty()) ++table_end;
    if (table_at == table_end || std::any_of(rows.begin() + table_end, rows.end(),
            [](const Match &row) { return !row.source.empty(); })) return std::nullopt;
    std::vector<DfhackItemOutputRecord> type_path, type_selected;
    size_t type_solutions = 0;
    const auto table_search = [&](auto &&self, size_t at, uint64_t sum, uint64_t previous) -> void {
        if (++work > 65536) { exhausted = true; return; }
        if (type_solutions > 1 || exhausted) return;
        if (at == table_end) {
            if (sum == total) { ++type_solutions; if (type_solutions == 1) type_selected = type_path; }
            return;
        }
        const auto text = std::string_view(rows[at].source);
        size_t enum_size = 0;
        while (enum_size < text.size() && ((text[enum_size] >= 'A' && text[enum_size] <= 'Z') ||
                text[enum_size] == '_' || (enum_size > 0 && text[enum_size] >= '0' &&
                    text[enum_size] <= '9'))) ++enum_size;
        if (!enum_size || enum_size > 64 || rows[at].x != body_left ||
                (enum_size != text.size() && text[enum_size] != ' ')) return;
        const std::string token(text.substr(0, enum_size));
        if (std::any_of(type_path.begin(), type_path.end(),
                [&](const DfhackItemOutputRecord &record) { return record.source == token; })) return;
        std::string digits;
        for (size_t end = at + 1; end <= table_end; ++end) {
            const auto part = end == at + 1 ? text.substr(enum_size)
                : std::string_view(rows[end - 1].source);
            bool numeric = true;
            for (unsigned char ch : part) {
                if (ch >= '0' && ch <= '9') digits.push_back(static_cast<char>(ch));
                else if (ch != ' ') { numeric = false; break; }
            }
            if (!numeric) break;
            uint64_t count = 0;
            if (!dfhack_item_positive_count(digits, count) || count > total - sum ||
                    count > previous) continue;
            const std::string complete = token + std::string(enum_size < 14 ? 14 - enum_size : 0, ' ') +
                ' ' + std::string(digits.size() < 5 ? 5 - digits.size() : 0, ' ') + digits;
            if (!same_layout(complete, at, end)) continue;
            DfhackItemOutputRecord identity;
            identity.rows.assign(rows.begin() + at, rows.begin() + end);
            identity.source = token;
            identity.native_rows = static_cast<int>(end - at);
            type_path.push_back(std::move(identity));
            self(self, end, sum + count, count);
            type_path.pop_back();
            if (type_solutions > 1 || exhausted) return;
        }
    };
    table_search(table_search, table_at, 0, total);
    if (exhausted || type_solutions != 1) return std::nullopt;
    // The column titles are authored labels, while the table entries are
    // df.item_type identifiers. Reserve just each title's exact glyph span,
    // including the narrow-layout case where WrappedLabel splits the header.
    for (std::string_view title : {"TYPE", "COUNT"}) {
        bool found = false;
        for (size_t row = header_at; row < header_end; ++row) {
            const size_t at = rows[row].source.find(title);
            if (at == std::string::npos) continue;
            if (found) return std::nullopt;
            found = true;
            DfhackItemOutputRecord caption;
            Match match = rows[row];
            match.x += static_cast<int>(at);
            match.length = static_cast<int>(title.size());
            match.source.assign(title);
            caption.rows.push_back(std::move(match));
            caption.source.assign(title);
            caption.native_rows = 1;
            const auto target = catalog.gui_fields.find(
                "DFHack GUI Item type counts: " + std::string(title));
            if (target != catalog.gui_fields.end() && contains_cjk_utf8(target->second))
                caption.target = target->second;
            records.push_back(std::move(caption));
        }
        if (!found) return std::nullopt;
    }
    for (auto &record : type_selected) records.push_back(std::move(record));
    resolve_captions();
    return records;
}
