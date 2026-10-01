// Included inside find_matches, before generic word/UI matching. The native
// item detail panel owns its prose, location captions and material-use
// rows, not isolated material words. Reuse the shared grammar and layout.
    {
        const NativePanelBorders borders(*gps_);
        const bool possible_items = native_item_anchors_in(*gps_, {0, 0, gps_->dimx, gps_->dimy});
        const auto location_captures = captured_clipped_captions();
        const auto location_draws = captured_native_drawn_text_rows();
        const auto top_location_draws = captured_native_drawn_text_rows(true);
        std::vector<std::pair<SDL_Rect, bool>> panel_contexts;
        std::map<std::array<int, 4>, std::optional<SDL_Rect>> item_headings;
        std::map<std::array<int, 4>, std::optional<SDL_Rect>> stepped_panels;
        const auto item_heading = [&](const SDL_Rect &panel) {
            const std::array<int, 4> key{panel.x, panel.y, panel.w, panel.h};
            if (const auto found = item_headings.find(key); found != item_headings.end())
                return found->second;
            const auto heading = native_item_detail_heading(*gps_, panel,
                [this](int x, int y) { return visible_char_at(x, y); });
            item_headings.emplace(key, heading);
            return heading;
        };
        const auto current_text = [&](int x, int y, int length) {
            for (int at = x; at < x + length; ++at) {
                const unsigned char visible = visible_char_at(at, y);
                if ((visible ? visible : ' ') !=
                    static_cast<unsigned char>(screen_rows[y][at])) return false;
                if (screen_override) {
                    bool top = false;
                    cell_at(at, y, &top);
                    if (screen_override != (top ? gps_->screen_top : gps_->screen)) return false;
                }
            }
            return true;
        };
        const auto is_item_panel = [&](const SDL_Rect &panel) {
            for (const auto &[known, item_context] : panel_contexts)
                if (known.x == panel.x && known.y == panel.y &&
                    known.w == panel.w && known.h == panel.h) return item_context;
            if (!native_item_anchors_in(*gps_, panel)) {
                panel_contexts.emplace_back(panel, false);
                return false;
            }
            // Adventure sheets omit the state-action strip. The same current
            // picture/Weight heading that owns their title proves this panel.
            if (item_heading(panel)) {
                panel_contexts.emplace_back(panel, true);
                return true;
            }
            // A View/recenter control also occurs on creature panels. Only
            // the item-only forbid/dump/melt/hide strip establishes context.
            for (int y = panel.y; y < panel.y + panel.h; ++y)
                for (int x = panel.x; x < panel.x + panel.w; ++x)
                    if (native_item_state_action_at(*gps_, x, y)) {
                        panel_contexts.emplace_back(panel, true);
                        return true;
                    }
            panel_contexts.emplace_back(panel, false);
            return false;
        };
        const auto item_panel_for_field = [&](int first, int last, int row)
                -> std::optional<SDL_Rect> {
            if (!possible_items) return std::nullopt;
            if (const auto panel = native_panel_interior(borders, *gps_, first, last, row);
                panel && is_item_panel(*panel)) return panel;
            // Owner is on the item picture's middle row, ABOVE Weight. A
            // stepped sheet cannot use the body fallback below, which needs
            // Weight before the source row. Share the title reader's current
            // picture/heading proof; the owner row is checked again below.
            if (screen_rows[row].compare(first, 7, "Owner: ") == 0) {
                for (int picture = 0; picture < first; ++picture) {
                    const int picture_right = native_picture_box_right(*gps_, picture, row);
                    if (picture_right <= picture || picture_right > first) continue;
                    const auto panel = native_item_detail_panel(borders, *gps_,
                        picture, picture_right, row,
                        [this](int x, int y) { return visible_char_at(x, y); });
                    if (panel && first >= panel->x && last <= panel->x + panel->w &&
                        row >= panel->y && row < panel->y + panel->h &&
                        is_item_panel(*panel)) return panel;
                }
            }
            // Item sheets are not always freestanding rectangles: the right
            // scroll gutter starts BELOW the heading and can interrupt that
            // side's path to the top corners. A sheet can also reach the
            // viewport's bottom. Do not relax the generic closed-panel reader
            // for other UIs. Prove THIS sheet by its continuous left edge,
            // current Weight caption and item-only controls in the heading.
            int left = first - 1;
            while (left >= 0 && !borders.at(left, row, 3)) --left;
            if (left < 0) return std::nullopt;
            int top = row - 1;
            while (top >= 0 && borders.at(left, top, 3)) --top;
            if (top < 0 || !borders.at(left, top, 0)) return std::nullopt;
            // Item-picture tabs and scrollbar caps interrupt the right side
            // beside the opening lines. The complete top edge establishes
            // the sheet width even when those rows have no right-side tile.
            int right = left + 1;
            while (right < gps_->dimx && borders.at(right, top, 1)) ++right;
            if (right >= gps_->dimx || !borders.at(right, top, 2) || last > right)
                return std::nullopt;
            // Many independent fields share this same stepped-sheet probe.
            // Its heading stops before the source row, so include that row
            // in the key; a shorter band must not borrow a later Weight or
            // action. The current native grid is unchanged by source claims.
            const std::array<int, 4> key{left, top, right, row};
            if (const auto found = stepped_panels.find(key); found != stepped_panels.end())
                return found->second;
            const auto remember = [&](std::optional<SDL_Rect> panel) {
                stepped_panels.emplace(key, panel);
                return panel;
            };
            // Weight is mandatory for this fallback. Reject ordinary panels
            // from their text before walking every cell's item-action skins.
            bool weight = false;
            for (int y = top + 1; y < row && !weight; ++y) {
                std::string heading;
                for (int x = left + 1; x < right; ++x) {
                    const unsigned char ch = visible_char_at(x, y);
                    heading.push_back(ch ? ch : ' ');
                }
                const size_t at = heading.find("Weight:");
                weight = weight || (at != std::string::npos &&
                    (at == 0 || heading[at - 1] == ' '));
            }
            if (!weight) return remember(std::nullopt);
            bool state_action = false;
            for (int y = top + 1; y < row && !state_action; ++y)
                for (int x = left + 1; x < right && !state_action; ++x)
                    state_action = native_item_state_action_at(*gps_, x, y);
            const SDL_Rect heading_panel{left + 1, top + 1,
                right - left - 1, row - top - 1};
            if (!state_action && !item_heading(heading_panel)) return remember(std::nullopt);
            // Keep the same sheet across the right-side steps. Each body row
            // below still stops at its own visible controls and borders.
            int bottom = row + 1;
            while (bottom < gps_->dimy && borders.at(left, bottom, 3)) ++bottom;
            return remember(SDL_Rect{left + 1, top + 1, right - left - 1, bottom - top - 1});
        };
        const auto item_description_context = [&](int first, int last, int row) {
            if (!possible_items) return false;
            if (item_panel_for_field(first, last, row)) return true;
            // The item tabs can replace the sheet's right corner as well as
            // its side. A captured textbox supplies its own dimensions; it
            // needs item identity here, not a second rectangular outer frame.
            int left = first - 1;
            while (left >= 0 && !borders.at(left, row, 3)) --left;
            if (left < 0) return false;
            int top = row - 1;
            while (top >= 0 && borders.at(left, top, 3)) --top;
            if (top < 0 || !borders.at(left, top, 0)) return false;
            const SDL_Rect heading_band{left + 1, top + 1,
                gps_->dimx - left - 1, row - top - 1};
            // Tie the picture to this same left edge and body column. An
            // unrelated item card farther to the right cannot authorize text.
            bool picture = false;
            for (int x = heading_band.x; x <= first && !picture; ++x)
                picture = native_picture_box_right(*gps_, x, heading_band.y + 1) > x;
            if (!picture) return false;
            const auto heading = item_heading(heading_band);
            if (!heading || row < heading->y + heading->h) return false;
            // As with item captions, require the actual forbid/dump/melt/hide
            // skin beside the title. Picture + Weight + these actions proves
            // the item sheet without treating the scan width as body space.
            for (int y = heading_band.y; y < heading->y + heading->h; ++y)
                for (int x = heading->x; x < gps_->dimx; ++x)
                    if (native_item_state_action_at(*gps_, x, y)) return true;
            return false;
        };
        const auto engraving_opening = [](std::string_view source) {
            return source.starts_with("Engraved on the wall is ") ||
                source.starts_with("Engraved on the floor is ") ||
                source.starts_with("Engraved is ");
        };
        const auto description_opening = [&](std::string_view source) {
            return engraving_opening(source) || source.starts_with("This is ") ||
                source.starts_with("These are ");
        };
        const auto engraving_panel_for_field = [&](int first, int last, int row)
                -> std::optional<SDL_Rect> {
            // Engravings have a title and picture, but no Weight or item-state
            // controls. Their explicit prose opening owns this separate
            // context; it must not classify other fields as item captions.
            if (const auto panel = native_panel_interior(borders, *gps_, first, last, row))
                return panel;
            int left = first - 1;
            while (left >= 0 && !borders.at(left, row, 3)) --left;
            if (left < 0) return std::nullopt;
            int top = row - 1;
            while (top >= 0 && borders.at(left, top, 3)) --top;
            if (top < 0 || !borders.at(left, top, 0)) return std::nullopt;
            // The picture/scroll gutter makes the right edge step outward
            // beside the first body row. Use the complete top edge's main
            // frame width, not that temporary wider row or a closed rectangle
            // through the gutter. The left edge may reach the viewport bottom.
            int right = left + 1;
            while (right < gps_->dimx && borders.at(right, top, 1)) ++right;
            if (right >= gps_->dimx || !borders.at(right, top, 2) || last > right)
                return std::nullopt;
            int bottom = row + 1;
            while (bottom < gps_->dimy && borders.at(left, bottom, 3)) ++bottom;
            return SDL_Rect{left + 1, top + 1, right - left - 1, bottom - top - 1};
        };
        const auto reserve_untranslated = [&](std::vector<Match> rows, const std::string &source) {
            if (!rows.empty()) rows.front().native_help_review_source = source;
            for (auto &row : rows) {
                row.native_help_source_only = true;
                std::fill_n(screen_rows[row.y].begin() + row.x, row.length, ' ');
                untranslated_help_rows.push_back(std::move(row));
            }
        };
        const auto description_layout_right = [&](const std::vector<Match> &rows, int right)
                -> std::optional<int> {
            if (rows.empty() || right <= 0 || right > gps_->dimx) return std::nullopt;
            const auto obstacle = [&](int x, int y) {
                return native_foreground_picture_at(*gps_, x, y) ||
                    is_cp437_box_separator(screen_rows[y], x) ||
                    borders.at(x, y, 0) || borders.at(x, y, 1) ||
                    borders.at(x, y, 2) || borders.at(x, y, 3) ||
                    borders.at(x, y, 5) || borders.at(x, y, 6) ||
                    borders.at(x, y, 7) || borders.at(x, y, 8);
            };
            int left = gps_->dimx;
            for (const auto &row : rows) {
                if (row.y < 0 || row.y >= gps_->dimy || row.x < 0 ||
                    row.length <= 0 || row.x > gps_->dimx - row.length ||
                    screen_rows[row.y].compare(row.x, row.length, row.source) != 0 ||
                    !current_text(row.x, row.y, row.length)) return std::nullopt;
                left = std::min(left, row.x);
                const int end = row.x + row.length;
                // Source ownership remains the entire native line, even
                // when another line's gutter narrows the Chinese layout.
                for (int x = row.x; x < end; ++x)
                    if (obstacle(x, row.y)) return std::nullopt;
            }
            for (const auto &row : rows) {
                // Reflow starts at the paragraph's common left edge. An
                // indented row may donate only blank, unobstructed cells.
                for (int x = left; x < row.x; ++x) {
                    const auto visible = visible_char_at(x, row.y);
                    if (obstacle(x, row.y) || screen_rows[row.y][x] != ' ' ||
                        (visible && visible != ' ')) return std::nullopt;
                }
                // A control after a short line bounds reflow; it does not
                // invalidate intact prose in this or another native row.
                for (int x = row.x + row.length; x < right; ++x) {
                    const auto visible = visible_char_at(x, row.y);
                    if (obstacle(x, row.y) || screen_rows[row.y][x] != ' ' ||
                        (visible && visible != ' ')) {
                        right = x;
                        break;
                    }
                }
            }
            return right > left ? std::optional<int>(right) : std::nullopt;
        };
        // Item and engraving textboxes retain their own native wrap width.
        // Their picture tabs and scroll gutter can interrupt the outer frame.
        // Prefer the complete captured wrap, proving every original row and
        // bounding reflow at controls in the textbox's trailing padding.
        // This also works when the outer frame cannot be read as a rectangle.
        const bool visible_description = std::any_of(screen_rows.begin(), screen_rows.end(),
            [&](const std::string &row) {
                for (const auto &field : split_text_fields(row))
                    if (description_opening(field.text)) return true;
                return false;
            });
        if (visible_description) {
            std::vector<NativeParagraphCapture> descriptions;
            {
                std::lock_guard<std::mutex> lock(g_native_paragraph_mutex);
                for (auto capture = g_native_paragraph_captures.rbegin();
                        capture != g_native_paragraph_captures.rend(); ++capture)
                    if (description_opening(trim_view(capture->source)) &&
                        !capture->wrapped_lines.empty() && capture->paragraph_width > 0 &&
                        capture->paragraph_width <= gps_->dimx &&
                        capture->wrapped_lines.size() <= static_cast<size_t>(gps_->dimy))
                        descriptions.push_back(*capture);
            }
            for (const auto &capture : descriptions) {
                const auto &first = capture.wrapped_lines.front();
                const auto anchor = trim_view(first);
                if (!description_opening(anchor)) continue;
                const int indent = static_cast<int>(anchor.data() - first.data());
                const int height = static_cast<int>(capture.wrapped_lines.size());
                for (int y = 0; y + height <= gps_->dimy; ++y) {
                    for (size_t at = screen_rows[y].find(anchor); at != std::string::npos;
                            at = screen_rows[y].find(anchor, at + 1)) {
                        const int left = static_cast<int>(at) - indent;
                        if (left < 0 || left > gps_->dimx - capture.paragraph_width ||
                            (left > 0 && ascii_word_byte(screen_rows[y][left - 1]))) continue;
                        if (!engraving_opening(anchor) && !item_description_context(
                                static_cast<int>(at), static_cast<int>(at + anchor.size()), y))
                            continue;
                        const int right = left + capture.paragraph_width;
                        std::vector<Match> rows;
                        for (int line = 0; line < height; ++line) {
                            const auto &wrapped = capture.wrapped_lines[line];
                            const auto source = trim_view(wrapped);
                            if (source.empty()) break;
                            const int x = left + static_cast<int>(source.data() - wrapped.data());
                            const int row_y = y + line;
                            if (x > right || source.size() > static_cast<size_t>(right - x) ||
                                screen_rows[row_y].compare(x, source.size(), source) != 0 ||
                                !current_text(x, row_y, static_cast<int>(source.size()))) break;
                            rows.push_back({x, row_y, static_cast<int>(source.size()),
                                kUiMessageRule, {}, std::string(source)});
                        }
                        if (rows.size() != capture.wrapped_lines.size()) continue;
                        const auto layout_right = description_layout_right(rows, right);
                        if (!layout_right) continue;
                        const auto target = translate_item_description_source(capture.source, true);
                        if (!target || !append_bounded_paragraph(rows, *target, screen_rows,
                                result, only_y, *layout_right, *layout_right))
                            reserve_untranslated(std::move(rows), capture.source);
                    }
                }
            }
            // PE 53.16 0x158be1 wraps only when the textbox width changes;
            // 0x158d52 redraws its retained strings every frame. Those actual
            // draws also recover already-open item/engraving textboxes without
            // a wrap capture. Accept complete visible rows and a fully resolved
            // description, using their occupied width rather than a guessed frame.
            for (bool top_layer : {false, true}) {
                const auto draws = captured_native_drawn_text_rows(top_layer);
                std::map<std::pair<int, int>, const NativeDrawnTextRow *> positions;
                for (const auto &draw : draws) positions[{draw.x, draw.y}] = &draw;
                for (const auto &first : draws) {
                    const auto opening = trim_view(first.source);
                    if (!description_opening(opening) || first.x < 0 ||
                        first.x >= gps_->dimx || first.y < 0 || first.y >= gps_->dimy) continue;
                    if (first.source.size() > static_cast<size_t>(gps_->dimx - first.x)) continue;
                    if (!engraving_opening(opening) && !item_description_context(first.x,
                            first.x + static_cast<int>(first.source.size()), first.y)) continue;
                    std::vector<Match> rows;
                    std::string source;
                    int right = first.x;
                    bool intact = true;
                    for (int y = first.y; y < gps_->dimy; ++y) {
                        const auto found = positions.find({first.x, y});
                        if (found == positions.end()) break;
                        const auto &draw = *found->second;
                        const auto text = trim_view(draw.source);
                        if (text.empty() || (y != first.y && description_opening(text))) break;
                        const int x = first.x + static_cast<int>(text.data() - draw.source.data());
                        if (x >= gps_->dimx || text.size() > static_cast<size_t>(gps_->dimx - x) ||
                            screen_rows[y].compare(x, text.size(), text) != 0 ||
                            !current_text(x, y, static_cast<int>(text.size()))) {
                            intact = false;
                            break;
                        }
                        rows.push_back({x, y, static_cast<int>(text.size()),
                            kUiMessageRule, {}, std::string(text)});
                        right = std::max(right, x + static_cast<int>(text.size()));
                        if (!source.empty()) source.push_back(' ');
                        source += text;
                    }
                    if (!intact || rows.empty()) continue;
                    const auto layout_right = description_layout_right(rows, right);
                    if (!layout_right) continue;
                    NativeParagraphViewport viewport;
                    const auto native = native_source_for_rows(rows, -1, nullptr, &viewport);
                    if (native) source = *native;
                    if (!description_opening(source)) continue;
                    const auto target = translate_item_description_source(source, true);
                    if (target) append_bounded_paragraph(rows, *target, screen_rows,
                        result, only_y, *layout_right, *layout_right, {}, false, -1,
                        native ? std::optional(viewport) : std::nullopt);
                }
            }
        }
        for (int y = 0; y < gps_->dimy; ++y) {
            for (const auto &field : split_text_fields(screen_rows[y])) {
                const bool engraving = engraving_opening(field.text);
                const bool introduction = engraving || field.text.starts_with("This is ") ||
                    field.text.starts_with("These are ");
                bool location = field.text.starts_with("In ") ||
                    field.text.starts_with("On ") || field.text.starts_with("With ");
                bool owner = field.text.starts_with("Owner: ");
                const bool uses = field.text == "Uses";
                // A scrolled description no longer starts with "This is".
                // Such a continuation is admitted below only when all its
                // visible rows match a captured complete item paragraph.
                const auto panel = engraving
                    ? engraving_panel_for_field(field.start, field.end, y)
                    : item_panel_for_field(field.start, field.end, y);
                if (!panel) continue;
                const int right = panel->x + panel->w;
                if (owner) {
                    const auto heading = item_heading(*panel);
                    owner = heading && y > heading->y &&
                        y < heading->y + heading->h - 1 && field.start >= heading->x;
                }
                if (location) {
                    // A wrapped historical sentence can start with "In" as
                    // well. Only the separate container/holder-icon row owns the
                    // location caption; scrolling prose stays one viewport.
                    location = false;
                    int icon_glyphs = 0;
                    for (int x = panel->x; x < field.start; ++x) {
                        location = location || native_foreground_picture_at(*gps_, x, y);
                        const unsigned char ch = visible_char_at(x, y);
                        if (ch && ch != ' ') ++icon_glyphs;
                    }
                    // Native item/holder icons can also use addchar instead
                    // of a texture (PE 0x15650d / 0x1566a2). One isolated
                    // current glyph with a gap before the relation is the
                    // same icon column; ordinary wrapped prose has none.
                    const unsigned char gap = field.start > panel->x
                        ? visible_char_at(field.start - 1, y) : 0;
                    location = location || (icon_glyphs == 1 &&
                        field.start > panel->x + 1 && (!gap || gap == ' '));
                }
                if (!introduction && !location && !owner && !uses &&
                    y < panel->y + 3) continue;
                if (uses) {
                    // The native Uses heading has the same left margin as
                    // its list. Each entry is one addst call; blank padding
                    // is not a column boundary, and entries are not prose.
                    // Linux 53.16 0x13eba14..0x13eba65 emits the first entry
                    // two rows below Uses, then advances one row per entry.
                    const auto list_row = [&](int row_y) -> std::optional<Match> {
                        const std::string_view band(
                            screen_rows[row_y].data() + panel->x, panel->w);
                        const auto text = trim_view(band);
                        if (text.empty()) return std::nullopt;
                        const int left = panel->x + static_cast<int>(text.data() - band.data());
                        if (left != field.start || !current_text(left, row_y, text.size()))
                            return std::nullopt;
                        for (int x = left; x < left + static_cast<int>(text.size()); ++x)
                            if (is_cp437_box_separator(screen_rows[row_y], x) ||
                                native_item_action_at(*gps_, x, row_y)) return std::nullopt;
                        return Match{left, row_y, static_cast<int>(text.size()),
                            kFortressItemUseRule, {}, std::string(text)};
                    };
                    auto heading = list_row(y);
                    if (!heading || heading->source != field.text) continue;
                    std::vector<Match> entries;
                    entries.push_back(std::move(*heading));
                    for (int row_y = y + 2; row_y < panel->y + panel->h; ++row_y) {
                        auto row = list_row(row_y);
                        if (!row) break; // blank, another widget, or a covered layer
                        entries.push_back(std::move(*row));
                    }
                    for (auto &entry : entries) {
                        const auto target = entry.y == y ? exact_literal_translation(entry.source)
                            : translate_fortress_material_use(entry.source);
                        entry.native_hover_untranslated = !target;
                        entry.target = target.value_or(cp437_to_utf8(entry.source));
                        entry.layout_x = field.start;
                        entry.layout_y = entry.y;
                        entry.layout_length = right - field.start;
                        entry.layout_clip_right = right;
                        // Never extend even a long fallback through a native
                        // graphical control or scrollbar on the same row.
                        for (int x = entry.x + entry.length; x < right; ++x) {
                            bool top = false;
                            cell_at(x, entry.y, &top);
                            const auto *tiles = top ? gps_->screentexpos_top : gps_->screentexpos;
                            if (tiles && tiles[static_cast<size_t>(x) * gps_->dimy + entry.y] > 0) {
                                entry.layout_clip_right = x;
                                entry.layout_length = x - field.start;
                                break;
                            }
                        }
                        entry.layout_left = true;
                        entry.layout_font_pixels = std::clamp(
                            static_cast<int>(gps_->tile_pixel_y * config_.font_scale), 1, gps_->tile_pixel_y);
                        entry.layout_lock_font_pixels = true;
                        entry.layout_line_height_pixels = gps_->tile_pixel_y;
                        // Unknown entries still own one whole field. They
                        // keep the common font/margin and remain collectable,
                        // instead of becoming Make + English tail or a name.
                        std::fill_n(screen_rows[entry.y].begin() + entry.x, entry.length, ' ');
                        if (only_y < 0 || entry.y == only_y) result.push_back(std::move(entry));
                    }
                    continue;
                }
                if (location || owner) {
                    // Keep the container/holder icon and separate View button.
                    // With introduces a unit label, not a personal first name;
                    // its profession/species/name uses the shared UI resolver.
                    if (!current_text(field.start, y, field.end - field.start)) continue;
                    std::string source = field.text;
                    // Retained native draws keep the pre-clipping value even
                    // after the per-frame clipping registry advances. Match
                    // the same layer, position and visible bytes as item names.
                    bool top_layer = false;
                    cell_at(field.start, y, &top_layer);
                    for (const auto &draw : top_layer ? top_location_draws : location_draws)
                        if (draw.x == field.start && draw.y == y &&
                            draw.source == field.text && !draw.complete_source.empty()) {
                            source = draw.complete_source;
                            break;
                        }
                    if (source == field.text)
                        for (const auto &capture : location_captures)
                            if (capture.x == field.start && capture.y == y &&
                                capture.visible == field.text) {
                                source = capture.complete;
                                break;
                            }
                    const auto target = source.ends_with("...") ? std::nullopt
                        : translate_item_description_source(source, true);
                    int caption_right = right;
                    for (const auto &next : split_text_fields(screen_rows[y])) {
                        if (next.start >= field.end && next.start < caption_right) {
                            caption_right = next.start;
                            // Include the View button's left cap in the
                            // boundary, including its classic-mode skin.
                            if (const auto button = native_button_text_rect(
                                    *gps_, next.start, next.end, y);
                                button && button->x - 1 >= field.end)
                                caption_right = std::min(caption_right, button->x - 1);
                        }
                    }
                    // A graphical control can precede its text. Its current
                    // texture, not just the word View, bounds the available row.
                    for (int x = field.end; x < caption_right; ++x) {
                        bool top = false;
                        cell_at(x, y, &top);
                        const auto *tiles = top ? gps_->screentexpos_top : gps_->screentexpos;
                        if (tiles && tiles[static_cast<size_t>(x) * gps_->dimy + y] > 0) {
                            caption_right = x;
                            break;
                        }
                    }
                    if (!target || caption_right <= field.start) {
                        reserve_untranslated({{field.start, y, field.end - field.start,
                            kUiMessageRule, {}, field.text}}, source);
                        continue;
                    }
                    // A holder/location is one caption beside an icon and a
                    // View control, not prose. Share the item row's fixed UI
                    // font and measured ellipsis within that control boundary.
                    Match caption{field.start, y, field.end - field.start,
                        kFortressItemCaptionRule, *target, field.text};
                    caption.layout_x = field.start;
                    caption.layout_y = y;
                    caption.layout_length = caption_right - field.start;
                    caption.layout_clip_right = caption_right;
                    caption.layout_left = true;
                    caption.layout_font_pixels = std::clamp(
                        static_cast<int>(gps_->tile_pixel_y * config_.font_scale), 1, gps_->tile_pixel_y);
                    caption.layout_lock_font_pixels = true;
                    caption.layout_line_height_pixels = gps_->tile_pixel_y;
                    std::fill_n(screen_rows[y].begin() + field.start, field.end - field.start, ' ');
                    if (only_y < 0 || y == only_y) result.push_back(std::move(caption));
                    continue;
                }
                std::vector<Match> rows;
                std::string source;
                bool intact = true;
                int body_right = right;
                const auto scrollbars = native_vertical_scrollbar_spans(*gps_, *panel);
                for (int row_y = y; row_y < panel->y + panel->h; ++row_y) {
                    // Item and engraving gutters can change width between
                    // rows. Read each original row within its own boundary;
                    // only the Chinese layout uses the narrowest common width.
                    // A short row's gutter must not truncate a later long row
                    // or invalidate an earlier, fully visible source span.
                    int row_right = right;
                    // Adventure sheets put a scrollbar INSIDE the outer
                    // frame. Read its live skin before the filtered text:
                    // classic arrows/thumbs have no foreground texture and
                    // are not box separators. The same edge bounds source
                    // ownership, Chinese wrapping and final drawing.
                    for (const auto &scrollbar : scrollbars)
                        if (row_y >= scrollbar.y && row_y < scrollbar.y + scrollbar.h)
                            row_right = std::min(row_right, scrollbar.x);
                    for (int x = panel->x; x < row_right; ++x) {
                        if (native_foreground_picture_at(*gps_, x, row_y) ||
                            is_cp437_box_separator(screen_rows[row_y], x) ||
                            borders.at(x, row_y, 0) || borders.at(x, row_y, 1) ||
                            borders.at(x, row_y, 2) || borders.at(x, row_y, 3) ||
                            borders.at(x, row_y, 5) || borders.at(x, row_y, 6) ||
                            borders.at(x, row_y, 7) || borders.at(x, row_y, 8)) {
                            row_right = x;
                            break;
                        }
                    }
                    if (row_right <= field.start) break;
                    const std::string_view band(screen_rows[row_y].data() + panel->x,
                        row_right - panel->x);
                    const std::string_view text = trim_view(band);
                    if (text.empty()) break;
                    body_right = std::min(body_right, row_right);
                    const int left = panel->x + static_cast<int>(text.data() - band.data());
                    if (!current_text(left, row_y, text.size())) {
                        intact = false;
                        break;
                    }
                    for (int x = left; x < left + static_cast<int>(text.size()); ++x)
                        if (is_cp437_box_separator(screen_rows[row_y], x) ||
                            native_item_action_at(*gps_, x, row_y)) intact = false;
                    if (!intact) break;
                    rows.push_back({left, row_y, static_cast<int>(text.size()),
                        kUiMessageRule, {}, std::string(text)});
                    if (!source.empty()) source.push_back(' ');
                    source += text;
                }
                if (!intact || rows.empty()) continue;
                // Captured source retains text hidden by native wrapping. A
                // direct, uncaptured description is accepted only if its
                // entire visible production resolves through the same grammar.
                NativeParagraphViewport viewport;
                const auto native = native_source_for_rows(rows, -1, nullptr, &viewport);
                if (native) source = *native;
                if (engraving && !engraving_opening(source)) continue;
                if (!introduction && (!native ||
                    (!source.starts_with("This is ") && !source.starts_with("These are "))))
                    continue;
                const auto target = translate_item_description_source(source, true);
                if (!target || !append_bounded_paragraph(rows, *target, screen_rows,
                        result, only_y, body_right, body_right, {}, false, -1,
                        native ? std::optional(viewport) : std::nullopt))
                    reserve_untranslated(std::move(rows), source);
            }
        }
    }
