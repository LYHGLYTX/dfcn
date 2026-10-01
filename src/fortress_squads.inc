// The squad list owns three consecutive fields: its name, current order and
// routine. In particular, "Raid <site>" is an order, not a person's name.
void Overlay::append_fortress_squad_rows(std::vector<std::string> &rows,
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
    struct Control { SDL_Rect box; int y; };
    std::vector<Control> controls;
    for (int y = 0; y < gps_->dimy; ++y) {
        for (const auto &field : split_text_fields(context[y])) {
            if (field.text != "Create new squad") continue;
            if (const auto box = native_button_text_rect(*gps_, field.start, field.end, y))
                controls.push_back({*box, y});
        }
    }
    if (controls.empty()) return;

    const NativePanelBorders borders(*gps_);
    const auto clipped = captured_clipped_captions();
    for (int y = 2; y < gps_->dimy; ++y) {
        for (const auto &routine : split_text_fields(context[y])) {
            if (!routine.text.starts_with("Routine:")) continue;
            std::array<LogicalTextField, 3> fields;
            fields[2] = routine;
            for (int row = 0; row < 2; ++row) {
                for (const auto &field : split_text_fields(context[y - 2 + row]))
                    if (field.start == routine.start) { fields[row] = field; break; }
            }
            if (fields[0].text.empty() || fields[1].text.empty()) continue;
            const int right = std::max({fields[0].end, fields[1].end, routine.end});
            // Include all three rows so a classic button cannot supply the
            // outer frame. The separate creation control proves this list.
            const auto panel = native_panel_interior(borders, *gps_,
                SDL_Rect{routine.start, y - 2, right - routine.start, 3});
            if (!panel || std::none_of(controls.begin(), controls.end(),
                    [&](const Control &control) {
                        return control.y > y && control.box.x >= panel->x &&
                            control.box.x + control.box.w <= panel->x + panel->w &&
                            control.box.y >= panel->y &&
                            control.box.y + control.box.h <= panel->y + panel->h;
                    })) continue;
            for (int row = 0; row < 3; ++row) {
                const int field_y = y - 2 + row;
                if (only_y >= 0 && only_y != field_y) continue;
                const auto &field = fields[row];
                const int length = field.end - field.start;
                std::string complete = field.text;
                for (const auto &capture : clipped)
                    if (capture.x == field.start && capture.y == field_y &&
                            capture.visible == field.text) {
                        complete = capture.complete;
                        break;
                    }
                auto target = exact_literal_translation(complete);
                if (!target && row == 0) target = translate_legends_name(complete, false);
                if (!target && row == 1) target = translate_world_mission_title(complete);
                if (!target && row == 1) target = translate_fortress_activity(complete);
                if (!target && row == 2) {
                    const auto label = exact_literal_translation("Routine:");
                    const auto value = trim_view(std::string_view(complete).substr(8));
                    const auto translated = exact_literal_translation(value);
                    if (label) target = *label + (translated ? *translated : native_text_to_utf8(value));
                }
                if (rows[field_y].compare(field.start, length, field.text) == 0) {
                    Match match{field.start, field_y, length, kFortressSquadRowRule,
                        target ? *target : native_text_to_utf8(complete), field.text};
                    match.native_hover_untranslated = !target;
                    if (!target) match.native_help_review_source = complete;
                    match.layout_x = routine.start;
                    match.layout_length = panel->x + panel->w - routine.start;
                    match.layout_clip_right = panel->x + panel->w;
                    match.layout_left = true;
                    matches.push_back(std::move(match));
                    std::fill_n(rows[field_y].begin() + field.start, length, ' ');
                } else if (raw_layer) {
                    // The composite owns a field spanning native layers;
                    // each raw layer suppresses only its matching bytes.
                    for (int offset = 0; offset < length;) {
                        while (offset < length && rows[field_y][field.start + offset] != field.text[offset]) ++offset;
                        const int start = offset;
                        while (offset < length && rows[field_y][field.start + offset] == field.text[offset]) ++offset;
                        if (offset == start) continue;
                        matches.push_back({field.start + start, field_y, offset - start,
                            kFortressSquadRowRule, {}, field.text.substr(start, offset - start)});
                        std::fill_n(rows[field_y].begin() + field.start + start, offset - start, ' ');
                    }
                }
            }
        }
    }
}

void Overlay::layout_fortress_squads(SDL_Renderer *renderer) {
    if (!gps_ || !renderer || !face_ ||
        gps_->tile_pixel_x <= 0 || gps_->tile_pixel_y <= 0) return;
    std::map<std::pair<int, int>, std::vector<std::vector<Match *>>> columns;
    for (Match &match : prepared_matches_) {
        if (match.rule != kFortressSquadRowRule || match.target.empty() ||
                match.native_split_duplicate || match.layout_clip_right <= match.layout_x) continue;
        match.layout_right = false;
        columns[{match.layout_x, match.layout_clip_right}].push_back({&match});
    }
    for (auto &[bounds, rows] : columns)
        layout_fortress_text_rows(renderer, rows, bounds.first, bounds.second, true);

    // The member page has one name beside each portrait and selection box,
    // not the three-line squad/order/routine records above. Keep the native
    // name column even when its formatter supplies a much longer identity.
    if (std::none_of(prepared_matches_.begin(), prepared_matches_.end(),
            [](const Match &match) {
                return match.source == "Back to squads" && !match.native_split_duplicate;
            })) return;
    const NativePanelBorders borders(*gps_);
    const bool classic = native_ui_classic().value_or(false);
    const auto &buttons = native_texture_button_main(*gps_);
    for (const Match &back : prepared_matches_) {
        if (back.source != "Back to squads" || back.native_split_duplicate) continue;
        const auto control = native_button_text_rect(*gps_, back.x,
            back.x + back.length, back.y);
        if (!control) continue;
        // All three control rows must fit inside the enclosing panel; its
        // own classic border is not the member list's outer frame.
        const auto panel = native_panel_interior(borders, *gps_, *control);
        if (!panel) continue;
        const int panel_right = panel->x + panel->w;
        const int panel_bottom = panel->y + panel->h;
        struct Member { Match *match; int right; };
        std::vector<Member> members;
        int text_left = panel_right, portrait_right = -1;
        for (Match &name : prepared_matches_) {
            if (name.rule != kCreatureNameRule || name.target.empty() ||
                name.native_split_duplicate || name.legends_flow ||
                name.x < panel->x || name.x + name.length > panel_right ||
                name.y < control->y + control->h || name.y >= panel_bottom) continue;
            const int top = name.native_split_text ? name.native_split_top_y : name.y;
            int checkbox = -1, middle = -1;
            // A graphical caption can occupy either half of the same
            // native row. The complete 4x3 control establishes its record.
            for (int y = top; y <= top + 1 && checkbox < 0; ++y) {
                if (y - 1 < control->y + control->h || y + 1 >= panel_bottom) continue;
                for (int x = name.x + name.length; x + 4 <= panel_right; ++x) {
                    if (native_main_button_skin_at(*gps_, x, y,
                            buttons[INTERFACE_BUTTON_MAIN_SQUADS_SELECTED], classic) ||
                        native_main_button_skin_at(*gps_, x, y,
                            buttons[INTERFACE_BUTTON_MAIN_SQUADS_NOT_SELECTED], classic)) {
                        checkbox = x;
                        middle = y;
                        break;
                    }
                }
            }
            if (checkbox < 0) continue;
            const int right = checkbox - 4 >= name.x &&
                native_main_button_skin_at(*gps_, checkbox - 4, middle,
                    buttons[INTERFACE_BUTTON_MAIN_SQUADS_CANCEL_ORDER], classic)
                ? checkbox - 4 : checkbox;
            if (name.x + name.length > right) continue;
            text_left = std::min(text_left, name.x);
            for (int y = middle - 1; y <= middle + 1; ++y)
                for (int x = panel->x; x < right; ++x)
                    if (native_foreground_picture_at(*gps_, x, y))
                        portrait_right = std::max(portrait_right, x + 1);
            members.push_back({&name, right});
        }
        if (portrait_right >= 0) text_left = std::max(text_left, portrait_right + 1);
        for (const Member &member : members) {
            if (text_left >= member.right) continue;
            Match &name = *member.match;
            name.layout_x = text_left;
            name.layout_length = member.right - text_left;
            name.layout_box_pixel_x = -1;
            name.layout_box_pixel_width = 0;
            name.layout_left = true;
            name.layout_right = false;
            name.layout_y = name.y;
            name.layout_pixel_y = 0;
            name.layout_fixed_baseline = false;
            name.layout_font_pixels = unified_font_pixels();
            name.layout_lock_font_pixels = true;
            name.layout_visual_height_pixels = 0;
            name.layout_line_height_pixels = gps_->tile_pixel_y;
            name.layout_ellipsize = true;
        }
    }
}
