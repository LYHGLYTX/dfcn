// The launcher is a document beside an executable autocomplete list. Own
// both before native page recognizers or global word translations run.
std::vector<std::string> dfhack_context_rows(gps_->dimy,
    std::string(gps_->dimx, ' '));
for (int y = 0; y < gps_->dimy; ++y)
    for (int x = 0; x < gps_->dimx; ++x) {
        bool top = false;
        const auto *cell = cell_at(x, y, &top);
        dfhack_context_rows[y][x] = cell && cell[0] ? static_cast<char>(cell[0]) : ' ';
    }
retain_native_dfhack_border_chars(*gps_, dfhack_context_rows);
std::vector<SDL_Rect> dfhack_launcher_frames;
std::vector<SDL_Rect> dfhack_launcher_regions;
std::vector<Match> dfhack_launcher_matches;
{
    constexpr std::string_view title = "DFHack Launcher";
    for (int title_y = 0; title_y < gps_->dimy; ++title_y) {
        const size_t title_at = dfhack_context_rows[title_y].find(title);
        if (title_at == std::string::npos) continue;
        const auto frame = native_dfhack_frame(dfhack_context_rows, title_y,
            static_cast<int>(title_at), static_cast<int>(title.size()));
        if (!frame) continue;
        const int left = frame->x, right = frame->x + frame->w - 1;
        const int top = frame->y, bottom = frame->y + frame->h - 1;
        const int divider = right - 29;
        // These two native labels and their documented offsets distinguish
        // the launcher from an arbitrary DFHack dialog with the same skin.
        if (divider <= left + 20 || top + 9 >= bottom ||
                dfhack_context_rows[top + 2].find("Tab/Shift+Tab", divider) == std::string::npos ||
                dfhack_context_rows[top + 7].find("Showing:", divider) == std::string::npos)
            continue;
        bool connected = true;
        for (int y = top + 1; connected && y < bottom; ++y) {
            const auto ch = static_cast<unsigned char>(dfhack_context_rows[y][divider]);
            connected = ch == 0xb3 || ch == 0xba || ch == 0xc5 ||
                ch == 0xce || ch == 0xb4 || ch == 0xb9;
        }
        if (!connected) continue;
        dfhack_launcher_frames.push_back(*frame);
        dfhack_launcher_regions.push_back(*frame);
        const auto caption = [&](std::string_view source, int y, int begin, int end) {
            const size_t at = dfhack_context_rows[y].find(source, begin);
            if (at == std::string::npos || at + source.size() > static_cast<size_t>(end)) return;
            const auto target = exact_literal_translation("DFHack help: " + std::string(source));
            if (!target || !contains_cjk_utf8(*target) || (only_y >= 0 && only_y != y) ||
                    screen_rows[y].compare(at, source.size(), source) != 0) return;
            Match match{static_cast<int>(at), y, static_cast<int>(source.size()),
                kDfhackHotkeysHintRule, *target, std::string(source)};
            match.layout_x = static_cast<int>(at);
            match.layout_length = end - match.layout_x;
            match.layout_clip_right = end;
            match.layout_left = true;
            dfhack_launcher_matches.push_back(std::move(match));
        };
        caption(title, top, left + 1, right);
        caption("run", top + 4, left + 1, left + 12);
        caption("history search:", top + 4, left + 12, divider);
        caption("Click or select via", top + 1, divider + 1, right);
        caption("Tags:", top + 4, divider + 1, right - 12);
        for (std::string_view source : {"Dev default", "Default", "Custom"})
            caption(source, top + 4, divider + 1, right);
        caption("Reset tag filter", top + 5, divider + 1, right);
        caption("Showing:", top + 7, divider + 1, divider + 10);
        caption("Matching tools", top + 7, divider + 10, right);
        caption("Similar tools", top + 7, divider + 10, right);
        caption("Tagged tools", top + 7, divider + 10, right);
        caption("Help", top + 6, left + 1, left + 10);
        caption("Output", top + 6, left + 10, left + 22);
        // In graphical mode tab text is repeated on its second half.
        caption("Help", top + 7, left + 1, left + 10);
        caption("Output", top + 7, left + 10, left + 22);
        caption("Clear output", top + 6, left + 20, divider);
        caption("Copy output to clipboard", top + 7, left + 20, divider);
        caption("Copied", top + 7, left + 20, divider);
        // Output has its own message/template catalogue. Help responses can
        // still use the document catalogue, after their native layout is read.
        {
            const int body_left = left + 2, body_right = divider - 3;
            const int body_top = top + 9;
            const int body_width = body_right - body_left;
            const bool output_page =
                dfhack_context_rows[top + 6].find("Clear output", left + 20) <
                    static_cast<size_t>(divider) ||
                dfhack_context_rows[top + 7].find("Copy output to clipboard", left + 20) <
                    static_cast<size_t>(divider) ||
                dfhack_context_rows[top + 7].find("Copied", left + 20) <
                    static_cast<size_t>(divider);
            const int tile_w = gps_->tile_pixel_x, tile_h = gps_->tile_pixel_y;
            const int origin_x = (gps_->screen_pixel_x - gps_->dimx * tile_w) / 2;
            const int origin_y = (gps_->screen_pixel_y - gps_->dimy * tile_h) / 2;
            const auto read_help_row = [&](int y, bool item_glyphs = false) -> std::optional<Match> {
                const auto band = std::string_view(dfhack_context_rows[y]).substr(
                    body_left, body_right - body_left);
                const auto ink = trim_view(band);
                if (ink.empty() || std::any_of(ink.begin(), ink.end(), [item_glyphs](unsigned char ch) {
                        // pronoun_type.symbol is CP437 0x0b/0x0c. Silent
                        // command output keeps these painted sex glyphs;
                        // they are part of the captured name, not padding.
                        // getReadableDescription paints the masterwork sun
                        // and paired magic arrows as CP437 0x0f/0x11/0x10.
                        // Admit them only in the item protocol reader.
                        const bool item_symbol = item_glyphs &&
                            (ch == 0x0f || ch == 0x10 || ch == 0x11);
                        return (ch < ' ' && ch != 0x0b && ch != 0x0c && !item_symbol) ||
                            (ch >= 0xb3 && ch <= 0xda);
                    })) return std::nullopt;
                const int x = body_left + static_cast<int>(ink.data() - band.data());
                if (screen_rows[y].compare(x, ink.size(), ink) != 0) return std::nullopt;
                return Match{x, y, static_cast<int>(ink.size()), kDfhackHotkeysHintRule,
                    {}, std::string(ink)};
            };
            const auto blank_help_row = [&](int y) {
                return trim_view(std::string_view(dfhack_context_rows[y]).substr(
                    body_left, body_width)).empty();
            };
            // Mirror dfhack.lua's string:wrap: retain leading indentation and
            // internal padding, trim only trailing space, and preserve hard
            // line breaks. helpdb print_columns first wraps prose to 58 bytes,
            // then WrappedLabel wraps each padded console line to body_width.
            const auto native_wrap = [](std::string_view text, int width) {
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
            };
            const auto identifier = [](std::string_view value) {
                return value == "?" || (!value.empty() && std::all_of(value.begin(), value.end(),
                    [](unsigned char ch) {
                        return (ch >= 'a' && ch <= 'z') || (ch >= 'A' && ch <= 'Z') ||
                            (ch >= '0' && ch <= '9') || ch == '/' || ch == '-' || ch == '_' || ch == '.';
                    }));
            };
            struct OutputColumnHead {
                std::string key;
                Match description;
                int first_y = -1;
                bool long_key = false;
            };
            bool table_command = false;
            std::string output_command;
            std::unordered_set<int> item_output_rows;
            const auto helpdb_description = [&](const Match &description) {
                if (description.source.starts_with("tags: ")) return false;
                const auto initial = std::string_view(description.source);
                if (description.x == body_left && initial.size() > 21 && initial[20] == ' ') {
                    const auto key = trim_view(initial.substr(0, 20));
                    if (identifier(key) && std::all_of(initial.begin() + key.size(),
                            initial.begin() + 21, [](char ch) { return ch == ' '; })) return false;
                }
                if (table_command) return true;
                // The echo may have scrolled away, and the GUI can wrap the
                // first 58-column description again. Read that whole record
                // before consulting the catalog; tag metadata also proves
                // that a padded name belongs to helpdb's command listing.
                std::vector<Match> prose{description};
                for (int line = description.y + 1; line < bottom &&
                        prose.size() < 64; ++line) {
                    const auto row = read_help_row(line);
                    if (!row || row->source.starts_with("> ")) break;
                    if (row->x == body_left + 22 && row->source.starts_with("tags: "))
                        return true;
                    const auto text = std::string_view(row->source);
                    if (row->x == body_left && text.size() > 21 && text[20] == ' ') {
                        const auto key = trim_view(text.substr(0, 20));
                        if (identifier(key) && std::all_of(text.begin() + key.size(),
                                text.begin() + 21, [](char ch) { return ch == ' '; })) break;
                    }
                    if (row->x == body_left && text.size() > 20 && identifier(text)) break;
                    if (row->x != body_left && row->x != body_left + 22) break;
                    prose.push_back(*row);
                }
                return translate_dfhack_output_rows(prose, 58).has_value();
            };
            const auto column_head = [&](int y) -> std::optional<OutputColumnHead> {
                if (!output_page || body_width <= 22) return std::nullopt;
                const auto first = read_help_row(y);
                if (!first || first->x != body_left) return std::nullopt;
                const auto text = std::string_view(first->source);
                if (text.size() > 21 && text[20] == ' ') {
                    const auto key = trim_view(text.substr(0, 20));
                    const auto description = trim_view(text.substr(21));
                    if (identifier(key) && !description.empty() &&
                            std::all_of(text.begin() + key.size(), text.begin() + 21,
                                [](char ch) { return ch == ' '; })) {
                        Match prose = *first;
                        prose.x += static_cast<int>(description.data() - text.data());
                        prose.length = static_cast<int>(description.size());
                        prose.source.assign(description);
                        if (helpdb_description(prose))
                            return OutputColumnHead{std::string(key), std::move(prose), y, false};
                    }
                }
                // Names longer than 20 bytes occupy their own console line.
                // WrappedLabel can split a very long name over several rows;
                // all those rows remain executable native identifiers.
                std::string key;
                for (int line = y; line < bottom; ++line) {
                    const auto row = read_help_row(line);
                    if (!row) break;
                    const size_t first_word = row->source.find(' ');
                    const bool rewrapped_short_name = key.size() <= 20 && line == y + 1 &&
                        row->x == body_left &&
                        (first_word == std::string::npos ? row->source.size() : first_word) + 21 >
                            static_cast<size_t>(body_width);
                    const bool rewrapped_long_description = key.size() > 20 &&
                        key.size() % body_width != 0 && row->x == body_left &&
                        !identifier(row->source);
                    if (!key.empty() && ((key.size() > 20 && row->x == body_left + 22) ||
                            rewrapped_short_name || rewrapped_long_description) &&
                            helpdb_description(*row)) {
                        const bool long_key = key.size() > 20;
                        return OutputColumnHead{std::move(key), *row, y, long_key};
                    }
                    if (row->x != body_left || !identifier(row->source) ||
                            (line > y && key.size() % body_width != 0)) break;
                    key += row->source;
                }
                return std::nullopt;
            };
            const auto column_native_lines = [&](std::string_view source,
                    std::string_view key, bool long_key) {
                std::vector<std::string> result;
                const auto descriptions = native_wrap(source, 58);
                if (long_key) {
                    auto names = native_wrap(key, body_width);
                    result.insert(result.end(), names.begin(), names.end());
                }
                for (size_t line = 0; line < descriptions.size(); ++line) {
                    std::string console_line;
                    if (line == 0 && !long_key) {
                        console_line.assign(key);
                        console_line.append(20 - key.size(), ' ');
                        console_line += ' ';
                    } else console_line.assign(22, ' ');
                    console_line += descriptions[line];
                    auto physical = native_wrap(console_line, body_width);
                    result.insert(result.end(), physical.begin(), physical.end());
                }
                return result;
            };
            for (int y = body_top; y < bottom;) {
                if (item_output_rows.contains(y)) { ++y; continue; }
                if (!read_help_row(y)) { ++y; continue; }
                const auto first = *read_help_row(y);
                if (output_page && first.source.starts_with("> ")) {
                    const auto command = trim_view(std::string_view(first.source).substr(2));
                    const auto space = command.find(' ');
                    const auto name = command.substr(0, space);
                    output_command.assign(name);
                    table_command = name == "tags" || name == "ls" || name == "dir";
                    // An unwrapped echo and its actual blank separator are
                    // evidence for this output block alone. The item reader
                    // additionally proves its verbose/footer/type protocol.
                    if (first.x == body_left && first.source.size() < static_cast<size_t>(body_width) &&
                            y + 1 < bottom && blank_help_row(y + 1)) {
                        std::vector<Match> item_block;
                        bool complete = true;
                        for (int at = y + 2; at < bottom; ++at) {
                            const auto row = read_help_row(at, true);
                            if (row && row->source.starts_with("> ")) break;
                            if (row) item_block.push_back(*row);
                            else if (blank_help_row(at)) item_block.push_back(Match{
                                body_left, at, 0, kDfhackHotkeysHintRule, {}, {}});
                            else { complete = false; break; }
                        }
                        if (complete)
                            if (const auto catalog = g_dfhack_output_snapshot.load(std::memory_order_acquire))
                                if (auto records = translate_dfhack_item_output_rows(
                                        *catalog, command, item_block, body_left, body_width)) {
                                    for (auto &record : *records) {
                                        for (const auto &row : record.rows) item_output_rows.insert(row.y);
                                        if (record.rows.empty() || !contains_cjk_utf8(record.target)) continue;
                                        const int text_left = record.rows.front().x;
                                        const bool heading = record.source == "TYPE" || record.source == "COUNT";
                                        const int text_right = heading
                                            ? text_left + record.rows.front().length : body_right;
                                        record.rows.front().layout_native_clip = SDL_Rect{
                                            origin_x + text_left * tile_w,
                                            origin_y + record.rows.front().y * tile_h,
                                            (text_right - text_left) * tile_w,
                                            static_cast<int>(record.rows.size()) * tile_h};
                                        append_bounded_paragraph(std::move(record.rows), record.target,
                                            screen_rows, dfhack_launcher_matches, only_y, text_right,
                                            text_right, {}, false, text_left);
                                    }
                                }
                    }
                    ++y;
                    continue;
                }
                if (output_page && first.x == body_left + 22 &&
                        first.source.starts_with("tags: ")) {
                    if (const auto label = exact_literal_translation("DFHack help: Tags:");
                            label && contains_cjk_utf8(*label) && (only_y < 0 || only_y == y)) {
                        Match match{first.x, y, 5, kDfhackHotkeysHintRule, *label, "tags:"};
                        match.layout_x = first.x;
                        match.layout_length = 5;
                        match.layout_left = true;
                        match.layout_clip_right = first.x + 5;
                        dfhack_launcher_matches.push_back(std::move(match));
                    }
                    int end = y + 1;
                    for (; end < bottom; ++end) {
                        const auto row = read_help_row(end);
                        if (!row || row->source.starts_with("> ") || column_head(end) ||
                                (row->x != body_left && row->x != body_left + 22)) break;
                        // Metadata owns only further category tokens. An
                        // unfamiliar following message must be read anew,
                        // even when its command header has no translation.
                        if (!dfhack_tag_metadata_tokens(row->source)) break;
                    }
                    y = end;
                    continue;
                }
                if (const auto head = column_head(y)) {
                    std::vector<Match> prose{head->description};
                    int end = head->description.y + 1;
                    for (; end < bottom; ++end) {
                        const auto row = read_help_row(end);
                        if (!row || row->source.starts_with("> ") || column_head(end) ||
                                (row->x == body_left + 22 && row->source.starts_with("tags: ")) ||
                                (row->x != body_left && row->x != body_left + 22)) break;
                        prose.push_back(*row);
                    }
                    NativeParagraphViewport viewport{};
                    std::string complete_source;
                    const auto target = translate_dfhack_output_rows(prose, 58,
                        &viewport, &complete_source);
                    if (target && !complete_source.empty() && contains_cjk_utf8(*target)) {
                        const auto expected = column_native_lines(complete_source,
                            head->key, head->long_key);
                        bool same = expected.size() >= static_cast<size_t>(end - y);
                        for (int line = y; same && line < end; ++line) {
                            const auto actual = read_help_row(line);
                            const auto wanted = trim_view(expected[line - y]);
                            same = actual && actual->source == wanted &&
                                actual->x == body_left + static_cast<int>(
                                    wanted.data() - expected[line - y].data());
                        }
                        // A known following row closes this block. Only the
                        // viewport edge may hide the rest of its source.
                        same = same && (expected.size() == static_cast<size_t>(end - y) ||
                            end == bottom);
                        if (same) {
                            const int native_rows = static_cast<int>(expected.size()) -
                                (head->description.y - y);
                            prose.front().layout_native_clip = SDL_Rect{
                                origin_x + body_left * tile_w,
                                origin_y + head->description.y * tile_h,
                                body_width * tile_w, (end - head->description.y) * tile_h};
                            append_bounded_paragraph(std::move(prose), *target, screen_rows,
                                dfhack_launcher_matches, only_y, body_right, body_right,
                                {}, false, head->description.x == body_left
                                    ? body_left : body_left + 21,
                                native_rows > end - head->description.y
                                    ? std::optional<NativeParagraphViewport>(
                                        NativeParagraphViewport{0, native_rows}) : std::nullopt);
                        }
                    }
                    // Even an unmapped table owns its complete description.
                    // A suffix must not translate independently of its head.
                    y = end;
                    continue;
                }
                std::vector<Match> rows;
                int end = y;
                while (end < bottom) {
                    if (item_output_rows.contains(end)) break;
                    const auto row = read_help_row(end);
                    if (!row || (output_page && (row->source.starts_with("> ") ||
                            column_head(end) || (row->x == body_left + 22 &&
                                row->source.starts_with("tags: "))))) break;
                    rows.push_back(*row);
                    ++end;
                }
                const auto following = end < bottom ? read_help_row(end) : std::nullopt;
                const bool tag_boundary = following && following->x == body_left + 22 &&
                    following->source.starts_with("tags: ");
                if (output_page && ((table_command && first.x == body_left + 22) ||
                        column_head(end) || tag_boundary)) {
                    // Recover a scrolling table tail only when its complete
                    // catalog source reproduces every byte and indentation of
                    // the two native wrapping passes. The unknown identifier
                    // affects only the first row's padding, never later rows.
                    NativeParagraphViewport ignored{};
                    std::string complete_source;
                    const auto target = translate_dfhack_output_rows(rows, 58,
                        &ignored, &complete_source);
                    std::optional<NativeParagraphViewport> selected;
                    bool ambiguous = false;
                    if (target && contains_cjk_utf8(*target) && !complete_source.empty()) {
                        for (bool long_key : {false, true}) {
                            const auto expected = column_native_lines(complete_source,
                                long_key ? std::string_view("xxxxxxxxxxxxxxxxxxxxx")
                                         : std::string_view("x"), long_key);
                            const size_t names = long_key ? 1 : 0;
                            for (size_t start = names; start + rows.size() <= expected.size(); ++start) {
                                bool same = start + rows.size() == expected.size() || end == bottom;
                                for (size_t line = 0; same && line < rows.size(); ++line) {
                                    const auto ink = trim_view(expected[start + line]);
                                    same = rows[line].source == ink &&
                                        rows[line].x == body_left + static_cast<int>(
                                            ink.data() - expected[start + line].data());
                                }
                                if (!same) continue;
                                const NativeParagraphViewport recovered{
                                    static_cast<int>(start - names),
                                    static_cast<int>(expected.size() - names)};
                                if (selected && (selected->first_line != recovered.first_line ||
                                        selected->total_lines != recovered.total_lines)) ambiguous = true;
                                else selected = recovered;
                            }
                        }
                        if (selected && !ambiguous && !rows.empty()) {
                            rows.front().layout_native_clip = SDL_Rect{
                                origin_x + body_left * tile_w, origin_y + y * tile_h,
                                body_width * tile_w, static_cast<int>(rows.size()) * tile_h};
                            append_bounded_paragraph(std::move(rows), *target, screen_rows,
                                dfhack_launcher_matches, only_y, body_right, body_right,
                                {}, false, body_left + 21, selected);
                        }
                    }
                    // An unproved tail retains its native bytes; it cannot
                    // fall through to independent help-suffix translation.
                    y = std::max(y + 1, end);
                    continue;
                }
                bool claimed = false;
                for (size_t count = rows.size(); count > 0; --count) {
                    std::vector<Match> paragraph(rows.begin(), rows.begin() + count);
                    NativeParagraphViewport viewport{};
                    std::string complete_source;
                    std::optional<std::string> target;
                    if (output_page)
                        if (const auto catalog = g_dfhack_output_snapshot.load(std::memory_order_acquire))
                            target = translate_dfhack_lever_output_rows(*catalog, paragraph,
                                body_left, body_width, &complete_source);
                    if (!target && output_page && output_command == "instruments" &&
                            !paragraph.empty() && paragraph.front().x >= body_left) {
                        std::string instrument(paragraph.front().x - body_left, ' ');
                        for (size_t row = 0; row < paragraph.size(); ++row) {
                            if (row) instrument += ' ';
                            instrument += paragraph[row].source;
                        }
                        const auto expected = native_wrap(instrument, body_width);
                        bool same = expected.size() == paragraph.size();
                        for (size_t row = 0; same && row < paragraph.size(); ++row) {
                            const auto ink = trim_view(expected[row]);
                            same = ink == paragraph[row].source &&
                                paragraph[row].x == body_left + static_cast<int>(
                                    ink.data() - expected[row].data());
                        }
                        if (same)
                            if (const auto catalog = g_dfhack_output_snapshot.load(std::memory_order_acquire)) {
                                target = translate_dfhack_instruments_output(*catalog, instrument, false);
                                if (target) complete_source = std::move(instrument);
                            }
                    }
                    if (!target) target = output_page
                        ? translate_dfhack_output_rows(paragraph, body_width,
                            &viewport, &complete_source)
                        : translate_dfhack_help_rows(paragraph, body_width,
                            &viewport, &complete_source);
                    if (!target) continue;
                    if (output_page && viewport.total_lines > static_cast<int>(count)) {
                        // A document slice must also have the actual native
                        // wrapping/indentation of ordinary output. A table's
                        // 58-column hard breaks cannot become prose merely
                        // because its visible tail matches a catalog suffix.
                        const auto expected = native_wrap(complete_source, body_width);
                        bool same = false;
                        for (size_t start = 0; !same && start + count <= expected.size(); ++start) {
                            same = true;
                            for (size_t line = 0; same && line < count; ++line) {
                                const auto ink = trim_view(expected[start + line]);
                                same = paragraph[line].source == ink &&
                                    paragraph[line].x == body_left + static_cast<int>(
                                        ink.data() - expected[start + line].data());
                            }
                            if (same) viewport = {static_cast<int>(start),
                                static_cast<int>(expected.size())};
                        }
                        if (!same) continue;
                    }
                    if (!contains_cjk_utf8(*target)) {
                        // Documentation commands/code are native ink; they
                        // still belong to this document, never a word rule.
                        y += static_cast<int>(count);
                        claimed = true;
                        break;
                    }
                    int clip_bottom = y + static_cast<int>(count);
                    if (count == rows.size())
                        while (clip_bottom < bottom && !read_help_row(clip_bottom)) ++clip_bottom;
                    paragraph.front().layout_native_clip = SDL_Rect{
                        origin_x + body_left * tile_w, origin_y + y * tile_h,
                        (body_right - body_left) * tile_w, (clip_bottom - y) * tile_h};
                    const bool fitted = append_bounded_paragraph(std::move(paragraph), *target,
                        screen_rows, dfhack_launcher_matches, only_y, body_right, body_right,
                        {}, false, body_left,
                        viewport.total_lines > static_cast<int>(count)
                            ? std::optional<NativeParagraphViewport>(viewport) : std::nullopt);
                    if (!fitted) continue;
                    y += static_cast<int>(count);
                    claimed = true;
                    break;
                }
                if (!claimed) ++y;
            }
        }
        // Reserve input, executable list, and complete help/output sources
        // regardless of translation coverage. This never suppresses native
        // glyphs: only translated Match records own suppression/drawing.
        for (int y = top; y <= bottom; ++y)
            std::fill_n(screen_rows[y].begin() + left, frame->w, ' ');
    }
}
