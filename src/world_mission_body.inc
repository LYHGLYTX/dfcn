// Mission reports use curses_text_boxst rows, not the Legends rich-text box.
// The native event producer supplies each complete record and its actual row
// addresses. Neither a heading nor an English sentence selects this owner.
    {
        const auto paragraphs = native_mission_report_paragraphs();
        if (!paragraphs.empty()) {
            const std::array draw_layers{captured_native_drawn_text_rows(false),
                captured_native_drawn_text_rows(true)};
            std::unordered_multimap<uintptr_t, const NativeDrawnTextRow *> by_address;
            for (const auto &draws : draw_layers)
                for (const auto &draw : draws)
                    if (draw.address) by_address.emplace(draw.address, &draw);
            const NativePanelBorders borders(*gps_);
            constexpr uint32_t upper_half = 1u << 3, lower_half = 1u << 4;
            const auto row_half = [&](const NativeDrawnTextRow &draw, int y,
                    size_t length) -> uint32_t {
                uint32_t half = UINT32_MAX;
                for (size_t offset = 0; offset < length; ++offset) {
                    if (draw.source[offset] == ' ') continue;
                    const int x = draw.x + static_cast<int>(offset);
                    bool top = false;
                    const auto *cell = cell_at(x, y, &top);
                    if (!cell || top != draw.top_layer ||
                        (screen_override && screen_override !=
                            (top ? gps_->screen_top : gps_->screen))) return UINT32_MAX;
                    const auto *flags = top ? gps_->screentexpos_top_flag : gps_->screentexpos_flag;
                    const uint32_t current = flags
                        ? flags[static_cast<size_t>(x) * gps_->dimy + y] & (upper_half | lower_half) : 0;
                    if (current == (upper_half | lower_half) ||
                        (half != UINT32_MAX && half != current)) return UINT32_MAX;
                    half = current;
                }
                return half;
            };
            std::vector<Match> report_rows, report_duplicates, report_exposed_halves;
            std::vector<size_t> report_indices;
            std::string report_target;
            std::vector<int> report_colors;
            size_t report_line_count = 0;
            int report_left = -1, report_right = gps_->dimx;
            bool report_intact = true;
            for (const auto &paragraph : paragraphs) {
                // Playback appends its rows before replacing the native
                // shaded animation with real text. A complete-report reflow
                // must not expose that event before the native reveal.
                if (!paragraph.revealed) break;
                std::vector<Match> rows, duplicates, exposed_halves;
                std::vector<size_t> indices;
                size_t logical_count = 0;
                int left = -1, right = gps_->dimx;
                bool intact = true;
                for (const auto &native_row : paragraph.rows) {
                    // Native empty separator rows retain their spacing in
                    // the surrounding report; they own no English glyphs.
                    if (trim_view(native_row.source).empty()) continue;
                    const size_t logical_line = logical_count++;
                    const auto [first, last] = by_address.equal_range(native_row.address);
                    const NativeDrawnTextRow *selected = nullptr;
                    Match span;
                    std::optional<Match> duplicate;
                    int selected_right = gps_->dimx;
                    for (auto at = first; at != last; ++at) {
                        const auto &draw = *at->second;
                        if (draw.source != native_row.source || draw.x < 0 || draw.y < 0 ||
                            draw.x >= gps_->dimx || draw.y >= gps_->dimy) continue;
                        const auto panel = native_panel_interior(borders, *gps_,
                            SDL_Rect{draw.x, draw.y, 1, 1});
                        int clip_right = gps_->dimx;
                        if (panel) {
                            clip_right = std::min(clip_right, panel->x + panel->w);
                            for (const auto &bar : native_vertical_scrollbar_spans(*gps_, *panel))
                                if (draw.y >= bar.y && draw.y < bar.y + bar.h && bar.x > draw.x)
                                    clip_right = std::min(clip_right, bar.x);
                        }
                        if (clip_right <= draw.x) continue;
                        size_t exposed = std::min(native_row.source.size(),
                            static_cast<size_t>(clip_right - draw.x));
                        while (exposed && native_row.source[exposed - 1] == ' ') --exposed;
                        if (!exposed || screen_rows[draw.y].compare(draw.x, exposed,
                            native_row.source, 0, exposed) != 0) continue;
                        const uint32_t half = row_half(draw, draw.y, exposed);
                        if (half == UINT32_MAX) continue;
                        int primary_y = draw.y;
                        std::optional<int> mate_y;
                        if (half == upper_half) mate_y = draw.y + 1;
                        else if (half == lower_half) {
                            mate_y = draw.y;
                            primary_y = draw.y - 1;
                        }
                        if (mate_y && (primary_y < 0 || *mate_y >= gps_->dimy ||
                            screen_rows[primary_y].compare(draw.x, exposed,
                                native_row.source, 0, exposed) != 0 ||
                            screen_rows[*mate_y].compare(draw.x, exposed,
                                native_row.source, 0, exposed) != 0 ||
                            row_half(draw, primary_y, exposed) != upper_half ||
                            row_half(draw, *mate_y, exposed) != lower_half)) {
                            // A clipped/covered font mate does not authorize
                            // a replacement paragraph. Its surviving half
                            // still belongs to this event, not to word rules.
                            intact = false;
                            if (std::none_of(exposed_halves.begin(), exposed_halves.end(),
                                    [&](const Match &part) {
                                        return part.x == draw.x && part.y == draw.y;
                                    }))
                                exposed_halves.push_back({draw.x, draw.y,
                                    static_cast<int>(exposed), kUiMessageRule, {},
                                    native_row.source.substr(0, exposed)});
                            continue;
                        }
                        Match current{draw.x, primary_y, static_cast<int>(exposed),
                            kUiMessageRule, {}, native_row.source.substr(0, exposed)};
                        bool top = false;
                        const auto *cell = cell_at(draw.x, primary_y, &top);
                        current.layout_foreground_rgb = cell
                            ? (cell[1] << 16) | (cell[2] << 8) | cell[3] : draw.foreground_rgb;
                        std::optional<Match> mate;
                        if (mate_y) {
                            current.native_split_text = true;
                            current.native_split_top_y = primary_y;
                            mate = current;
                            mate->y = *mate_y;
                            mate->native_split_duplicate = true;
                        }
                        // Address reuse or two current copies must never
                        // merge different native viewports into one event.
                        if (selected && (span.x != current.x || span.y != current.y ||
                            span.source != current.source)) {
                            intact = false;
                            continue;
                        }
                        selected = &draw;
                        span = std::move(current);
                        duplicate = std::move(mate);
                        selected_right = std::min(clip_right,
                            draw.x + std::max(1, paragraph.paragraph_width));
                    }
                    if (!selected) continue;
                    if (left < 0) left = span.x;
                    else if (left != span.x) intact = false;
                    right = std::min(right, selected_right);
                    if (!rows.empty() && (indices.back() + 1 != logical_line ||
                        span.y <= rows.back().y)) intact = false;
                    indices.push_back(logical_line);
                    rows.push_back(std::move(span));
                    if (duplicate) duplicates.push_back(std::move(*duplicate));
                }
                // Translate the complete revealed report, including events
                // outside the current viewport. One measured layout prevents
                // a longer event from overprinting the following paragraph.
                std::string target;
                if (const auto pieces = translate_history_event(paragraph.document))
                    for (const auto &piece : *pieces) target += piece.target;
                if (target.empty()) {
                    // An unavailable semantic snapshot retains its COMPLETE
                    // native text within the shared flow. Its words cannot
                    // fall through to unrelated name/season dictionaries.
                    target = native_text_to_utf8(paragraph.document.native_source);
                    if (target.empty())
                        for (const auto &row : paragraph.rows) {
                            const auto source = trim_view(row.source);
                            if (source.empty()) continue;
                            if (!target.empty()) target += ' ';
                            target += native_text_to_utf8(source);
                        }
                }
                if (!target.empty()) {
                    std::vector<uint32_t> codepoints;
                    if (!decode_utf8(target, codepoints)) intact = false;
                    int color = paragraph.foreground_rgb;
                    if (!rows.empty() && rows.front().layout_foreground_rgb >= 0)
                        color = rows.front().layout_foreground_rgb;
                    if (color < 0) color = 0xffffff;
                    if (!report_target.empty()) {
                        report_target += '\n';
                        report_colors.push_back(color);
                    }
                    report_target += target;
                    report_colors.insert(report_colors.end(), codepoints.size(), color);
                }
                if (!rows.empty()) {
                    rows.front().native_help_review_source = paragraph.document.native_source;
                    if (report_left < 0) report_left = left;
                    else if (report_left != left) intact = false;
                    report_right = std::min(report_right, right);
                    for (const size_t index : indices) {
                        const size_t current = report_line_count + index;
                        if (!report_indices.empty() && report_indices.back() + 1 != current)
                            intact = false;
                        report_indices.push_back(current);
                    }
                }
                report_line_count += logical_count;
                report_intact = report_intact && intact;
                report_rows.insert(report_rows.end(), std::make_move_iterator(rows.begin()),
                    std::make_move_iterator(rows.end()));
                report_duplicates.insert(report_duplicates.end(),
                    std::make_move_iterator(duplicates.begin()), std::make_move_iterator(duplicates.end()));
                report_exposed_halves.insert(report_exposed_halves.end(),
                    std::make_move_iterator(exposed_halves.begin()), std::make_move_iterator(exposed_halves.end()));
            }
            std::optional<NativeParagraphViewport> viewport;
            if (!report_indices.empty() &&
                (report_indices.front() || report_indices.back() + 1 != report_line_count))
                viewport = NativeParagraphViewport{static_cast<int>(report_indices.front()),
                    static_cast<int>(report_line_count)};
            const bool translated = report_intact && !report_rows.empty() &&
                !report_target.empty() && report_right > report_left &&
                append_bounded_paragraph(report_rows, report_target, screen_rows,
                    result, only_y, report_right, report_right, report_colors,
                    false, report_left, viewport, {}, static_cast<int>(report_line_count));
            if (translated) {
                for (auto &duplicate : report_duplicates) {
                    std::fill_n(screen_rows[duplicate.y].begin() + duplicate.x,
                        duplicate.length, ' ');
                    if (only_y < 0 || only_y == duplicate.y)
                        result.push_back(std::move(duplicate));
                }
            } else {
                // Occluded or conflicting source ownership reserves every
                // confirmed span while leaving the native report visible.
                report_rows.insert(report_rows.end(),
                    std::make_move_iterator(report_duplicates.begin()),
                    std::make_move_iterator(report_duplicates.end()));
                report_rows.insert(report_rows.end(),
                    std::make_move_iterator(report_exposed_halves.begin()),
                    std::make_move_iterator(report_exposed_halves.end()));
                for (auto &row : report_rows) {
                    row.native_help_source_only = true;
                    std::fill_n(screen_rows[row.y].begin() + row.x, row.length, ' ');
                    untranslated_help_rows.push_back(std::move(row));
                }
            }
        }
    }
