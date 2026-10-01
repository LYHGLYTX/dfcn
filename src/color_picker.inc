// Color names and their dye annotation belong to one list caption. Claim
// the whole native row before generic words can acquire separate text boxes.
void Overlay::append_color_picker_rows(std::vector<std::string> &rows,
        std::vector<Match> &matches, int only_y, bool raw_layer) const {
    if (!config_.compositional_rules) return;
    auto context = rows;
    if (raw_layer) {
        // The heading can be on a different layer from a list caption. Use
        // the current visible modal for ownership, then project onto rows.
        for (int y = 0; y < gps_->dimy; ++y)
            for (int x = 0; x < gps_->dimx; ++x) {
                bool top = false;
                const auto *cell = cell_at(x, y, &top);
                context[y][x] = cell && cell[0] ? static_cast<char>(cell[0]) : ' ';
            }
    }
    const NativePanelBorders borders(*gps_);
    std::optional<SDL_Rect> panel;
    int heading_y = -1;
    for (int y = 0; y < gps_->dimy && !panel; ++y) {
        for (const std::string_view title : {"Select color.", "Choose dye color"}) {
            const size_t at = context[y].find(title);
            if (at == std::string::npos ||
                !has_word_boundaries(context[y], at, at + title.size())) continue;
            panel = native_panel_interior(borders, *gps_, static_cast<int>(at),
                static_cast<int>(at + title.size()), y);
            if (panel) { heading_y = y; break; }
        }
    }
    if (!panel) return;
    int right = panel->x + panel->w - 1;
    for (const auto &bar : native_vertical_scrollbar_spans(*gps_, *panel))
        if (bar.y + bar.h > heading_y && bar.x > panel->x + panel->w / 2)
            right = std::min(right, bar.x - 1);

    struct Choice {
        int x, y, end;
        std::string target;
    };
    std::vector<Choice> choices;
    int left = right;
    const auto letter = [](unsigned char ch) {
        return (ch >= 'a' && ch <= 'z') || (ch >= 'A' && ch <= 'Z');
    };
    for (int y = heading_y + 1; y < panel->y + panel->h; ++y) {
        int x = panel->x;
        while (x < right && !letter(context[y][x])) ++x;
        if (x == right) continue;
        int end = x;
        while (end < right && (letter(context[y][end]) ||
                context[y][end] == ' ' || context[y][end] == '-' ||
                context[y][end] == '(' || context[y][end] == ')')) ++end;
        while (end > x && context[y][end - 1] == ' ') --end;
        // Only lookup discards native justification padding. Suppression
        // retains every physical byte between the color and annotation.
        std::istringstream words(context[y].substr(x, end - x));
        std::string source;
        for (std::string word; words >> word;) {
            if (!source.empty()) source += ' ';
            source += lower(word);
        }
        std::optional<std::string> target;
        if (source == "any color") {
            target = exact_literal_translation(source);
        } else {
            const bool dye = source.ends_with(" (dye)");
            if (dye) source.resize(source.size() - std::string_view(" (dye)").size());
            std::vector<size_t> origins;
            target = RULESETS.translate_with_origins(source, "::color::name", origins);
            if (target && dye) *target += "（染料）";
        }
        if (!target || target->empty()) continue;
        choices.push_back({x, y, end, std::move(*target)});
        left = std::min(left, x);
    }
    if (choices.empty() || left >= right) return;
    const int pixels = std::clamp(static_cast<int>(gps_->tile_pixel_y * config_.font_scale),
        1, std::max(1, gps_->tile_pixel_y));
    for (const auto &choice : choices) {
        if (only_y >= 0 && choice.y != only_y) continue;
        // Immediate glyph suppression may see only part of this visible
        // caption on its raw layer. Claim each matching span there; the final
        // composed scan owns the complete caption as a single Match.
        for (int x = choice.x; x < choice.end;) {
            while (x < choice.end && (rows[choice.y][x] != context[choice.y][x] ||
                    rows[choice.y][x] == ' ')) ++x;
            const int begin = x;
            while (x < choice.end && rows[choice.y][x] == context[choice.y][x]) ++x;
            int end = x;
            while (end > begin && rows[choice.y][end - 1] == ' ') --end;
            if (end == begin) continue;
            Match match{begin, choice.y, end - begin, kColorPickerChoiceRule,
                choice.target, rows[choice.y].substr(begin, end - begin)};
            match.layout_x = left;
            match.layout_length = right - left;
            match.layout_left = true;
            match.layout_clip_right = right;
            match.layout_font_pixels = pixels;
            match.layout_lock_font_pixels = true;
            match.layout_line_height_pixels = gps_->tile_pixel_y;
            matches.push_back(std::move(match));
            std::fill(rows[choice.y].begin() + begin, rows[choice.y].begin() + end, ' ');
        }
    }
}
