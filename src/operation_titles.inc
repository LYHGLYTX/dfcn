// One semantic layout class, carried by the shared dictionary's `o` flag.
// Native addresses and English/Chinese title lists do not belong in layout.
bool Overlay::is_operation_title(const Match &match) const {
    return match.rule >= 0 && static_cast<size_t>(match.rule) < rules_.size() &&
        rules_[static_cast<size_t>(match.rule)].operation_title;
}

void Overlay::layout_operation_titles(SDL_Renderer *renderer) {
    if (!gps_ || !face_ || !renderer ||
        gps_->tile_pixel_x <= 0 || gps_->tile_pixel_y <= 0) return;
    const NativePanelBorders borders(*gps_);
    for (Match &match : prepared_matches_) {
        if (!is_operation_title(match) || match.target.empty() ||
            match.native_split_duplicate || match.x < 0 || match.y < 0 ||
            match.y >= gps_->dimy || match.length <= 0 ||
            match.length > gps_->dimx - match.x ||
            match.source.size() != static_cast<size_t>(match.length)) continue;

        // The live, closed title frame owns available width. Never use the
        // English title's length, screenshot coordinates or remembered bounds.
        const auto panel = native_panel_interior(borders, *gps_,
            match.x, match.x + match.length, match.y);
        if (!panel || panel->w <= 2) continue;
        const auto card = capture_panel_text_card(*panel);
        const int title_y = match.native_split_text ? match.native_split_top_y : match.y;
        if (!card || card->rows.front().y != title_y) continue;
        const auto &title = card->rows.front();
        const Rule &rule = rules_[static_cast<size_t>(match.rule)];
        if (title.x != match.x || title.source.size() != match.source.size() ||
            !template_literal_at(title.source, 0, match.source, rule.case_insensitive)) continue;
        // A full source match on the visible owner layer is required even
        // when the surviving half-font match belongs to the lower row.
        std::string visible;
        for (int x = match.x; x < match.x + match.length; ++x)
            visible.push_back(visible_char_at(x, match.y));
        if (!template_literal_at(visible, 0, match.source, rule.case_insensitive)) continue;

        // All states use one inner cell of padding on either side of the
        // same frame. Preserve the native title row: staircase/Arena hints
        // below it are separate fields, not vertical space to centre into.
        const int left = panel->x + 1;
        const int right = panel->x + panel->w - 1;
        match.layout_y = title_y;
        match.layout_pixel_y = 0;
        match.layout_box_pixel_x = -1;
        match.layout_box_pixel_width = 0;
        // Reuse the card/list fitter: one UI-scale-derived font, left aligned,
        // locked against per-caption raster/SDL resizing. Very narrow frames
        // use its Unicode-aware ellipsis, never change the group's font size.
        layout_fortress_text_rows(renderer, {{&match}}, left, right);
        // Only translated geometry changes. Source masks, native half-font
        // ownership, colors, frame textures and hit boxes remain untouched.
    }
}
