// plugins/hotkeys.lua keeps executable command strings in a 35..45-column
// list and puts the selected command's complete short help in a separate
// WrappedLabel. Neither command tokens nor the frame signature are prose.
std::vector<SDL_Rect> dfhack_hotkeys_regions;
std::vector<Match> dfhack_hotkeys_matches;
{
    auto context_rows = screen_rows;
    if (screen_override) {
        for (int y = 0; y < gps_->dimy; ++y)
            for (int x = 0; x < gps_->dimx; ++x) {
                bool top = false;
                const auto *cell = cell_at(x, y, &top);
                context_rows[y][x] = cell && cell[0] ? static_cast<char>(cell[0]) : ' ';
            }
    }
    for (int guide_y = 0; guide_y < gps_->dimy; ++guide_y) {
        const auto &guide_row = context_rows[guide_y];
        const size_t guide_at = guide_row.find("Quickstart guide");
        if (guide_at == std::string::npos || guide_at < 4 ||
            guide_row.compare(guide_at - 3, 3, "?: ") != 0) continue;
        const int left = static_cast<int>(guide_at) - 4;
        const auto arrow_at = [&](int y) {
            return y >= 0 && y < gps_->dimy &&
                static_cast<unsigned char>(context_rows[y][left + 1]) == 26;
        };
        const bool inverted = !arrow_at(guide_y - 2);
        int first = inverted ? guide_y + 2 : guide_y - 2;
        int last = first;
        if (!arrow_at(first)) continue;
        if (inverted) {
            while (last - first < 14 && arrow_at(last + 1)) ++last;
        } else {
            while (last - first < 14 && arrow_at(first - 1)) --first;
        }
        const int list_top = inverted ? guide_y - 1 : first - 1;
        const int list_bottom = inverted ? last + 1 : guide_y + 1;
        if (list_top < 0 || list_bottom >= gps_->dimy) continue;
        const auto &signature_row = context_rows[list_bottom];
        const size_t signature = signature_row.find("DFHack", left + 29);
        if (signature == std::string::npos || signature > static_cast<size_t>(left + 39))
            continue;
        const int right = static_cast<int>(signature) + 7;
        if (right >= gps_->dimx) continue;
        // The arrow, guide and signature identify the card together. Confirm
        // a shortcut suffix too, allowing DFHack's unbound launcher fallback.
        bool has_binding = false;
        for (int y = first; y <= last; ++y) {
            const std::string field = trim(context_rows[y].substr(left + 3, right - left - 3));
            const size_t space = field.rfind(' ');
            if (field == "gui/launcher") has_binding = true;
            if (space == std::string::npos) continue;
            std::string key = field.substr(space + 1);
            // DFHack spells modifiers Ctrl-Shift-D; the shared native key
            // parser uses Ctrl+Shift+D. Normalize only this temporary probe.
            std::replace(key.begin(), key.end(), '-', '+');
            has_binding = has_binding || is_keybinding_code(key);
        }
        if (!has_binding) continue;
        dfhack_hotkeys_regions.push_back(
            {left, list_top, right - left + 1, list_bottom - list_top + 1});
        const std::string guide_source = "Quickstart guide";
        if ((only_y < 0 || only_y == guide_y) &&
            screen_rows[guide_y].compare(guide_at, guide_source.size(), guide_source) == 0) {
            if (const auto target = exact_literal_translation("DFHack hotkeys hint: " + guide_source)) {
                Match guide{static_cast<int>(guide_at), guide_y,
                    static_cast<int>(guide_source.size()), kDfhackHotkeysHintRule, *target, guide_source};
                guide.layout_x = static_cast<int>(guide_at);
                guide.layout_length = right - guide.layout_x;
                guide.layout_left = true;
                guide.layout_clip_right = right;
                dfhack_hotkeys_matches.push_back(std::move(guide));
            }
        }
        int help_top = list_bottom + 1, help_bottom = -1;
        const auto blank_or_border = [&](int y) {
            const auto &row = context_rows[y];
            for (int x = left + 1; x < right; ++x)
                if (row[x] != ' ' && !is_cp437_box_separator(row, x)) return false;
            return true;
        };
        if (inverted) {
            help_bottom = list_top - 1;
            if (help_bottom < 2 ||
                context_rows[help_bottom].compare(signature, 6, "DFHack") != 0) continue;
            help_top = help_bottom - 1;
            while (help_top >= 0 && !blank_or_border(help_top))
                --help_top;
            if (help_top < 0) continue;
        } else {
            for (int y = help_top + 2; y < gps_->dimy; ++y) {
                if (context_rows[y].compare(signature, 6, "DFHack") == 0) {
                    help_bottom = y;
                    break;
                }
                // WrappedLabel has no blank rows inside its short summary.
                if (blank_or_border(y - 1))
                    break;
            }
        }
        if (help_bottom <= help_top + 1) continue;
        dfhack_hotkeys_regions.push_back(
            {left, help_top, right - left + 1, help_bottom - help_top + 1});
        std::vector<Match> rows;
        std::string source;
        bool intact = true;
        for (int y = help_top + 1; y < help_bottom; ++y) {
            const std::string field = context_rows[y].substr(left + 1, right - left - 1);
            const size_t at = field.find_first_not_of(' ');
            if (at == std::string::npos) { intact = false; break; }
            const std::string text = trim(field.substr(at));
            const int x = left + 1 + static_cast<int>(at);
            if (screen_rows[y].compare(x, text.size(), text) != 0) intact = false;
            if (!source.empty()) source += ' ';
            source += text;
            rows.push_back({x, y, static_cast<int>(text.size()), kDfhackHotkeysHintRule, {}, text});
        }
        if (!intact || rows.empty()) continue;
        const auto target = exact_literal_translation("DFHack hotkeys hint: " + source);
        if (!target) continue;
        const int tile_w = gps_->tile_pixel_x, tile_h = gps_->tile_pixel_y;
        const int origin_x = (gps_->screen_pixel_x - gps_->dimx * tile_w) / 2;
        const int origin_y = (gps_->screen_pixel_y - gps_->dimy * tile_h) / 2;
        rows.front().layout_native_clip = SDL_Rect{
            origin_x + (left + 1) * tile_w, origin_y + (help_top + 1) * tile_h,
            (right - left - 1) * tile_w, (help_bottom - help_top - 1) * tile_h};
        append_bounded_paragraph(std::move(rows), *target, screen_rows,
            dfhack_hotkeys_matches, only_y, right, right, {}, false, left + 1);
    }
    // Reservation emits no command or signature matches, preserving native
    // glyphs and colors during both immediate suppression and final layout.
    for (const SDL_Rect &owned : dfhack_hotkeys_regions)
        for (int y = owned.y; y < owned.y + owned.h; ++y)
            std::fill_n(screen_rows[y].begin() + owned.x, owned.w, ' ');
}
