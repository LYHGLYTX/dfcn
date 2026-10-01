// Health -> History owns dated procedures and their staff lines. Native
// wrapping can separate a procedure from its body part; translate the entire
// record before material, anatomy and date words acquire independent boxes.
void Overlay::append_health_history_rows(std::vector<std::string> &rows,
        std::vector<Match> &matches, int only_y) const {
    if (!gps_ || rows.size() != static_cast<size_t>(gps_->dimy)) return;
    std::vector<std::string> context(gps_->dimy);
    const auto read_row = [&](int y) -> const std::string & {
        auto &row = context[y];
        if (row.empty()) {
            row.assign(gps_->dimx, ' ');
            for (int x = 0; x < gps_->dimx; ++x) {
                bool top = false;
                const auto *cell = cell_at(x, y, &top);
                if (cell && cell[0]) row[x] = cell[0];
            }
        }
        return row;
    };
    const auto half_at = [&](int x, int y) {
        bool top = false;
        (void)cell_at(x, y, &top);
        const auto *flags = top ? gps_->screentexpos_top_flag : gps_->screentexpos_flag;
        return flags ? flags[static_cast<size_t>(x) * gps_->dimy + y]
            & ((1u << 3) | (1u << 4)) : 0u;
    };
    const auto selected = [&](int y, const std::vector<LogicalTextField> &fields,
                              std::string_view caption) {
        int active = -1, inactive = -1;
        for (const auto &field : fields) {
            bool top = false;
            const auto *cell = cell_at(field.start, y, &top);
            if (!cell || half_at(field.start, y) == (1u << 4)) return false;
            const int color = (cell[1] << 16) | (cell[2] << 8) | cell[3];
            if (field.text == caption) active = color;
            else if (inactive < 0) inactive = color;
            else if (inactive != color) return false;
        }
        return active >= 0 && inactive >= 0 && active != inactive;
    };
    for (int tabs_y = 0; tabs_y < gps_->dimy; ++tabs_y) {
        const auto tabs = character_information_tab_fields(read_row(tabs_y));
        if (tabs.empty()) continue;
        bool history_page = false;
        auto frame = find_graphical_character_panel_frame(*gps_,
            tabs.front().start, tabs.back().end, tabs_y);
        if (!frame) frame = find_ascii_panel_frame(tabs.front().start,
            tabs.back().end, tabs_y, gps_->dimx, gps_->dimy,
            [&](int x, int y) { return static_cast<unsigned char>(read_row(y)[x]); });
        // Classic captions can cover an outer edge. The selected tab bands
        // still identify the page, but only current native draws may supply
        // text and display width when a complete frame is unavailable.
        const int panel_left = frame ? frame->left + 1 : tabs.front().start - 2;
        const int panel_right = frame ? frame->right : gps_->dimx;
        const int panel_bottom = frame ? frame->bottom : gps_->dimy;
        if (panel_left < 0 || panel_left >= panel_right) continue;
        const int next_band = tabs_y +
            (half_at(tabs.front().start, tabs_y) == (1u << 3) ? 2 : 1);
        int body_top = -1;
        for (int y = next_band; y < panel_bottom; ++y) {
            const auto &row = read_row(y);
            const auto body = std::string_view(row).substr(
                panel_left, panel_right - panel_left);
            if (std::none_of(body.begin(), body.end(), [](unsigned char ch) {
                    return (ch >= 'A' && ch <= 'Z') || (ch >= 'a' && ch <= 'z');
                })) continue;
            std::vector<LogicalTextField> fields;
            size_t cursor = panel_left;
            for (const std::string_view caption : {
                    "Status", "Wounds", "Treatment", "History", "Description"}) {
                size_t at = row.find(caption, cursor);
                std::string_view text = caption;
                if (caption == "Status" && at == std::string::npos) {
                    text = "Overview";
                    at = row.find(text, cursor);
                }
                if (at == std::string::npos || at + text.size() >
                        static_cast<size_t>(panel_right) ||
                    !(has_word_boundaries(row, at, at + text.size()) ||
                      is_ascii_tab_caption(row, at, at + text.size()))) break;
                cursor = at + text.size();
                fields.push_back({static_cast<int>(at), static_cast<int>(cursor),
                    std::string(text)});
            }
            if (fields.size() == 5) {
                history_page = selected(tabs_y, tabs, "Health") && selected(y, fields, "History");
                body_top = y + 1;
                for (const auto &field : fields)
                    if (half_at(field.start, y) == (1u << 3)) body_top = y + 2;
            }
            break; // Only the first text band below Health can be its tabs.
        }
        if (body_top < 0) continue;
        const SDL_Rect panel{panel_left, body_top,
            panel_right - panel_left, panel_bottom - body_top};
        int right = panel_right;
        for (const auto &bar : native_vertical_scrollbar_spans(*gps_, panel))
            right = std::min(right, bar.x);
        if (right <= panel.x) return;
        auto draws = captured_native_drawn_text_rows();
        const auto top_draws = captured_native_drawn_text_rows(true);
        draws.insert(draws.end(), top_draws.begin(), top_draws.end());
        const auto captions = captured_clipped_captions();
        // A health row can have separate date/event color draws. Collect
        // their actual spans before asking the generic card reader, which
        // rejects an entire classic row if it also encounters a control.
        // Every drawn byte must still agree with the current composed grid;
        // only spaces may join adjacent draws into one logical source line.
        std::vector<std::vector<std::pair<int, int>>> spans(gps_->dimy);
        for (const auto &draw : draws) {
            if (draw.y < body_top || draw.y >= panel_bottom ||
                draw.x < panel.x || draw.x >= right || draw.source.empty()) continue;
            std::string_view visible = draw.source;
            for (const auto &caption : captions) {
                if (caption.x == draw.x && caption.y == draw.y &&
                    caption.complete == draw.source &&
                    draw.source.starts_with(caption.visible)) visible = caption.visible;
            }
            visible = visible.substr(0, static_cast<size_t>(right - draw.x));
            while (!visible.empty() && visible.back() == ' ') visible.remove_suffix(1);
            if (visible.empty()) continue;
            const uint32_t half = half_at(draw.x, draw.y);
            const int first_y = half == (1u << 4) ? draw.y - 1 : draw.y;
            const int height = half ? 2 : 1;
            for (int y = first_y; y < first_y + height; ++y) {
                if (y < body_top || y >= panel_bottom ||
                    (half && half_at(draw.x, y) !=
                        (y == first_y ? (1u << 3) : (1u << 4))) ||
                    read_row(y).compare(draw.x, visible.size(), visible) != 0) continue;
                spans[y].emplace_back(draw.x, draw.x + static_cast<int>(visible.size()));
            }
        }
        std::vector<NativeTextCardRow> physical;
        for (int y = body_top; y < panel_bottom; ++y) {
            if (!spans[y].empty()) {
                int first = right, last = panel.x;
                for (const auto &[begin, end] : spans[y]) {
                    first = std::min(first, begin);
                    last = std::max(last, end);
                }
                const auto &row = read_row(y);
                while (first < last && row[first] == ' ') ++first;
                bool complete = first < last;
                std::vector<int> colors;
                for (int x = first; x < last && complete; ++x) {
                    if (native_foreground_picture_at(*gps_, x, y) ||
                        native_item_action_at(*gps_, x, y) ||
                        (row[x] != ' ' && std::none_of(spans[y].begin(), spans[y].end(),
                            [&](const auto &span) { return x >= span.first && x < span.second; }))) {
                        complete = false;
                        break;
                    }
                    bool top = false;
                    const auto *cell = cell_at(x, y, &top);
                    colors.push_back(cell ? (cell[1] << 16) | (cell[2] << 8) | cell[3] : 0xffffff);
                }
                if (complete) {
                    physical.push_back({first, y, row.substr(first, last - first), std::move(colors)});
                    continue;
                }
            }
            if (frame) {
                const auto card = capture_panel_text_card({panel.x, y, right - panel.x, 1});
                if (card && card->rows.size() == 1) physical.push_back(card->rows.front());
            }
        }
        const auto new_record = [](std::string_view source) {
            return health_history_date_end(source) != 0 || source.starts_with("- ");
        };
        std::vector<Match> owned;
        for (size_t begin = 0; begin < physical.size();) {
            // Keep both half-font source rows for suppression, but only one
            // logical line when reconstructing the native wrapped record.
            std::vector<size_t> logical;
            size_t end = begin;
            while (end < physical.size()) {
                const auto &part = physical[end];
                if (end > begin && (part.y != physical[end - 1].y + 1 ||
                        new_record(part.source))) break;
                logical.push_back(end++);
                if (half_at(part.x, part.y) == (1u << 3) && end < physical.size()) {
                    const auto &second = physical[end];
                    if (second.y == part.y + 1 && second.x == part.x &&
                        second.source == part.source &&
                        half_at(second.x, second.y) == (1u << 4)) ++end;
                }
            }
            const auto &first = physical[begin];
            std::string source;
            std::vector<Match> native_lines;
            for (size_t at : logical) {
                const auto &part = physical[at];
                if (!source.empty()) source += ' ';
                source += part.source;
                native_lines.push_back({part.x, part.y, static_cast<int>(part.source.size()),
                    kHealthHistoryRowRule, {}, part.source});
            }
            // Only exact current wrap rows/draw bytes can recover an edge-
            // clipped record. Never infer a missing limb, material or person.
            if (auto complete = native_source_for_rows(native_lines, right);
                    complete && new_record(trim_view(*complete))) source = *complete;
            if (logical.size() == 1) {
                const int draw_y = half_at(first.x, first.y) == (1u << 4)
                    ? first.y - 1 : first.y;
                for (const auto &draw : draws) {
                    if (draw.x != first.x || draw.y != draw_y) continue;
                    if (trim_view(std::string_view(draw.source).substr(
                            0, static_cast<size_t>(right - first.x))) != first.source) continue;
                    const auto &complete = draw.complete_source.empty()
                        ? draw.source : draw.complete_source;
                    if (new_record(complete)) source = complete;
                }
                for (const auto &caption : captions)
                    if (caption.x == first.x && caption.y == draw_y &&
                        caption.visible == first.source && new_record(caption.complete))
                        source = caption.complete;
            }
            if (!new_record(trim_view(source)) && source != "No medical history") {
                begin = end;
                continue;
            }
            int layout_right = right;
            if (!frame) {
                layout_right = panel.x;
                for (size_t at = begin; at < end; ++at)
                    layout_right = std::max(layout_right,
                        physical[at].x + static_cast<int>(physical[at].source.size()));
            }
            const auto target = translate_health_history_record(source);
            // Hover/disabled captions need not share one inactive color.
            // A complete dated procedure under all five Health subtabs also
            // proves History; defer ownership until that typed record exists.
            const size_t complete_date_end = health_history_date_end(source);
            if (target && ((complete_date_end &&
                    !trim_view(std::string_view(source).substr(complete_date_end)).empty()) ||
                    source == "No medical history")) history_page = true;
            const std::string output = target ? *target : native_text_to_utf8(source);
            const int color = first.foregrounds.front();
            int event_color = color;
            const size_t date_end = health_history_date_end(first.source);
            if (date_end) {
                size_t at = first.source.find_first_not_of(' ', date_end);
                if (at != std::string::npos) event_color = first.foregrounds[at];
                else if (logical.size() > 1)
                    event_color = physical[logical[1]].foregrounds.front();
            }
            std::vector<uint32_t> cps;
            decode_utf8(output, cps);
            std::vector<int> colors(cps.size(), date_end ? event_color : color);
            if (date_end) {
                for (size_t at = 0; at < cps.size(); ++at) {
                    colors[at] = color;
                    if (cps[at] == ':' || cps[at] == 0xff1a) break;
                }
            }
            const size_t first_line_end = logical.size() > 1 ? logical[1] : end;
            for (size_t at = begin; at < end; ++at) {
                const auto &part = physical[at];
                const int length = static_cast<int>(part.source.size());
                // Raw layer scans must prove each owned span separately.
                if (rows[part.y].compare(part.x, length, part.source) != 0) continue;
                Match match{part.x, part.y, length, kHealthHistoryRowRule,
                    at < first_line_end ? output : std::string{}, part.source};
                match.layout_x = panel.x;
                match.layout_length = layout_right - panel.x;
                match.layout_clip_right = layout_right;
                match.layout_left = true;
                match.layout_foreground_rgb = color;
                if (!match.target.empty()) match.layout_glyph_foreground_rgb = colors;
                match.native_hover_untranslated = !target;
                if (!target && at == begin) match.native_help_review_source = source;
                owned.push_back(std::move(match));
            }
            begin = end;
        }
        if (!history_page) continue;
        for (auto &match : owned) {
            std::fill_n(rows[match.y].begin() + match.x, match.length, ' ');
            std::erase_if(matches, [&](const Match &other) {
                return other.y == match.y && other.x < match.x + match.length &&
                    match.x < other.x + other.length;
            });
            if (only_y < 0 || only_y == match.y) matches.push_back(std::move(match));
        }
        return;
    }
}

void Overlay::layout_health_history_rows(SDL_Renderer *renderer) {
    if (!renderer || !face_ || !gps_ || gps_->tile_pixel_x <= 0 ||
        gps_->tile_pixel_y <= 0) return;
    std::vector<std::vector<Match *>> records;
    int left = gps_->dimx;
    for (auto &match : prepared_matches_) {
        if (match.rule != kHealthHistoryRowRule || match.target.empty() ||
            match.native_split_duplicate) continue;
        records.push_back({&match});
        left = std::min(left, match.layout_x);
    }
    if (records.empty()) return;
    int pixels = gps_->tile_pixel_y;
    for (const auto &record : records) {
        if (record.front()->layout_clip_right <= left) return;
        layout_fortress_text_rows(renderer, {record}, left,
            record.front()->layout_clip_right, true);
        pixels = std::min(pixels, record.front()->layout_font_pixels);
    }
    for (const auto &record : records) record.front()->layout_font_pixels = pixels;
}
