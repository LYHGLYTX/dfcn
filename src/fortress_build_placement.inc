// Material selection is a label/value header and a name/count/distance table.
// The item rows reuse the build menu's picture skin, NOT its single-caption
// contract. Keep the current native origins and existing dictionary targets.
void Overlay::layout_fortress_build_materials(SDL_Renderer *renderer) {
    if (!gps_ || !face_ || !renderer ||
        gps_->tile_pixel_x <= 0 || gps_->tile_pixel_y <= 0) return;
    const NativePanelBorders borders(*gps_);
    const auto blank = [](unsigned char ch) { return ch == 0 || ch == ' '; };
    const auto current_field = [&](const Match &match) {
        if (match.target.empty() || match.native_split_duplicate || match.legends_flow ||
            match.x < 0 || match.x >= gps_->dimx || match.y < 0 || match.y >= gps_->dimy ||
            match.length <= 0 || match.length > gps_->dimx - match.x ||
            match.source.size() != static_cast<size_t>(match.length)) return false;
        const bool fold_case = match.rule >= 0 && static_cast<size_t>(match.rule) < rules_.size() &&
            rules_[static_cast<size_t>(match.rule)].case_insensitive;
        std::string visible;
        for (int x = match.x; x < match.x + match.length; ++x)
            visible.push_back(visible_char_at(x, match.y));
        return template_literal_at(visible, 0, match.source, fold_case);
    };
    for (Match &field : prepared_matches_) {
        if (field.rule < 0 || static_cast<size_t>(field.rule) >= rules_.size()) continue;
        const Rule &rule = rules_[static_cast<size_t>(field.rule)];
        if (!rule.numeric_template ||
            (rule.source != "Amount needed: {d}" && rule.source != "Dist: {d}") ||
            !current_field(field)) continue;

        const int end = field.x + field.length;
        int right = -1;
        auto button = native_button_text_span(*gps_, field.x, end, field.y);
        if (rule.source == "Dist: {d}") {
            // Material rows join the picture's right edge directly to the
            // caption fill, without a separate rectangle left cap. Read the
            // complete picture/caption frame in both UI modes, including the
            // decrement control painted over its right end. The generic
            // button reader requires a cap that this material row no longer has.
            if (const auto caption = native_picture_caption_rect(
                    *gps_, field.x, field.y, false, nullptr, false, nullptr, false, true);
                    caption && caption->x <= field.x && end <= caption->x + caption->w)
                button = {{caption->x, caption->x + caption->w}};
        }
        if (button) right = button->second;
        else if (const auto panel = native_panel_interior(borders, *gps_, field.x, end, field.y))
            right = panel->x + panel->w;
        // The fixed-font fitter stops at any following visible field. When
        // the frame is unavailable, the common renderer resolves ownership;
        // the English source span cannot stand in for the control's width.
        if (right > field.x)
            layout_fortress_text_rows(renderer, {{&field}}, field.x, right);
        if (rule.source != "Dist: {d}" || !button) continue;

        // The current closed item strip bounds the name on the left. Read
        // native column boundaries before considering translation coverage:
        // a selected amount such as 2/3 is an independent, untranslated field.
        // Including it in name_end would reject the complete name and leave
        // that row centered in its English span instead of aligned here.
        int left = button->first;
        while (left < field.x && blank(visible_char_at(left, field.y))) ++left;
        std::string native;
        for (int x = left; x < field.x; ++x) {
            const auto ch = visible_char_at(x, field.y);
            native.push_back(ch ? static_cast<char>(ch) : ' ');
        }
        const auto columns = split_text_fields(native);
        if (columns.empty() || columns.front().start != 0) continue;
        const int name_end = left + columns.front().end;
        const int next_column = columns.size() > 1
            ? left + columns[1].start : field.x;
        std::vector<Match *> parts;
        bool complete = true;
        for (Match &part : prepared_matches_) {
            if (part.y != field.y || part.native_split_duplicate ||
                part.x >= name_end || part.x + part.length <= left) continue;
            if (part.x < left || part.x + part.length > name_end || !current_field(part)) {
                complete = false;
                break;
            }
            parts.push_back(&part);
        }
        std::sort(parts.begin(), parts.end(), [](const Match *a, const Match *b) {
            return a->x < b->x;
        });
        int cursor = left;
        for (const Match *part : parts) {
            // Do not move text across untranslated suffixes, extra columns
            // or overlapping matches. Keep each source mask/color intact.
            const int gap = part->x - cursor;
            if (gap < 0 || gap > 1) { complete = false; break; }
            while (cursor < part->x && blank(visible_char_at(cursor, field.y))) ++cursor;
            if (cursor != part->x) { complete = false; break; }
            cursor += part->length;
        }
        if (!complete || parts.empty() || cursor != name_end) continue;
        // Retain an explicit gutter even when a long translated item needs
        // ellipsizing. The selected amount retains its native glyphs and
        // position; the distance is fitted separately. Neither is appended
        // to, hidden by, or recolored as part of the item name.
        const int name_right = std::max(name_end, next_column - 1);
        layout_fortress_text_rows(renderer, {parts}, left, name_right);
    }
}

// Machine totals are whole numeric fields. Native layout can pad their words
// and colon independently; retain those physical cells while reading the
// existing complete dictionary template, before generic Power/name matches.
void Overlay::append_fortress_machine_power_rows(std::vector<std::string> &rows,
        std::vector<Match> &matches, int only_y) const {
    static constexpr std::string_view sources[] = {
        "Total Power: {d}", "Total Power Needed: {d}",
    };
    std::vector<std::pair<int, int>> power_fields;
    for (const auto source : sources) {
        const auto entry = history_semantic_templates_.find(std::string(source));
        if (entry == history_semantic_templates_.end()) continue;
        const Rule &rule = rules_[static_cast<size_t>(entry->second)];
        if (!rule.numeric_template || rule.template_kinds.size() != 1 ||
            rule.template_kinds.front() != 'd' || rule.template_literals.size() != 2 ||
            !rule.template_literals.back().empty()) continue;
        for (int y = 0; y < static_cast<int>(rows.size()); ++y) {
            auto &row = rows[y];
            for (size_t start = row.find("Total"); start != std::string::npos;
                    start = row.find("Total", start + 1)) {
                const auto prefix_end = catalog_literal_end(
                    row, start, rule.template_literals.front(), rule.case_insensitive);
                if (!prefix_end) continue;
                size_t number = *prefix_end;
                while (number < row.size() && row[number] == ' ') ++number;
                size_t end = number;
                while (end < row.size() && row[end] >= '0' && row[end] <= '9') ++end;
                if (end == number || !has_word_boundaries(row, start, end)) continue;
                power_fields.emplace_back(static_cast<int>(start), y);
                if (only_y >= 0 && only_y != y) continue;
                const std::string target = translate_template_captures(
                    rule, {row.substr(number, end - number)});
                if (target.empty()) continue;
                Match match{static_cast<int>(start), y, static_cast<int>(end - start),
                    entry->second, target, row.substr(start, end - start)};
                match.layout_x = static_cast<int>(start);
                match.layout_left = true;
                matches.push_back(std::move(match));
                std::fill(row.begin() + start, row.begin() + end, ' ');
            }
        }
    }
    // The operation/foundation states sit immediately above/below the two
    // totals in the same column. Own those complete UI fields before any
    // name recovery, including both physical halves of a tall native font.
    // Scan anchors even for a single-row suppression call, so it recognizes
    // the same state as the full-frame pass.
    for (const auto &[left, power_y] : power_fields) {
        for (int y = std::max(0, power_y - 2);
                y <= std::min(static_cast<int>(rows.size()) - 1, power_y + 2); ++y) {
            if (only_y >= 0 && only_y != y) continue;
            auto &row = rows[y];
            for (const auto &field : split_text_fields(row)) {
                if (field.start != left ||
                    (field.text != "Active" && field.text != "Inactive" &&
                     field.text != "Hanging" && field.text != "Stable Foundation")) continue;
                int node = 0;
                for (const unsigned char ch : field.text) {
                    const auto next = trie_[node].next.find(ch);
                    if (next == trie_[node].next.end()) { node = -1; break; }
                    node = next->second;
                }
                if (node < 0 || trie_[node].rule < 0) continue;
                const int index = trie_[node].rule;
                const Rule &rule = rules_[static_cast<size_t>(index)];
                if (rule.target.empty()) continue;
                Match state{left, y, field.end - left, index, rule.target, field.text};
                state.layout_x = left;
                state.layout_left = true;
                matches.push_back(std::move(state));
                std::fill(row.begin() + left, row.begin() + field.end, ' ');
            }
        }
    }
}

// The inspected building's progress and actions are independent whole fields,
// not prose or build-menu picture captions. Keep the native insets: the status
// begins at the panel edge and buttons have their own text padding. Every
// translation comes from the dictionary, including progress-state variants.
void Overlay::layout_fortress_building_status(SDL_Renderer *renderer) {
    if (!gps_ || !face_ || !renderer ||
        gps_->tile_pixel_x <= 0 || gps_->tile_pixel_y <= 0) return;
    const NativePanelBorders borders(*gps_);
    static constexpr std::string_view statuses[] = {
        "waiting for construction...", "construction initiated.",
        "partially constructed.", "construction nearly done.",
        "construction suspended.", "construction inactive.",
        "slated for removal", "removal suspended.", "removal inactive.",
        "nest box claimed by", "nest box unclaimed",
        "outdoor access", "no outdoor access",
        "ready to be split", "not ready to be split", "too many hives",
        "* output restricted", "* no output",
        "* requires wild colony or", "* existing hive",
        "* destroys colony", "* requires a jug", "* saves colony for split",
        "active", "inactive", "hanging", "stable foundation",
        "pumps from the north", "pumps from the east",
        "pumps from the south", "pumps from the west",
    };
    static constexpr std::string_view actions[] = {
        "suspend construction", "resume construction", "cancel construction",
        "remove building", "cancel removal",
        "install colony when ready", "do not install colony",
        "gather any products", "do not gather products",
        "start pump manually", "stop pumping manually",
    };
    for (Match &match : prepared_matches_) {
        if (match.rule < 0 || static_cast<size_t>(match.rule) >= rules_.size() ||
            match.target.empty() || match.native_split_duplicate || match.legends_flow ||
            match.x < 0 || match.x >= gps_->dimx || match.y < 0 || match.y >= gps_->dimy ||
            match.length <= 0 || match.length > gps_->dimx - match.x ||
            match.source.size() != static_cast<size_t>(match.length)) continue;
        const std::string source = lower(trim(match.source));
        const Rule &rule = rules_[static_cast<size_t>(match.rule)];
        const bool power = rule.source == "Total Power: {d}" ||
            rule.source == "Total Power Needed: {d}";
        const bool action = std::find(std::begin(actions), std::end(actions), source)
            != std::end(actions);
        if (!power && !action && std::find(std::begin(statuses), std::end(statuses), source)
                == std::end(statuses)) continue;

        // Recovered metadata cannot claim a hidden or already changed field.
        // Keep the matched span and half-text ownership for glyph suppression.
        std::string visible;
        for (int x = match.x; x < match.x + match.length; ++x)
            visible.push_back(visible_char_at(x, match.y));
        if (!template_literal_at(visible, 0, match.source,
                rules_[static_cast<size_t>(match.rule)].case_insensitive)) continue;

        std::vector<std::vector<Match *>> rows{{&match}};
        if (source == "nest box claimed by" && !match.native_split_text) {
            // The native inspection writes the claimant at the SAME x on
            // the immediately following row (53.16 addst calls at 0x13da038
            // and 0x13da0c2). It is a separate colored identity, not prose
            // continuing after "by" or an independently centered caption.
            // Use the complete existing name translation, never a particular
            // species/name or a global rule for animal-name alignment.
            auto occupant = fortress_text_row(match.x, match.y + 1);
            const bool current = !occupant.empty() &&
                std::all_of(occupant.begin(), occupant.end(), [&](const Match *part) {
                    if (part->source.size() != static_cast<size_t>(part->length)) return false;
                    std::string field;
                    for (int x = part->x; x < part->x + part->length; ++x)
                        field.push_back(visible_char_at(x, part->y));
                    const bool fold = part->rule >= 0 && static_cast<size_t>(part->rule) < rules_.size() &&
                        rules_[static_cast<size_t>(part->rule)].case_insensitive;
                    return template_literal_at(field, 0, part->source, fold);
                });
            if (current) rows.push_back(std::move(occupant));
        }

        int source_right = match.x + match.length;
        for (const auto &row : rows)
            source_right = std::max(source_right, row.back()->x + row.back()->length);
        int right = -1;
        if (action) {
            if (const auto button = native_button_text_rect(*gps_, match.x, source_right, match.y))
                right = button->x + button->w;
            else if (const auto span = native_button_text_span(*gps_, match.x, source_right, match.y))
                right = span->second;
        } else if (const auto panel = native_panel_interior(borders, *gps_, match.x,
                source_right, match.y)) {
            right = panel->x + panel->w;
        }
        // The shared fitter stops at other visible fields and clips to this
        // frame/button. No guessed screen width, background clearing, per-
        // sentence font changes, or carry-over geometry from the last state.
        // Hive hints carry their indent as leading source spaces. Those are
        // native grid columns, not proportional spaces in the Chinese font.
        // Keep each hint/status on its own row and each checkbox caption at
        // its own native inset; none is a centered title or wrapped prose.
        // Source spans (including spaces), colors and half-font baselines
        // still belong to the original match and are never moved or erased.
        const int indent = static_cast<int>(match.source.find_first_not_of(' '));
        const int left = match.x + indent;
        match.target = trim(match.target);
        match.layout_x = left;
        if (!match.native_split_text) {
            match.layout_y = match.y;
            match.layout_pixel_y = 0;
        }
        match.layout_box_pixel_x = -1;
        match.layout_box_pixel_width = 0;
        if (right > left) {
            layout_fortress_text_rows(renderer, rows, left, right);
        } else {
            for (const auto &row : rows)
                for (Match *part : row) {
                    part->layout_x = left;
                    part->layout_left = true;
                    part->layout_font_pixels = unified_font_pixels();
                    part->layout_lock_font_pixels = true;
                }
        }
    }
}

// The farm footer is three independent columns, not a paragraph. Its two
// checkbox captions and the soil hint use adjacent native text rows; the
// generic prose pass would otherwise concatenate all three columns and move
// the amount into the first row. Own each complete dictionary field before
// that pass, without moving the checkboxes or enlarging source suppression.
void Overlay::layout_fortress_farm_plot(SDL_Renderer *renderer) {
    if (!gps_ || !face_ || !renderer ||
        gps_->tile_pixel_x <= 0 || gps_->tile_pixel_y <= 0) return;
    const NativePanelBorders borders(*gps_);
    static constexpr std::string_view fields[] = {
        "Not set to fertilize", "Set to fertilize",
        "Current amount: {d}/{d}",
        "Fertilize", "every season", "Fertilize every season",
        "Poor soil", "(Cavern soil", "is best)", "(Cavern soil is best)",
    };
    for (Match &match : prepared_matches_) {
        if (match.rule < 0 || static_cast<size_t>(match.rule) >= rules_.size() ||
            match.target.empty() || match.native_split_duplicate || match.legends_flow ||
            match.x < 0 || match.x >= gps_->dimx || match.y < 0 || match.y >= gps_->dimy ||
            match.length <= 0 || match.length > gps_->dimx - match.x ||
            match.source.size() != static_cast<size_t>(match.length)) continue;
        const Rule &rule = rules_[static_cast<size_t>(match.rule)];
        if (std::find(std::begin(fields), std::end(fields), rule.source) ==
            std::end(fields)) continue;

        // Do not lay out a hidden/stale recovered field. Numeric templates
        // retain their actual native amount in match.source; targets and all
        // terminology still come from the existing translation table.
        std::string visible;
        for (int x = match.x; x < match.x + match.length; ++x)
            visible.push_back(visible_char_at(x, match.y));
        if (!template_literal_at(visible, 0, match.source, rule.case_insensitive)) continue;

        if (!match.native_split_text) {
            match.layout_y = match.y;
            match.layout_pixel_y = 0;
        }
        // The actual button or panel supplies the width; the shared layout
        // also stops at the next checkbox or visible field in that region.
        auto region = native_button_text_rect(*gps_, match.x,
            match.x + match.length, match.y);
        if (!region) region = native_panel_interior(borders, *gps_,
            match.x, match.x + match.length, match.y);
        if (region) {
            layout_fortress_text_rows(renderer, {{&match}}, match.x,
                region->x + region->w);
        } else {
            // Retain field ownership and its baseline without turning the
            // current English amount or caption into a clipping rectangle.
            match.layout_x = match.x;
            match.layout_left = true;
            match.layout_font_pixels = unified_font_pixels();
            match.layout_lock_font_pixels = true;
            match.layout_visual_height_pixels = 0;
            match.layout_line_height_pixels = gps_->tile_pixel_y;
        }
    }
}

// Placement uses plain buttons and a checkbox, not the build menu's picture
// buttons. Keep complete dictionary/template matches as native fields; never
// compose this panel from independently centred Select/after/material words.
void Overlay::layout_fortress_build_placement(SDL_Renderer *renderer) {
    if (!gps_ || !face_ || !renderer ||
        gps_->tile_pixel_x <= 0 || gps_->tile_pixel_y <= 0) return;

    const NativePanelBorders borders(*gps_);
    const int tile_w = gps_->tile_pixel_x, tile_h = gps_->tile_pixel_y;
    const int origin_x = (gps_->screen_pixel_x - gps_->dimx * tile_w) / 2;
    const auto blank = [](unsigned char ch) { return ch == 0 || ch == ' '; };
    const auto current_field = [&](const Match &match) {
        if (match.target.empty() || match.native_split_duplicate || match.legends_flow ||
            match.x < 0 || match.x >= gps_->dimx || match.y < 0 || match.y >= gps_->dimy ||
            match.length <= 0 || match.length > gps_->dimx - match.x ||
            match.source.size() != static_cast<size_t>(match.length)) return false;
        const bool fold_case = match.rule >= 0 && static_cast<size_t>(match.rule) < rules_.size() &&
            rules_[static_cast<size_t>(match.rule)].case_insensitive;
        std::string visible;
        for (int x = match.x; x < match.x + match.length; ++x)
            visible.push_back(visible_char_at(x, match.y));
        return template_literal_at(visible, 0, match.source, fold_case);
    };
    // All native placement outcomes share the status field. Translations
    // remain in the dictionary, including the established Disconnected term.
    static constexpr std::string_view statuses[] = {
        "disconnected", "need trigger type", "needs walkable perimeter",
        "needs to be anchored on edge", "blocked at this location",
        "hidden, cannot build at this location",
        "surrounded by empty space", "needs adjacent wall", "needs open space",
        "off map", "water at this location", "lava/magma at this location",
        "building present", "must remove construction", "must be inside",
        "too close to edge", "must be outside", "cannot build at highest level",
        "need soil or mud at location", "need soil at location",
        "needs ground or near machine", "no mud/soil for farm", "mud is left by water",
    };
    struct Field {
        Match *match;
        int right;
        std::optional<SDL_Rect> button;
        bool material_requirement;
    };
    std::vector<Field> fields;
    bool has_placement_control = false;
    for (Match &match : prepared_matches_) {
        if (match.rule < 0 || static_cast<size_t>(match.rule) >= rules_.size()) continue;
        const std::string source = lower(match.source);
        const bool button = source == "select material after placement" ||
            source == "select material at placement" ||
            source == "use closest material" || source == "use last material";
        const bool control = button || source == "keep building after placement" ||
            (source.starts_with("click a tile to place the ") && source.ends_with('.'));
        const std::string &rule_source = rules_[static_cast<size_t>(match.rule)].source;
        const bool material_requirement = rule_source == "Needs {s}" ||
            rule_source == "No access to {s}";
        // The stair span is a numeric field on its own native row, not a
        // continuation to merge into the placement heading or material button.
        const bool level_span = rule_source == "(spans {d} levels)";
        if (!control && !material_requirement && !level_span &&
            std::find(std::begin(statuses), std::end(statuses), source) ==
                std::end(statuses)) continue;

        // Page recovery and half-font normalization may have retained hidden
        // metadata. Only the CURRENT visible bytes may own a placement field.
        if (!current_field(match)) continue;
        has_placement_control |= control;

        // Only the live panel or button establishes a text allocation. A
        // source endpoint remains useful for finding neighbours, not clipping.
        const int source_right = match.x + match.length;
        int right = -1;
        if (const auto panel = native_panel_interior(borders, *gps_,
                match.x, source_right, match.y)) {
            const int limit = panel->x + panel->w;
            right = source_right;
            while (right < limit) {
                const unsigned char ch = visible_char_at(right, match.y);
                if (ch && ch != ' ') break;
                ++right;
            }
        }
        std::optional<SDL_Rect> button_box;
        if (button) {
            button_box = native_button_text_rect(*gps_, match.x,
                match.x + match.length, match.y);
            if (button_box) {
                right = button_box->x + button_box->w;
            } else if (const auto rect = native_caption_button_rect(match)) {
                const int button_right = (rect->x + rect->w - origin_x) / tile_w;
                if (button_right >= match.x + match.length)
                    right = right > match.x ? std::min(right, button_right) : button_right;
            }
        }
        fields.push_back({&match, right, button_box, material_requirement});
    }
    if (fields.empty()) return;

    // Placement feedback changes whenever the pointer crosses a tile. Do not
    // refit the entire panel to that frame's text: even a one-pixel change in
    // the status glyphs' ink/padding used to shrink every unchanged button.
    // Match the fixed-size fortress hover policy. Font size depends only on
    // UI scaling and font_scale, never the outcome, field count or name length.
    // draw_match's lock also prevents a second per-string raster/SDL refit.
    for (const Field &field : fields) {
        // Missing-material cards are displayed BEFORE placement is possible,
        // so they have no placement controls. Each complete Needs/No access
        // template is still an independent native record, not prose. Requiring
        // a placement button here let the multiline pass concatenate several
        // requirements/access failures at the top of the card, crossing their
        // separate guidance rows. Keep the same field fitter in both contexts;
        // unrelated short status literals still require placement controls.
        if (!has_placement_control && !field.material_requirement) continue;
        Match &match = *field.match;
        // Each field retains its native inset: heading/status, buttons and
        // checkbox text have different origins. Do not move native controls,
        // expand glyph suppression, clear their backgrounds or alter colors.
        match.layout_x = match.x;
        match.layout_y = match.y;
        match.layout_box_pixel_x = -1;
        match.layout_box_pixel_width = 0;
        match.layout_pixel_y = 0;
        if (field.right > match.x)
            layout_fortress_text_rows(renderer, {{&match}}, match.x, field.right);
        else {
            match.layout_left = true;
            match.layout_font_pixels = unified_font_pixels();
            match.layout_lock_font_pixels = true;
        }
        // draw_match retains native_split_top_y for native two-row text;
        // layout_x also keeps these independent fields out of prose reflow.
    }

    for (const Field &field : fields) {
        Match &label = *field.match;
        if (lower(label.source) != "use last material" || !field.button ||
            label.native_split_text) continue;
        const SDL_Rect &box = *field.button;
        const int right = box.x + box.w;
        std::vector<std::vector<Match *>> rows;
        bool complete = true;
        for (int y = box.y; y < box.y + box.h; ++y) {
            int first = box.x;
            while (first < right && blank(visible_char_at(first, y))) ++first;
            if (first == right) continue;
            auto row = fortress_text_row(first, y);
            if (row.empty() || std::any_of(row.begin(), row.end(), [&](const Match *part) {
                    return part->x + part->length > right || !current_field(*part);
                })) {
                complete = false;
                break;
            }
            // A whole current field is required before moving either line.
            // Do not move translated fragments away from an unknown suffix,
            // or mistake a foreground tooltip for the remembered material.
            for (int x = row.back()->x + row.back()->length; x < right; ++x)
                if (!blank(visible_char_at(x, y))) complete = false;
            if (!complete) break;
            rows.push_back(std::move(row));
        }
        if (!complete || rows.size() != 2 || rows.front().size() != 1 ||
            rows.front().front() != &label || rows.back().front()->y != label.y + 1)
            continue;

        // This native button puts its label on the middle row and its value
        // on the bottom row. Keeping those y positions crowds the lower cap;
        // centring the value in its English span also gives every material a
        // different left edge. Own the TWO-line block inside the closed skin.
        // The value may be a compositional item (negative rule), not a literal
        // UI rule. Reuse its complete translation, colors and source mask.
        const int padding_y = (box.h - static_cast<int>(rows.size())) * tile_h / 2;
        for (size_t row = 0; row < rows.size(); ++row) {
            for (Match *part : rows[row]) {
                part->layout_y = box.y + static_cast<int>(row);
                part->layout_pixel_y = padding_y;
            }
        }
        // The shared fitter records each row's pixel clip from its baseline.
        // Set the final centred positions first so the old source rows cannot
        // clip off the translated glyphs after the block moves upward.
        layout_fortress_text_rows(renderer, rows, label.x, right);
    }
}
