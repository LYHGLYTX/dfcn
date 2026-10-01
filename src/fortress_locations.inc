// A location's complete labels must precede UI-message matching: the Dance
// action otherwise consumes the first word of "Dance floor in common area:".
// Keep quantities and coloured status values separate from dictionary labels.
void Overlay::append_fortress_location_matches(std::vector<std::string> &rows,
        std::vector<Match> &matches, int only_y, bool raw_layer) const {
    if (!gps_ || rows.size() != static_cast<size_t>(gps_->dimy)) return;
    auto context = rows;
    if (raw_layer) {
        for (int y = 0; y < gps_->dimy; ++y)
            for (int x = 0; x < gps_->dimx; ++x) {
                const auto ch = visible_char_at(x, y);
                context[y][x] = ch ? static_cast<char>(ch) : ' ';
            }
    }
    const NativePanelBorders borders(*gps_);
    std::optional<SDL_Rect> panel;
    constexpr std::string_view rooms = "Rented rooms (Total):";
    constexpr std::string_view goblets = "Goblets (Desired):";
    for (int y = 1; y + 1 < gps_->dimy && !panel; ++y) {
        const auto x = context[y].find(rooms);
        if (x == std::string::npos) continue;
        const auto frame = native_panel_interior(borders, *gps_,
            static_cast<int>(x), static_cast<int>(x + rooms.size()), y);
        if (!frame) continue;
        // Both labels must belong to this same closed panel. A tooltip or a
        // map label elsewhere on screen cannot establish a location page.
        for (int row = frame->y; row < frame->y + frame->h; ++row) {
            const auto at = context[row].find(goblets, frame->x);
            if (at != std::string::npos && at + goblets.size() <=
                    static_cast<size_t>(frame->x + frame->w)) {
                panel = frame;
                break;
            }
        }
    }
    if (!panel) return;
    const int right = panel->x + panel->w;
    const int bottom = panel->y + panel->h;
    auto append = [&](int x, int y, int length, int rule, const std::string &target) {
        if (target.empty() || length <= 0) return;
        const auto source = context[y].substr(x, length);
        if (rows[y].compare(x, length, source) == 0) {
            if (only_y < 0 || only_y == y)
                matches.push_back({x, y, length, rule, target, source});
            std::fill_n(rows[y].begin() + x, length, ' ');
        } else if (raw_layer) {
            // A coloured caption can span layers. Suppress only matching
            // physical bytes; the composite pass owns the complete overlay.
            for (int offset = 0; offset < length;) {
                while (offset < length && rows[y][x + offset] != source[offset]) ++offset;
                const int start = offset;
                while (offset < length && rows[y][x + offset] == source[offset]) ++offset;
                if (offset == start) continue;
                if (only_y < 0 || only_y == y)
                    matches.push_back({x + start, y, offset - start, rule, {},
                        source.substr(start, offset - start)});
                std::fill_n(rows[y].begin() + x + start, offset - start, ' ');
            }
        }
    };
    int first_fact_y = bottom;
    for (int y = panel->y; y < bottom; ++y) {
        for (const std::string_view label : {"Chests in common area:",
                "Goblets (Desired):", "Stored Instruments (Desired):",
                "Dance floor in common area:", "Rented rooms (Total):"}) {
            const auto at = context[y].find(label, panel->x);
            if (at == std::string::npos || at + label.size() > static_cast<size_t>(right) ||
                !has_word_boundaries(context[y], at, at + label.size())) continue;
            const auto target = exact_literal_translation(std::string(label));
            if (!target || target->empty()) continue;
            first_fact_y = std::min(first_fact_y, y);
            append(static_cast<int>(at), y, static_cast<int>(label.size()),
                kFortressLocationLabelRule, *target);
            int start = static_cast<int>(at + label.size());
            while (start < right && context[y][start] == ' ') ++start;
            int end = start;
            std::string value;
            if (start + 4 <= right && context[y].compare(start, 4, "None") == 0 &&
                has_word_boundaries(context[y], start, start + 4)) {
                const auto translated = exact_literal_translation("None");
                if (translated) { value = *translated; end += 4; }
            } else if (start < right && context[y][start] >= '0' && context[y][start] <= '9') {
                // Native quantities include current (desired), and the dance
                // floor can show dimensions. Stop before any other field.
                while (end < right &&
                    std::string_view("0123456789 ()xX,<>/").find(context[y][end]) !=
                        std::string_view::npos) ++end;
                while (end > start && context[y][end - 1] == ' ') --end;
                value = context[y].substr(start, end - start);
            }
            append(start, y, end - start, kFortressLocationValueRule, value);
        }
    }
    for (int y = panel->y; y < bottom; ++y) {
        for (const auto &field : split_text_fields(context[y])) {
            if (field.start < panel->x || field.end > right) continue;
            const bool heading = field.text == "Tavern" && y < first_fact_y;
            const bool caption = heading || field.text == "Tavern Keeper" ||
                field.text == "Tavern keeper" || field.text == "Performer" ||
                field.text == "All visitors welcome" || field.text == "Citizens only";
            if (!caption) continue;
            const auto target = exact_literal_translation(field.text);
            if (target) append(field.start, y, field.end - field.start,
                kFortressLocationTextRule, *target);
            if (!heading) continue;
            // The location name and type share the native header column.
            // Recognize the whole previous name field, retaining its normal
            // procedural-name translation and the two original header rows.
            for (int name_y = std::max(panel->y, y - 2); name_y < y; ++name_y) {
                for (const auto &name : split_text_fields(context[name_y])) {
                    if (name.start != field.start || name.end > right || name.text == "Tavern")
                        continue;
                    const auto translated = translate_procedural_fragment(name.text);
                    if (translated) append(name.start, name_y, name.end - name.start,
                        kFortressLocationTextRule, *translated);
                }
            }
        }
    }
}

void Overlay::layout_fortress_location(SDL_Renderer *renderer) {
    if (!gps_ || !renderer || !face_ ||
        gps_->tile_pixel_x <= 0 || gps_->tile_pixel_y <= 0) return;
    const NativePanelBorders borders(*gps_);
    const auto layout_caption = [&](Match &match) {
        auto region = native_button_text_rect(*gps_, match.x,
            match.x + match.length, match.y);
        if (!region) region = native_panel_interior(borders, *gps_,
            match.x, match.x + match.length, match.y);
        if (region) {
            layout_fortress_text_rows(renderer, {{&match}}, match.x,
                region->x + region->w, true);
        } else {
            // Keep the native origin until the draw recovers its control;
            // a short English title must not become the Chinese text budget.
            match.layout_x = match.x;
            match.layout_left = true;
            match.layout_font_pixels = unified_font_pixels();
            match.layout_lock_font_pixels = true;
            match.layout_visual_height_pixels = 0;
            match.layout_line_height_pixels = gps_->tile_pixel_y;
        }
    };
    std::vector<Match *> labels, moving;
    for (Match &match : prepared_matches_) {
        if (match.target.empty() || match.native_split_duplicate) continue;
        if (match.rule == kFortressLocationLabelRule) labels.push_back(&match);
        if (match.rule == kFortressLocationLabelRule || match.rule == kFortressLocationValueRule)
            moving.push_back(&match);
        if (match.rule == kFortressLocationTextRule) layout_caption(match);
    }
    const auto display_y = [](const Match &match) {
        return match.native_split_text ? match.native_split_top_y : match.y;
    };
    // The left facts share a label/value table; rented rooms is a separate
    // field on the dance-floor row. Group native label starts, allowing the
    // one-cell inset used by the desired-quantity controls.
    std::sort(labels.begin(), labels.end(), [](const Match *a, const Match *b) {
        return a->x < b->x;
    });
    for (size_t begin = 0; begin < labels.size();) {
        size_t end = begin + 1;
        const int left = labels[begin]->x;
        while (end < labels.size() && labels[end]->x <= left + 1) ++end;
        std::vector<std::vector<Match *>> label_rows, value_rows;
        int right = left, label_width = 0;
        const int pixels = std::clamp(static_cast<int>(gps_->tile_pixel_y * config_.font_scale),
            1, gps_->tile_pixel_y);
        for (size_t i = begin; i < end; ++i) {
            Match *label = labels[i];
            label_rows.push_back({label});
            right = std::max(right, label->x + label->length);
            const auto *glyph = get_glyph_texture(renderer, label->target,
                gps_->screen_pixel_x, gps_->tile_pixel_y, pixels, 0, true);
            if (!glyph || !glyph->texture) return;
            label_width = std::max(label_width,
                (label->x - left) * gps_->tile_pixel_x + glyph->width);
            int field_right = gps_->dimx;
            for (const Match *other : labels)
                if (display_y(*other) == display_y(*label) && other->x > label->x)
                    field_right = std::min(field_right, other->x);
            Match *value = nullptr;
            for (Match *field : moving) {
                if (field->rule == kFortressLocationValueRule &&
                    display_y(*field) == display_y(*label) && field->x >= label->x + label->length &&
                    field->x + field->length <= field_right &&
                    (!value || field->x < value->x)) value = field;
            }
            if (value) {
                value_rows.push_back({value});
                right = std::max(right, value->x + value->length);
            }
            // PE 53.16 draws the desired-quantity controls with these three
            // complete main-button skins. Their left edge owns the text
            // budget even when a current/desired count gains more digits.
            if (label->source == "Goblets (Desired):" ||
                label->source == "Stored Instruments (Desired):") {
                for (int x = label->x + label->length; x + 12 <= gps_->dimx; ++x) {
                    bool found = false;
                    for (int y = display_y(*label); y <= display_y(*label) + 1; ++y) {
                        if (native_main_button_at(*gps_, x, y, 299) &&
                            native_main_button_at(*gps_, x + 4, y, 300) &&
                            native_main_button_at(*gps_, x + 8, y, 301)) {
                            right = std::max(right, x - 1);
                            found = true;
                            break;
                        }
                    }
                    if (found) break;
                }
            }
        }
        if (end < labels.size()) right = std::min(right, labels[end]->x - 1);
        const int value_left = left + (label_width + 2 * config_.horizontal_padding +
            gps_->tile_pixel_x - 1) / gps_->tile_pixel_x + 1;
        if (!value_rows.empty() && value_left < right) {
            // Quantity controls start inside their frame, one cell after the
            // unframed facts. Share the value column without pulling those
            // captions back onto the left border. Measure each actual inset,
            // then keep the smallest fitted font common to the whole column.
            int label_pixels = pixels;
            for (const auto &row : label_rows) {
                layout_fortress_text_rows(renderer, {row}, row.front()->x,
                    value_left - 1, true, false, moving);
                if (row.front()->layout_font_pixels > 0)
                    label_pixels = std::min(label_pixels, row.front()->layout_font_pixels);
            }
            for (const auto &row : label_rows)
                if (row.front()->layout_font_pixels > 0)
                    row.front()->layout_font_pixels = label_pixels;
            layout_fortress_text_rows(renderer, value_rows, value_left, right, true, false, moving);
        } else {
            for (const auto &row : label_rows)
                layout_caption(*row.front());
        }
        begin = end;
    }
}
