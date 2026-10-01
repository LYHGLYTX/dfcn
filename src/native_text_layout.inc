// All game-text drawing and occlusion accounting consume this same resolved
// layout. Page composers describe fields; native owners retain the allocation,
// cursor, row advance and viewport through every subsequent composition pass.
void Overlay::bind_native_text_matches(std::vector<Match> &matches,
        const unsigned char *raw) const {
    if (!gps_) return;
    for (Match &match : matches) {
        const bool fold_case = match.rule >= 0 &&
            static_cast<size_t>(match.rule) < rules_.size() &&
            rules_[static_cast<size_t>(match.rule)].case_insensitive;
        bind_native_text_geometry(*gps_, match, raw, fold_case);
    }
}

bool Overlay::native_match_has_render_source(const Match &match,
        const unsigned char *raw) const {
    if (!gps_) return false;
    if (match.native_flow || (match.legends_flow && match.legends_flow->native_flow))
        return true;
    if (match.source.empty()) return false;
    const auto geometry = match.native_geometry
        ? native_captured_text_geometry(*gps_, match)
        : capture_native_text_geometry(*gps_, match, raw, false);
    return geometry && geometry->paint && (!raw || geometry->grid == raw);
}

Overlay::ResolvedTextLayout Overlay::resolve_text_draw_layout(const Match &match) const {
    ResolvedTextLayout result;
    if (!gps_ || gps_->tile_pixel_x <= 0 || gps_->tile_pixel_y <= 0) return result;
    const int tile_w = gps_->tile_pixel_x, tile_h = gps_->tile_pixel_y;
    const int origin_x = (gps_->screen_pixel_x - tile_w * gps_->dimx) / 2;
    const int origin_y = (gps_->screen_pixel_y - tile_h * gps_->dimy) / 2;
    const auto native = native_captured_text_geometry(*gps_, match);
    const bool native_row = !match.native_flow && native && native->paint;
    if (!match.native_flow && (!native_row || match.source.empty())) return result;
    int row = match.y;
    int offset_y = 0;
    if (native_row) {
        const auto *paint = &*native->paint;
        row = paint->y;
        offset_y = 0;
        if (paint->flags_known) {
            const uint32_t half = paint->flags & ((1u << 3) | (1u << 4));
            if (half == (1u << 3) || half == (1u << 4)) {
                row -= half == (1u << 4) ? 1 : 0;
                offset_y = tile_h / 2;
            }
        } else if (match.native_split_text) {
            row = match.native_split_top_y;
            offset_y = tile_h / 2;
        }
    }
    result.clip = native_text_draw_region(match);
    // Source cells alone cannot authorize a translated allocation. This path
    // uses only a real paragraph render or the current native writer's paint.
    result.line = {origin_x + match.x * tile_w, origin_y + row * tile_h + offset_y,
        std::max(0, result.clip.x + result.clip.w - (origin_x + match.x * tile_w)), tile_h};
    result.left = true;
    result.lock_pixels = true;
    if (match.native_flow) {
        const auto &flow = *match.native_flow;
        result.line = {origin_x + flow.x * tile_w + flow.pixel_x,
            origin_y + flow.y * tile_h + flow.pixel_y,
            flow.pixel_width > 0 ? flow.pixel_width : flow.width * tile_w,
            flow.line_height_pixels > 0 ? flow.line_height_pixels : tile_h};
        result.left = !flow.centered && !flow.right;
        result.right = flow.right;
        result.ellipsize = flow.ellipsize;
        result.lock_pixels = true;
    } else if (native_row) {
        // The current writer owns placement even when a page-specific pass
        // supplied an English span, guessed field width or a different Y.
        // A partial semantic replacement starts at its physical source cell;
        // a complete replacement starts at the native writer cursor.
        result.line.x = origin_x + (native->complete_row
            ? native->paint->x : native->source_x) * tile_w;
        result.line.y = origin_y + row * tile_h + offset_y;
        result.line.w = std::max(0, result.clip.x + result.clip.w - result.line.x);
        result.line.h = tile_h;
        result.left = true;
        result.right = false;
        result.ellipsize = false;
        result.lock_pixels = true;
    }
    // Native multiline capture supplies one complete paragraph to the fitter.
    // Wrapping each already-wrapped English row here would overlap the next row.
    if (result.wrap_width > 0) result.wrap_width = result.line.w;
    if (result.ellipsize) {
        const SDL_Rect column_clip{result.line.x, 0, result.line.w, gps_->screen_pixel_y};
        SDL_Rect visible{};
        result.clip = SDL_IntersectRect(&result.clip, &column_clip, &visible)
            ? visible : SDL_Rect{};
    }
    return result;
}

SDL_Rect Overlay::translated_text_bounds(SDL_Renderer *renderer, const Match &match) {
    if (match.native_display_run) {
        if (!match.native_display_owner || !match.native_display_run->geometry ||
                !native_text_geometry_current(*gps_, *match.native_display_run->geometry)) return {};
        Match display = match;
        display.native_display_run.reset();
        display.native_display_owner = false;
        display.native_geometry = match.native_display_run->geometry;
        display.target = match.native_display_run->target;
        display.x = display.native_geometry->source_x;
        display.y = display.native_geometry->source_y;
        display.length = static_cast<int>(display.native_geometry->source.size());
        display.source = display.native_geometry->source;
        return translated_text_bounds(renderer, display);
    }
    const auto layout = resolve_text_draw_layout(match);
    if (match.target.empty() || layout.line.w <= 0 || layout.clip.w <= 0 ||
            layout.clip.h <= 0) return {};
    std::string shortened;
    const std::string *text = &match.target;
    if (layout.ellipsize) {
        const auto fitted = ellipsize_text(match.target, layout.line.w);
        if (!fitted) return {};
        shortened = fitted->text;
        text = &shortened;
    }
    const auto *glyph = get_glyph_texture(renderer, *text, layout.line.w, layout.line.h,
        match.layout_font_pixels, match.layout_visual_height_pixels,
        layout.lock_pixels, {}, layout.wrap_width);
    if (!glyph || !glyph->texture) return {};
    const auto drawn = layout.destination(*glyph);
    SDL_Rect visible{};
    return SDL_IntersectRect(&drawn, &layout.clip, &visible) ? visible : SDL_Rect{};
}
