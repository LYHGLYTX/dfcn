// Footer layout and immediate suppression must agree on whether the complete
// native quote currently owns these cells, including every visible wrap row.
std::optional<NativeOverviewQuoteDraw> Overlay::current_character_overview_quote() const {
    if (!gps_) return std::nullopt;
    std::optional<NativeOverviewQuoteDraw> draw;
    {
        std::lock_guard<std::mutex> lock(g_native_overview_quote_mutex);
        draw = g_native_overview_quote_draw;
    }
    if (draw) {
        // Saved buffer addresses can differ in copied background/composited
        // read views. Prove the complete visible source against this view;
        // never dereference a saved buffer or use its address as page lifetime.
        bool current = draw->dimx == gps_->dimx &&
            draw->dimy == gps_->dimy && draw->left >= 0 &&
            draw->right > draw->left && draw->right <= gps_->dimx &&
            draw->top >= 0 && draw->bottom > draw->top && draw->bottom <= gps_->dimy &&
            !draw->wrapped_lines.empty();
        bool ink = false;
        // Cached native grids can outlive the draw epoch. Prove their actual
        // current cells against the owned wrap rows, without consulting the
        // previous graphical composition's occlusion or mutated match rows.
        for (size_t line = 0; current && line < draw->wrapped_lines.size() &&
                int64_t(draw->top) + int64_t(line) < draw->bottom; ++line) {
            const auto &text = draw->wrapped_lines[line];
            const size_t count = std::min(text.size(),
                static_cast<size_t>(draw->right - draw->left));
            for (size_t i = 0; i < count; ++i) {
                // Spaces contribute no visible glyph to this source proof.
                // Prove every ink byte, as with the rich reading rows.
                if (text[i] == ' ') continue;
                bool top = false;
                const int x = draw->left + static_cast<int>(i);
                const int y = draw->top + static_cast<int>(line);
                const size_t tile = static_cast<size_t>(x) * gps_->dimy + y;
                // This addst loop writes the base grid. Its current write
                // must not be rejected by unrelated/stale top artwork.
                const auto *cell = draw->grid == gps_->screen
                    ? gps_->screen + tile * 8 : cell_at(x, y, &top);
                if (!cell || cell[0] != static_cast<unsigned char>(text[i])) {
                    current = false;
                    break;
                }
                ink = true;
            }
        }
        if (!current || !ink) draw.reset();
    }
    return draw;
}

std::optional<int> Overlay::character_overview_display_bottom(
        int left, int top, int width, int source_height) const {
    if (!gps_ || gps_->dimx <= 0 || gps_->dimy <= 0 || left < 0 || top < 0 ||
        left >= gps_->dimx || top >= gps_->dimy || width <= 0 ||
        width > gps_->dimx - left || source_height <= 0 ||
        source_height > gps_->dimy - top) return std::nullopt;
    int bottom = -1;
    if (const auto quote = current_character_overview_quote()) {
        if (left == quote->left && left + width <= quote->right &&
            top >= quote->top && top + source_height <= quote->bottom)
            bottom = quote->bottom;
    }
    if (bottom < 0) {
        const auto read_char = [&](int x, int y) -> unsigned char {
            bool top_layer = false;
            const auto *cell = cell_at(x, y, &top_layer);
            return cell && cell[0] ? cell[0] : ' ';
        };
        const auto settings = native_ui_settings();
        const bool classic = settings && settings->classic;
        for (int tabs_y = 0; tabs_y < top && bottom < 0; ++tabs_y) {
            std::string row(static_cast<size_t>(gps_->dimx), ' ');
            for (int x = 0; x < gps_->dimx; ++x) row[x] = static_cast<char>(read_char(x, tabs_y));
            const auto tabs = character_information_tab_fields(row);
            if (tabs.empty()) continue;
            const int first = tabs.front().start, last = tabs.back().end;
            auto frame = find_ascii_panel_frame(first, last, tabs_y,
                gps_->dimx, gps_->dimy, read_char);
            if (!frame) frame = find_graphical_character_panel_frame(*gps_, first, last, tabs_y);
            if (!frame) frame = find_character_overview_frame(*gps_, first, last, tabs_y, read_char);
            if (!frame || left != frame->left + 1 || left + width > frame->right ||
                top + source_height > frame->bottom - 1) continue;
            int content_top = tabs_y + 1;
            for (const auto &tab : tabs) {
                bool top_layer = false;
                (void)cell_at(tab.start, tabs_y, &top_layer);
                const auto *flags = top_layer ? gps_->screentexpos_top_flag : gps_->screentexpos_flag;
                const size_t at = static_cast<size_t>(tab.start) * gps_->dimy + tabs_y;
                if (flags && (flags[at] & (1u << 3))) content_top = tabs_y + 2;
            }
            const int divider = (frame->left + frame->right) / 2;
            for (int y = content_top; y < top && y < frame->bottom; ++y) {
                bool complete = native_ui_skin_at(*gps_, divider, y,
                    native_texture_interior_border_n_w_e(*gps_), classic);
                for (int x = frame->left + 1; complete && x < frame->right; ++x)
                    if (x != divider && !native_ui_skin_at(*gps_, x, y,
                            native_texture_interior_border_w_e(*gps_), classic)) complete = false;
                // The native prose limit excludes B-1 as well as the outer
                // bottom border. Arena's lower action/widget stops the blank
                // budget below; a captured quote carries its stricter B-4.
                if (complete) bottom = frame->bottom - 1;
            }
        }
    }
    if (bottom < top + source_height) return std::nullopt;
    const auto overlays = native_text_overlay_frames(*gps_);
    int limit = top + source_height;
    for (; limit < bottom; ++limit) {
        // Borrow only actual blank rows. A different document, action or
        // foreground widget owns its space even if some of its cells are blank.
        const bool overlay = std::any_of(overlays.begin(), overlays.end(), [&](const SDL_Rect &box) {
            return limit >= box.y && limit < box.y + box.h &&
                left < box.x + box.w && box.x < left + width;
        });
        if (overlay || native_button_text_rect(*gps_, left, left + width, limit)) break;
        bool blank = true;
        for (int x = left; blank && x < left + width; ++x) {
            bool top_layer = false;
            const auto *cell = cell_at(x, limit, &top_layer);
            if (!cell || (cell[0] != 0 && cell[0] != ' ') ||
                native_foreground_picture_at(*gps_, x, limit) ||
                native_item_action_at(*gps_, x, limit)) blank = false;
        }
        if (!blank) break;
    }
    return limit;
}

// Overview's optional quote and third-person memory are one bounded footer document.
// Keep native source ownership separate from Chinese placement, and use the
// shared measured paragraph fitter rather than English-width centering.
void Overlay::append_character_overview_footer(
        const std::vector<std::string> &input_rows,
        std::vector<std::string> &screen_rows, std::vector<Match> &matches,
        int tabs_y, int only_y, bool source_scan) const {
    auto draw = current_character_overview_quote();
    std::vector<std::string> draw_rows;
    if (draw) {
        draw_rows = input_rows;
        for (int y = draw->top; y < draw->bottom; ++y) {
            for (int x = draw->left; x < draw->right; ++x) {
                bool top = false;
                const size_t tile = static_cast<size_t>(x) * gps_->dimy + y;
                const auto *cell = draw->grid == gps_->screen
                    ? gps_->screen + tile * 8 : cell_at(x, y, &top);
                draw_rows[y][x] = cell && cell[0] ? static_cast<char>(cell[0]) : ' ';
            }
        }
    }
    const auto &native_rows = draw ? draw_rows : input_rows;
    if (tabs_y < 0 && !draw) return;
    const std::string tabs = tabs_y < 0 ? std::string{} : native_rows[static_cast<size_t>(tabs_y)];
    const auto tab_fields = character_information_tab_fields(tabs);
    if (tab_fields.empty() && !draw) return;
    const int first_tab = tab_fields.empty() ? draw->left : tab_fields.front().start;
    const int last_tab_end = tab_fields.empty() ? draw->right : tab_fields.back().end;
    int content_top = tabs_y + 1;
    for (const auto &field : tab_fields) {
        bool top = false;
        (void)cell_at(field.start, tabs_y, &top);
        const auto *flags = top ? gps_->screentexpos_top_flag : gps_->screentexpos_flag;
        const size_t tile = static_cast<size_t>(field.start) * gps_->dimy + tabs_y;
        if (flags && (flags[tile] & (1u << 3)))
            content_top = std::max(content_top, tabs_y + 2);
    }
    const auto grid = draw ? decltype(find_character_summary_grid(*gps_,
        first_tab, last_tab_end, content_top)){} : find_character_summary_grid(*gps_,
        first_tab, last_tab_end, content_top);
    std::optional<AsciiPanelFrame> frame;
    if (draw) frame = AsciiPanelFrame{
        draw->left - 1, draw->top - 1, draw->right, draw->bottom};
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
    int footer_top = draw ? draw->top : -1;
    if (grid && grid->left == frame->left + 1 && grid->right == frame->right &&
        grid->bottom < frame->bottom) {
        footer_top = grid->bottom + 1;
    } else if (!draw) {
        const auto settings = native_ui_settings();
        const bool classic = settings && settings->classic;
        const int divider = (frame->left + frame->right) / 2;
        for (int y = content_top; y < frame->bottom; ++y) {
            // The final separator establishes the prose viewport on its
            // own. Long summary fields can erase an earlier middle border;
            // graphical separators have texture IDs, not CP437 row bytes.
            bool native_separator = native_ui_skin_at(*gps_, divider, y,
                native_texture_interior_border_n_w_e(*gps_), classic);
            for (int x = frame->left + 1; native_separator && x < frame->right; ++x) {
                if (x != divider && !native_ui_skin_at(*gps_, x, y,
                        native_texture_interior_border_w_e(*gps_), classic))
                    native_separator = false;
            }
            if (native_separator) footer_top = y + 1;
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
    for (int y = tabs_y + 1; !draw && y < frame->bottom; ++y) {
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
        const size_t tile = static_cast<size_t>(x) * gps_->dimy + y;
        const auto *cell = draw && draw->grid == gps_->screen &&
                x >= draw->left && x < draw->right && y >= draw->top && y < draw->bottom
            ? gps_->screen + tile * 8 : cell_at(x, y, &top);
        return cell ? (cell[1] << 16) | (cell[2] << 8) | cell[3] : -1;
    };
    auto paired_rows = [&](int x, int y, int end) {
        if (y + 1 >= frame->bottom ||
            native_rows[static_cast<size_t>(y)].compare(x, end - x,
                native_rows[static_cast<size_t>(y + 1)], x, end - x) != 0)
            return false;
        constexpr uint32_t upper = 1u << 3, lower = 1u << 4;
        bool ink = false;
        for (int column = x; column < end; ++column) {
            const auto ch = static_cast<unsigned char>(native_rows[y][column]);
            if (ch == ' ') continue;
            bool a_top = false, b_top = false;
            const auto *a = cell_at(column, y, &a_top);
            const auto *b = cell_at(column, y + 1, &b_top);
            const auto *flags = a_top ? gps_->screentexpos_top_flag : gps_->screentexpos_flag;
            const size_t at = static_cast<size_t>(column) * gps_->dimy + y;
            if (!a || !b || a_top != b_top || a[0] != ch || b[0] != ch ||
                !flags || (flags[at] & (upper | lower)) != upper ||
                (flags[at + 1] & (upper | lower)) != lower) return false;
            ink = true;
        }
        return ink;
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
        // A native two-row glyph is one logical sentence row. Keep both
        // physical spans for suppression, but append its source and colors
        // only once so clause parsing and color origins remain aligned.
        if (paired_rows(x, y, end))
            paragraph.rows.push_back({x, y + 1, end - x,
                kCharacterOverviewQuoteRule, {}, part});
        return paragraph.rows.back().y;
    };
    auto bounds = [&](int y, int left) {
        const auto &row = native_rows[static_cast<size_t>(y)];
        int begin = left, end = frame->right;
        while (begin < end && row[static_cast<size_t>(begin)] == ' ') ++begin;
        while (end > begin && row[static_cast<size_t>(end - 1)] == ' ') --end;
        return std::pair{begin, end};
    };
    auto claim_rows = [&](const std::vector<Match> &rows) {
        // The immutable snapshot can recover bytes that an earlier field
        // reader already reserved. The complete footer owner replaces those
        // physical fragments before publishing either translation or source.
        std::erase_if(matches, [&](const Match &match) {
            return std::any_of(rows.begin(), rows.end(), [&](const Match &row) {
                return match.y == row.y && match.length > 0 &&
                    match.x < row.x + row.length && row.x < match.x + match.length;
            });
        });
    };
    auto reserve_unknown = [&](const Paragraph &paragraph) {
        claim_rows(paragraph.rows);
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
    const auto rich_memory_owns = [&](int row_y) {
        // Overview's native rich-text calls now bind the actual recent-
        // thought source vector. Keep that complete document's ownership and
        // semantic colors; a quote must not erase or reparse its screen rows.
        if (!native_knowledge_frame_.document || !native_knowledge_frame_.document->thoughts ||
                !native_knowledge_frame_matches_) return false;
        return std::any_of(native_knowledge_frame_matches_->begin(),
            native_knowledge_frame_matches_->end(), [&](const Match &row) {
                return row.rule == kNativeKnowledgeDocumentRule && row.y == row_y &&
                    row.x >= frame->left + 1 && row.x < frame->right;
            });
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
        if (memory_only && rich_memory_owns(y)) continue;
        Paragraph quote;
        bool closed = false;
        if (draw && y == draw->top && has_quote) {
            // The renderer owns the complete sentence even when its final
            // native line is clipped. Its original string, rather than a
            // reconstructed prefix, selects every quote grammar branch.
            for (size_t line = 0; line < draw->wrapped_lines.size() &&
                    int64_t(y) + int64_t(line) < frame->bottom; ++line) {
                const int row_y = y + static_cast<int>(line);
                const int end = opening + static_cast<int>(std::min(
                    draw->wrapped_lines[line].size(),
                    static_cast<size_t>(frame->right - opening)));
                if (end > opening) add_row(quote, opening, row_y, end);
            }
            quote.source = draw->source;
            quote.colors.assign(quote.source.size(), rgb_at(opening, y));
            closed = true;
        }
        for (int row_y = y; !draw && has_quote && row_y < frame->bottom; ++row_y) {
            if (rich_memory_owns(row_y)) break;
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
            row_y = add_row(quote, begin, row_y, end);
            if (closed || end < row_end) break;
        }
        if (has_quote && !closed) {
            if (footer_top >= 0 && !quote.rows.empty()) {
                reserve_unknown(quote);
                y = quote.rows.back().y;
            }
            continue;
        }
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
            reserve_unknown(quote);
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
            if (!rich_memory_owns(next_y) &&
                    (first.starts_with("He ") || first.starts_with("She ") || first.starts_with("It "))) {
                for (int row_y = next_y; row_y < frame->bottom; ++row_y) {
                    const auto [start, stop] = bounds(row_y, frame->left + 1);
                    if (start >= stop) break;
                    const auto &row = native_rows[static_cast<size_t>(row_y)];
                    if (std::any_of(row.begin() + start, row.begin() + stop,
                        [](unsigned char ch) { return is_cp437_box_drawing_byte(ch); })) break;
                    row_y = add_row(memory, start, row_y, stop);
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
        std::vector<Match> source_rows;
        if (quote.target) {
            source_rows = quote.rows;
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
            if (rich_memory_owns(limit)) break;
            const auto [begin, end] = bounds(limit, frame->left + 1);
            if (begin < end) break;
            ++limit;
        }
        std::vector<Match> slots;
        const int target_y = source_rows.front().y;
        for (int row_y = target_y; row_y < limit; ++row_y) {
            const auto found = std::find_if(source_rows.begin(), source_rows.end(),
                [&](const Match &row) { return row.y == row_y; });
            if (found != source_rows.end()) slots.push_back(*found);
            else slots.push_back({opening, row_y, 0, kCharacterOverviewQuoteRule, {}, {}});
        }
        // This complete footer frame, together with the following unclaimed
        // blank rows, owns the document's viewport. Quote and memory writers
        // can have separate clips; intersecting those clips would reject the
        // complete translation or crop its measured continuation rows.
        const int tile_w = gps_->tile_pixel_x, tile_h = gps_->tile_pixel_y;
        const int origin_x = (gps_->screen_pixel_x - gps_->dimx * tile_w) / 2;
        const int origin_y = (gps_->screen_pixel_y - gps_->dimy * tile_h) / 2;
        const SDL_Rect viewport{origin_x + (frame->left + 1) * tile_w,
            origin_y + target_y * tile_h, (frame->right - frame->left - 1) * tile_w,
            (limit - target_y) * tile_h};
        for (Match &slot : slots) slot.layout_native_clip = viewport;
        std::vector<Match> fitted;
        if (!append_bounded_paragraph(std::move(slots), target, screen_rows,
                fitted, only_y, frame->right, frame->right, foregrounds,
                false, frame->left + 1)) {
            if (quote.target) reserve_unknown(quote);
            if (memory.target) reserve_unknown(memory);
            y = last_source_y;
            continue;
        }
        claim_rows(source_rows);
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
