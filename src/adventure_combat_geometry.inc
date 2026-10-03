// AttackCreature's later stages use a single summary, not the eight-row
// target chooser. Coordinates below come from the native render and summary
// routines (PE 53.16 Steam 0x878600/0x872f10; classic 0x875e80).
// `panel` is the closed frame's INTERIOR: native outer L/T are panel.x/y-1.
struct NativeAdventureCombatSelector {
    size_t row = 0;
    SDL_Rect text{}, left_arrow{}, right_arrow{};
};

struct NativeAdventureCombatPanel {
    SDL_Rect panel{}, header{}, name{}, status{}, done{};
    // Three-row native allocations; their caption baseline is box.y+1.
    // x excludes the shortcut at panel.x and its following one-cell gap.
    std::vector<SDL_Rect> rows;
    // Only a complete native type-filter selector supplies these text strips.
    // Its arrows remain native artwork and never belong to a source mask.
    std::vector<NativeAdventureCombatSelector> selectors;
};

// This renderer paints gps.hover_rectangle, including in classic mode.
// Requiring init's generic border palette excludes that complete native
// frame before either its summary or its controls can own any caption.
static std::optional<SDL_Rect> adventure_combat_closed_panel_at(
        const graphicst &gps, int first, int last, int y, bool classic) {
    const auto *skin = native_texture_hover_rectangle(gps);
    const auto at = [&](int x, int row, int column, int band) {
        return native_ui_skin_at(gps, x, row, skin[column][band], classic);
    };
    // Native bounds chooses centre-50 .. centre+50; keep that allocation
    // relative to the live source, then prove every exposed frame cell.
    constexpr int outer_width = 100;
    for (int left = first - 1; left >= 0; --left) {
        const int right = left + outer_width;
        if (right < last || right >= gps.dimx ||
                !at(left, y, 0, 1) || !at(right, y, 2, 1)) continue;
        const auto rail = [&](int row, int band) {
            if (!at(left, row, 0, band) || !at(right, row, 2, band)) return false;
            for (int x = left + 1; x < right; ++x)
                if (!at(x, row, 1, band)) return false;
            return true;
        };
        int top = y - 1;
        while (top >= 0 && !rail(top, 0)) {
            if (!at(left, top, 0, 1) || !at(right, top, 2, 1)) break;
            --top;
        }
        if (top < 0 || !rail(top, 0)) continue;
        int bottom = y + 1;
        while (bottom < gps.dimy && !rail(bottom, 2)) {
            if (!at(left, bottom, 0, 1) || !at(right, bottom, 2, 1)) break;
            ++bottom;
        }
        if (bottom >= gps.dimy || !rail(bottom, 2)) continue;
        return SDL_Rect{left + 1, top + 1, right - left - 1, bottom - top - 1};
    }
    return std::nullopt;
}

static std::optional<SDL_Rect> adventure_combat_done_box_at(
        const graphicst &gps, const SDL_Rect &panel, bool classic) {
    const int left = panel.x + panel.w - 8;
    const int top = panel.y;
    if (left < panel.x || top + 3 > panel.y + panel.h) return std::nullopt;
    const auto *skin = native_texture_button_horizontal_option_confirm(gps);
    for (int dx = 0; dx < 8; ++dx) {
        const int column = dx == 0 ? 0 : dx == 7 ? 2 : 1;
        for (int dy = 0; dy < 3; ++dy) {
            if (!native_ui_skin_at(gps, left + dx, top + dy,
                    skin[column][dy], classic, dy == 1 && column == 1))
                return std::nullopt;
        }
    }
    return SDL_Rect{left + 1, top, 6, 3};
}

static std::optional<std::pair<SDL_Rect, SDL_Rect>> adventure_combat_confirmation_boxes_at(
        const graphicst &gps, const SDL_Rect &panel, bool classic) {
    const int top = panel.y + panel.h - 3;
    const auto button = [&](int left, int width, const int32_t (*skin)[3])
            -> std::optional<SDL_Rect> {
        if (top < panel.y || left < panel.x || left + width > panel.x + panel.w)
            return std::nullopt;
        for (int dx = 0; dx < width; ++dx) {
            const int column = dx == 0 ? 0 : dx == width - 1 ? 2 : 1;
            for (int dy = 0; dy < 3; ++dy) {
                if (native_ui_skin_at(gps, left + dx, top + dy,
                        skin[column][dy], classic, dy == 1 && column == 1)) continue;
                // The native confirmation hotkey occupies the lower strip.
                // Classic glyphs replace its ink; the two corners remain.
                if (classic && dy == 2 && column == 1 &&
                        native_ui_skin_at(gps, left + dx, top + dy,
                            skin[1][1], true, true)) continue;
                return std::nullopt;
            }
        }
        return SDL_Rect{left + 1, top, width - 2, 3};
    };
    // Stage one: Confirm L+2..L+12 uses ACTIVE; Cancel R-11..R-2
    // uses REMOVE. Neither is the green Done confirmation skin.
    const auto confirm = button(panel.x + 1, 11,
        native_texture_button_horizontal_option_active(gps));
    const auto cancel = button(panel.x + panel.w - 11, 10,
        native_texture_button_horizontal_option_remove(gps));
    if (!confirm || !cancel) return std::nullopt;
    return std::pair{*confirm, *cancel};
}

static bool adventure_combat_header_at(const graphicst &gps,
        const SDL_Rect &header, bool classic) {
    if (header.x < 0 || header.y < 0 || header.w <= 16 || header.h != 8 ||
            header.x + header.w > gps.dimx || header.y + header.h > gps.dimy)
        return false;
    const auto *rectangle = native_texture_button_rectangle(gps);
    const auto *picture = native_texture_button_picture_box(gps);
    // The summary first draws an eight-row rectangle, then a 12-by-6
    // picture frame. Anchored 12-by-8 portrait artwork can overlap its last
    // two rows, but cannot replace the caption column's native skin.
    for (int dy = 0; dy < 8; ++dy) {
        for (int dx = 0; dx < header.w; ++dx) {
            const bool portrait = dx < 12 && dy < 6;
            const int column = dx == 0 ? 0 :
                dx == (portrait ? 11 : header.w - 1) ? 2 : 1;
            const int row = dy == 0 ? 0 :
                dy == (portrait ? 5 : 7) ? 2 : 1;
            if (portrait && column == 1 && row == 1) continue;
            const auto *skin = portrait ? picture : rectangle;
            const bool caption = !portrait && dx >= 13 &&
                dx < header.w - 1 && dy > 0;
            if (native_ui_skin_at(gps, header.x + dx, header.y + dy,
                    skin[column][row], classic, caption, false, dx < 12))
                continue;
            // A full final status line may cover the classic bottom rail;
            // only the summary's already bounded caption area can do this.
            if (classic && caption && row == 2 &&
                    native_ui_skin_at(gps, header.x + dx, header.y + dy,
                        rectangle[1][1], true, true)) continue;
            return false;
        }
    }
    return true;
}

static std::optional<SDL_Rect> adventure_combat_action_box_at(
        const graphicst &gps, const SDL_Rect &panel, int top, bool classic,
        bool picture = false) {
    const int left = panel.x;
    const int maximum_right = panel.x + panel.w - 1;
    if (top < panel.y || top + 3 > panel.y + panel.h || left < 0 ||
            maximum_right >= gps.dimx) return std::nullopt;
    const auto *rectangle = native_texture_button_rectangle(gps);
    // Native scrolling shortens the right edge by two columns when its
    // scrollbar is present. Discover that edge from the actual upper rail.
    // A body-part/attack record replaces its first four columns with a
    // four-by-three lower-tile icon. The remaining rails still belong to
    // the same rectangle; never use its artwork as caption ownership.
    int right = left + (picture ? 4 : 1);
    while (right <= maximum_right && native_ui_skin_at(gps,
            right, top, rectangle[1][0], classic)) ++right;
    if ((right != maximum_right && right != maximum_right - 2) ||
            right <= left + 3) return std::nullopt;
    std::vector<std::pair<int, int>> selectors;
    for (int x = left + 2; x < right; ++x) {
        const auto strip = native_type_filter_span(gps, x, x + 1, top + 1);
        if (!strip || strip->first - 4 < left + 2 || strip->second + 4 > right)
            continue;
        selectors.emplace_back(strip->first - 4, strip->second + 4);
        x = strip->second + 3;
    }
    for (int dy = 0; dy < 3; ++dy) {
        for (int x = left; x <= right; ++x) {
            if (picture && x < left + 4) continue;
            const int column = x == left ? 0 : x == right ? 2 : 1;
            const bool caption = dy == 1 && x < right;
            // A complete child selector can replace the parent's middle
            // strip. Its independently proven arrows/text do not relax
            // either horizontal rail or this row's shortcut and side caps.
            if (dy == 1 && std::any_of(selectors.begin(), selectors.end(),
                    [&](const auto &span) { return x >= span.first && x < span.second; }))
                continue;
            if (native_ui_skin_at(gps, x, top + dy,
                    rectangle[column][dy], classic, caption)) continue;
            // The shortcut is drawn on the left cap in classic mode. Its
            // blank-cell background, both corners and the opposite side
            // still establish the complete three-row control.
            if (classic && dy == 1 && x == left &&
                    native_ui_skin_at(gps, x, top + dy,
                        rectangle[1][1], true, true)) continue;
            return std::nullopt;
        }
    }
    const int caption_left = left + (picture ? 6 : 2);
    return SDL_Rect{caption_left, top, right - caption_left, 3};
}

static std::optional<SDL_Rect> adventure_combat_wrestling_box_at(
        const graphicst &gps, const SDL_Rect &panel, int top, bool classic) {
    const int left = panel.x;
    const int maximum_right = panel.x + panel.w - 1;
    if (top < panel.y || top + 3 > panel.y + panel.h || left < 0 ||
            top < 0 || top + 3 > gps.dimy || maximum_right >= gps.dimx)
        return std::nullopt;
    const auto *rectangle = native_texture_button_rectangle(gps);
    // Stages eight/nine have a relationship list before their move list;
    // the first move's top therefore varies with the live relationship
    // allocation. Each move still occupies exactly three native rows.
    // Grab's own object and grip occupy two four-by-three icons. Its
    // target-object branch adds a third, shifting L+11 to L+15.
    for (const int artwork_width : {8, 12}) {
        if (left + artwork_width + 2 >= maximum_right) continue;
        int right = left + artwork_width;
        while (right <= maximum_right && native_ui_skin_at(gps,
                right, top, rectangle[1][0], classic)) ++right;
        if (right != maximum_right && right != maximum_right - 2) continue;

        // A plain relationship rectangle has no leading icon strip.
        // Require actual artwork replacing the native horizontal rails
        // in every four-column icon before excluding those cells.
        bool artwork = true;
        for (int start = left; start < left + artwork_width; start += 4) {
            bool replaces_rail = false;
            for (int x = start; x < start + 4; ++x) {
                const int column = x == left ? 0 : 1;
                for (const int dy : {0, 2})
                    replaces_rail = replaces_rail || !native_ui_skin_at(
                        gps, x, top + dy, rectangle[column][dy], classic);
            }
            if (!replaces_rail) { artwork = false; break; }
        }
        if (!artwork) continue;

        bool intact = true;
        for (int dy = 0; dy < 3 && intact; ++dy) {
            for (int x = left + artwork_width; x <= right; ++x) {
                const int column = x == right ? 2 : 1;
                const bool caption = dy == 1 && x < right;
                if (!native_ui_skin_at(gps, x, top + dy,
                        rectangle[column][dy], classic, caption)) {
                    intact = false;
                    break;
                }
            }
        }
        if (!intact) continue;
        const int caption_left = left + artwork_width + 2;
        return SDL_Rect{caption_left, top, right - caption_left, 3};
    }
    return std::nullopt;
}

static std::optional<NativeAdventureCombatPanel> capture_adventure_combat_panel(
        const graphicst &gps, int first, int last, int y) {
    if (gps.dimx <= 0 || gps.dimy <= 0 || first < 0 || first >= last ||
            last > gps.dimx || y < 0 || y >= gps.dimy) return std::nullopt;
    const bool classic = native_ui_classic().value_or(false);
    // Use a presently closed frame. A nearby translated prompt or an
    // occupied-texture run cannot confer ownership of the combat summary.
    const auto panel = adventure_combat_closed_panel_at(gps, first, last, y, classic);
    if (!panel || panel->w <= 30 || panel->h <= 14) return std::nullopt;
    const SDL_Rect header{panel->x + 1, panel->y + 1, panel->w - 10, 8};
    if (!adventure_combat_header_at(gps, header, classic)) return std::nullopt;

    // Done is an eight-column, three-row native confirmation control at
    // outer R-8/T+1. Its text anchor is R-6/T+2. Require its actual skin;
    // no English literal is necessary to recognize the surrounding panel.
    const auto done = adventure_combat_done_box_at(gps, *panel, classic);
    if (!done) return std::nullopt;

    NativeAdventureCombatPanel result;
    result.panel = *panel;
    result.header = header;
    result.done = *done;
    const int header_right = header.x + header.w - 1;
    result.name = {header.x + 13, header.y + 1,
        header_right - header.x - 13, 1};
    result.status = {header.x + 16, header.y + 2,
        header_right - header.x - 16, 6};

    // All stages with this summary retain their three-row record pitch.
    // Values and dynamic unit/item/anatomy strings are routed by the caller;
    // geometry does not select a stage by one particular combat verb.
    for (int top = panel->y + 12; top + 3 <= panel->y + panel->h; top += 3) {
        const auto box = adventure_combat_action_box_at(gps, *panel, top, classic);
        if (!box) break;
        const size_t row_index = result.rows.size();
        result.rows.push_back(*box);
        const int caption_y = top + 1;
        for (int x = box->x; x < box->x + box->w; ++x) {
            const auto strip = native_type_filter_span(gps, x, x + 1, caption_y);
            if (!strip || strip->first - 4 < box->x ||
                    strip->second + 4 > box->x + box->w) continue;
            result.selectors.push_back({row_index,
                {strip->first, caption_y, strip->second - strip->first, 1},
                {strip->first - 4, caption_y, 3, 1},
                {strip->second + 1, caption_y, 3, 1}});
            x = strip->second + 3;
        }
    }
    return result;
}
