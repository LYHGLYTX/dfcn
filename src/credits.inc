// The About dialog contains authored records from data/credits.txt, not
// procedural names or a paragraph assembled from unrelated English spans.
// Resolve its current frame on every scan; no screen/scroll-position cache.
void Overlay::append_credits_rows(std::vector<std::string> &rows,
        std::vector<Match> &matches, int only_y) const {
    std::vector<std::string> context(gps_->dimy, std::string(gps_->dimx, ' '));
    for (int y = 0; y < gps_->dimy; ++y)
        for (int x = 0; x < gps_->dimx; ++x) {
            const unsigned char ch = visible_char_at(x, y);
            if (ch) context[y][x] = static_cast<char>(ch);
        }
    constexpr std::string_view fmod = "This Version of DF uses FMOD Studio";
    constexpr std::string_view sdl = "This version of DF uses SDL:";
    constexpr std::string_view license = "See the SDL folder for license information.";
    const NativePanelBorders borders(*gps_);
    for (int anchor_y = 0; anchor_y < gps_->dimy; ++anchor_y) {
        const size_t at = context[anchor_y].find(fmod);
        if (at == std::string::npos) continue;
        const auto panel = native_panel_interior(borders, *gps_, static_cast<int>(at),
            static_cast<int>(at + fmod.size()), anchor_y);
        if (!panel) continue;
        const int right = panel->x + panel->w, bottom = panel->y + panel->h;
        int license_y = -1;
        bool have_sdl = false, have_copyright = false;
        std::optional<SDL_Rect> done;
        for (int y = panel->y; y < bottom; ++y) {
            const auto line = std::string_view(context[y]).substr(panel->x, panel->w);
            have_sdl |= line.find(sdl) != std::string_view::npos;
            have_copyright |= line.find("Copyright (C) ") != std::string_view::npos;
            if (line.find(license) != std::string_view::npos) license_y = y;
            for (const auto &field : split_text_fields(context[y])) {
                if (field.text != "Done" || field.start < panel->x || field.end > right)
                    continue;
                const auto button = native_intro_button_text_rect(*gps_,
                    field.start, field.end, y);
                if (button && button->x >= panel->x && button->x + button->w <= right &&
                    button->y >= panel->y && button->y + button->h <= bottom)
                    done = button;
            }
        }
        if (!have_sdl || !have_copyright || license_y < anchor_y || !done) continue;
        const int left = static_cast<int>(at);
        int list_right = right - 1;
        for (const auto &bar : native_vertical_scrollbar_spans(*gps_, *panel))
            if (bar.y > license_y) list_right = std::min(list_right, bar.x - 1);
        if (list_right <= left) continue;

        const auto claim = [&](int x, int y, int end, int rule,
                int box_left, int box_right, bool centered) {
            // Trim only padding from the physical span. A trailing CR must
            // remain owned, otherwise its CP437 music-note glyph survives.
            while (x < end && context[y][x] == ' ') ++x;
            while (end > x && context[y][end - 1] == ' ') --end;
            if (x >= end || box_right <= box_left) return;
            const std::string source = context[y].substr(x, end - x);
            if (rows[y].compare(x, source.size(), source) != 0) return;
            std::string text = source;
            while (!text.empty() && (text.back() == '\r' || text.back() == ' '))
                text.pop_back();
            auto translated = exact_literal_translation("Credits: " + text);
            // Roles and thanks reuse the established complete UI strings.
            // Unknown contributors remain whole; never feed them to the
            // procedural-name/word grammar (e.g. Bowman -> bow + man).
            if (!translated && rule != kCreditsTextRule && !text.empty())
                translated = exact_literal_translation(text);
            if (!translated && rule != kCreditsTextRule && !text.empty()) {
                // Copyright years use the ordinary indexed numeric templates,
                // not TOML/name composition or a second year-format grammar.
                for (int index : candidate_template_rules(text)) {
                    const Rule &candidate = rules_[static_cast<size_t>(index)];
                    if (!candidate.numeric_template || candidate.string_template) continue;
                    size_t end = 0;
                    std::vector<std::string> captures;
                    if (match_template(candidate, text, 0, &end, &captures) && end == text.size()) {
                        translated = fill_template(candidate, captures, &capture_translations_);
                        break;
                    }
                }
            }
            Match match{x, y, end - x, rule,
                translated ? *translated : native_text_to_utf8(text), source};
            match.native_hover_untranslated = !translated && !text.empty();
            match.layout_x = box_left;
            match.layout_length = box_right - box_left;
            match.layout_clip_right = box_right;
            match.layout_left = !centered;
            if (only_y < 0 || only_y == y) matches.push_back(std::move(match));
            std::fill_n(rows[y].begin() + x, source.size(), ' ');
        };
        for (int y = panel->y; y < bottom; ++y) {
            const bool button_row = y >= done->y && y < done->y + done->h;
            const int text_right = button_row ? std::min(right - 1, done->x - 1)
                : y > license_y ? list_right : right - 1;
            const bool title = y < anchor_y;
            claim(panel->x, y, text_right,
                title ? kCreditsTitleRule : y <= license_y ? kCreditsLegalRule : kCreditsTextRule,
                left, text_right, title);
            // Classic nine-slice borders are real CP437 bytes. Only the
            // caption belongs to translation, never the top/bottom edges.
            if (button_row && trim_view(std::string_view(context[y]).substr(
                    done->x, done->w)) == "Done")
                claim(done->x, y, done->x + done->w, kCreditsDoneRule,
                    done->x, done->x + done->w, true);
        }
        return;
    }
}

void Overlay::layout_credits_rows(SDL_Renderer *renderer) {
    if (!gps_ || !face_ || !renderer || gps_->tile_pixel_x <= 0 ||
        gps_->tile_pixel_y <= 0) return;
    // Each group uses the shared measured-row renderer. Header/legal text
    // cannot shrink the contributors, and English lengths never set centres.
    // Half-font rows were normalized before detaching these records from
    // generic page/paragraph layout; retain their original baseline and color.
    for (int rule : {kCreditsTextRule, kCreditsLegalRule, kCreditsTitleRule, kCreditsDoneRule}) {
        std::vector<std::vector<Match *>> group;
        int left = 0, right = gps_->dimx;
        for (Match &match : prepared_matches_) {
            if (match.rule != rule || match.target.empty() || match.native_split_duplicate) continue;
            left = std::max(left, match.layout_x);
            right = std::min(right, match.layout_x + match.layout_length);
            group.push_back({&match});
        }
        if (!group.empty() && left < right)
            layout_fortress_text_rows(renderer, group, left, right, true, true);
    }
}
