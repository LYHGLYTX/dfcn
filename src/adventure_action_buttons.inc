// Included in find_matches after map ownership is established, before other
// field readers. A character sheet can overwrite the right side of an
// adventure HUD button in the same native layer. Its surviving prefix has
// no independent meaning: retain the complete actual draw as the source of
// the existing translation, but own only the exposed caption cells.
    if (native_gameplay_map_screen()) {
        const auto settings = native_ui_settings();
        const bool classic = settings && settings->classic;
        const NativePanelBorders borders(*gps_);
        std::vector<NativeDrawnTextRow> draws;
        {
            std::lock_guard<std::mutex> lock(g_native_drawn_text_mutex);
            draws = g_native_drawn_text_rows;
            draws.insert(draws.end(), g_native_drawn_top_text_rows.begin(),
                g_native_drawn_top_text_rows.end());
        }

        // The right cap is behind a separately proven, currently closed
        // foreground panel. Every exposed cell of the button's left cap,
        // upper edge, lower edge and text strip must still match its skin.
        const auto exposed_button = [&](int first, int right, int y) {
            const int32_t (*skins[])[3] = {
                native_texture_button_horizontal_option_active(*gps_),
                native_texture_button_horizontal_option_inactive(*gps_),
                native_texture_button_horizontal_option_remove(*gps_),
                native_texture_button_horizontal_option_confirm(*gps_),
                native_texture_button_rectangle(*gps_),
                native_texture_button_rectangle_selected(*gps_),
                native_texture_button_rectangle_light(*gps_),
                native_texture_button_rectangle_dark(*gps_),
            };
            for (const auto *skin : skins) {
                for (int variant = 0; variant < (classic ? 6 : 3); ++variant) {
                    const int orientation = variant % 3;
                    const auto tile = [&](int column, int row) {
                        if (orientation == 1) std::swap(column, row);
                        if (orientation == 2 && column > 0) column = 3 - column;
                        // Native enabled HUD actions brighten their complete
                        // confirm/remove frame in classic mode. Require one
                        // consistent live palette across every exposed edge.
                        return skin[column][row] | (variant >= 3 ? 0x4000 : 0);
                    };
                    if (tile(1, 1) <= 0 || tile(0, 1) == tile(1, 1) ||
                        tile(2, 1) == tile(1, 1) ||
                        !native_ui_skin_at(*gps_, first, y - 1, tile(1, 0), classic))
                        continue;
                    int left = first;
                    while (left > 0 && native_ui_skin_at(*gps_, left - 1,
                            y - 1, tile(1, 0), classic)) --left;
                    --left;
                    if (left < 0 || left >= first) continue;
                    bool intact = true;
                    for (int row = 0; row < 3 && intact; ++row) {
                        if (!native_ui_skin_at(*gps_, left, y + row - 1,
                                tile(0, row), classic)) {
                            intact = false;
                            break;
                        }
                        for (int x = left + 1; x < right; ++x) {
                            if (!native_ui_skin_at(*gps_, x, y + row - 1,
                                    tile(1, row), classic, row == 1)) {
                                intact = false;
                                break;
                            }
                        }
                    }
                    if (intact) return true;
                }
            }
            return false;
        };

        for (const auto &draw : draws) {
            if (!draw.caption_source || draw.x < 0 || draw.x >= gps_->dimx || draw.y <= 0 ||
                draw.y + 1 >= gps_->dimy ||
                (only_y >= 0 && draw.y != only_y) ||
                draw.source.size() > static_cast<size_t>(gps_->dimx - draw.x)) continue;
            const std::string_view source = trim_view(draw.source);
            if (source != "Continue action" && source != "Stop action" &&
                source != "Finish action") continue;
            const int first = draw.x + static_cast<int>(source.data() - draw.source.data());
            const int end = first + static_cast<int>(source.size());
            int cut = first;
            while (cut < end && visible_char_at(cut, draw.y) ==
                    static_cast<unsigned char>(source[cut - first])) ++cut;
            if (cut <= first || cut == end || cut + 2 >= gps_->dimx) continue;

            const auto panel = native_panel_interior(borders, *gps_,
                SDL_Rect{cut + 1, draw.y - 1, 1, 3});
            if (!panel || panel->x != cut + 1 || panel->x + panel->w < end ||
                !exposed_button(first, cut, draw.y)) continue;
            bool current = true;
            for (int x = first; x < cut; ++x) {
                bool top = false;
                const auto *cell = cell_at(x, draw.y, &top);
                if (!cell || (screen_override && screen_override !=
                        (top ? gps_->screen_top : gps_->screen))) {
                    current = false;
                    break;
                }
            }
            if (!current) continue;
            const auto target = exact_literal_translation(std::string(source));
            if (!target || target->empty()) continue;
            // Both layers can retain the same draw. Project only once onto
            // the current exposed bytes, never onto the foreground panel.
            if (std::any_of(result.begin(), result.end(), [&](const Match &match) {
                    return match.x == first && match.y == draw.y && match.length == cut - first;
                })) continue;
            Match match{first, draw.y, cut - first, kUiMessageRule, *target,
                std::string(source.substr(0, cut - first))};
            match.layout_x = first;
            match.layout_length = cut - first;
            match.layout_left = true;
            match.layout_clip_right = cut;
            // Immediate glyph scans may run before the foreground panel has
            // finished drawing. Clear only the currently proven exposed ink.
            match.graphical_clear_x = first;
            match.graphical_clear_y = draw.y;
            match.graphical_clear_width = cut - first;
            match.graphical_clear_height = 1;
            result.push_back(std::move(match));
            std::fill(screen_rows[draw.y].begin() + first,
                screen_rows[draw.y].begin() + cut, ' ');
        }
    }
