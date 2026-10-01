// Adventure creation's personality actions are separate graphical buttons.
// Their English captions begin at a fixed inset, so centring each Chinese
// caption inside its English glyph run gives every button a different centre.
void Overlay::layout_adventure_personality_actions(SDL_Renderer *renderer) {
    if (!gps_ || !face_ || !renderer ||
        gps_->tile_pixel_x <= 0 || gps_->tile_pixel_y <= 0) return;
    static constexpr std::array<std::string_view, 4> sources = {{
        "Full customization", "Change dream/goal (if possible)",
        "Randomize personality", "Accept personality"
    }};
    std::array<Match *, sources.size()> captions{};
    for (Match &match : prepared_matches_) {
        if (match.target.empty() || match.native_split_duplicate) continue;
        for (size_t index = 0; index < sources.size(); ++index) {
            if (match.source != sources[index]) continue;
            if (captions[index]) return;
            captions[index] = &match;
        }
    }
    // The dream action is conditional. The other three complete actions
    // establish this page without relying on translated labels or coordinates.
    if (!captions[0] || !captions[2] || !captions[3] ||
        captions[0]->y >= captions[2]->y ||
        captions[2]->y >= captions[3]->y ||
        (captions[1] && (captions[1]->y <= captions[0]->y ||
            captions[1]->y >= captions[2]->y))) return;

    const int tile_w = gps_->tile_pixel_x, tile_h = gps_->tile_pixel_y;
    const int origin_x = (gps_->screen_pixel_x - gps_->dimx * tile_w) / 2;
    const int origin_y = (gps_->screen_pixel_y - gps_->dimy * tile_h) / 2;
    std::array<std::optional<SDL_Rect>, sources.size()> boxes{};
    size_t resolved = 0;
    for (size_t index = 0; index < captions.size(); ++index) {
        if (!captions[index]) continue;
        const Match &match = *captions[index];
        if (match.x < 0 || match.y < 0 || match.y >= gps_->dimy ||
            match.length <= 0 || match.x + match.length > gps_->dimx) continue;
        // Prefer the current closed skin to a generic occupied background
        // run, which can contain more than one adjacent control.
        if (const auto rect = native_button_text_rect(*gps_, match.x,
                match.x + match.length, match.y)) {
            boxes[index] = SDL_Rect{origin_x + rect->x * tile_w,
                origin_y + rect->y * tile_h, rect->w * tile_w, rect->h * tile_h};
        } else if (const auto span = native_button_text_span(*gps_, match.x,
                match.x + match.length, match.y)) {
            boxes[index] = SDL_Rect{origin_x + span->first * tile_w,
                origin_y + match.y * tile_h,
                (span->second - span->first) * tile_w, tile_h};
        } else {
            boxes[index] = native_caption_button_rect(match);
        }
        if (!boxes[index]) continue;
        if (boxes[index]->w <= 2 * config_.horizontal_padding) {
            boxes[index].reset();
            continue;
        }
        ++resolved;
    }
    if (!resolved) return;

    // Each action retains its own current native button rectangle.
    const int pixels = unified_font_pixels();
    for (size_t index = 0; index < captions.size(); ++index) {
        if (!boxes[index]) continue;
        Match &match = *captions[index];
        match.layout_x = (boxes[index]->x - origin_x) / tile_w;
        match.layout_length = (boxes[index]->w + tile_w - 1) / tile_w;
        match.layout_box_pixel_x = boxes[index]->x;
        match.layout_box_pixel_width = boxes[index]->w;
        match.layout_native_clip = boxes[index];
        match.layout_ellipsize = true;
        match.layout_left = false;
        match.layout_font_pixels = pixels;
        match.layout_lock_font_pixels = true;
        match.layout_line_height_pixels = tile_h;
    }
}
