// The native adventure compass is an 11-by-11 frame at the top of the UI.
// Its horizontal origin follows the viewport: never assume the screen edge.
// Each of its nine rows has a creature glyph, a bearing, and an optional
// Gui/Qst badge. Creature glyphs are arbitrary and are not keyboard hints.
void Overlay::append_adventure_compass_matches(std::vector<std::string> &rows,
        std::vector<Match> &matches, int only_y) const {
    if (gps_->dimx < 11 || gps_->dimy < 11) return;
    const NativePanelBorders borders(*gps_);
    static constexpr std::array<std::string_view, 16> bearings = {{
        "N", "NNE", "NE", "ENE", "E", "ESE", "SE", "SSE",
        "S", "SSW", "SW", "WSW", "W", "WNW", "NW", "NNW",
    }};
    for (int frame_left = 0; frame_left + 10 < gps_->dimx; ++frame_left) {
        if (!borders.at(frame_left, 0, 0)) continue;
        // Probe the full interior so a creature's CP437 line glyph cannot
        // be mistaken for a nearer edge while walking from the direction.
        const auto panel = native_panel_interior(borders, *gps_,
            frame_left + 1, frame_left + 10, 1);
        if (!panel || panel->x != frame_left + 1 || panel->y != 1 ||
            panel->w != 9 || panel->h != 9) continue;

        std::vector<Match> captions;
        bool complete = true;
        for (int y = panel->y; y < panel->y + panel->h; ++y) {
            std::string visible;
            for (int x = panel->x; x < panel->x + panel->w; ++x) {
                const unsigned char ch = visible_char_at(x, y);
                visible.push_back(ch ? static_cast<char>(ch) : ' ');
            }
            if (trim_view(visible).empty()) continue;
            const std::string_view direction = trim_view(
                std::string_view(visible).substr(2, 3));
            const std::string_view badge = trim_view(
                std::string_view(visible).substr(6, 3));
            const bool bearing = std::find(bearings.begin(), bearings.end(),
                direction) != bearings.end();
            if (visible[1] != ' ' || visible[2] == ' ' || visible[5] != ' ' ||
                (!bearing && direction != "***") ||
                (!badge.empty() && badge != "Gui" && badge != "Qst")) {
                complete = false;
                break;
            }
            // The native *** marker is not a direction. Leave it and the
            // creature/badge columns untouched, including their colors.
            if (!bearing) continue;
            const int x = panel->x + 2;
            const int length = static_cast<int>(direction.size());
            // Raw-layer suppression may see text under a foreground widget.
            // Only the current composed bearing may own these source cells.
            if (rows[y].compare(panel->x, panel->w, visible) != 0) continue;
            const auto target = exact_literal_translation(
                "Adventure compass: " + std::string(direction));
            if (!target || target->empty()) continue;
            Match caption{x, y, length, kAdventureCompassRule,
                *target, std::string(direction)};
            caption.layout_x = x;
            caption.layout_y = y;
            caption.layout_length = 4;
            caption.layout_clip_right = x + 4;
            caption.layout_left = true;
            captions.push_back(std::move(caption));
        }
        if (!complete) continue;
        for (auto &caption : captions) {
            std::fill_n(rows[caption.y].begin() + caption.x, caption.length, ' ');
            if (only_y < 0 || only_y == caption.y)
                matches.push_back(std::move(caption));
        }
        frame_left += 10;
    }
}

void Overlay::layout_adventure_compass(SDL_Renderer *renderer) {
    // Fit the entire bearing column together. Even a one-letter source has
    // the full four-cell budget, ending before the optional native badge.
    std::map<int, std::vector<std::vector<Match *>>> columns;
    for (auto &match : prepared_matches_)
        if (match.rule == kAdventureCompassRule && !match.target.empty())
            columns[match.x].push_back({&match});
    for (const auto &[left, rows] : columns)
        layout_fortress_text_rows(renderer, rows, left, left + 4, true);
}
