// Caravan requests have independently scrolling category and commodity
// columns. Their captions are left-aligned native fields, not English-width
// centring boxes. Keep source spans, selection artwork and hitboxes intact.
std::vector<NativeTextCard> Overlay::capture_fortress_trade_request_rows() const {
    if (!gps_ || gps_->tile_pixel_x <= 0 || gps_->tile_pixel_y <= 0) return {};
    const auto settings = native_ui_settings();
    if (!settings) return {};
    std::vector<std::string> context(gps_->dimy, std::string(gps_->dimx, ' '));
    for (int y = 0; y < gps_->dimy; ++y)
        for (int x = 0; x < gps_->dimx; ++x) {
            bool top = false;
            const auto *cell = cell_at(x, y, &top);
            context[y][x] = cell && cell[0] ? cell[0] : ' ';
        }
    constexpr std::string_view heading = "Make requests for next year's caravan.";
    const NativePanelBorders borders(*gps_);
    for (int heading_y = 0; heading_y < gps_->dimy; ++heading_y) {
        const size_t at = context[heading_y].find(heading);
        if (at == std::string::npos ||
            !has_word_boundaries(context[heading_y], at, at + heading.size())) continue;
        const auto panel = native_panel_interior(borders, *gps_,
            static_cast<int>(at), static_cast<int>(at + heading.size()), heading_y);
        if (!panel) continue;
        const int right = panel->x + panel->w, bottom = panel->y + panel->h;
        int footer_y = bottom;
        for (int y = heading_y + 1; y < bottom; ++y) {
            for (const auto &field : split_text_fields(context[y])) {
                if (field.text != "Done" || field.start < panel->x || field.end > right)
                    continue;
                const auto button = native_button_text_rect(*gps_, field.start, field.end, y);
                if (button && button->x >= panel->x && button->x + button->w <= right)
                    footer_y = std::min(footer_y, button->y);
            }
        }
        if (footer_y == bottom) continue;
        std::vector<NativeTextCard> cards;
        const auto append = [&](SDL_Rect source, int text_left, int text_right) {
            if (source.x < panel->x || source.x + source.w > right ||
                source.y <= heading_y || source.y + source.h > footer_y ||
                text_left >= text_right) return;
            if (std::any_of(cards.begin(), cards.end(), [&](const NativeTextCard &seen) {
                    return seen.interior.x == text_left && seen.interior.y == source.y;
                })) return;
            auto card = capture_panel_text_card(source, true);
            if (!card) return;
            card->interior.x = text_left;
            card->interior.w = text_right - text_left;
            cards.push_back(std::move(*card));
        };

        // Read every actual category skin, including the selected row. A
        // short/partially translated label must not determine the column's
        // margin or split Small/Large cut gems into independent layout boxes.
        for (int y = heading_y + 1; y < footer_y; ++y) {
            for (const auto &field : split_text_fields(context[y])) {
                if (field.start < panel->x || field.start >= right) continue;
                const auto button = native_category_button_frame(
                    *gps_, field.start, field.start + 1, y);
                if (!button || button->toggle) continue;
                const SDL_Rect box = button->interior;
                append(box, box.x + 1, box.x + box.w - 1);
            }
        }

        // Native 53.16 draws a rectangle row and then overlays the same
        // selection box as embark on its final four cells (ELF
        // 0x1660680..0x1660a66). The caption starts ON the rectangle's left
        // cap, unlike categories. Recognize the visible checkbox and entire
        // caption strip; do not infer its bounds from a material/animal name
        // or from how many rows happen to exist in the other column.
        const auto &skin = native_texture_button_rectangle(*gps_);
        for (int top = heading_y + 1; top + 3 <= footer_y; ++top) {
            for (int checkbox = panel->x + 2; checkbox + 4 <= right; ++checkbox) {
                if (!native_selection_box_at(*gps_, checkbox, top, settings->classic)) continue;
                int left = checkbox - 1;
                while (left > panel->x &&
                        native_ui_texture_at(*gps_, left, top + 1, skin[1][1])) --left;
                if (left + 1 >= checkbox) continue;
                bool complete = true;
                for (int row = 0; row < 3 && complete; ++row) {
                    if (!native_ui_texture_at(*gps_, left, top + row, skin[0][row])) {
                        complete = false;
                        break;
                    }
                    for (int x = left + 1; x < checkbox; ++x)
                        if (!native_ui_texture_at(*gps_, x, top + row, skin[1][row])) {
                            complete = false;
                            break;
                        }
                }
                if (complete) append({left, top, checkbox - left, 3}, left + 1, checkbox - 1);
                checkbox += 3;
            }
        }
        return cards;
    }
    return {};
}

void Overlay::layout_fortress_trade_requests(SDL_Renderer *renderer) {
    if (!gps_ || !face_ || !renderer ||
        gps_->tile_pixel_x <= 0 || gps_->tile_pixel_y <= 0) return;
    for (auto &match : prepared_matches_) {
        if (match.rule != kFortressTradeRequestRowRule || match.target.empty() ||
            match.native_split_duplicate) continue;
        layout_fortress_text_rows(renderer, {{&match}}, match.layout_x, match.layout_clip_right);
    }
}
