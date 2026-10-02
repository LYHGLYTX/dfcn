// The native attack chooser draws eight-row records, with a wide portrait,
// a shortcut at L+13 and a name at L+15. Status strings start at L+18.
// Its tall rectangle is not a three-row picture-caption button. Keep every
// source span and baseline, but give the translated fields one text column.
static std::optional<SDL_Rect> adventure_target_record(const graphicst &gps,
        const SDL_Rect &panel, int key_x, int key_y) {
    const int left = key_x - 13, top = key_y - 1;
    const int panel_right = panel.x + panel.w;
    if (left < panel.x || top < panel.y || top + 8 > panel.y + panel.h ||
            left + 15 >= panel_right) return std::nullopt;
    const auto *rectangle = native_texture_button_rectangle(gps);
    const auto *picture = native_texture_button_picture_box(gps);
    const bool classic = native_ui_classic().value_or(false);
    int picture_bottom = top + 1;
    while (picture_bottom < top + 8 && native_ui_skin_at(gps, left,
            picture_bottom, picture[0][1], classic, false, false, true)) ++picture_bottom;
    if (picture_bottom >= top + 8 ||
            !native_ui_skin_at(gps, left, picture_bottom, picture[0][2],
                classic, false, false, true)) return std::nullopt;
    int right = left + 12;
    while (right < panel_right &&
            native_ui_skin_at(gps, right, top, rectangle[1][0], classic)) ++right;
    if (right <= left + 15 || right >= panel_right ||
            !native_ui_skin_at(gps, right, top, rectangle[2][0], classic))
        return std::nullopt;
    for (int y = top; y < top + 8; ++y) {
        for (int x = left; x <= right; ++x) {
            const bool portrait = x < left + 12 && y <= picture_bottom;
            const int column = x == left ? 0 : x == (portrait ? left + 11 : right) ? 2 : 1;
            const int row = y == top ? 0 : y == (portrait ? picture_bottom : top + 7) ? 2 : 1;
            // Portrait artwork replaces its interior, while its four sides
            // still prove the current picture and rectangle allocation.
            if (portrait && column == 1 && row == 1) continue;
            const auto *skin = portrait ? picture : rectangle;
            const bool caption = !portrait && x >= key_x && x < right && y > top;
            if (native_ui_skin_at(gps, x, y, skin[column][row], classic,
                    caption, false, x < left + 12)) continue;
            // A status continuation can overwrite the classic bottom rail.
            // Only this record's text column may replace that rail, with the
            // rectangle's own blank-cell palette and no foreground artwork.
            if (classic && caption && row == 2 &&
                    native_ui_skin_at(gps, x, y, rectangle[1][1], true, true)) continue;
            return std::nullopt;
        }
    }
    return SDL_Rect{left + 15, top, right - left - 15, 8};
}

void Overlay::layout_adventure_target_rows(SDL_Renderer *renderer) {
    if (!gps_ || !renderer || !face_ || gps_->tile_pixel_x <= 0 ||
            gps_->tile_pixel_y <= 0) return;
    constexpr std::string_view prompt = "Who will you attack?";
    const NativePanelBorders borders(*gps_);
    for (const auto &heading : prepared_matches_) {
        if (heading.source != prompt) continue;
        const auto panel = native_panel_interior(borders, *gps_, heading.x,
            heading.x + heading.length, heading.y);
        if (!panel) continue;
        const int panel_right = panel->x + panel->w;
        std::string native_row(gps_->dimx, ' ');
        for (int key_y = heading.y + 1; key_y < panel->y + panel->h; ++key_y) {
            for (int key_x = panel->x + 13; key_x + 2 < panel_right; ++key_x) {
                const unsigned char key = visible_char_at(key_x, key_y);
                if (!((key >= 'a' && key <= 'z') || (key >= 'A' && key <= 'Z') ||
                        (key >= '0' && key <= '9')) ||
                        visible_char_at(key_x + 1, key_y) > ' ') continue;
                const auto box = adventure_target_record(*gps_, *panel, key_x, key_y);
                if (!box) continue;
                for (int y = key_y; y < box->y + box->h; ++y) {
                    std::fill(native_row.begin(), native_row.end(), ' ');
                    for (int x = box->x; x < box->x + box->w; ++x) {
                        const unsigned char ch = visible_char_at(x, y);
                        native_row[x] = ch ? static_cast<char>(ch) : ' ';
                    }
                    int first = box->x, end = box->x + box->w;
                    while (first < end && native_row[first] == ' ') ++first;
                    while (end > first && (native_row[end - 1] == ' ' ||
                            is_cp437_box_separator(native_row, end - 1))) --end;
                    if (first >= end) continue;
                    std::vector<Match *> parts;
                    std::vector<uint8_t> covered(static_cast<size_t>(end - first), 0);
                    for (auto &match : prepared_matches_) {
                        if (match.y != y || match.x < first || match.x + match.length > end ||
                                match.length <= 0 || match.source.size() !=
                                    static_cast<size_t>(match.length) || match.target.empty()) continue;
                        const bool fold_case = match.rule >= 0 &&
                            static_cast<size_t>(match.rule) < rules_.size() &&
                            rules_[static_cast<size_t>(match.rule)].case_insensitive;
                        const auto comparable = [fold_case](unsigned char ch) {
                            return fold_case && ch >= 'A' && ch <= 'Z' ? ch + ('a' - 'A') : ch;
                        };
                        bool same = true;
                        for (int i = 0; i < match.length; ++i)
                            if (comparable(native_row[match.x + i]) != comparable(match.source[i])) {
                                same = false;
                                break;
                            }
                        if (!same) continue;
                        parts.push_back(&match);
                        std::fill_n(covered.begin() + match.x - first, match.length, 1);
                    }
                    // Partial translations retain their native positions.
                    // Move only a complete field, including all color runs.
                    bool complete = !parts.empty();
                    for (int x = first; x < end; ++x)
                        if (native_row[x] != ' ' && !covered[x - first]) complete = false;
                    if (!complete) continue;
                    std::sort(parts.begin(), parts.end(), [](const Match *a, const Match *b) {
                        return a->x < b->x;
                    });
                    for (auto *part : parts) {
                        part->native_adventure_target_row = true;
                        part->native_picture_caption_box = *box;
                    }
                    layout_fortress_text_rows(renderer, {parts}, box->x, box->x + box->w);
                    const int tile_w = gps_->tile_pixel_x, tile_h = gps_->tile_pixel_y;
                    const int origin_x = (gps_->screen_pixel_x - gps_->dimx * tile_w) / 2;
                    const int origin_y = (gps_->screen_pixel_y - gps_->dimy * tile_h) / 2;
                    for (auto *part : parts) {
                        part->layout_reflowed_control = true;
                        part->layout_native_clip = SDL_Rect{origin_x + box->x * tile_w,
                            origin_y + box->y * tile_h, box->w * tile_w, box->h * tile_h};
                    }
                }
                break;
            }
        }
    }
}
