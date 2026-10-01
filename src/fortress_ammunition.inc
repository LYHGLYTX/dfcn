// The ammunition picker is a column of native text buttons; the editor has
// separate name/count columns and five action buttons. Claim captions BEFORE
// generic word matching:
// material, procedural shape, type and foreign marker can otherwise become
// separately centred translations. The marker remains part of source ownership.
void Overlay::append_fortress_ammunition_choices(std::vector<std::string> &rows,
        std::vector<Match> &matches, int only_y) const {
    if (!config_.compositional_rules) return;
    const auto captures = captured_clipped_captions();
    const NativePanelBorders borders(*gps_);
    struct Caption {
        int left, end, y, button_left, button_right;
        std::string visible, source;
        std::optional<SDL_Rect> panel;
        bool ammunition_type = false;
        bool picker_column = false;
    };
    std::vector<Caption> captions;
    // Discover the current control column independently of translation
    // coverage, even when glyph suppression asks about only one grid row.
    for (int y = 0; y < gps_->dimy; ++y) {
        for (int x = 0; x < gps_->dimx; ++x) {
            // Frame glyphs cannot be ammunition text. In classic lists most
            // occupied cells are borders; do not reconstruct dozens of button
            // skins for each one. The shared separator reader preserves UTF-8
            // bytes in actual names, including CP437-valued continuations.
            if (rows[y][x] == ' ' || is_cp437_box_separator(rows[y], x)) continue;
            const auto button = native_button_text_span(*gps_, x, x + 1, y);
            if (!button) continue;
            int left = button->first, end = button->second;
            x = end; // A button owns one caption, not one match per word.
            while (left < end && rows[y][left] == ' ') ++left;
            while (end > left && rows[y][end - 1] == ' ') --end;
            if (end <= left) continue;
            bool current = true;
            for (int at = button->first; at < button->second; ++at) {
                const auto ch = visible_char_at(at, y);
                if ((ch ? ch : ' ') != static_cast<unsigned char>(rows[y][at])) {
                    current = false;
                    break;
                }
            }
            if (!current) continue; // Never claim a covered/background row.
            const std::string visible = rows[y].substr(left, end - left);
            std::string complete = visible;
            for (const auto &capture : captures)
                if (capture.x == left && capture.y == y && capture.visible == visible) {
                    complete = capture.complete;
                    break;
                }
            // Native material/type draws can contain alignment padding. It
            // is meaningful only inside this single, closed caption strip.
            std::istringstream words(complete);
            std::string source;
            for (std::string word; words >> word;) {
                if (!source.empty()) source += ' ';
                source += word;
            }
            const auto panel = native_panel_interior(borders, *gps_, left, end, y);
            const bool ammunition_type = split_ammunition_item_name(source).has_value();
            captions.push_back({left, end, y, button->first, button->second,
                visible, std::move(source), panel, ammunition_type, false});
        }
    }

    // A picker has a closed modal, its own Cancel action and a contiguous
    // column of three-row buttons with ammunition type suffixes. Include
    // EVERY native caption in that column when establishing its identity;
    // a pair of translated words elsewhere must not establish a picker.
    std::map<std::array<int, 6>, std::vector<size_t>> columns;
    for (size_t i = 0; i < captions.size(); ++i) {
        const Caption &caption = captions[i];
        if (!caption.panel) continue;
        const SDL_Rect &panel = *caption.panel;
        columns[{caption.button_left, caption.button_right,
            panel.x, panel.y, panel.w, panel.h}].push_back(i);
    }
    for (const auto &[key, column] : columns) {
        if (column.size() < 2) continue;
        const bool has_cancel = std::any_of(captions.begin(), captions.end(),
            [&](const Caption &caption) {
                return caption.panel && caption.panel->x == key[2] &&
                    caption.panel->y == key[3] && caption.panel->w == key[4] &&
                    caption.panel->h == key[5] && lower(caption.source) == "cancel" &&
                    caption.y < captions[column.front()].y;
            });
        if (!has_cancel) continue;
        bool picker = true;
        for (size_t i = 0; i < column.size(); ++i) {
            const Caption &caption = captions[column[i]];
            if (!caption.ammunition_type ||
                (i && caption.y != captions[column[i - 1]].y + 3)) {
                picker = false;
                break;
            }
        }
        if (picker)
            for (size_t i : column) captions[i].picker_column = true;
    }

    // The configured ammunition table has no button around its item name.
    // Its Add/Confirm header and ordered row controls establish ownership,
    // including a single configured entry. Keep the native name inset and
    // stop before the separate current/desired quantity, not at English ink.
    // PE 53.16 draws these at row-left + 2 / + 30 (0x140454d5e /
    // 0x140454ecb). Read the actual fields so scrolling and panel movement
    // preserve that contract without fixed screen coordinates. Assigned
    // item subrows have only Remove and retain their separate icon inset.
    for (const Caption &add : captions) {
        if (add.source != "Add ammunition") continue;
        for (const Caption &confirm : captions) {
            if (confirm.source != "Confirm" || confirm.y != add.y ||
                confirm.button_left <= add.button_right) continue;
            const auto panel = native_panel_interior(borders, *gps_, SDL_Rect{
                add.button_left, add.y - 1,
                confirm.button_right - add.button_left, 3});
            if (!panel) continue;
            const int panel_right = panel->x + panel->w;
            for (int y = add.y + 2; y < panel->y + panel->h; ++y) {
                if (only_y >= 0 && only_y != y) continue;
                constexpr std::array<std::string_view, 5> labels = {
                    "Mat", "Amt", "Combat", "Training", "Delete"};
                std::array<const Caption *, labels.size()> controls{};
                size_t next = 0;
                for (const Caption &caption : captions) {
                    if (caption.y != y || caption.button_left < panel->x ||
                        caption.button_right > panel_right ||
                        caption.source != labels[next]) continue;
                    controls[next++] = &caption;
                    if (next == labels.size()) break;
                }
                if (next != labels.size()) continue;
                const auto &row = rows[y];
                const int name_limit = controls.front()->button_left - 1;
                if (name_limit <= panel->x) continue;
                const auto fields = split_text_fields(row.substr(
                    panel->x, name_limit - panel->x));
                if (fields.size() < 2) continue;
                const auto &quantity = fields.back();
                const size_t slash = quantity.text.find('/');
                if (slash == std::string::npos || slash == 0 ||
                    slash + 1 == quantity.text.size() ||
                    !std::all_of(quantity.text.begin(), quantity.text.end(),
                        [](unsigned char ch) { return (ch >= '0' && ch <= '9') || ch == '/'; }) ||
                    quantity.text.find('/', slash + 1) != std::string::npos) continue;
                int left = panel->x, end = panel->x + quantity.start;
                while (left < end && row[left] == ' ') ++left;
                while (end > left && row[end - 1] == ' ') --end;
                if (left == end) continue;
                const std::string visible = row.substr(left, end - left);
                bool current = true;
                for (int at = left; at < end; ++at) {
                    const auto ch = visible_char_at(at, y);
                    if ((ch ? ch : ' ') != static_cast<unsigned char>(row[at]) ||
                        is_cp437_box_separator(visible, at - left)) current = false;
                }
                if (!current) continue;
                std::string complete = visible;
                for (const auto &capture : captures)
                    if (capture.x == left && capture.y == y && capture.visible == visible) {
                        complete = capture.complete;
                        break;
                    }
                auto target = exact_literal_translation(complete);
                if (!target) target = translate_ammunition_item_name(complete);
                if (target && (target->empty() || target->find("[C:") != std::string::npos ||
                    target->find_first_of("\r\n") != std::string::npos)) target.reset();
                const auto claim = [&](int first, int last, const std::string &source,
                                       const std::string &translated, int box_left,
                                       int box_right, bool align_left) {
                    Match match{first, y, last - first, kFortressAmmunitionChoiceRule,
                        translated, source};
                    match.layout_x = box_left;
                    match.layout_y = y;
                    match.layout_length = box_right - box_left;
                    match.layout_clip_right = box_right;
                    match.layout_left = align_left;
                    match.layout_font_pixels = std::clamp(
                        static_cast<int>(gps_->tile_pixel_y * config_.font_scale),
                        1, gps_->tile_pixel_y);
                    match.layout_lock_font_pixels = true;
                    match.layout_line_height_pixels = gps_->tile_pixel_y;
                    matches.push_back(std::move(match));
                    std::fill(rows[y].begin() + first, rows[y].begin() + last, ' ');
                };
                claim(left, end, visible, target.value_or(native_text_to_utf8(complete)),
                    left, panel->x + quantity.start - 1, true);
                matches.back().native_hover_untranslated = !target;
                // Each toggle keeps its own native state color and hitbox.
                // In particular, Training never becomes Combat's name slot.
                for (const Caption *control : controls)
                    if (const auto translated = exact_literal_translation(control->source))
                        claim(control->left, control->end, control->visible, *translated,
                            control->button_left, control->button_right, false);
            }
        }
    }

    for (const Caption &caption : captions) {
        if (!caption.ammunition_type || (only_y >= 0 && caption.y != only_y)) continue;
        auto target = translate_ammunition_item_name(caption.source);
        if (!target && !caption.picker_column) continue;
        if (const auto literal = exact_literal_translation(caption.source)) target = literal;
        // An unknown material still owns one field inside a proven picker.
        // Preserve its complete original name instead of splitting known
        // species/tissue/type words into independently centred fragments.
        if (!target) target = cp437_to_utf8(caption.source);
        if (target->empty() || target->find("[C:") != std::string::npos ||
            target->find_first_of("\r\n") != std::string::npos) continue;
        Match match{caption.left, caption.y, caption.end - caption.left,
            kFortressAmmunitionChoiceRule, *target, caption.visible};
        match.layout_x = caption.left;
        match.layout_y = caption.y;
        match.layout_length = caption.button_right - caption.left;
        match.layout_left = true;
        match.layout_clip_right = caption.button_right;
        match.layout_font_pixels = std::clamp(
            static_cast<int>(gps_->tile_pixel_y * config_.font_scale), 1, gps_->tile_pixel_y);
        match.layout_lock_font_pixels = true;
        match.layout_line_height_pixels = gps_->tile_pixel_y;
        matches.push_back(std::move(match));
        std::fill(rows[caption.y].begin() + caption.left,
            rows[caption.y].begin() + caption.end, ' ');
    }
}

void Overlay::layout_fortress_ammunition_choices(SDL_Renderer *renderer) {
    if (!gps_ || !face_ || !renderer || gps_->tile_pixel_y <= 0) return;
    for (auto &match : prepared_matches_) {
        if (match.rule != kFortressAmmunitionChoiceRule || match.target.empty() ||
            match.native_split_duplicate || match.layout_x < 0 ||
            match.layout_clip_right <= match.layout_x) continue;
        // Matching already proved the current button or table column. Keep
        // that box and any normalized half-font baseline, never the English
        // name width or another control's caption. Names are left aligned;
        // each editor action is centered inside its own button.
        match.layout_box_pixel_x = -1;
        match.layout_box_pixel_width = 0;
        layout_fortress_text_rows(renderer, {{&match}}, match.layout_x,
            match.layout_clip_right, false, true);
    }
}
