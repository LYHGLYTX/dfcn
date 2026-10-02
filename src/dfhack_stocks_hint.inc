// DFHack plugins/stocks.lua owns a 27x7 frame with a 25x5 body. Its
// independently colored key/action fields are not item nouns or names.
// Identify the complete card before any generic translation, including raw
// layer suppression. Custom frame artwork need not expose border characters.
std::vector<SDL_Rect> dfhack_stocks_hint_regions;
std::vector<Match> dfhack_stocks_hint_matches;
{
    const auto context_row = [&](int y) {
        if (!screen_override) return screen_rows[static_cast<size_t>(y)];
        std::string row(static_cast<size_t>(gps_->dimx), ' ');
        for (int x = 0; x < gps_->dimx; ++x) {
            bool top = false;
            const auto *cell = cell_at(x, y, &top);
            row[static_cast<size_t>(x)] = cell && cell[0] ? static_cast<char>(cell[0]) : ' ';
        }
        return row;
    };
    struct ActionField {
        int x = 0, y = 0;
        std::string source;
    };
    for (int scroll_y = 4; scroll_y + 1 < gps_->dimy; ++scroll_y) {
        const std::string scroll_row = context_row(scroll_y);
        for (size_t at = scroll_row.find("Shift+Scroll"); at != std::string::npos;
                at = scroll_row.find("Shift+Scroll", at + 12)) {
            const int left = static_cast<int>(at), right = left + 25;
            if (right > gps_->dimx || scroll_row.compare(at + 12, 13, ": fast scroll") != 0 ||
                context_row(scroll_y + 1).compare(at + 18, 6, "DFHack") != 0) continue;
            std::array<ActionField, 4> actions;
            bool complete = true;
            for (int index = 0; index < 3; ++index) {
                const int y = scroll_y - 4 + index;
                const std::string row = context_row(y).substr(at, 25);
                const size_t separator = row.find(": ");
                if (separator == std::string::npos ||
                    !is_keybinding_code(std::string_view(row).substr(0, separator))) {
                    complete = false;
                    break;
                }
                const std::string action = trim(row.substr(separator + 2));
                if ((index == 0 && action != "collapse all" && action != "expand all") ||
                    (index == 1 && action != "expand all") ||
                    (index == 2 && action != "remove empties")) {
                    complete = false;
                    break;
                }
                actions[index] = {left + static_cast<int>(separator) + 2, y, action};
            }
            if (!complete) continue;
            actions[3] = {left + 14, scroll_y, "fast scroll"};
            // Reserving these regions emits no key/brand matches: their
            // original glyphs and colors must remain visible, not suppressed.
            const SDL_Rect body{left, scroll_y - 4, 25, 5};
            const SDL_Rect brand{left + 18, scroll_y + 1, 6, 1};
            dfhack_stocks_hint_regions.push_back(body);
            dfhack_stocks_hint_regions.push_back(brand);
            for (const ActionField &action : actions) {
                if (only_y >= 0 && only_y != action.y) continue;
                const auto &source_row = screen_rows[static_cast<size_t>(action.y)];
                if (source_row.compare(action.x, action.source.size(), action.source) != 0)
                    continue;
                const auto target = exact_literal_translation("DFHack stocks hint: " + action.source);
                if (!target) continue;
                Match match{action.x, action.y, static_cast<int>(action.source.size()),
                    kDfhackStocksHintRule, *target, action.source};
                match.layout_x = action.x;
                match.layout_length = right - action.x;
                match.layout_left = true;
                match.layout_clip_right = right;
                dfhack_stocks_hint_matches.push_back(std::move(match));
            }
        }
    }
    for (const SDL_Rect &owned : dfhack_stocks_hint_regions)
        for (int y = owned.y; y < owned.y + owned.h; ++y)
            std::fill_n(screen_rows[static_cast<size_t>(y)].begin() + owned.x, owned.w, ' ');
}
