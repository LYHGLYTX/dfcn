// Labor -> Work animals draws one identity beside each portrait, then paints
// Recenter/Inspect over the caption's right edge. Own that whole field before
// literal words can split a name, purpose, species and sex into separate runs.
void Overlay::append_character_work_animal_rows(std::vector<std::string> &rows,
        std::vector<Match> &matches, int only_y) const {
    if (!gps_ || gps_->dimx <= 0 || gps_->dimy <= 0 ||
        rows.size() != static_cast<size_t>(gps_->dimy)) return;
    std::vector<std::string> context(gps_->dimy);
    const auto read_row = [&](int y) -> const std::string & {
        auto &row = context[y];
        if (row.empty()) {
            row.assign(gps_->dimx, ' ');
            for (int x = 0; x < gps_->dimx; ++x) {
                bool top = false;
                const auto *cell = cell_at(x, y, &top);
                if (cell && cell[0]) row[x] = cell[0];
            }
        }
        return row;
    };
    for (int tabs_y = 0; tabs_y < gps_->dimy; ++tabs_y) {
        const auto main = character_information_tab_fields(read_row(tabs_y));
        if (main.size() != 6 || main.back().text != "Labor") continue;
        // The character's outer frame is independent of this scrolling list:
        // tabs and header text can overwrite its sides. The complete Labor
        // band and each record's own portrait/actions establish ownership.
        int animals_y = -1;
        for (int y = tabs_y + 1; y < gps_->dimy; ++y) {
            const auto &row = read_row(y);
            size_t cursor = 0;
            int active = -1, inactive = -1;
            bool band = true;
            for (const std::string_view caption : {
                    "Work details", "Workshops", "Locations", "Work animals"}) {
                size_t at = row.find(caption, cursor);
                if (at == std::string::npos && caption == "Work details")
                    at = row.find("Work Details", cursor);
                if (at == std::string::npos || at + caption.size() >
                        static_cast<size_t>(gps_->dimx) ||
                    !(has_word_boundaries(row, at, at + caption.size()) ||
                      is_ascii_tab_caption(row, at, at + caption.size()))) {
                    band = false;
                    break;
                }
                bool top = false;
                const auto *cell = cell_at(static_cast<int>(at), y, &top);
                if (!cell) { band = false; break; }
                const int color = (cell[1] << 16) | (cell[2] << 8) | cell[3];
                if (caption == "Work animals") active = color;
                else if (inactive < 0) inactive = color;
                else if (inactive != color) { band = false; break; }
                cursor = at + caption.size();
            }
            if (band && active >= 0 && inactive >= 0 && active != inactive) {
                animals_y = y;
                break;
            }
        }
        if (animals_y < 0) continue;
        const auto captures = captured_clipped_captions();
        const std::array draws{captured_native_drawn_text_rows(false),
            captured_native_drawn_text_rows(true)};
        for (int middle = animals_y + 2; middle + 1 < gps_->dimy; ++middle) {
            for (int picture = 0; picture + 5 < gps_->dimx; ++picture) {
                const int left = native_picture_box_right(*gps_, picture, middle);
                if (left != picture + 5) continue;
                // PE 53.16 0x175a30..0x17630f draws a five-cell portrait,
                // then its caption two cells after the portrait's right edge.
                // Recenter and Inspect are adjacent three-cell controls. The
                // fourth-cell assignment action follows one blank column.
                // These controls overwrite a longer underlying rectangle;
                // that rectangle's surviving cap is not the caption boundary.
                int right = -1;
                for (int x = left + 3; x + 11 < gps_->dimx; ++x)
                    if (native_square_button_at(*gps_, x, middle,
                            native_texture_button_stocks_recenter(*gps_)) &&
                        native_square_button_at(*gps_, x + 3, middle,
                            native_texture_button_stocks_view_item(*gps_))) {
                        right = x;
                        break;
                    }
                if (right <= left) continue;
                const SDL_Rect box{left + 2, middle - 1, right - left - 2, 3};
                for (int y = middle - 1; y <= middle + 1; ++y) {
                    if (only_y >= 0 && y != only_y) continue;
                    const auto &row = read_row(y);
                    int first = box.x, end = right;
                    while (first < end && row[first] == ' ') ++first;
                    while (end > first && row[end - 1] == ' ') --end;
                    if (end <= first) continue;
                    bool text = false, valid = true;
                    for (int x = first; x < end; ++x) {
                        const unsigned char ch = row[x];
                        if (is_cp437_box_separator(row, x) ||
                            (ch < ' ' && ch != 0x0b && ch != 0x0c)) { valid = false; break; }
                        text = text || (ch >= 'A' && ch <= 'Z') ||
                            (ch >= 'a' && ch <= 'z') || ch >= 0x80;
                    }
                    if (!valid || !text) continue;
                    const std::string visible = row.substr(first, end - first);
                    if (rows[y].compare(first, end - first, visible) != 0) continue;
                    bool top = false;
                    (void)cell_at(first, y, &top);
                    const auto *flags = top ? gps_->screentexpos_top_flag : gps_->screentexpos_flag;
                    const auto half = flags ? flags[static_cast<size_t>(first) * gps_->dimy + y]
                        & ((1u << 3) | (1u << 4)) : 0u;
                    const int mate = half == (1u << 3) ? y + 1 : half == (1u << 4) ? y - 1 : -1;
                    const auto same_row = [&](int draw_y) {
                        if (draw_y == y) return true;
                        if (draw_y != mate || mate < 0 || mate >= gps_->dimy) return false;
                        bool mate_top = false;
                        (void)cell_at(first, mate, &mate_top);
                        const auto other = flags && mate_top == top
                            ? flags[static_cast<size_t>(first) * gps_->dimy + mate]
                                & ((1u << 3) | (1u << 4)) : 0u;
                        return other == (half == (1u << 3) ? (1u << 4) : (1u << 3)) &&
                            read_row(mate).compare(first, visible.size(), visible) == 0;
                    };
                    const auto current_source = [&](int x, int draw_y, std::string_view source) {
                        if (x != first || !same_row(draw_y)) return false;
                        source = source.substr(0, static_cast<size_t>(right - first));
                        while (!source.empty() && source.back() == ' ') source.remove_suffix(1);
                        return source == visible;
                    };
                    std::string source = visible;
                    bool recovered = false;
                    for (const auto &capture : captures)
                        if (current_source(capture.x, capture.y, capture.visible)) {
                            source = capture.complete;
                            recovered = true;
                            break;
                        }
                    if (!recovered)
                        for (const auto &draw : draws[top ? 1 : 0])
                            if (draw.caption_source && current_source(draw.x, draw.y, draw.source)) {
                                source = draw.complete_source.empty() ? draw.source : draw.complete_source;
                                break;
                            }
                    auto target = translate_creature_label(source);
                    if (!target) target = translate_unit_identity(source, true);
                    // A separately drawn sex glyph can be outside this slot.
                    // Accept its separator only after the preceding complete
                    // identity resolves; never guess a clipped name or caste.
                    if (!target && source.ends_with(',')) {
                        target = translate_unit_identity(
                            trim_view(std::string_view(source).substr(0, source.size() - 1)), true);
                        if (target) *target += "，";
                    }
                    Match match{first, y, end - first, kCharacterWorkAnimalRowRule,
                        target ? *target : native_text_to_utf8(source), visible};
                    match.native_hover_untranslated = !target;
                    if (!target) match.native_help_review_source = source;
                    match.native_picture_caption_box = box;
                    match.layout_x = box.x;
                    match.layout_length = box.w;
                    match.layout_clip_right = right;
                    match.layout_left = true;
                    matches.push_back(std::move(match));
                    std::fill(rows[y].begin() + first, rows[y].begin() + end, ' ');
                }
                break;
            }
        }
        return;
    }
}

void Overlay::layout_character_work_animal_rows(SDL_Renderer *renderer) {
    if (!renderer || !face_ || !gps_ || gps_->tile_pixel_x <= 0 || gps_->tile_pixel_y <= 0) return;
    for (Match &match : prepared_matches_) {
        if (match.rule != kCharacterWorkAnimalRowRule || !match.native_picture_caption_box ||
            match.native_split_duplicate || match.target.empty()) continue;
        const auto &box = *match.native_picture_caption_box;
        layout_fortress_picture_caption(renderer, {&match}, box.x, box.x + box.w);
    }
}
