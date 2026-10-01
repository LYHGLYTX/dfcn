// Military -> Kills is a scrolling list of complete records. Claim each
// record before dictionary words can split its name, species and date into
// unrelated boxes with different fonts and leftover native English glyphs.
void Overlay::append_character_kill_rows(std::vector<std::string> &rows,
        std::vector<Match> &matches, int only_y) const {
    if (!gps_ || gps_->dimx <= 0 || gps_->dimy <= 0 ||
        rows.size() != static_cast<size_t>(gps_->dimy)) return;
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
    for (int tabs_y = 0; tabs_y < gps_->dimy; ++tabs_y) {
        const auto main_tabs = character_information_tab_fields(read_row(tabs_y));
        if (main_tabs.empty() ||
            !character_social_tab_selected(tabs_y, "Military")) continue;
        auto frame = find_graphical_character_panel_frame(*gps_,
            main_tabs.front().start, main_tabs.back().end, tabs_y);
        if (!frame) frame = find_ascii_panel_frame(main_tabs.front().start,
            main_tabs.back().end, tabs_y, gps_->dimx, gps_->dimy,
            [&](int x, int y) { return static_cast<unsigned char>(read_row(y)[x]); });
        const int panel_left = frame ? frame->left + 1 : main_tabs.front().start - 2;
        const int panel_right = frame ? frame->right : gps_->dimx;
        const int panel_bottom = frame ? frame->bottom : gps_->dimy;
        if (panel_left < 0 || panel_left >= panel_right) continue;
        int content_top = tabs_y + 1;
        for (const auto &tab : main_tabs)
            if (half_at(tab.start, tabs_y) == (1u << 3))
                content_top = tabs_y + 2;

        int body_top = -1;
        for (int y = content_top; y < panel_bottom; ++y) {
            const auto &row = read_row(y);
            const auto body = std::string_view(row).substr(
                panel_left, panel_right - panel_left);
            if (std::none_of(body.begin(), body.end(), [](unsigned char ch) {
                    return (ch >= 'A' && ch <= 'Z') || (ch >= 'a' && ch <= 'z');
                })) continue;
            std::array<int, 3> colors{};
            size_t cursor = panel_left;
            int next_y = y + 1;
            bool valid = true;
            size_t index = 0;
            for (std::string_view caption : {"Squad", "Uniform", "Kills"}) {
                const size_t at = row.find(caption, cursor);
                if (at == std::string::npos || at + caption.size() >
                        static_cast<size_t>(panel_right) ||
                    !(has_word_boundaries(row, at, at + caption.size()) ||
                      is_ascii_tab_caption(row, at, at + caption.size()))) {
                    valid = false;
                    break;
                }
                bool top = false;
                const auto *cell = cell_at(static_cast<int>(at), y, &top);
                if (!cell || half_at(static_cast<int>(at), y) == (1u << 4)) {
                    valid = false;
                    break;
                }
                colors[index++] = (cell[1] << 16) | (cell[2] << 8) | cell[3];
                if (half_at(static_cast<int>(at), y) == (1u << 3)) next_y = y + 2;
                cursor = at + caption.size();
            }
            // All three subtabs remain visible. Their current selection is
            // required, so Squad and Uniform never acquire this row grammar.
            if (valid && colors[0] == colors[1] && colors[2] != colors[0])
                body_top = next_y;
            break;
        }
        if (body_top < 0) continue;
        const SDL_Rect panel{panel_left, body_top,
            panel_right - panel_left, panel_bottom - body_top};
        const auto scrollbars = native_vertical_scrollbar_spans(*gps_, panel);
        const auto draws = captured_native_drawn_text_rows();
        const auto captions = captured_clipped_captions();
        // DF already submits each kill record as one addst string. In
        // classic mode the surrounding grid also contains CP437 controls;
        // a generic full-width card can reject the row before its grammar
        // is reached. Own the current native text draw first. The selected
        // Military/Kills bands and the complete typed record establish its
        // meaning; every visible byte still has to agree on its own layer.
        const auto append_draws = [&](const auto &native_draws) {
            for (const auto &draw : native_draws) {
                if (draw.y < body_top || draw.y >= panel_bottom ||
                    draw.x < panel_left || draw.x >= panel_right ||
                    draw.source.empty()) continue;
                std::string complete = draw.complete_source.empty()
                    ? draw.source : draw.complete_source;
                std::string_view visible = draw.source;
                for (const auto &caption : captions) {
                    if (caption.x != draw.x || caption.y != draw.y) continue;
                    if (caption.visible == draw.source) complete = caption.complete;
                    if (caption.complete == draw.source &&
                        draw.source.starts_with(caption.visible)) visible = caption.visible;
                }
                const auto target = translate_character_kill_record(complete);
                if (!target) continue;
                int right = panel_right;
                for (const auto &scrollbar : scrollbars)
                    if (draw.y >= scrollbar.y && draw.y < scrollbar.y + scrollbar.h)
                        right = std::min(right, scrollbar.x);
                if (right <= draw.x) continue;
                visible = visible.substr(0, static_cast<size_t>(right - draw.x));
                while (!visible.empty() && visible.back() == ' ') visible.remove_suffix(1);
                if (visible.empty()) continue;
                // Without a complete outer frame, the proven native draw
                // is also the display budget. Never infer spare space from
                // the screen edge or cover the neighbouring panel.
                if (!frame) right = draw.x + static_cast<int>(visible.size());
                const int length = static_cast<int>(visible.size());
                const uint32_t half = half_at(draw.x, draw.y);
                const int first_y = half == (1u << 4) ? draw.y - 1 : draw.y;
                const int height = half ? 2 : 1;
                for (int y = first_y; y < first_y + height; ++y) {
                    if (y < body_top || y >= panel_bottom ||
                        (half && half_at(draw.x, y) !=
                            (y == first_y ? (1u << 3) : (1u << 4))) ||
                        read_row(y).compare(draw.x, length, visible) != 0 ||
                        rows[y].compare(draw.x, length, visible) != 0) continue;
                    std::fill_n(rows[y].begin() + draw.x, length, ' ');
                    std::erase_if(matches, [&](const Match &match) {
                        return match.y == y && match.x < draw.x + length &&
                            draw.x < match.x + match.length;
                    });
                    if (only_y >= 0 && only_y != y) continue;
                    Match match{draw.x, y, length, kCharacterKillRowRule,
                        *target, std::string(visible)};
                    match.layout_x = draw.x;
                    match.layout_length = right - draw.x;
                    match.layout_clip_right = right;
                    match.layout_left = true;
                    bool top = false;
                    if (const auto *cell = cell_at(draw.x, y, &top))
                        match.layout_foreground_rgb = (cell[1] << 16) | (cell[2] << 8) | cell[3];
                    matches.push_back(std::move(match));
                }
            }
        };
        append_draws(draws);
        append_draws(captured_native_drawn_text_rows(true));
        if (!frame) return;
        for (int y = body_top; y < frame->bottom; ++y) {
            int right = frame->right;
            for (const auto &scrollbar : scrollbars)
                if (y >= scrollbar.y && y < scrollbar.y + scrollbar.h)
                    right = std::min(right, scrollbar.x);
            if (right <= panel.x) continue;
            const auto card = capture_panel_text_card({panel.x, y, right - panel.x, 1});
            if (!card || card->rows.size() != 1) continue;
            const auto &row = card->rows.front();
            std::string complete = row.source;
            // A clipped native draw retains its full name/date. Only exact
            // surviving bytes in the current viewport can identify it.
            const uint32_t half = half_at(row.x, y);
            const int draw_y = half == (1u << 4) ? y - 1 : y;
            for (const auto &draw : draws) {
                if (draw.x != row.x || draw.y != draw_y) continue;
                const auto visible = trim_view(std::string_view(draw.source).substr(
                    0, static_cast<size_t>(right - row.x)));
                if (visible == row.source) {
                    complete = draw.complete_source.empty() ? draw.source : draw.complete_source;
                    break;
                }
            }
            for (const auto &caption : captions)
                if (caption.x == row.x && caption.y == draw_y &&
                    caption.visible == row.source) { complete = caption.complete; break; }
            const auto target = translate_character_kill_record(complete);
            const int length = static_cast<int>(row.source.size());
            // Each raw layer must prove its own source span. No composed
            // popup text or underlying map text can be erased by this list.
            if (rows[y].compare(row.x, length, row.source) != 0) continue;
            std::fill_n(rows[y].begin() + row.x, length, ' ');
            std::erase_if(matches, [&](const Match &match) {
                return match.y == y && match.x < row.x + length &&
                    row.x < match.x + match.length;
            });
            if (only_y >= 0 && only_y != y) continue;
            Match match{row.x, y, length, kCharacterKillRowRule,
                target ? *target : native_text_to_utf8(complete), row.source};
            match.layout_x = row.x;
            match.layout_length = right - row.x;
            match.layout_clip_right = right;
            match.layout_left = true;
            if (!row.foregrounds.empty()) match.layout_foreground_rgb = row.foregrounds.front();
            match.native_hover_untranslated = !target;
            if (!target) match.native_help_review_source = complete;
            matches.push_back(std::move(match));
        }
        return;
    }
}

void Overlay::layout_character_kill_rows(SDL_Renderer *renderer) {
    if (!renderer || !face_ || !gps_ || gps_->tile_pixel_x <= 0 ||
        gps_->tile_pixel_y <= 0) return;
    std::vector<std::vector<Match *>> rows;
    int left = gps_->dimx;
    for (auto &match : prepared_matches_) {
        if (match.rule != kCharacterKillRowRule || match.target.empty() ||
            match.native_split_duplicate) continue;
        rows.push_back({&match});
        left = std::min(left, match.layout_x);
    }
    if (rows.empty()) return;
    // Headings, identities, dates and aggregate counts share one measured
    // font and left margin. Native source rows still own glyph suppression,
    // the scroll position, title colors and the half-font baseline.
    int pixels = gps_->tile_pixel_y;
    for (const auto &row : rows) {
        if (row.front()->layout_clip_right <= left) return;
        layout_fortress_text_rows(renderer, {row}, left,
            row.front()->layout_clip_right, true);
        pixels = std::min(pixels, row.front()->layout_font_pixels);
    }
    // A short heading's captured width must not truncate a longer victim
    // record when the outer frame is unavailable. Keep each row's bounds
    // while sharing the smallest measured font across the list.
    for (const auto &row : rows) row.front()->layout_font_pixels = pixels;
}
