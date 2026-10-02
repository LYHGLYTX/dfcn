// Building detail sheets can reach the viewport bottom or step outward at
// their scroll gutter. Only the resting-place record uses this fallback;
// ordinary panels continue to require a closed frame.
static std::optional<SDL_Rect> native_resting_place_panel(
        const NativePanelBorders &borders, const graphicst &gps,
        const SDL_Rect &source) {
    if (const auto panel = native_panel_interior(borders, gps, source)) return panel;
    if (source.x <= 0 || source.y <= 0 || source.w <= 0 || source.h <= 0 ||
            source.x + source.w > gps.dimx || source.y + source.h > gps.dimy)
        return std::nullopt;
    int left = source.x - 1;
    while (left >= 0 && !borders.at(left, source.y, 3)) --left;
    if (left < 0) return std::nullopt;
    int top = source.y - 1;
    while (top >= 0 && borders.at(left, top, 3)) --top;
    if (top < 0 || !borders.at(left, top, 0)) return std::nullopt;
    int right = left + 1;
    while (right < gps.dimx && borders.at(right, top, 1)) ++right;
    if (right >= gps.dimx || !borders.at(right, top, 2) ||
            source.x + source.w > right) return std::nullopt;
    int bottom = source.y + 1;
    while (bottom < gps.dimy && borders.at(left, bottom, 3)) ++bottom;
    if (bottom < source.y + source.h) return std::nullopt;
    return SDL_Rect{left + 1, top + 1, right - left - 1, bottom - top - 1};
}

// Fixed native records draw their introduction and person separately without
// add_paragraph, either on consecutive rows or side by side. Claim the complete
// record before generic item prose or formatter-owned identity rows consume it.
void Overlay::append_native_split_ui_messages(std::vector<std::string> &screen_rows,
        std::vector<Match> &result, int only_y,
        const unsigned char *screen_override) const {
    const auto &prefixes = ui_message_split_prefixes_;
    if (prefixes.empty()) return;
    for (bool top_layer : {false, true}) {
        const auto *layer = top_layer ? gps_->screen_top : gps_->screen;
        if (!layer || (screen_override && screen_override != layer)) continue;
        const auto draws = captured_native_drawn_text_rows(top_layer);
        std::map<std::pair<int, int>, const NativeDrawnTextRow *> positions;
        for (const auto &draw : draws) positions[{draw.x, draw.y}] = &draw;
        const auto current_draw = [&](const NativeDrawnTextRow &draw)
                -> std::optional<Match> {
            if (!draw.address || draw.x < 0 || draw.x >= gps_->dimx ||
                draw.y < 0 || draw.y >= gps_->dimy || draw.source.empty() ||
                draw.source.size() > static_cast<size_t>(gps_->dimx - draw.x) ||
                screen_rows[draw.y].compare(draw.x, draw.source.size(), draw.source) != 0)
                return std::nullopt;
            for (size_t offset = 0; offset < draw.source.size(); ++offset) {
                const int x = draw.x + static_cast<int>(offset);
                const unsigned char expected = static_cast<unsigned char>(draw.source[offset]);
                const size_t at = static_cast<size_t>(x) * gps_->dimy + draw.y;
                bool top = false;
                const auto *cell = cell_at(x, draw.y, &top);
                const unsigned char visible = cell && cell[0] ? cell[0] : ' ';
                const unsigned char drawn = layer[at * 8] ? layer[at * 8] : ' ';
                // Black spaces in screen_top are transparent. They can belong
                // to this draw only when the visible base is equally empty;
                // every non-space glyph must still own the exact drawn layer.
                const bool same_layer = top == top_layer || (expected == ' ' &&
                    native_item_row_layer_at(*gps_, x, draw.y, top_layer));
                if (!same_layer || drawn != expected || visible != expected ||
                    is_cp437_box_separator(screen_rows[draw.y], x)) return std::nullopt;
            }
            const auto text = trim_view(draw.source);
            if (text.empty()) return std::nullopt;
            return Match{draw.x + static_cast<int>(text.data() - draw.source.data()),
                draw.y, static_cast<int>(text.size()), kUiMessageRule, {}, std::string(text)};
        };
        const auto foregrounds = [&](const Match &row) {
            std::vector<int> colors;
            colors.reserve(static_cast<size_t>(row.length));
            for (int x = row.x; x < row.x + row.length; ++x) {
                const auto *cell = layer + (static_cast<size_t>(x) * gps_->dimy + row.y) * 8;
                colors.push_back((cell[1] << 16) | (cell[2] << 8) | cell[3]);
            }
            return colors;
        };
        for (const auto &first : draws) {
            const auto rules = prefixes.find(std::string(trim_view(first.source)));
            if (rules == prefixes.end()) continue;
            const auto heading = current_draw(first);
            if (!heading) continue;
            // Combat confirmations draw the fixed prefix, the formatter-bound
            // target and the question mark consecutively on one row. Preserve
            // that person before the independent identity pass blanks its bytes.
            auto next = positions.find({first.x + static_cast<int>(first.source.size()), first.y});
            const bool inline_person = next != positions.end();
            if (!inline_person) next = positions.find({first.x, first.y + 1});
            if (next == positions.end()) continue;
            const auto &person = *next->second;
            const auto identity = current_draw(person);
            if (!identity || (!inline_person && identity->x != heading->x)) continue;
            for (int index : rules->second) {
                const Rule &rule = rules_[static_cast<size_t>(index)];
                const auto &suffix = rule.template_literals.back();
                Match body = *identity;
                // Coffin records and combat confirmations append punctuation
                // in another addst draw. Its terminal must be adjacent.
                if (!body.source.ends_with(suffix)) {
                    const auto tail = positions.find({person.x +
                        static_cast<int>(person.source.size()), person.y});
                    if (tail == positions.end() || trim_view(tail->second->source) != suffix)
                        continue;
                    const auto punctuation = current_draw(*tail->second);
                    if (!punctuation) continue;
                    body.length = punctuation->x + punctuation->length - body.x;
                    body.source = screen_rows[body.y].substr(body.x, body.length);
                }
                const int end = body.x + body.length;
                if (end < gps_->dimx && screen_rows[body.y][end] != ' ' &&
                    !is_cp437_box_separator(screen_rows[body.y], end)) continue;
                const std::string source = heading->source + ' ' + body.source;
                auto source_colors = foregrounds(*heading);
                source_colors.push_back(source_colors.back());
                const auto body_colors = foregrounds(body);
                source_colors.insert(source_colors.end(), body_colors.begin(), body_colors.end());
                std::optional<std::string> target;
                std::vector<int> target_colors;
                const auto capture = trim_view(std::string_view(body.source).substr(
                    0, body.source.size() - suffix.size()));
                // The formatter knows THIS NativeString's person/profession.
                // Do not reparse that field through a same-spelled global name.
                if (person.unit_identity_target && !person.unit_identity_target->empty() &&
                    capture == trim_view(person.source) &&
                    rule.target_template_literals.size() == 2 &&
                    rule.target_capture_order.size() == 1 && rule.target_capture_order.front() == 0) {
                    const std::vector<std::string> captures{std::string(capture)};
                    const std::vector<std::optional<std::string>> resolved{person.unit_identity_target};
                    target = fill_template(rule, captures, nullptr, nullptr, &resolved);
                    const auto color_text = [&](std::string_view text, int color) {
                        std::vector<uint32_t> codepoints;
                        if (decode_utf8(std::string(text), codepoints))
                            target_colors.insert(target_colors.end(), codepoints.size(), color);
                    };
                    color_text(rule.target_template_literals.front(), source_colors.front());
                    color_text(*person.unit_identity_target, body_colors.front());
                    color_text(rule.target_template_literals.back(), body_colors.back());
                } else {
                    target = translate_help_paragraph(source, source_colors, target_colors, true, index);
                }
                if (!target) continue;
                const int source_right = std::max(heading->x + heading->length, end);
                int right = source_right;
                const NativePanelBorders borders(*gps_);
                const SDL_Rect source_box{heading->x, heading->y,
                    source_right - heading->x, body.y - heading->y + 1};
                const auto panel = heading->source == "This is the resting place of"
                    ? native_resting_place_panel(borders, *gps_, source_box)
                    : native_panel_interior(borders, *gps_, source_box);
                if (panel) {
                    // These fixed draws have no native paragraph width. Their
                    // English ink is not the width of the record: using it
                    // makes Chinese wrapping change with the person's name.
                    // Keep the panel's matching left/right inset, and stop
                    // before any independent field or foreground artwork.
                    right = std::max(source_right, panel->x + panel->w -
                        (heading->x - panel->x));
                    for (const Match *row : std::array<const Match *, 2>{&*heading, &body}) {
                        // The inline person's bytes belong to this sentence,
                        // so only its terminal can bound an independent field.
                        if (inline_person && row == &*heading) continue;
                        for (int x = row->x + row->length; x < right; ++x) {
                            const auto ch = visible_char_at(x, row->y);
                            if ((ch && ch != ' ') ||
                                    native_foreground_picture_at(*gps_, x, row->y)) {
                                right = std::max(source_right, x);
                                break;
                            }
                        }
                    }
                }
                std::vector<Match> rows;
                if (inline_person) {
                    // One physical line owns all three draws. Passing separate
                    // same-y fields as paragraph rows would invent extra lines.
                    Match row = *heading;
                    row.length = end - row.x;
                    row.source = screen_rows[row.y].substr(row.x, row.length);
                    rows.push_back(std::move(row));
                } else {
                    rows = {*heading, std::move(body)};
                }
                append_bounded_paragraph(std::move(rows), *target,
                    screen_rows, result, only_y, right, right, target_colors, false, heading->x);
                break;
            }
        }
    }
}

// Furniture details have independent picture captions and a two-line unit
// record. Each field keeps its native column; English string lengths must
// not separately centre the title, person, status and room name.
void Overlay::layout_resting_place_details(SDL_Renderer *renderer) {
    if (!gps_ || !renderer || !face_ || gps_->tile_pixel_x <= 0 ||
            gps_->tile_pixel_y <= 0) return;
    const NativePanelBorders borders(*gps_);
    for (const Match &introduction : prepared_matches_) {
        if (introduction.rule != kUiMessageRule ||
                introduction.source != "This is the resting place of") continue;
        const auto panel = native_resting_place_panel(borders, *gps_,
            SDL_Rect{introduction.x, introduction.y, introduction.length, 2});
        if (!panel) continue;
        const int panel_right = panel->x + panel->w;
        const int right = panel_right - (introduction.x - panel->x);
        const auto current = [&](const Match &match) {
            if (match.x < panel->x || match.x + match.length > panel_right ||
                    match.y < panel->y || match.y >= panel->y + panel->h ||
                    match.length <= 0 ||
                    match.source.size() != static_cast<size_t>(match.length)) return false;
            const bool fold = match.rule >= 0 &&
                static_cast<size_t>(match.rule) < rules_.size() &&
                rules_[static_cast<size_t>(match.rule)].case_insensitive;
            std::string native;
            for (int x = match.x; x < match.x + match.length; ++x) {
                const auto ch = visible_char_at(x, match.y);
                native.push_back(ch ? ch : ' ');
            }
            return template_literal_at(native, 0, match.source, fold);
        };
        if (!current(introduction)) continue;
        Match *membership = nullptr;
        for (Match &match : prepared_matches_) {
            if (match.rule == kUiMessageRule && match.x == introduction.x &&
                    match.y > introduction.y + 1 &&
                    (match.source == "This furniture is a part of" ||
                     match.source == "This furniture is a part of multiple rooms.") &&
                    current(match) && (!membership || match.y < membership->y))
                membership = &match;
        }
        if (!membership) continue;

        for (Match &identity : prepared_matches_) {
            if (identity.rule != kCreatureNameRule || identity.target.empty() ||
                    identity.native_split_duplicate || identity.y <= introduction.y + 1 ||
                    identity.y >= membership->y || !current(identity)) continue;
            auto name = fortress_text_row(identity.x, identity.y);
            if (name.empty()) continue;
            std::vector<std::vector<Match *>> rows{std::move(name)};
            for (Match &status : prepared_matches_) {
                if (status.x == identity.x && status.y == identity.y + 1 &&
                        lower(trim(status.source)) == "deceased" && current(status)) {
                    auto row = fortress_text_row(status.x, status.y);
                    if (!row.empty()) rows.push_back(std::move(row));
                    break;
                }
            }
            layout_fortress_text_rows(renderer, rows, identity.x, right, true);
        }

        // Prove the icon before claiming a caption. Both an unnamed room
        // and a player's custom room name use this same complete field.
        const auto picture_caption = [&](int first_y, int last_y) {
            for (int y = first_y; y < last_y; ++y) {
                for (int picture = panel->x; picture <= introduction.x; ++picture) {
                    const int picture_right = native_picture_box_right(*gps_, picture, y);
                    if (picture_right <= picture || picture_right >= right) continue;
                    auto box = native_picture_caption_rect(*gps_, picture_right, y);
                    if (!box) box = native_picture_caption_rect(*gps_, picture_right + 1, y);
                    const int end = box ? std::min(right, box->x + box->w) : right;
                    int left = box ? box->x : picture_right;
                    while (left < end && (!visible_char_at(left, y) ||
                                         visible_char_at(left, y) == ' ')) ++left;
                    auto row = fortress_text_row(left, y);
                    if (row.empty() || row.back()->x + row.back()->length > end ||
                            !std::all_of(row.begin(), row.end(),
                                [&](const Match *part) { return current(*part); })) continue;
                    layout_fortress_text_rows(renderer, {row}, left, end, true);
                    return;
                }
            }
        };
        picture_caption(panel->y + 1, introduction.y);
        picture_caption(membership->y + 1, panel->y + panel->h - 1);
    }
}
