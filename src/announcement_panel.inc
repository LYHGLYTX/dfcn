// Included after complete announcement ownership and map-text filtering.
// This is a current-frame proof, not a remembered page or a text-only cache.
// Keep ordinary matching/layout for the HUD, dates and category controls.
const bool announcement_panel_only = [&]() {
    if (only_y >= 0) return false;
    constexpr std::array<std::string_view, 4> upper = {
        "Curses", "Combat", "Sparring", "Hunting"};
    constexpr std::array<std::string_view, 10> middle = {
        "Profession changes", "Military", "Mental state", "Masterpieces", "Job failures",
        "Death", "Ghosts", "Wildlife", "Labor", "Crime"};
    constexpr std::array<std::string_view, 11> lower = {
        "All", "General", "World", "Environment", "Arrivals", "Attacks",
        "Trade", "Nobles", "Animal", "Life changes", "Strange moods"};
    // Reject ordinary pages before copying the composed grid or inspecting skins.
    if (std::none_of(screen_rows.begin(), screen_rows.end(), [](const auto &row) {
            return row.find("Sparring") != std::string::npos &&
                row.find("Curses") != std::string::npos;
        })) return false;
    if (native_toolbar_tooltip_frame()) return false;
    const auto settings = native_ui_settings();
    if (!settings) return false;
    std::vector<std::string> current(gps_->dimy, std::string(gps_->dimx, ' '));
    const auto native_cell = [&](int x, int y) -> const unsigned char * {
        if (x < 0 || y < 0 || x >= gps_->dimx || y >= gps_->dimy) return nullptr;
        bool top = false;
        return cell_at(x, y, &top);
    };
    for (int y = 0; y < gps_->dimy; ++y)
        for (int x = 0; x < gps_->dimx; ++x) {
            const auto *cell = native_cell(x, y);
            current[y][x] = cell && cell[0] ? static_cast<char>(cell[0]) : ' ';
        }
    // The queried layer must own the actual text used by this proof. Empty
    // cells and decorative skins can change independently while scrolling.
    const auto text_visible = [&](int x, int y, int length) {
        for (int column = x; column < x + length; ++column) {
            if (current[y][column] == ' ') continue;
            const size_t at = static_cast<size_t>(column) * gps_->dimy + y;
            const unsigned char ch = screen_override ? screen_override[at * 8]
                : visible_char_at(column, y);
            if (ch != static_cast<unsigned char>(current[y][column]) ||
                    (screen_override && screen_override !=
                        (native_ui_top_layer_at(*gps_, at) ? gps_->screen_top : gps_->screen)))
                return false;
        }
        return true;
    };
    // Classic tabs prove every slope/rail/background. Graphical tab artwork
    // has no required character bytes: there the closed outer native panel,
    // all 25 separate labels, owned reports and absence of other text jointly
    // establish this page. Never infer graphical skins from CP437 glyphs.
    const auto tab = [&](int x, int y, int length,
            std::optional<SDL_Rect> body = std::nullopt) -> std::optional<SDL_Rect> {
        if (!text_visible(x, y, length)) return std::nullopt;
        if (!settings->classic) {
            const size_t at = static_cast<size_t>(x) * gps_->dimy + y;
            const bool layer = native_ui_top_layer_at(*gps_, at);
            const auto *flags = layer ? gps_->screentexpos_top_flag : gps_->screentexpos_flag;
            constexpr uint32_t top_half = 1u << 3, bottom_half = 1u << 4;
            const uint32_t half = flags ? flags[at] & (top_half | bottom_half) : 0;
            if (half == (top_half | bottom_half)) return std::nullopt;
            if (half) {
                const int mate = half == top_half ? y + 1 : y - 1;
                // Only an actual body boundary can clip the other half.
                // Missing or covered halves inside the body still reject.
                const bool clipped = body && y >= body->y && y < body->y + body->h &&
                    (mate < body->y || mate >= body->y + body->h);
                if (!clipped && (mate < 0 || mate >= gps_->dimy ||
                        current[mate].compare(x, length, current[y], x, length) != 0 ||
                        !text_visible(x, mate, length)))
                    return std::nullopt;
                for (int column = x; column < x + length; ++column) {
                    // Separately drawn fields need not stamp font flags into
                    // the empty gap between them. Both rows were compared
                    // above, so only shared whitespace can skip glyph proof.
                    if (current[y][column] == ' ' && (clipped || current[mate][column] == ' '))
                        continue;
                    const size_t here = static_cast<size_t>(column) * gps_->dimy + y;
                    const size_t other = static_cast<size_t>(column) * gps_->dimy + mate;
                    if (native_ui_top_layer_at(*gps_, here) != layer ||
                            (flags[here] & (top_half | bottom_half)) != half ||
                            (!clipped && (native_ui_top_layer_at(*gps_, other) != layer ||
                                (flags[other] & (top_half | bottom_half)) !=
                                    (half == top_half ? bottom_half : top_half)))) return std::nullopt;
                }
                if (clipped) return SDL_Rect{x, y, length, 1};
                return SDL_Rect{x, std::min(y, mate), length, 2};
            }
            return SDL_Rect{x, y, length, 1};
        }
        const auto *rail = native_cell(x, y - 1);
        if (!rail || rail[0] != 196) return std::nullopt;
        const bool layer = native_ui_top_layer_at(*gps_, static_cast<size_t>(x) * gps_->dimy + y);
        const auto edge = [&](int column, int row, unsigned char glyph) {
            const auto *cell = native_cell(column, row);
            return cell && cell[0] == glyph &&
                native_ui_top_layer_at(*gps_, static_cast<size_t>(column) * gps_->dimy + row) == layer &&
                std::equal(cell + 1, cell + 7, rail + 1);
        };
        int left = x, right = x + 1;
        while (edge(left - 1, y - 1, 196)) --left;
        while (edge(right, y - 1, 196)) ++right;
        if (!edge(left - 1, y - 1, '/') || !edge(right, y - 1, '\\') ||
                !edge(left - 2, y, '/') || !edge(left - 1, y, '_') ||
                !edge(right + 1, y, '\\') || x + length > right + 1) return std::nullopt;
        for (int column = left - 1; column <= right; ++column) {
            const auto *cell = native_cell(column, y);
            if (!cell || native_ui_top_layer_at(*gps_,
                    static_cast<size_t>(column) * gps_->dimy + y) != layer ||
                    !std::equal(cell + 4, cell + 7, rail + 4)) return std::nullopt;
        }
        return SDL_Rect{left - 2, y - 1, right - left + 4, 2};
    };
    std::vector<SDL_Rect> tabs;
    const auto tab_row = [&](int y, const auto &labels) {
        std::vector<SDL_Rect> found;
        size_t after = 0;
        for (const auto label : labels) {
            const size_t x = current[y].find(label, after);
            if (x == std::string::npos ||
                    (!has_word_boundaries(current[y], x, x + label.size()) &&
                     !is_ascii_tab_caption(current[y], x, x + label.size())))
                return false;
            const auto frame = tab(static_cast<int>(x), y, static_cast<int>(label.size()));
            if (!frame || (!found.empty() && frame->x < found.back().x + found.back().w - 1))
                return false;
            found.push_back(*frame);
            after = x + label.size();
        }
        tabs.insert(tabs.end(), found.begin(), found.end());
        return true;
    };
    int upper_y = -1, middle_y = -1, lower_y = -1;
    for (int y = 1; y < gps_->dimy; ++y)
        if (tab_row(y, upper)) { upper_y = y; break; }
    if (upper_y < 0) return false;
    for (int y = upper_y + 2; y <= upper_y + 4 && y < gps_->dimy; ++y)
        if (tab_row(y, middle)) { middle_y = y; break; }
    if (middle_y < 0) return false;
    for (int y = middle_y + 2; y <= middle_y + 4 && y < gps_->dimy; ++y)
        if (tab_row(y, lower)) { lower_y = y; break; }
    if (lower_y < 0) return false;
    int body_top = lower_y + 1, tabs_right = 0;
    for (const auto &frame : tabs) {
        body_top = std::max(body_top, frame.y + frame.h);
        tabs_right = std::max(tabs_right, frame.x + frame.w);
    }
    const NativePanelBorders borders(*gps_);
    auto panel = native_panel_interior(borders, *gps_, tabs.front());
    std::optional<SDL_Rect> frame_scrollbar;
    const auto scrollbar_cap = [&](int x, int y, bool last) {
        const auto pair = [&](int32_t left, int32_t right) {
            return left > 0 && right > 0 &&
                native_ui_skin_at(*gps_, x, y, left, settings->classic) &&
                native_ui_skin_at(*gps_, x + 1, y, right, settings->classic);
        };
        const auto &track = native_texture_scrollbar(*gps_);
        if (pair(track[0][last ? 2 : 0], track[1][last ? 2 : 0])) return true;
        const auto *hover = last ? native_texture_scrollbar_down_hover(*gps_)
            : native_texture_scrollbar_up_hover(*gps_);
        const auto *pressed = last ? native_texture_scrollbar_down_pressed(*gps_)
            : native_texture_scrollbar_up_pressed(*gps_);
        if (pair(hover[0], hover[1]) || pair(pressed[0], pressed[1])) return true;
        for (int index : {last ? 2 : 0, last ? 5 : 3, last ? 6 : 4})
            if (pair(settings->scrollbar_skins[index][0],
                    settings->scrollbar_skins[index][1])) return true;
        return false;
    };
    if (!panel) {
        // A report scrollbar may replace part of the right frame. Its full
        // native run and BOTH caps must prove the occluder before the existing
        // closed-frame reader can borrow those hidden border cells.
        const int anchor_y = tabs.front().y + tabs.front().h / 2;
        const bool layer = native_ui_top_layer_at(*gps_,
            static_cast<size_t>(tabs.front().x) * gps_->dimy + anchor_y);
        for (int edge = tabs_right; edge < gps_->dimx && !panel; ++edge) {
            if (!borders.at(edge, anchor_y, 5)) continue;
            for (int x : {edge - 1, edge}) {
                if (x < 0 || x + 1 >= gps_->dimx) continue;
                const SDL_Rect gutter{x, body_top, 2, gps_->dimy - body_top};
                for (const auto &bar : native_vertical_scrollbar_spans(*gps_, gutter)) {
                    if (bar.h < 3 || !scrollbar_cap(x, bar.y, false) ||
                            !scrollbar_cap(x, bar.y + bar.h - 1, true)) continue;
                    bool same_layer = true;
                    for (int y = bar.y; y < bar.y + bar.h && same_layer; ++y)
                        for (int column = x; column < x + 2; ++column)
                            if (native_ui_top_layer_at(*gps_,
                                    static_cast<size_t>(column) * gps_->dimy + y) != layer)
                                same_layer = false;
                    if (!same_layer) continue;
                    const auto candidate = native_panel_interior(borders, *gps_, tabs.front(), bar);
                    if (!candidate || candidate->x + candidate->w != edge ||
                            bar.y + bar.h > candidate->y + candidate->h + 1) continue;
                    panel = candidate;
                    frame_scrollbar = bar;
                    break;
                }
                if (panel) break;
            }
        }
    }
    if (!panel) return false;
    const int right = panel->x + panel->w, bottom = panel->y + panel->h;
    if (body_top >= bottom) return false;
    const SDL_Rect body{panel->x, body_top, panel->w, bottom - body_top};
    for (const auto &frame : tabs)
        if (frame.x < panel->x || frame.y < panel->y ||
                frame.x + frame.w > right || frame.y + frame.h > bottom) return false;
    // Use the unfiltered composite for this proof. Map ownership filtering
    // may discard an unbound draw; that absence cannot prove a popup empty.
    auto remainder = current;
    if (!screen_override)
        for (int y = panel->y; y < bottom; ++y)
            for (int x = panel->x; x < right; ++x)
                // The final pass knows this frame's opaque graphical copies.
                // Their covered old glyphs are not visible popup/body text.
                // Raw suppression must not borrow that graphical epoch.
                if (remainder[y][x] != ' ' && visible_char_at(x, y) == 0)
                    remainder[y][x] = ' ';
    std::vector<bool> report_rows(gps_->dimy, false);
    const auto own_report = [&](const Match &match) {
        if (match.y <= lower_y || match.y >= bottom || match.x < panel->x ||
                match.length <= 0 || match.x + match.length > right ||
                match.source.size() != static_cast<size_t>(match.length) ||
                current[match.y].compare(match.x, match.length, match.source) != 0 ||
                !text_visible(match.x, match.y, match.length)) return;
        report_rows[match.y] = true;
        std::fill_n(remainder[match.y].begin() + match.x, match.length, ' ');
    };
    for (const auto &match : result) own_report(match);
    for (const auto &match : untranslated_help_rows) own_report(match);
    if (std::none_of(report_rows.begin(), report_rows.end(), [](bool value) { return value; }))
        return false;
    for (const auto &frame : tabs)
        for (int y = frame.y; y < frame.y + frame.h; ++y)
            std::fill_n(remainder[y].begin() + frame.x, frame.w, ' ');
    if (frame_scrollbar)
        for (int y = frame_scrollbar->y; y < std::min(bottom, frame_scrollbar->y + frame_scrollbar->h); ++y)
            std::fill(remainder[y].begin() + std::max(panel->x, frame_scrollbar->x),
                remainder[y].begin() + std::min(right, frame_scrollbar->x + frame_scrollbar->w), ' ');
    const auto &main_buttons = native_texture_button_main(*gps_);
    std::unordered_map<int32_t, std::vector<size_t>> controls_by_corner;
    for (size_t kind = 0; kind < std::size(main_buttons); ++kind) {
        const int32_t first = main_buttons[kind][0][0];
        if (first > 0) controls_by_corner[settings->classic ? first & 0xff : first].push_back(kind);
    }
    // Only complete current controls can remove their artwork from the proof.
    for (int y = lower_y + 1; y < bottom; ++y)
        for (int x = std::max(panel->x, right - 8); x < right; ++x) {
            if (x + 4 <= right && y + 1 < bottom) {
                const size_t at = static_cast<size_t>(x) * gps_->dimy + y - 1;
                const bool top = native_ui_top_layer_at(*gps_, at);
                const auto *primary = top ? gps_->screentexpos_top : gps_->screentexpos;
                const auto *lower_tiles = top ? gps_->screentexpos_top_lower : gps_->screentexpos_lower;
                const std::array<long, 2> keys = settings->classic
                    ? std::array<long, 2>{static_cast<unsigned char>(current[y - 1][x]), 0}
                    : std::array<long, 2>{primary ? primary[at] : 0, lower_tiles ? lower_tiles[at] : 0};
                bool control = false;
                for (long key : keys) {
                    const auto found = controls_by_corner.find(static_cast<int32_t>(key));
                    if (found == controls_by_corner.end()) continue;
                    for (size_t kind : found->second)
                        if (native_main_button_skin_at(*gps_, x, y, main_buttons[kind], settings->classic)) {
                            control = true;
                            break;
                        }
                    if (control) break;
                }
                if (control)
                    for (int row = y - 1; row <= y + 1; ++row)
                        std::fill_n(remainder[row].begin() + x, 4, ' ');
            }
            if (native_square_button_at(*gps_, x, y, native_texture_button_stocks_recenter(*gps_)))
                for (int row = y - 1; row <= y + 1; ++row)
                    if (row >= panel->y && row < bottom)
                        std::fill_n(remainder[row].begin() + x, std::min(3, right - x), ' ');
            if (x + 1 >= right) continue;
            for (const auto &skin : settings->scrollbar_skins)
                if (native_ui_skin_at(*gps_, x, y, skin[0], settings->classic) &&
                        native_ui_skin_at(*gps_, x + 1, y, skin[1], settings->classic)) {
                    remainder[y][x] = remainder[y][x + 1] = ' ';
                    break;
                }
        }
    constexpr std::array<std::string_view, 12> months = {"Granite", "Slate", "Felsite",
        "Hematite", "Malachite", "Galena", "Limestone", "Sandstone", "Timber",
        "Moonstone", "Opal", "Obsidian"};
    const auto calendar_day = [&](std::string_view text) {
        // Some date callers insert "of" between the ordinal and month. It is
        // only a native calendar connector here, never a translation rule.
        std::string normalized;
        if (const size_t of = text.find(" of "); of != std::string_view::npos) {
            const auto month = text.substr(of + 4);
            if (std::find(months.begin(), months.end(), month) != months.end()) {
                normalized = std::string(text.substr(0, of)) + " " + std::string(month);
                text = normalized;
            }
        }
        for (int index : candidate_template_rules(text)) {
            const auto &rule = rules_[static_cast<size_t>(index)];
            if (!rule.source.starts_with("{d}") ||
                    std::none_of(months.begin(), months.end(), [&](auto month) {
                        return rule.source.find(std::string(month)) != std::string::npos;
                    })) continue;
            size_t end = 0;
            std::vector<std::string> captures;
            if (match_template(rule, text, 0, &end, &captures) && end == text.size()) return true;
        }
        return false;
    };
    const auto calendar_date = [&](std::string_view text) {
        // The report list emits Year N, <ordinal> <month>; other native
        // callers use the existing <ordinal> <month>, N calendar production.
        // Recognize both with their current dictionary templates, without
        // replacing the ordinary matcher that translates these date fields.
        if (calendar_day(text)) return true;
        for (int index : candidate_template_rules(text)) {
            const auto &rule = rules_[static_cast<size_t>(index)];
            if (rule.source != "Year {d}") continue;
            size_t end = 0;
            std::vector<std::string> captures;
            if (!match_template(rule, text, 0, &end, &captures)) continue;
            auto day = trim_view(text.substr(end));
            if (day.empty() || day.front() != ',') continue;
            day = trim_view(day.substr(1));
            if (calendar_day(day)) return true;
        }
        return false;
    };
    int first_body_text = bottom;
    for (int y = body_top; y < bottom; ++y)
        if (report_rows[y]) { first_body_text = y; break; }
    for (int y = panel->y; y < bottom; ++y) {
        std::string text = remainder[y].substr(panel->x, panel->w);
        for (size_t x = 0; x < text.size(); ++x)
            if (is_cp437_box_separator(remainder[y], panel->x + x)) text[x] = ' ';
        auto payload = trim_view(text);
        if (payload.empty()) continue;
        if (y < body_top || !payload.starts_with("Date:")) return false;
        first_body_text = std::min(first_body_text, y);
        const int x = panel->x + static_cast<int>(text.find_first_not_of(' '));
        if (!text_visible(x, y, static_cast<int>(payload.size()))) return false;
        int previous = y - 1;
        int date_top = y;
        if (!settings->classic) {
            const auto span = tab(x, y, static_cast<int>(payload.size()), body);
            if (!span) return false;
            previous = span->y - 1;
            date_top = span->y;
        }
        payload = trim_view(payload.substr(5));
        if (!calendar_date(payload)) return false;
        // The first visible body text can be the complete date belonging to
        // a report scrolled above the viewport. Later dates still need their
        // immediately preceding owned report; both font halves share a top.
        if ((previous < 0 || !report_rows[previous]) && date_top != first_body_text)
            return false;
    }
    // The open map and HUD remain on the original matcher. A different text
    // window beside the reports is not covered by the panel proof. The map's
    // native elevation label is the only textual side field on this page.
    const auto elevation = [&](std::string_view source) {
        for (int index : candidate_template_rules(source)) {
            const auto &rule = rules_[static_cast<size_t>(index)];
            if (rule.source != "Elevation {d}") continue;
            size_t end = 0;
            std::vector<std::string> captures;
            if (match_template(rule, source, 0, &end, &captures) && end == source.size()) return true;
        }
        return false;
    };
    for (int y = panel->y - 1; y <= bottom; ++y) {
        std::string outside = screen_rows[y];
        std::fill(outside.begin() + panel->x - 1, outside.begin() + right + 1, ' ');
        // A proven two-column scrollbar can straddle the panel's right
        // border. Its outer column is the same control, not a side window.
        if (frame_scrollbar && y >= frame_scrollbar->y &&
                y < frame_scrollbar->y + frame_scrollbar->h)
            std::fill(outside.begin() + std::max(0, frame_scrollbar->x),
                outside.begin() + std::min(gps_->dimx, frame_scrollbar->x + frame_scrollbar->w), ' ');
        for (size_t x = 0; x < outside.size(); ++x)
            if (is_cp437_box_separator(screen_rows[y], x)) outside[x] = ' ';
        for (const auto &field : split_text_fields(outside)) {
            if (std::none_of(field.text.begin(), field.text.end(), [](unsigned char ch) {
                    return (ch >= 'A' && ch <= 'Z') || (ch >= 'a' && ch <= 'z') || ch >= 0x80;
                })) continue;
            if (!elevation(field.text)) return false;
        }
    }
    // Above/below the report's vertical extent, do not mistake another closed
    // text window for ordinary HUD or toolbar ink. The resource HUD is the
    // sole allowed text frame here and must carry its independent counters.
    std::map<std::array<int, 4>, bool> outer_frames;
    for (int y = 0; y < gps_->dimy; ++y) {
        if (y >= panel->y - 1 && y <= bottom) continue;
        for (const auto &field : split_text_fields(screen_rows[y])) {
            if (std::none_of(field.text.begin(), field.text.end(), [](unsigned char ch) {
                    return (ch >= 'A' && ch <= 'Z') || (ch >= 'a' && ch <= 'z') || ch >= 0x80;
                })) continue;
            const auto frame = native_panel_interior(borders, *gps_, field.start, field.end, y);
            if (!frame) continue;
            const std::array<int, 4> key{frame->x, frame->y, frame->w, frame->h};
            if (const auto known = outer_frames.find(key); known != outer_frames.end()) {
                if (!known->second) return false;
                continue;
            }
            bool population = false, food = false, drink = false, seeds = false;
            if (frame->y + frame->h <= panel->y - 1)
                for (int row = frame->y; row < frame->y + frame->h; ++row) {
                    const auto text = std::string_view(current[row]).substr(frame->x, frame->w);
                    const auto label = [&](std::string_view source) {
                        const size_t at = text.find(source);
                        return at != std::string_view::npos && has_word_boundaries(text, at, at + source.size());
                    };
                    population = population || label("Population") || label("Pop");
                    food = food || label("Food");
                    drink = drink || label("Drink");
                    seeds = seeds || label("Seeds");
                }
            const bool hud = population && food && drink && seeds;
            outer_frames.emplace(key, hud);
            if (!hud) return false;
        }
    }
    return true;
}();
