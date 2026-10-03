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
    append_main_menu_credits_rows(context, rows, matches, only_y);
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

void Overlay::append_main_menu_credits_rows(const std::vector<std::string> &context,
        std::vector<std::string> &rows, std::vector<Match> &matches, int only_y) const {
    const auto classic = native_ui_classic();
    if (!classic) return;
    struct FooterRow { int x, y, kind; std::string source; };
    std::vector<FooterRow> footer;
    std::array<int, 4> first{{-1, -1, -1, -1}};
    // Classic has four footer records; graphics keeps version and copyright.
    // Capture both physical halves so even the untranslated version moves.
    for (int y = std::max(0, gps_->dimy - 12); y < gps_->dimy; ++y) {
        const auto &row = context[y];
        const size_t x = row.find_first_not_of(' ');
        if (x == std::string::npos || x > 2) continue;
        const std::string source(trim_view(std::string_view(row).substr(x)));
        int kind = -1;
        if (source == "A Bay 12 Games Production") kind = 0;
        else if (source.size() > 1 && source[0] == 'v' &&
                source[1] >= '0' && source[1] <= '9' &&
                std::all_of(source.begin() + 1, source.end(), [](char ch) {
                    return (ch >= '0' && ch <= '9') || ch == '.';
                })) kind = 1;
        else if (source.starts_with("Copyright (C) ") &&
                source.ends_with("Bay 12 Games")) kind = 2;
        else if (source == "Dwarf Fortress uses FMOD by Firelight Technologies") kind = 3;
        if (kind < 0) continue;
        if (!*classic && kind != 1 && kind != 2) continue;
        if (first[kind] < 0) first[kind] = y;
        footer.push_back({static_cast<int>(x), y, kind, source});
    }
    if (!(first[1] >= 0 && first[1] < first[2])) return;
    if (*classic && !(first[0] >= 0 && first[0] < first[1] &&
            first[2] < first[3])) return;
    for (const auto &row : footer) {
        if (rows[row.y].compare(row.x, row.source.size(), row.source) != 0) continue;
        auto target = exact_literal_translation(row.source);
        if (!target && row.kind == 2) {
            for (int index : candidate_template_rules(row.source)) {
                const Rule &candidate = rules_[static_cast<size_t>(index)];
                if (!candidate.numeric_template || candidate.string_template) continue;
                size_t end = 0;
                std::vector<std::string> captures;
                if (match_template(candidate, row.source, 0, &end, &captures) &&
                        end == row.source.size()) {
                    target = fill_template(candidate, captures, &capture_translations_);
                    break;
                }
            }
        }
        Match match{row.x, row.y, static_cast<int>(row.source.size()),
            kMainMenuCreditsRule, target ? *target : native_text_to_utf8(row.source), row.source};
        match.layout_x = row.x;
        match.layout_length = gps_->dimx - row.x;
        match.layout_left = true;
        if (only_y < 0 || only_y == row.y) matches.push_back(std::move(match));
        std::fill_n(rows[row.y].begin() + row.x, row.source.size(), ' ');
    }
}

void Overlay::layout_main_menu_credits_rows() {
    if (!gps_ || gps_->tile_pixel_y <= 0) return;
    Match *production = nullptr, *version = nullptr, *copyright = nullptr, *fmod = nullptr;
    const auto baseline = [](const Match &match) {
        return match.native_split_text ? match.native_split_top_y
            : match.layout_y >= 0 ? match.layout_y : match.y;
    };
    const auto pixel_offset = [this](const Match &match) {
        return match.native_split_text ? gps_->tile_pixel_y / 2 : match.layout_pixel_y;
    };
    for (Match &match : prepared_matches_) {
        if (match.rule != kMainMenuCreditsRule || match.native_split_duplicate ||
                match.target.empty()) continue;
        Match **record = match.source == "A Bay 12 Games Production" ? &production
            : match.source.starts_with("v") ? &version
            : match.source.starts_with("Copyright (C) ") ? &copyright
            : match.source.starts_with("Dwarf Fortress uses FMOD") ? &fmod : nullptr;
        if (record && (!*record || baseline(match) < baseline(**record))) *record = &match;
    }
    if (!version || !copyright) return;
    const Match &first = production ? *production : *version;
    const Match &second = production ? *version : *copyright;
    const Match &last = fmod ? *fmod : *copyright;
    const int advance = (baseline(second) - baseline(first)) * gps_->tile_pixel_y +
        pixel_offset(second) - pixel_offset(first);
    if (advance <= 0) return;
    // Keep source ownership at the old coordinates. Only the translated
    // baselines move, leaving the former bottom line for the credit.
    Match credit{last.x, last.y, 0, kMainMenuCreditsRule,
        "Byayoi同人社区汉化~", {}};
    credit.layout_x = first.x;
    credit.layout_y = baseline(last);
    credit.layout_pixel_y = pixel_offset(last);
    credit.layout_length = gps_->dimx - credit.layout_x;
    credit.layout_left = true;
    credit.layout_fixed_baseline = true;
    const SDL_Rect viewport{0, 0, gps_->screen_pixel_x, gps_->screen_pixel_y};
    credit.layout_native_clip = viewport;
    credit.layout_reflowed_paragraph = true;
    for (Match &match : prepared_matches_) {
        if (match.rule != kMainMenuCreditsRule || match.native_split_duplicate) continue;
        match.layout_y = baseline(match);
        match.layout_pixel_y = pixel_offset(match) - advance;
        match.layout_fixed_baseline = true;
        // A source writer's old one-row clip must not cut off the moved text.
        match.layout_native_clip = viewport;
        match.layout_reflowed_paragraph = true;
    }
    prepared_matches_.push_back(std::move(credit));
}

void Overlay::note_main_menu_developer_copy(SDL_Renderer *renderer,
        SDL_Texture *texture, const SDL_Rect &dest) {
    if (!renderer || !texture || !gps_) return;
    // DEVELOPER, DEVELOPER_SMALL and DEVELOPER_TINY are live cached_texturest
    // entries. Both native ABIs store the texture pointer at 8 and variant at 16.
    for (int slot : {7, 8, 9}) {
        const auto *cached = reinterpret_cast<const unsigned char *>(&gps_->tex[slot]);
        SDL_Texture *developer = nullptr;
        std::memcpy(&developer, cached + 8, sizeof(developer));
        if (cached[16] != 0 || developer != texture) continue;
        main_menu_developer_rect_ = dest;
        main_menu_developer_renderer_ = renderer;
        main_menu_developer_target_ = SDL_GetRenderTarget(renderer);
        main_menu_developer_epoch_ = draw_epoch_;
        break;
    }
}

void Overlay::draw_main_menu_branding(SDL_Renderer *renderer) {
    const auto classic = native_ui_classic();
    if (!gps_ || !classic ||
            !std::any_of(prepared_matches_.begin(), prepared_matches_.end(), [](const Match &match) {
                return match.rule == kMainMenuCreditsRule &&
                    match.source.starts_with("Copyright (C) ");
            })) return;
    Uint8 old_r = 0, old_g = 0, old_b = 0, old_a = 0;
    SDL_BlendMode old_blend = SDL_BLENDMODE_NONE;
    SDL_GetRenderDrawColor(renderer, &old_r, &old_g, &old_b, &old_a);
    SDL_GetRenderDrawBlendMode(renderer, &old_blend);
    SDL_SetRenderDrawBlendMode(renderer, SDL_BLENDMODE_NONE);
    const int tile_w = gps_->tile_pixel_x, tile_h = gps_->tile_pixel_y;
    const int origin_x = (gps_->screen_pixel_x - tile_w * gps_->dimx) / 2;
    const int origin_y = (gps_->screen_pixel_y - tile_h * gps_->dimy) / 2;
    SDL_SetRenderDrawColor(renderer, 0, 0, 0, 255);
    // A mode switch can present the completed footer after the old glyphs
    // were already copied. Clear every original physical span before any
    // relocated line is painted, including the suppressed half-font duplicates.
    if (*classic) {
        for (const Match &match : prepared_matches_) {
            if (match.rule != kMainMenuCreditsRule || match.length <= 0) continue;
            const int source_y = match.native_split_text ? match.native_split_top_y : match.y;
            const SDL_Rect source{origin_x + match.x * tile_w,
                origin_y + source_y * tile_h, match.length * tile_w,
                (match.native_split_text ? 2 : 1) * tile_h};
            SDL_RenderFillRect(renderer, &source);
        }
    }
    // Keep each relocated footer line readable over the illustrated background
    // and remove any earlier translated ink before this frame's text is drawn.
    for (const Match &match : prepared_matches_) {
        if (match.rule != kMainMenuCreditsRule || match.native_split_duplicate ||
                match.target.empty()) continue;
        auto *glyph = get_glyph_texture(renderer, match.target,
            gps_->screen_pixel_x, tile_h);
        if (!glyph) continue;
        const SDL_Rect line{origin_x + match.layout_x * tile_w,
            origin_y + match.layout_y * tile_h + match.layout_pixel_y,
            glyph->width + 2 * config_.horizontal_padding, tile_h};
        SDL_RenderFillRect(renderer, &line);
    }
    if (!*classic && main_menu_developer_epoch_ == composite_read_epoch_ &&
            main_menu_developer_renderer_ == renderer &&
            main_menu_developer_target_ == SDL_GetRenderTarget(renderer)) {
        const SDL_Rect &logo = main_menu_developer_rect_;
        // Bay12's label occupies the bottom 32 of its 144-pixel small logo.
        // Use an integer cell scale and align both badges along that bottom edge.
        const int label_height = std::max(1, static_cast<int>(std::lround(logo.h * 32.0 / 144)));
        const int art_height = logo.h - label_height;
        const int cell_size = std::max(1, static_cast<int>(std::lround(
            static_cast<double>(art_height) / byayoi_sprite::height)));
        const int width = byayoi_sprite::width * cell_size;
        const int left = logo.x + logo.w + std::max(1, label_height / 2);
        const int top = logo.y + art_height - byayoi_sprite::height * cell_size;
        const int sprite_x = left + (logo.w - width) / 2;
        for (int y = 0; y < byayoi_sprite::height; ++y) {
            for (int x = 0; x < byayoi_sprite::width; ++x) {
                const auto &color = byayoi_sprite::palette[byayoi_sprite::pixels[y][x]];
                if (!color.a) continue;
                SDL_SetRenderDrawColor(renderer, color.r, color.g, color.b, color.a);
                const SDL_Rect cell{sprite_x + x * cell_size, top + y * cell_size,
                    cell_size, cell_size};
                SDL_RenderFillRect(renderer, &cell);
            }
        }
        const SDL_Rect label{left, logo.y + art_height, logo.w, label_height};
        SDL_SetRenderDrawColor(renderer, 0, 174, 220, 255);
        SDL_RenderFillRect(renderer, &label);
        if (auto *glyph = get_glyph_texture(renderer, "byayoi同人社区",
                gps_->screen_pixel_x, tile_h); glyph && glyph->width > 0 && glyph->height > 0) {
            const int padding = std::max(1, label_height / 8);
            const double scale = std::min(
                static_cast<double>(std::max(1, label.w - padding * 2)) / glyph->width,
                static_cast<double>(std::max(1, label.h - padding * 2)) / glyph->height);
            const int text_x = label.x + (label.w - static_cast<int>(std::lround(glyph->width * scale))) / 2;
            const int text_y = label.y + (label.h - static_cast<int>(std::lround(glyph->height * scale))) / 2;
            for (const auto &tile : glyph->tiles) {
                SDL_SetTextureColorMod(tile.texture, 255, 255, 255);
                SDL_SetTextureAlphaMod(tile.texture, 255);
                const int x = static_cast<int>(std::lround(tile.bounds.x * scale));
                const int y = static_cast<int>(std::lround(tile.bounds.y * scale));
                const SDL_Rect dst{text_x + x, text_y + y,
                    std::max(1, static_cast<int>(std::lround((tile.bounds.x + tile.bounds.w) * scale)) - x),
                    std::max(1, static_cast<int>(std::lround((tile.bounds.y + tile.bounds.h) * scale)) - y)};
                SDL_RenderCopy(renderer, tile.texture, nullptr, &dst);
            }
        }
    }
    SDL_SetRenderDrawColor(renderer, old_r, old_g, old_b, old_a);
    SDL_SetRenderDrawBlendMode(renderer, old_blend);
}
