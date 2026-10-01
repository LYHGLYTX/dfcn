// Room status capture only needs the native character tab band. Layout must
// use the same identity, independently of which tab translations survived
// matching/half-font normalization. Otherwise the generic picture pass can
// left-align empty rooms while an occupied room's action breaks its frame
// lookup and leaves that grade centered inside its English source width.
void Overlay::layout_character_room_rows(SDL_Renderer *renderer) {
    if (!gps_ || !renderer || !face_ || gps_->tile_pixel_x <= 0 ||
        gps_->tile_pixel_y <= 0) return;

    const auto settings = native_ui_settings();
    const auto read_char = [&](int x, int y) -> unsigned char {
        if (!settings || !settings->classic) return visible_char_at(x, y);
        bool top = false;
        const auto *cell = cell_at(x, y, &top);
        return cell ? cell[0] : 0;
    };
    for (int tabs_y = 0; tabs_y < gps_->dimy; ++tabs_y) {
        std::string native(gps_->dimx, ' ');
        for (int x = 0; x < gps_->dimx; ++x) {
            const auto ch = read_char(x, tabs_y);
            native[x] = ch ? ch : ' ';
        }
        const auto tabs = character_information_tab_fields(native);
        if (tabs.size() < 5 || tabs[4].text != "Rooms") continue;

        auto frame = find_ascii_panel_frame(tabs.front().start, tabs.back().end,
            tabs_y, gps_->dimx, gps_->dimy, read_char);
        if (!frame) frame = find_graphical_character_panel_frame(*gps_,
            tabs.front().start, tabs.back().end, tabs_y);
        const auto header = frame ? frame : find_character_header_frame(*gps_,
            tabs.front().start, tabs.back().end, tabs_y, read_char);
        const int panel_left = header ? header->left + 1 : tabs.front().start;
        const int panel_right = header ? header->right : gps_->dimx;
        const int panel_bottom = frame ? frame->bottom : gps_->dimy;

        std::vector<std::vector<Match *>> rows;
        int left = panel_right;
        for (Match &match : prepared_matches_) {
            const auto source = trim_view(match.source);
            if (match.target.empty() || match.native_split_duplicate ||
                match.y <= tabs_y || match.y >= panel_bottom ||
                match.x < panel_left || match.length <= 0 ||
                match.x + match.length > panel_right ||
                !is_character_room_status(source)) continue;
            // A foreground tooltip or another native layer cannot lend its
            // status word to the room list behind it.
            const int first = match.x + static_cast<int>(source.data() - match.source.data());
            bool current = true;
            for (size_t i = 0; i < source.size(); ++i)
                if (read_char(first + static_cast<int>(i), match.y) !=
                        static_cast<unsigned char>(source[i])) {
                    current = false;
                    break;
                }
            if (!current) continue;
            rows.push_back({&match});
            left = std::min(left, first);
        }
        if (rows.empty()) continue;

        // Keep the existing action gutter. Every grade and empty-room label
        // shares the native text column, never its private English ink span.
        const int right = panel_right - 4;
        if (right <= left) continue;
        for (const auto &row : rows) {
            Match &match = *row.front();
            match.layout_box_pixel_x = -1;
            match.layout_box_pixel_width = 0;
            match.layout_right = false;
            match.layout_clip_right = right;
        }
        layout_fortress_text_rows(renderer, rows, left, right, true);
        // Preserve native y/half-font baselines and all source mask spans.
        // Only horizontal layout and the list's common font belong here.
    }
}
