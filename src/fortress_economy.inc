// Own complete economic fields before generic dictionary/name matching can
// split them into separately centred words. All targets come from the TSV.
void Overlay::append_fortress_economy_matches(std::vector<std::string> &rows,
        std::vector<Match> &matches, int only_y, bool raw_layer) const {
    if (raw_layer) {
        // Use this frame's composite as context, but suppress only equal
        // source bytes on the raw layer. Never erase unrelated map cells.
        std::vector<std::string> context(rows.size(), std::string(gps_->dimx, ' '));
        for (int y = 0; y < gps_->dimy; ++y)
            for (int x = 0; x < gps_->dimx; ++x) {
                const unsigned char ch = visible_char_at(x, y);
                context[y][x] = ch ? ch : ' ';
            }
        std::vector<Match> panel;
        append_fortress_economy_matches(context, panel, -1);
        if (!panel.empty()) {
            for (const Match &span : panel) {
                if (only_y >= 0 && only_y != span.y) continue;
                int cursor = 0;
                while (cursor < span.length) {
                    while (cursor < span.length &&
                        rows[span.y][span.x + cursor] != span.source[cursor]) ++cursor;
                    const int start = cursor;
                    while (cursor < span.length &&
                        rows[span.y][span.x + cursor] == span.source[cursor]) ++cursor;
                    if (start == cursor) continue;
                    matches.push_back({span.x + start, span.y, cursor - start,
                        kFortressEconomyRule, {}, span.source.substr(start, cursor - start)});
                    std::fill_n(rows[span.y].begin() + span.x + start, cursor - start, ' ');
                }
            }
            return;
        }
        // An intact raw panel may still supply complete fields when the
        // composite is incomplete; prepare_frame promotes that group.
    }

    constexpr std::string_view heading = "Created Wealth:";
    constexpr std::string_view trade = "Trade Information:";
    constexpr std::string_view broker = "You need a broker with";
    constexpr std::string_view skill = "the appraisal skill.";
    constexpr std::string_view bookkeeper = "A bookkeeper helps";
    constexpr std::string_view broker_sentence =
        "You need a broker with the appraisal skill.";
    constexpr std::string_view bookkeeper_sentence =
        "A bookkeeper helps with accuracy.";
    constexpr std::array<std::string_view, 7> categories{{
        "Weapons:", "Armor and Garb:", "Furniture:", "Other Objects:",
        "Architecture:", "Displayed:", "Held/Worn:",
    }};
    auto at = [&](int x, int y, std::string_view text) {
        return x >= 0 && y >= 0 && y < gps_->dimy &&
            x + static_cast<int>(text.size()) <= gps_->dimx &&
            rows[y].compare(x, text.size(), text) == 0 &&
            has_word_boundaries(rows[y], x, x + text.size());
    };
    for (int top = 0; top < gps_->dimy; ++top) {
        const size_t position = rows[top].find(heading);
        if (position == std::string::npos) continue;
        const int left = static_cast<int>(position);
        if (!at(left, top, heading)) continue;
        // Relative native field positions, never screenshot coordinates.
        // Require the complete branch, not just a generic wealth label.
        const bool no_appraisal = at(left, top + 2, broker) &&
            at(left, top + 3, skill) && at(left, top + 5, bookkeeper) &&
            at(left, top + 6, trade) && at(left, top + 8, broker) &&
            at(left, top + 9, skill);
        const bool appraisal = at(left, top + 9, "Imported Wealth:") &&
            at(left, top + 11, "Exported Wealth:") && [&] {
                for (size_t i = 0; i < categories.size(); ++i)
                    if (!at(left + 1, top + 1 + static_cast<int>(i), categories[i]))
                        return false;
                return true;
            }();
        if (!no_appraisal && !appraisal) continue;

        std::vector<Match> panel;
        bool translated = true;
        auto field = [&](int x, int y, std::string_view source,
                         std::string_view full_source, int display_y) {
            std::string target;
            if (!full_source.empty()) {
                const auto value = exact_literal_translation(full_source);
                if (!value || value->empty()) { translated = false; return; }
                target = *value;
            }
            Match match{x, y, static_cast<int>(source.size()),
                kFortressEconomyRule, std::move(target), std::string(source)};
            match.layout_x = x;
            match.layout_y = display_y;
            match.layout_left = true;
            bool top_layer = false;
            const auto *cell = cell_at(x, y, &top_layer);
            if (cell && cell[0] == static_cast<unsigned char>(source.front()))
                match.layout_foreground_rgb = (cell[1] << 16) | (cell[2] << 8) | cell[3];
            panel.push_back(std::move(match));
        };
        field(left, top, heading, heading, top);
        if (no_appraisal) {
            for (int offset : {2, 8}) {
                field(left, top + offset, broker, broker_sentence, top + offset);
                field(left, top + offset + 1, skill, {}, top + offset);
            }
            // Native 53.16 draws "with accuracy." at y=11, then overwrites
            // that row with "Trade Information:" (native call sites
            // 0x16a2473 and 0x16a24cd). The full branch above identifies the
            // lost clause, not an arbitrary incomplete paragraph. Draw the
            // reviewed whole sentence between the two blocks, on one row.
            field(left, top + 5, bookkeeper, bookkeeper_sentence, top + 4);
            field(left, top + 6, trade, trade, top + 6);
        } else {
            for (size_t i = 0; i < categories.size(); ++i) {
                const int y = top + 1 + static_cast<int>(i);
                field(left + 1, y, categories[i], categories[i], y);
            }
            field(left, top + 9, "Imported Wealth:", "Imported Wealth:", top + 9);
            field(left, top + 11, "Exported Wealth:", "Exported Wealth:", top + 11);
        }
        if (!translated) continue;
        // The owning panel supplies available width. The row fitter stops
        // at the separate numeric/currency field; English label ends do not
        // establish the allocation of either column.
        int right = -1;
        const int tile_w = gps_->tile_pixel_x;
        if (tile_w > 0) {
            // These newly captured fields do not yet have a column clip.
            const SDL_Rect region = native_text_draw_region(panel.front());
            const bool viewport_only = region.x == 0 && region.y == 0 &&
                region.w == gps_->screen_pixel_x && region.h == gps_->screen_pixel_y;
            if (!viewport_only && region.w > 0 && region.h > 0) {
                const int origin_x = (gps_->screen_pixel_x - gps_->dimx * tile_w) / 2;
                right = (region.x + region.w - origin_x) / tile_w;
            }
        }
        for (Match &match : panel) {
            if (right > match.layout_x) {
                match.layout_length = right - match.layout_x;
                match.layout_clip_right = right;
            }
            std::fill_n(rows[match.y].begin() + match.x, match.length, ' ');
            if (only_y < 0 || only_y == match.y) matches.push_back(std::move(match));
        }
        return;
    }
}

void Overlay::layout_fortress_economy(SDL_Renderer *renderer) {
    if (!gps_ || !face_ || !renderer ||
        gps_->tile_pixel_x <= 0 || gps_->tile_pixel_y <= 0) return;
    std::vector<Match *> fields;
    for (Match &match : prepared_matches_)
        if (match.rule == kFortressEconomyRule && !match.target.empty()) fields.push_back(&match);
    if (fields.empty()) return;
    for (Match *field : fields) {
        if (field->layout_clip_right > field->layout_x)
            layout_fortress_text_rows(renderer, {{field}}, field->layout_x,
                field->layout_clip_right);
        else {
            // Missing native geometry is resolved by the common renderer;
            // a source string length must not become a replacement frame.
            field->layout_font_pixels = unified_font_pixels();
            field->layout_lock_font_pixels = true;
        }
    }
}
