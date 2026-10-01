// Overview's optional quote and third-person memory are one bounded footer document.
// Keep native source ownership separate from Chinese placement, and use the
// shared measured paragraph fitter rather than English-width centering.
void Overlay::append_character_overview_footer(
        const std::vector<std::string> &native_rows,
        std::vector<std::string> &screen_rows, std::vector<Match> &matches,
        int tabs_y, int only_y, bool source_scan) const {
    if (tabs_y < 0) return;
    const std::string &tabs = native_rows[static_cast<size_t>(tabs_y)];
    const auto tab_fields = character_information_tab_fields(tabs);
    if (tab_fields.empty()) return;
    const int first_tab = tab_fields.front().start, last_tab_end = tab_fields.back().end;
    int content_top = tabs_y + 1;
    for (const auto &field : tab_fields) {
        bool top = false;
        (void)cell_at(field.start, tabs_y, &top);
        const auto *flags = top ? gps_->screentexpos_top_flag : gps_->screentexpos_flag;
        const size_t tile = static_cast<size_t>(field.start) * gps_->dimy + tabs_y;
        if (flags && (flags[tile] & (1u << 3)))
            content_top = std::max(content_top, tabs_y + 2);
    }
    const auto grid = find_character_summary_grid(*gps_,
        first_tab, last_tab_end, content_top);
    std::optional<AsciiPanelFrame> frame;
    if (grid && grid->left > 0 && grid->right < gps_->dimx) {
        // The overview's four summary bands establish the footer's width.
        // Header side tabs can interrupt the upper outer frame, and summary
        // fields can overwrite its sides. Neither changes this prose box.
        // Prove only the continuous footer sides and its complete bottom.
        const int left = grid->left - 1, right = grid->right;
        const NativePanelBorders borders(*gps_);
        const auto edge = [&](int x, int y, int part) {
            const auto &row = native_rows[static_cast<size_t>(y)];
            if (borders.at(x, y, part, std::string_view(row),
                    std::pair{left, right + 1})) return true;
            const std::string_view span(row.data() + left,
                static_cast<size_t>(right - left + 1));
            if (!is_cp437_box_separator(span, static_cast<size_t>(x - left)))
                return false;
            const auto ch = static_cast<unsigned char>(row[static_cast<size_t>(x)]);
            if (part == 6) return ch == 0xd3 || ch == 0xd4;
            if (part == 8) return ch == 0xbd || ch == 0xbe;
            return false;
        };
        for (int y = grid->bottom + 1; y < gps_->dimy; ++y) {
            if (edge(left, y, 6) && edge(right, y, 8)) {
                bool complete = true;
                for (int x = left + 1; x < right; ++x) {
                    if (!edge(x, y, 7)) { complete = false; break; }
                }
                if (complete) frame = AsciiPanelFrame{left, grid->bottom, right, y};
                break;
            }
            if (!edge(left, y, 3) || !edge(right, y, 5)) break;
        }
    }
    if (!frame) frame = find_ascii_panel_frame(static_cast<int>(first_tab),
        last_tab_end, tabs_y, gps_->dimx, gps_->dimy,
        [&](int x, int y) { return static_cast<unsigned char>(
            native_rows[static_cast<size_t>(y)][static_cast<size_t>(x)]); });
    if (!frame) frame = find_graphical_character_panel_frame(*gps_,
        first_tab, last_tab_end, tabs_y);
    if (!frame) frame = find_character_overview_frame(*gps_,
        first_tab, last_tab_end, tabs_y,
        [&](int x, int y) { return static_cast<unsigned char>(native_rows[y][x]); });
    if (!frame) return; // A neighbouring map/list is never spare paragraph space.

    // The four summary bands end at a full-width T separator. An animal may
    // have only a third-person memory, so a leading quote cannot be the sole
    // signal that this is footer prose. Share the grid reader with summary
    // placement, and never claim prose from another character subtab.
    int footer_top = -1;
    if (grid && grid->left == frame->left + 1 && grid->right == frame->right &&
        grid->bottom < frame->bottom) {
        footer_top = grid->bottom + 1;
    } else {
        for (int y = content_top; y < frame->bottom; ++y) {
            int junctions = 0;
            bool horizontal = true;
            for (int x = frame->left + 1; x < frame->right; ++x) {
                const auto ch = static_cast<unsigned char>(native_rows[static_cast<size_t>(y)][x]);
                if (ch == 0xc1 || ch == 0xca || ch == 0xcf || ch == 0xd0) ++junctions;
                else if (ch != 0xc4 && ch != 0xcd) { horizontal = false; break; }
            }
            if (horizontal && junctions == 1) footer_top = y + 1;
        }
    }

    int age_y = -1;
    for (int y = tabs_y + 1; y < frame->bottom; ++y) {
        const std::string row = lower(normalize_utterance(std::string_view(
            native_rows[static_cast<size_t>(y)]).substr(
                frame->left + 1, frame->right - frame->left - 1)));
        for (std::string_view suffix : {" year old", " years old"}) {
            const size_t at = row.find(suffix);
            if (at != std::string::npos && at > 0 &&
                row[at - 1] >= '0' && row[at - 1] <= '9') age_y = y;
        }
        if (age_y >= 0) break;
    }
    struct Paragraph {
        std::vector<Match> rows;
        std::string source;
        std::vector<int> colors; // One native color per CP437 source byte.
        std::optional<std::string> target;
        std::vector<size_t> origins;
    };
    auto rgb_at = [&](int x, int y) {
        bool top = false;
        const auto *cell = cell_at(x, y, &top);
        return cell ? (cell[1] << 16) | (cell[2] << 8) | cell[3] : -1;
    };
    auto add_row = [&](Paragraph &paragraph, int x, int y, int end) {
        const auto part = native_rows[static_cast<size_t>(y)].substr(x, end - x);
        if (!paragraph.source.empty()) {
            paragraph.source.push_back(' ');
            paragraph.colors.push_back(paragraph.colors.back());
        }
        paragraph.source += part;
        for (int i = x; i < end; ++i) paragraph.colors.push_back(rgb_at(i, y));
        paragraph.rows.push_back({x, y, end - x, kCharacterOverviewQuoteRule, {}, part});
    };
    auto bounds = [&](int y, int left) {
        const auto &row = native_rows[static_cast<size_t>(y)];
        int begin = left, end = frame->right;
        while (begin < end && row[static_cast<size_t>(begin)] == ' ') ++begin;
        while (end > begin && row[static_cast<size_t>(end - 1)] == ' ') --end;
        return std::pair{begin, end};
    };
    auto reserve_unknown = [&](const Paragraph &paragraph) {
        for (const Match &row : paragraph.rows) {
            std::fill_n(screen_rows[static_cast<size_t>(row.y)].begin() + row.x, row.length, ' ');
            if (only_y >= 0 && only_y != row.y) continue;
            Match unknown = row;
            unknown.native_help_source_only = true;
            if (row.y == paragraph.rows.front().y)
                unknown.native_help_review_source = normalize_utterance(paragraph.source);
            matches.push_back(std::move(unknown));
        }
    };
    auto recover_wrapping = [&](Paragraph &paragraph, std::string_view complete) {
        // Only whitespace may differ from a captured pre-wrap source. Retain
        // current-frame colors even when the wrapper split inside a word.
        std::vector<size_t> visible, captured;
        auto nonspace = [](std::string_view text, std::vector<size_t> &positions) {
            for (size_t i = 0; i < text.size(); ++i)
                if (text[i] != ' ' && text[i] != '\t' && text[i] != '\r' && text[i] != '\n')
                    positions.push_back(i);
        };
        nonspace(paragraph.source, visible);
        nonspace(complete, captured);
        if (visible.size() != captured.size() || visible.empty()) return false;
        for (size_t i = 0; i < visible.size(); ++i)
            if (paragraph.source[visible[i]] != complete[captured[i]]) return false;
        std::vector<int> colors(complete.size(), paragraph.colors[visible.front()]);
        size_t next = 0;
        for (size_t i = 0; i < complete.size(); ++i) {
            if (next + 1 < captured.size() && i >= captured[next + 1]) ++next;
            colors[i] = paragraph.colors[visible[next]];
        }
        paragraph.source = complete;
        paragraph.colors = std::move(colors);
        return true;
    };
    auto translate_memory = [&](Paragraph &paragraph) {
        paragraph.target = translate_character_thought_paragraph(
            paragraph.source, &paragraph.origins);
    };
    auto append_colors = [](const Paragraph &paragraph, std::vector<int> &colors) {
        // The grammar maps output bytes through reordered semantic references;
        // rasterization consumes one color per UTF-32 glyph, not per UTF-8 byte.
        for (size_t i = 0; i < paragraph.target->size(); ++i) {
            if ((static_cast<unsigned char>((*paragraph.target)[i]) & 0xc0) == 0x80) continue;
            colors.push_back(paragraph.colors[paragraph.origins[i]]);
        }
    };

    for (int y = std::max({tabs_y + 1, age_y + 1, footer_top}); y < frame->bottom; ++y) {
        const auto [opening, first_end] = bounds(y, frame->left + 1);
        if (opening >= first_end) continue;
        const auto first = std::string_view(native_rows[static_cast<size_t>(y)]).substr(
            opening, first_end - opening);
        const bool has_quote = first.front() == '"';
        const bool memory_only = footer_top >= 0 &&
            (first.starts_with("He ") || first.starts_with("She ") || first.starts_with("It "));
        if (!has_quote && !memory_only) continue;
        Paragraph quote;
        bool closed = false;
        for (int row_y = y; has_quote && row_y < frame->bottom; ++row_y) {
            const auto [begin, row_end] = bounds(row_y, frame->left + 1);
            if (begin >= row_end) break;
            int end = begin;
            for (; end < row_end; ++end) {
                if (is_cp437_box_separator(native_rows[static_cast<size_t>(row_y)], end)) break;
                if (native_rows[static_cast<size_t>(row_y)][end] == '"' &&
                    (row_y != y || end != opening)) {
                    ++end;
                    closed = true;
                    break;
                }
            }
            if (end <= begin) break;
            add_row(quote, begin, row_y, end);
            if (closed || end < row_end) break;
        }
        if (has_quote && !closed) continue;
        if (has_quote) quote.target = translate_overview_quote(quote.source, &quote.origins);
        if (has_quote && !quote.target) {
            const auto captures = captured_native_paragraphs();
            for (auto capture = captures.rbegin(); capture != captures.rend(); ++capture) {
                auto complete = normalize_utterance(capture->source);
                if (complete.empty()) continue;
                if (complete.front() != '"') complete = '"' + complete + '"';
                if (!recover_wrapping(quote, complete)) continue;
                quote.target = translate_overview_quote(quote.source, &quote.origins);
                if (quote.target) break;
            }
        }
        if (has_quote && !quote.target) {
            if (age_y >= 0) reserve_unknown(quote);
            y = quote.rows.back().y;
            continue;
        }

        Paragraph memory;
        int next_y = has_quote ? quote.rows.back().y + 1 : y;
        // DF separates the quote from its memory with a blank row. Read the
        // first following paragraph only; buttons and other prose stay owned
        // by their widgets, even if this footer has ample unused space.
        for (; next_y < frame->bottom; ++next_y) {
            const auto [begin, end] = bounds(next_y, frame->left + 1);
            if (begin < end) break;
        }
        if (next_y < frame->bottom) {
            const auto [begin, end] = bounds(next_y, frame->left + 1);
            const auto first = std::string_view(native_rows[static_cast<size_t>(next_y)]).substr(begin, end - begin);
            if (first.starts_with("He ") || first.starts_with("She ") || first.starts_with("It ")) {
                for (int row_y = next_y; row_y < frame->bottom; ++row_y) {
                    const auto [start, stop] = bounds(row_y, frame->left + 1);
                    if (start >= stop) break;
                    const auto &row = native_rows[static_cast<size_t>(row_y)];
                    if (std::any_of(row.begin() + start, row.begin() + stop,
                        [](unsigned char ch) { return is_cp437_box_drawing_byte(ch); })) break;
                    add_row(memory, start, row_y, stop);
                }
                // Own the complete native paragraph before parsing. A line
                // ending at a shorter valid event (or before its punctuation)
                // must not leave the remaining event words to generic matching.
                if (!memory.rows.empty()) translate_memory(memory);
                if (!memory.target && !memory.rows.empty()) {
                    const auto captures = captured_native_paragraphs();
                    for (auto capture = captures.rbegin(); capture != captures.rend(); ++capture) {
                        if (!recover_wrapping(memory, capture->source)) continue;
                        translate_memory(memory);
                        if (memory.target) break;
                    }
                }
            }
        }
        std::string target;
        std::vector<int> foregrounds;
        std::vector<Match> source_rows = quote.rows;
        if (quote.target) {
            target = *quote.target;
            append_colors(quote, foregrounds);
        }
        if (memory.target) {
            if (quote.target) {
                target += "\n\n";
                foregrounds.insert(foregrounds.end(), 2, foregrounds.back());
            }
            target += *memory.target;
            append_colors(memory, foregrounds);
            source_rows.insert(source_rows.end(), memory.rows.begin(), memory.rows.end());
        } else if (!memory.rows.empty()) {
            reserve_unknown(memory);
        }
        if (source_rows.empty()) {
            if (!memory.rows.empty()) y = memory.rows.back().y;
            continue;
        }
        const int last_source_y = source_rows.back().y;
        int limit = last_source_y + 1;
        // Extra wrap rows must be blank inside this actual frame. Never force
        // Chinese into the English line count or silently truncate its tail.
        while (limit < frame->bottom) {
            const auto [begin, end] = bounds(limit, frame->left + 1);
            if (begin < end) break;
            ++limit;
        }
        std::vector<Match> slots;
        for (int row_y = y; row_y < limit; ++row_y) {
            const auto found = std::find_if(source_rows.begin(), source_rows.end(),
                [&](const Match &row) { return row.y == row_y; });
            if (found != source_rows.end()) slots.push_back(*found);
            else slots.push_back({opening, row_y, 0, kCharacterOverviewQuoteRule, {}, {}});
        }
        std::vector<Match> fitted;
        if (!append_bounded_paragraph(std::move(slots), target, screen_rows,
                fitted, only_y, frame->right, frame->right, foregrounds,
                false, frame->left + 1)) {
            if (quote.target) reserve_unknown(quote);
            if (memory.target) reserve_unknown(memory);
            y = last_source_y;
            continue;
        }
        // Clear native ink BEFORE drawing either Chinese paragraph. Each
        // native color run needs its own clear color: a white-only erase can
        // leave the colored English emotion word underneath the translation.
        for (const Match &row : source_rows) {
            if (only_y >= 0 && only_y != row.y) continue;
            for (int begin = row.x; begin < row.x + row.length;) {
                const int color = rgb_at(begin, row.y);
                int end = begin + 1;
                while (end < row.x + row.length && rgb_at(end, row.y) == color) ++end;
                Match clear{begin, row.y, end - begin, kCharacterOverviewQuoteRule, {},
                    row.source.substr(begin - row.x, end - begin)};
                clear.layout_foreground_rgb = color;
                clear.graphical_clear_x = begin;
                clear.graphical_clear_y = row.y;
                clear.graphical_clear_width = end - begin;
                clear.graphical_clear_height = 1;
                matches.push_back(std::move(clear));
                begin = end;
            }
        }
        matches.insert(matches.end(), std::make_move_iterator(fitted.begin()),
            std::make_move_iterator(fitted.end()));
        if (only_y < 0 && !source_scan) {
            static std::array<std::atomic_bool, 2> logged{};
            if (!logged[has_quote ? 0 : 1].exchange(true)) log_line("INFO",
                std::string("Overview footer: ") + (has_quote ? "quote" : "memory only") +
                "; panel-aligned measured reflow, native semantic colors; columns=" +
                std::to_string(frame->left + 1) + ".." + std::to_string(frame->right) +
                "; " + quote.source + (memory.target ? " / " + memory.source : ""));
        }
        y = last_source_y;
    }
}
