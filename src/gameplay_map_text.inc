// In classic gameplay and world-map screens, terrain and UI share the same byte grid.
// Only actual native string draws establish text ownership. A framed map can
// itself contain a legend, so neither a rectangle nor an English-looking run
// is sufficient evidence that its entire interior is text.
static void retain_native_map_text_span(std::vector<uint8_t> &cells,
        const std::vector<std::string> &context, int x, int y, std::string_view source,
        const graphicst *caption_graphics = nullptr, bool info_title = false) {
    if (y < 0 || y >= static_cast<int>(context.size()) || x < 0 ||
        x >= static_cast<int>(context[y].size()) || source.empty()) return;
    source = source.substr(0, context[y].size() - static_cast<size_t>(x));
    // Retained logical frames need not redraw their strings before Present.
    // Require both position and current bytes; stale captures never grant a
    // whole row or panel permission to translate newly exposed terrain.
    if (context[y].compare(x, source.size(), source) != 0) {
        if (!caption_graphics) return;
        size_t matching = 0;
        while (matching < source.size() && context[y][x + matching] == source[matching])
            ++matching;
        // A later action button may cover either a truncated widget's dots
        // or an ordinary caption's final letters. The complete current 3x3
        // skin proves the field edge; a mismatch alone does not. Its first
        // cells can coincide with source spaces, so use the button's left
        // edge rather than the first different byte. Every retained byte
        // must still match the captured source at its original coordinates.
        int edge = -1;
        for (int at = x + 1; at <= x + static_cast<int>(matching) && edge < 0; ++at) {
            if (info_title) {
                if (native_info_title_action_button_at(*caption_graphics, at, y)) edge = at;
                continue;
            }
            for (int middle = std::max(1, y - 1);
                    middle <= std::min(caption_graphics->dimy - 2, y + 1); ++middle)
                if (native_caption_action_button_at(*caption_graphics, at, middle)) {
                    edge = at;
                    break;
                }
        }
        if (edge < 0) return;
        source = source.substr(0, static_cast<size_t>(edge - x));
    }
    for (size_t i = 0; i < source.size(); ++i)
        cells[(static_cast<size_t>(x) + i) * context.size() + y] = 1;
}

std::vector<uint8_t> Overlay::capture_map_text_cells() const {
    if (!gps_ || !gps_->screen || gps_->dimx <= 0 || gps_->dimx > 1000 ||
        gps_->dimy <= 0 || gps_->dimy > 1000) return {};
    const auto settings = native_ui_settings();
    if (!settings || !settings->classic) return {};

    std::vector<uint8_t> cells;
    const size_t count = static_cast<size_t>(gps_->dimx) * gps_->dimy;
    if (native_gameplay_map_screen(true)) {
        cells.assign(count, 0);
        std::vector<std::string> context(gps_->dimy, std::string(gps_->dimx, ' '));
        for (int x = 0; x < gps_->dimx; ++x)
            for (int y = 0; y < gps_->dimy; ++y) {
                bool top = false;
                const auto *cell = cell_at(x, y, &top);
                const unsigned char ch = cell && cell[0] ? cell[0] : ' ';
                context[y][x] = static_cast<char>(ch);
                // Keep structural separators for existing field and paragraph
                // readers. They never authorize the bytes enclosed by them.
                if (is_cp437_box_drawing_byte(ch))
                    cells[static_cast<size_t>(x) * gps_->dimy + y] = 1;
            }
        // Assignment names can be clipped without an ellipsis draw, or be
        // partly overwritten by their adjacent skill column. The complete
        // live chooser/portrait frame and exact surviving draw bytes prove
        // those source spans before the general map mask erases their text.
        // Reuse the same owner as final layout; never retain an entire pane.
        if (const auto chooser = fortress_unit_chooser(*gps_, context);
                chooser && chooser->header_y >= 0) {
            for (const auto caption : {std::string_view{"Name"},
                    std::string_view{"Cat"}, std::string_view{"Prof"}}) {
                const auto x = context[chooser->header_y].find(caption, chooser->name_x);
                if (x == std::string::npos) continue;
                for (size_t offset = 0; offset < caption.size(); ++offset)
                    cells[(x + offset) * gps_->dimy + chooser->header_y] = 1;
            }
        }
        auto chooser_rows = context;
        std::vector<Match> chooser_fields;
        append_fortress_unit_chooser_rows(chooser_rows, chooser_fields, -1, false);
        for (const auto &field : chooser_fields)
            for (int x = field.x; x < field.x + field.length; ++x)
                cells[static_cast<size_t>(x) * gps_->dimy + field.y] = 1;
        // The chooser excludes Labor because its worker controls coexist
        // with a separate skill column. Retain that page through the same
        // dedicated reader that will later translate and lay out its rows.
        auto labor_rows = context;
        std::vector<Match> labor_fields;
        append_fortress_labor_rows(labor_rows, labor_fields, -1);
        for (const auto &field : labor_fields)
            for (int x = field.x; x < field.x + field.length; ++x)
                cells[static_cast<size_t>(x) * gps_->dimy + field.y] = 1;
        std::vector<NativeClippedCaption> covered_video_captions;
        {
            std::lock_guard<std::mutex> lock(g_native_drawn_text_mutex);
            for (const auto *draws : {&g_native_drawn_text_rows, &g_native_drawn_top_text_rows})
                for (const auto &draw : *draws) {
                    retain_native_map_text_span(cells, context, draw.x, draw.y, draw.source,
                        draw.caption_source ? gps_ : nullptr,
                        draw.info_title_kind != NativeInfoTitleKind::None);
                    if (!draw.caption_source || !is_video_setting_source(draw.source) || draw.x < 0 ||
                        draw.x >= gps_->dimx || draw.y < 0 || draw.y >= gps_->dimy)
                        continue;
                    const auto &row = context[draw.y];
                    size_t visible_length = 0;
                    while (visible_length < draw.source.size() &&
                        visible_length < static_cast<size_t>(gps_->dimx - draw.x) &&
                        row[draw.x + visible_length] == draw.source[visible_length])
                        ++visible_length;
                    if (visible_length == draw.source.size()) continue;
                    const int edge = draw.x + static_cast<int>(visible_length);
                    const std::string_view visible(draw.source.data(), visible_length);
                    if (!is_video_setting_source(visible) || edge + 2 > gps_->dimx ||
                        row[edge + 1] != '+') continue;
                    // Video labels are drawn BEFORE their numeric editors.
                    // The editor's complete three-row + button proves where
                    // it overwrote the suffix; clipx alone cannot see this.
                    // Its left cap, never the surrounding settings row's
                    // far-right edge, bounds the surviving caption.
                    const auto button = native_button_text_rect(
                        *gps_, edge + 1, edge + 2, draw.y);
                    if (!button || button->x != edge + 1 || button->w != 1 ||
                        button->h != 3 || button->y + 1 != draw.y) continue;
                    retain_native_map_text_span(cells, context, draw.x, draw.y, visible);
                    covered_video_captions.push_back(
                        {draw.x, draw.y, std::string(visible), draw.source});
                }
            // The alert's addst can replace a background draw at the same
            // origin. Restoring its saved cells must also retain that native
            // text ownership in classic mode. Only exact current bytes of a
            // draw intersecting this frame's saved rectangle may re-enter.
            if (NativeUiReadScope::background_view(gps_) && g_native_announcement_page &&
                    native_announcement_background_matches(*gps_, g_native_announcement_page->bounds)) {
                const auto &box = g_native_announcement_page->bounds;
                for (const auto &draw : g_native_overwritten_text_rows) {
                    if (draw.y < box.y || draw.y >= box.y + box.h ||
                            draw.x >= box.x + box.w ||
                            int64_t(draw.x) + static_cast<int64_t>(draw.source.size()) <= box.x)
                        continue;
                    retain_native_map_text_span(cells, context, draw.x, draw.y, draw.source);
                }
            }
        }
        for (const auto &caption : covered_video_captions)
            remember_clipped_caption(caption.x, caption.y, caption.visible, caption.complete);
        for (const auto &caption : captured_clipped_captions())
            retain_native_map_text_span(cells, context, caption.x, caption.y, caption.visible, gps_);
        // Character-sheet prose has a separate native rich-text draw entry.
        // It uses the same source-byte proof as ordinary labels and numbers.
        bool current = false;
        for (const auto &draw : captured_native_knowledge_draws(&current)) {
            if (!draw.document || draw.line < 0 ||
                static_cast<size_t>(draw.line) >= draw.document->rows.size()) continue;
            retain_native_map_text_span(cells, context, draw.x, draw.y,
                draw.document->rows[static_cast<size_t>(draw.line)]);
        }
    } else {
        cells = capture_embark_map_text_cells();
    }

    // Complete icon-button artwork owns every cell, including letters that
    // look like key names or words. Exclude it after retaining captions so a
    // string drawn inside the icon cannot re-enable translation of the skin.
    const auto buttons = native_main_button_spans(*gps_);
    if (!buttons.empty() && cells.empty()) cells.assign(count, 1);
    for (const auto &button : buttons)
        for (int x = button.x; x < button.x + button.w; ++x)
            for (int y = button.y; y < button.y + button.h; ++y)
                cells[static_cast<size_t>(x) * gps_->dimy + y] = 0;
    return cells;
}
