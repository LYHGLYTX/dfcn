// Depot trade draws its controls and summaries as separate native fields.
// A complete pair of selection buttons and its enclosing frame establish
// ownership before the paragraph and ordinary word matchers see those fields.
void Overlay::append_fortress_trade_fields(std::vector<std::string> &rows,
        std::vector<Match> &matches, int only_y, bool raw_layer) const {
    if (!gps_ || gps_->dimx <= 0 || gps_->dimy <= 0 ||
            rows.size() != static_cast<size_t>(gps_->dimy)) return;
    auto context = rows;
    for (int y = 0; y < gps_->dimy; ++y) {
        if (context[y].size() != static_cast<size_t>(gps_->dimx)) return;
        for (int x = 0; x < gps_->dimx; ++x) {
            const auto ch = visible_char_at(x, y);
            context[y][x] = ch ? static_cast<char>(ch) : ' ';
        }
    }
    const NativePanelBorders borders(*gps_);
    constexpr std::string_view control_captions[] = {
        "Mark all", "Unmark all", "Seize", "Accept Counteroffer",
        "Trade", "Offer as gift",
    };
    struct TradeControl {
        int x, y, end;
        SDL_Rect box;
        std::string source;
    };
    std::vector<TradeControl> controls;
    for (int y = 0; y < gps_->dimy; ++y) {
        for (const auto caption : control_captions) {
            for (size_t at = context[y].find(caption); at != std::string::npos;
                    at = context[y].find(caption, at + caption.size())) {
                const size_t end = at + caption.size();
                if (!has_word_boundaries(context[y], at, end)) continue;
                const auto button = native_button_text_rect(*gps_,
                    static_cast<int>(at), static_cast<int>(end), y);
                if (!button || button->h != 3 || button->x < 0 ||
                        button->x + button->w > gps_->dimx ||
                        button->y < 0 || button->y + button->h > gps_->dimy ||
                        button->y + 1 != y ||
                        trim_view(std::string_view(context[y]).substr(
                            button->x, button->w)) != caption) continue;
                controls.push_back({static_cast<int>(at), y,
                    static_cast<int>(end), *button, std::string(caption)});
            }
        }
    }
    std::optional<SDL_Rect> panel;
    for (const auto &mark : controls) {
        if (mark.source != "Mark all") continue;
        for (const auto &unmark : controls) {
            if (unmark.source != "Unmark all" || unmark.y != mark.y ||
                    unmark.box.y != mark.box.y ||
                    unmark.box.x <= mark.box.x + mark.box.w) continue;
            // Include both complete frames. Neither an individual button
            // nor an English-looking row can supply the containing panel.
            const SDL_Rect pair{mark.box.x - 1, mark.box.y,
                unmark.box.x + unmark.box.w + 1 - (mark.box.x - 1),
                mark.box.h};
            const auto bounds = native_panel_interior(borders, *gps_, pair);
            if (!bounds || pair.x < bounds->x ||
                    pair.x + pair.w > bounds->x + bounds->w ||
                    pair.y < bounds->y ||
                    pair.y + pair.h > bounds->y + bounds->h) continue;
            panel = bounds;
            break;
        }
        if (panel) break;
    }
    if (!panel) return;
    const int right = panel->x + panel->w, bottom = panel->y + panel->h;
    const auto source_colors = [&](int x, int y, int end) {
        std::vector<int> colors;
        colors.reserve(static_cast<size_t>(end - x));
        for (int at = x; at < end; ++at) {
            bool top = false;
            const auto *cell = cell_at(at, y, &top);
            colors.push_back(cell ? (cell[1] << 16) | (cell[2] << 8) | cell[3]
                : 0xffffff);
        }
        return colors;
    };
    const auto append = [&](int x, int y, int end, int display_left,
            int display_right, const std::optional<std::string> &target,
            bool centered = false, std::optional<SDL_Rect> box = std::nullopt,
            const std::vector<int> &target_colors = std::vector<int>{}) {
        if (y < panel->y || y >= bottom || x < panel->x ||
                end <= x || end > right || display_left < panel->x ||
                display_right > right || display_right <= display_left) return;
        const std::string source = context[y].substr(x, end - x);
        for (int at = x; at < end; ++at) {
            const auto ch = visible_char_at(at, y);
            if ((ch ? ch : ' ') != static_cast<unsigned char>(context[y][at]) ||
                    is_cp437_box_separator(context[y], at)) return;
        }
        const auto emit = [&](int first, int last, bool complete) {
            if (only_y < 0 || only_y == y) {
                Match match{first, y, last - first, kFortressTradeFieldRule,
                    complete ? target.value_or(native_text_to_utf8(source)) : std::string{},
                    context[y].substr(first, last - first)};
                match.native_hover_untranslated = complete && !target;
                match.native_picture_caption_box = box;
                match.layout_x = display_left;
                match.layout_y = y;
                match.layout_length = display_right - display_left;
                match.layout_clip_right = display_right;
                match.layout_left = !centered;
                match.layout_font_pixels = unified_font_pixels();
                match.layout_lock_font_pixels = true;
                match.layout_line_height_pixels = gps_->tile_pixel_y;
                if (complete && target) {
                    match.layout_glyph_foreground_rgb = target_colors;
                    if (!target_colors.empty())
                        match.layout_foreground_rgb = target_colors.front();
                }
                matches.push_back(std::move(match));
            }
            std::fill(rows[y].begin() + first, rows[y].begin() + last, ' ');
        };
        if (rows[y].compare(x, end - x, source) == 0) emit(x, end, true);
        else if (raw_layer) {
            // The composite field owns its meaning, while each raw layer
            // suppresses only equal bytes actually belonging to that layer.
            for (int at = x; at < end;) {
                while (at < end && rows[y][at] != context[y][at]) ++at;
                const int first = at;
                while (at < end && rows[y][at] == context[y][at]) ++at;
                if (first < at) emit(first, at, false);
            }
        }
    };
    for (const auto &control : controls) {
        if (control.box.x < panel->x || control.box.x + control.box.w > right ||
                control.box.y < panel->y || control.box.y + control.box.h > bottom)
            continue;
        std::vector<int> target_colors;
        auto target = translate_help_paragraph(control.source,
            source_colors(control.x, control.y, control.end),
            target_colors, true, -1, true);
        // Trade remains an ordinary exact action. Catalog entries keep the
        // context-specific meaning of Seize instead of its generic verb.
        if (!target && control.source == "Trade") {
            target = exact_literal_translation(control.source);
            target_colors.clear();
        }
        append(control.x, control.y, control.end, control.box.x,
            control.box.x + control.box.w, target, true, control.box, target_colors);
    }

    // Trade summaries and pane headings.
    for (int y = panel->y; y < bottom; ++y) {
        for (const std::string_view prefix : {"Merchant from ", "Your fortress of "}) {
            const size_t at = context[y].find(prefix, panel->x);
            if (at == std::string::npos || at + prefix.size() >= static_cast<size_t>(right) ||
                    !has_word_boundaries(context[y], at, at + prefix.size() - 1)) continue;
            const int x = static_cast<int>(at);
            const int end = std::min(right,
                static_cast<int>(template_fragment_end(context[y], at)));
            if (end <= x + static_cast<int>(prefix.size())) continue;
            int field_right = right;
            for (const auto &control : controls)
                if (control.box.y <= y && y < control.box.y + control.box.h &&
                        control.box.x > end)
                    field_right = std::min(field_right, control.box.x - 1);
            // Two pane titles may share one physical row. The next actual
            // field, rather than the panel width, owns its own column.
            for (const auto &field : split_text_fields(context[y]))
                if (field.start >= end && field.start < field_right)
                    field_right = field.start;
            std::vector<int> colors;
            const auto target = translate_help_paragraph(context[y].substr(x, end - x),
                source_colors(x, y, end), colors, true);
            append(x, y, end, x, field_right, target, false, std::nullopt, colors);
        }
        for (const std::string_view label : {"Trader Profit:", "Trader Loss:",
                "Allowed Weight:", "Excess Weight:", "Value:", "Weight:"}) {
            for (size_t at = context[y].find(label, panel->x); at != std::string::npos;
                    at = context[y].find(label, at + label.size())) {
                if (at + label.size() >= static_cast<size_t>(right) ||
                        !has_word_boundaries(context[y], at, at + label.size())) continue;
                const int x = static_cast<int>(at);
                const int label_end = x + static_cast<int>(label.size());
                int value_x = label_end;
                while (value_x < right && context[y][value_x] == ' ') ++value_x;
                int end = value_x;
                bool number = false;
                while (end < right) {
                    const unsigned char ch = context[y][end];
                    if (ch >= '0' && ch <= '9') number = true;
                    else if (ch == '?') number = true;
                    else if (ch != ',' && ch != '.' && ch != '-' && ch != '+' &&
                            ch != '~' && ch != 15 &&
                            !(ch >= 0x80 && !is_cp437_box_separator(context[y], end))) break;
                    ++end;
                }
                if (!number) continue;
                std::vector<int> colors;
                auto target = translate_help_paragraph(label,
                    source_colors(x, y, label_end), colors, true, -1, true);
                if (!target) target = exact_literal_translation(label);
                if (!target) continue;
                if (colors.empty()) {
                    std::vector<uint32_t> glyphs;
                    if (!decode_utf8(*target, glyphs)) continue;
                    colors.assign(glyphs.size(), source_colors(x, y, label_end).front());
                }
                // Labels, numbers and the game's CP437 currency/weight
                // glyphs form one scalar. Retain every value byte and color.
                *target += native_text_to_utf8(context[y].substr(value_x, end - value_x));
                const auto value_colors = source_colors(value_x, y, end);
                colors.insert(colors.end(), value_colors.begin(), value_colors.end());
                int field_right = right;
                for (const auto &control : controls)
                    if (control.box.y <= y && y < control.box.y + control.box.h &&
                            control.box.x > end)
                        field_right = std::min(field_right, control.box.x - 1);
                for (const auto &field : split_text_fields(context[y]))
                    if (field.start >= end && field.start < field_right)
                        field_right = field.start;
                append(x, y, end, x, field_right, target, false, std::nullopt, colors);
            }
        }
    }
}
