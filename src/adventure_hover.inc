// The native hover renderer overwrites the same character grid as the lists.
// Capture it before the first destructive frame cell, not at the later SDL
// glyph pass when the original row has already been replaced by tooltip text.
void Overlay::capture_adventure_background(graphicst *graphics) {
    TranslationStateScope translation_scope;
    adventure_before_hover_epoch_ = 0;
    if (!config_.enabled || graphics != gps_ || !graphics || !graphics->screen ||
        graphics->dimx <= 0 || graphics->dimx > 1000 ||
        graphics->dimy <= 0 || graphics->dimy > 1000) return;
    const size_t cells = static_cast<size_t>(graphics->dimx) * graphics->dimy;
    bool same_source = adventure_before_hover_matches_valid_ &&
        adventure_before_hover_dimx_ == graphics->dimx &&
        adventure_before_hover_dimy_ == graphics->dimy &&
        adventure_before_hover_grid_.size() == cells * 8;
    for (size_t tile = 0; same_source && tile < cells; ++tile)
        same_source = adventure_before_hover_grid_[tile * 8] == graphics->screen[tile * 8];
    // Mouse highlighting changes colors without changing the list's source.
    // Reuse dictionary matches, but keep the current colors/half-cell flags.
    if (!same_source) adventure_before_hover_matches_valid_ = false;
    adventure_before_hover_grid_.assign(graphics->screen, graphics->screen + cells * 8);
    adventure_before_hover_flags_.clear();
    if (graphics->screentexpos_flag)
        adventure_before_hover_flags_.assign(graphics->screentexpos_flag,
            graphics->screentexpos_flag + cells);
    adventure_before_hover_dimx_ = graphics->dimx;
    adventure_before_hover_dimy_ = graphics->dimy;
    adventure_before_hover_epoch_ = draw_epoch_;
}

// Keep source identity independent of the hover card's final composite. All
// recovery comes from this draw epoch or the current native text layers.
static bool adventure_skill_field(std::string_view source) {
    if (is_ranked_skill_source(source)) return true;
    const std::string folded = lower(std::string(source));
    if (folded.starts_with("very low ") || folded.starts_with("low ") ||
        folded.starts_with("below average ") || folded.starts_with("average ") ||
        folded.starts_with("above average ") || folded.starts_with("high ") ||
        folded.starts_with("very high ") || folded.starts_with("superior ")) return true;
    if (!source.ends_with(" pts")) return false;
    source.remove_suffix(4);
    return !source.empty() && std::all_of(source.begin(), source.end(),
        [](unsigned char ch) { return ch >= '0' && ch <= '9'; });
}

static std::optional<std::string> adventure_native_field(
        const graphicst &gps, const Match &match, const unsigned char *raw,
        bool fold_case) {
    if (!raw || match.target.empty() || match.length <= 0 ||
        match.x < 0 || match.x + match.length > gps.dimx ||
        match.y < 0 || match.y >= gps.dimy ||
        match.source.size() != static_cast<size_t>(match.length)) return std::nullopt;
    std::string row(static_cast<size_t>(gps.dimx), ' ');
    for (int x = 0; x < gps.dimx; ++x) {
        const unsigned char ch = raw[(static_cast<size_t>(x) * gps.dimy + match.y) * 8];
        if (ch) row[static_cast<size_t>(x)] = static_cast<char>(ch);
    }
    if (!template_literal_at(row, static_cast<size_t>(match.x), match.source, fold_case))
        return std::nullopt;
    const auto edge = [&](int x, int direction) {
        if (x < 0 || x >= gps.dimx || is_cp437_box_separator(row, x)) return true;
        if (row[static_cast<size_t>(x)] != ' ') return false;
        x += direction;
        return x < 0 || x >= gps.dimx || row[static_cast<size_t>(x)] == ' ' ||
            is_cp437_box_separator(row, x);
    };
    if (!edge(match.x - 1, -1) || !edge(match.x + match.length, 1))
        return std::nullopt;
    return row.substr(static_cast<size_t>(match.x), static_cast<size_t>(match.length));
}

static void adventure_native_style(const graphicst &gps, Match &match,
        const unsigned char *raw, const uint32_t *flags) {
    const auto *cell = raw + (static_cast<size_t>(match.x) * gps.dimy + match.y) * 8;
    match.layout_foreground_rgb = (cell[1] << 16) | (cell[2] << 8) | cell[3];
    if (!flags) return;
    constexpr uint32_t top_half = 1u << 3, bottom_half = 1u << 4;
    const uint32_t half = flags[static_cast<size_t>(match.x) * gps.dimy + match.y] &
        (top_half | bottom_half);
    if (half != top_half && half != bottom_half) return;
    const int first_y = match.y - (half == bottom_half ? 1 : 0);
    if (first_y < 0 || first_y + 1 >= gps.dimy) return;
    for (int x = match.x; x < match.x + match.length; ++x) {
        if ((flags[static_cast<size_t>(x) * gps.dimy + match.y] &
                (top_half | bottom_half)) != half) return;
    }
    match.native_split_text = true;
    match.native_split_top_y = first_y;
}

void Overlay::ensure_adventure_background_matches() {
    if (adventure_before_hover_matches_valid_) return;
    adventure_before_hover_matches_.clear();
    adventure_before_hover_footer_y_ = -1;
    const auto *raw = adventure_before_hover_grid_.data();
    for (Match match : find_matches(-1, raw)) {
        if (match.source == "Accept attributes and skills")
            adventure_before_hover_footer_y_ = match.y;
        if (!adventure_skill_field(match.source)) continue;
        const bool fold_case = match.rule >= 0 &&
            static_cast<size_t>(match.rule) < rules_.size() && rules_[match.rule].case_insensitive;
        const auto source = adventure_native_field(*gps_, match, raw, fold_case);
        if (!source) continue;
        match.source = *source;
        adventure_before_hover_matches_.push_back(std::move(match));
    }
    std::stable_sort(adventure_before_hover_matches_.begin(),
        adventure_before_hover_matches_.end(), [](const Match &a, const Match &b) {
            return a.length > b.length;
        });
    adventure_before_hover_matches_valid_ = true;
}

// Prepare one byte-checked native suppression mask before the first glyph of
// this hover frame. Skipping the original ink here avoids synchronous GPU
// readbacks for every translated source row at Present.
void Overlay::prepare_adventure_hover_suppression() {
    if (adventure_hover_scan_epoch_ == draw_epoch_ ||
        adventure_before_hover_epoch_ != draw_epoch_ || !face_ || rules_.empty() ||
        adventure_before_hover_dimx_ != gps_->dimx ||
        adventure_before_hover_dimy_ != gps_->dimy ||
        adventure_before_hover_grid_.size() != static_cast<size_t>(gps_->dimx) * gps_->dimy * 8)
        return;
    adventure_hover_scan_epoch_ = draw_epoch_;
    adventure_hover_suppress_epoch_ = 0;
    std::vector<std::string> rows(static_cast<size_t>(gps_->dimy),
        std::string(static_cast<size_t>(gps_->dimx), ' '));
    for (int x = 0; x < gps_->dimx; ++x) {
        for (int y = 0; y < gps_->dimy; ++y) {
            bool top = false;
            if (const auto *cell = cell_at(x, y, &top); cell && cell[0])
                rows[y][x] = static_cast<char>(cell[0]);
        }
    }
    capture_toolbar_tooltip(rows, false);
    if (!g_native_toolbar_tooltip || !g_native_toolbar_tooltip->native_frame ||
        !g_native_toolbar_tooltip->whole_frame) return;
    const auto &card = *g_native_toolbar_tooltip;
    ensure_adventure_background_matches();
    if (adventure_before_hover_footer_y_ < 0) return;
    adventure_hover_suppress_.assign(static_cast<size_t>(gps_->dimx) * gps_->dimy, 0);
    for (const Match &match : adventure_before_hover_matches_) {
        if (match.y >= adventure_before_hover_footer_y_ ||
            match.y < card.top || match.y > card.bottom ||
            match.x > card.right || match.x + match.length <= card.left) continue;
        int exposed = 0;
        bool current = true;
        for (int offset = 0; offset < match.length; ++offset) {
            const int x = match.x + offset;
            if (x >= card.left && x <= card.right) continue;
            const unsigned char ch = match.source[static_cast<size_t>(offset)];
            if (static_cast<unsigned char>(rows[match.y][x]) != ch) { current = false; break; }
            if (ch > ' ') ++exposed;
        }
        if (!current || !exposed) continue;
        for (int offset = 0; offset < match.length; ++offset) {
            const int x = match.x + offset;
            if (x >= card.left && x <= card.right) continue;
            const unsigned char ch = match.source[static_cast<size_t>(offset)];
            if (ch > ' ')
                adventure_hover_suppress_[static_cast<size_t>(x) * gps_->dimy + match.y] = ch;
        }
    }
    // Detection read these same current rows, including all blank padding.
    // Unknown cards retain every native glyph rather than partially vanishing.
    if (!translate_toolbar_tooltip(card.source).empty()) {
        for (size_t line = 0; line < card.rows.size(); ++line) {
            const int y = card.text_y + static_cast<int>(line);
            for (size_t offset = 0; offset < card.rows[line].size(); ++offset) {
                const unsigned char ch = card.rows[line][offset];
                if (ch > ' ')
                    adventure_hover_suppress_[static_cast<size_t>(card.body_x + offset) *
                        gps_->dimy + y] = ch;
            }
        }
    }
    adventure_hover_suppress_epoch_ = draw_epoch_;
}

void Overlay::recover_adventure_skill_rows() {
    if (!g_native_toolbar_tooltip || !g_native_toolbar_tooltip->native_frame) return;
    const auto &card = *g_native_toolbar_tooltip;
    const auto accept = std::find_if(prepared_matches_.begin(), prepared_matches_.end(),
        [](const Match &match) { return match.source == "Accept attributes and skills"; });
    if (accept == prepared_matches_.end()) return;
    const int footer_y = accept->y;
    std::vector<Match> candidates;
    std::vector<std::pair<const unsigned char *, const uint32_t *>> layers;
    if (adventure_before_hover_epoch_ == composite_read_epoch_ &&
        adventure_before_hover_dimx_ == gps_->dimx && adventure_before_hover_dimy_ == gps_->dimy &&
        adventure_before_hover_grid_.size() == static_cast<size_t>(gps_->dimx) * gps_->dimy * 8) {
        ensure_adventure_background_matches();
        candidates = adventure_before_hover_matches_;
        for (Match &match : candidates)
            adventure_native_style(*gps_, match, adventure_before_hover_grid_.data(),
                adventure_before_hover_flags_.empty() ? nullptr : adventure_before_hover_flags_.data());
    } else {
        // Other native builds can still recover an intact current layer.
        // A current pre-hover snapshot is authoritative and needs no rescan.
        layers.emplace_back(gps_->screen, gps_->screentexpos_flag);
        if (gps_->top_in_use) layers.emplace_back(gps_->screen_top, gps_->screentexpos_top_flag);
    }
    for (const auto &[raw, flags] : layers) {
        if (!raw) continue;
        for (Match match : find_matches(-1, raw)) {
            if (match.y >= footer_y || !adventure_skill_field(match.source)) continue;
            const bool fold_case = match.rule >= 0 &&
                static_cast<size_t>(match.rule) < rules_.size() && rules_[match.rule].case_insensitive;
            const auto source = adventure_native_field(*gps_, match, raw, fold_case);
            if (!source) continue;
            match.source = *source;
            adventure_native_style(*gps_, match, raw, flags);
            candidates.push_back(std::move(match));
        }
    }
    // Prefer whole labels over a coincidental dictionary match in a surviving
    // prefix. A source can only replace exposed text that still agrees with it.
    std::stable_sort(candidates.begin(), candidates.end(), [](const Match &a, const Match &b) {
        return a.length > b.length;
    });
    std::vector<Match> recovered;
    for (Match match : candidates) {
        if (match.y >= footer_y || match.length <= 0 || match.x < 0 ||
            match.x + match.length > gps_->dimx || match.y < 0 ||
            match.source.size() != static_cast<size_t>(match.length)) continue;
        const bool intersects = match.y >= card.top && match.y <= card.bottom &&
            match.x <= card.right && match.x + match.length > card.left;
        if (!intersects) continue;
        int exposed_letters = 0;
        bool current = true;
        for (int offset = 0; offset < match.length; ++offset) {
            const int x = match.x + offset;
            if (x >= card.left && x <= card.right) continue;
            const unsigned char source = match.source[static_cast<size_t>(offset)];
            const unsigned char visible = visible_char_at(x, match.y);
            if ((visible ? visible : ' ') != source) { current = false; break; }
            if (source > ' ') ++exposed_letters;
        }
        if (!current || exposed_letters == 0) continue;
        const int first_y = match.native_split_text ? match.native_split_top_y : match.y;
        if (std::any_of(recovered.begin(), recovered.end(), [&](const Match &other) {
                const int other_y = other.native_split_text ? other.native_split_top_y : other.y;
                return other_y == first_y && other.x < match.x + match.length &&
                    match.x < other.x + other.length;
            })) continue;
        match.native_hover_background = true;
        // A matching epoch alone does not prove this row was owned: native
        // partial draws can change the card after the first glyph. Verify all
        // exposed source ink, including both rows of split native text.
        bool suppressed = adventure_hover_suppress_epoch_ == composite_read_epoch_;
        for (int y = first_y; suppressed &&
                y < first_y + (match.native_split_text ? 2 : 1); ++y) {
            for (int offset = 0; offset < match.length; ++offset) {
                const int x = match.x + offset;
                if (y >= card.top && y <= card.bottom && x >= card.left && x <= card.right)
                    continue;
                const unsigned char source = match.source[static_cast<size_t>(offset)];
                if (source <= ' ') continue;
                const size_t tile = static_cast<size_t>(x) * gps_->dimy + y;
                if (tile >= adventure_hover_suppress_.size() ||
                    adventure_hover_suppress_[tile] != source) { suppressed = false; break; }
            }
        }
        if (!suppressed) {
            match.graphical_clear_x = match.x;
            match.graphical_clear_y = first_y;
            match.graphical_clear_width = match.length;
            match.graphical_clear_height = match.native_split_text ? 2 : 1;
        }
        recovered.push_back(std::move(match));
    }
    std::erase_if(prepared_matches_, [&](const Match &visible) {
        if (visible.rule == kToolbarTooltipBodyRule || visible.rule == kToolbarTooltipKeyRule ||
            visible.rule == kHelpDocumentRule) return false;
        return std::any_of(recovered.begin(), recovered.end(), [&](const Match &match) {
            const int first_y = match.native_split_text ? match.native_split_top_y : match.y;
            return visible.y >= first_y &&
                visible.y < first_y + (match.native_split_text ? 2 : 1) &&
                visible.x < match.x + match.length &&
                match.x < visible.x + visible.length;
        });
    });
    prepared_matches_.insert(prepared_matches_.end(),
        std::make_move_iterator(recovered.begin()), std::make_move_iterator(recovered.end()));
}

// Every background owner uses the same help clipping, including captions
// whose source is fully exposed but whose translated layout crosses a card.
// Keep the already measured layout and intersect only its final draw clips.
template <typename Draw>
static void draw_with_help_clips(SDL_Renderer *renderer, const graphicst &gps,
        const std::vector<SDL_Rect> &frames, const Match *match, Draw &&draw) {
    if (frames.empty()) { draw(); return; }
    const int tile_w = gps.tile_pixel_x, tile_h = gps.tile_pixel_y;
    if (tile_w <= 0 || tile_h <= 0) return;
    const int origin_x = (gps.screen_pixel_x - tile_w * gps.dimx) / 2;
    const int origin_y = (gps.screen_pixel_y - tile_h * gps.dimy) / 2;
    SDL_Rect saved{};
    const bool had_clip = SDL_RenderIsClipEnabled(renderer) == SDL_TRUE;
    SDL_RenderGetClipRect(renderer, &saved);
    std::vector<SDL_Rect> clips{{0, 0, gps.screen_pixel_x, gps.screen_pixel_y}};
    if (had_clip) {
        SDL_Rect intersection{};
        if (!SDL_IntersectRect(&clips.front(), &saved, &intersection)) return;
        clips.front() = intersection;
    }
    for (const auto &frame : frames) {
        // The foreground's source lies inside its own help frame. Recovered
        // background captions explicitly retain their separate ownership.
        const bool foreground = match && !match->native_hover_background &&
            !match->native_help_occluder && !match->native_help_background_frames &&
            match->x >= frame.x && match->y >= frame.y &&
            match->x + std::max(1, match->length) <= frame.x + frame.w &&
            match->y < frame.y + frame.h;
        if (foreground) continue;
        const SDL_Rect popup{origin_x + frame.x * tile_w, origin_y + frame.y * tile_h,
            frame.w * tile_w, frame.h * tile_h};
        std::vector<SDL_Rect> exposed;
        for (const auto &clip : clips) {
            SDL_Rect covered{};
            if (!SDL_IntersectRect(&clip, &popup, &covered)) { exposed.push_back(clip); continue; }
            const auto add = [&](SDL_Rect rect) { if (rect.w > 0 && rect.h > 0) exposed.push_back(rect); };
            add({clip.x, clip.y, clip.w, covered.y - clip.y});
            add({clip.x, covered.y + covered.h, clip.w,
                clip.y + clip.h - covered.y - covered.h});
            add({clip.x, covered.y, covered.x - clip.x, covered.h});
            add({covered.x + covered.w, covered.y,
                clip.x + clip.w - covered.x - covered.w, covered.h});
        }
        clips = std::move(exposed);
    }
    for (const auto &clip : clips) {
        SDL_RenderSetClipRect(renderer, &clip);
        draw();
    }
    SDL_RenderSetClipRect(renderer, had_clip ? &saved : nullptr);
}

void Overlay::draw_help_clipped_match(SDL_Renderer *renderer, const Match &match,
        const std::vector<SDL_Rect> &frames,
        const std::shared_ptr<NativeTooltipPage> &background_page,
        graphicst *background_graphics) {
    // Clearing and painting must read the same restored native page that
    // supplied layout. Reopening the toolbar snapshot here loses the classic
    // help restoration; without a toolbar it used the overwritten grid.
    const auto page = match.native_help_background_frames ? background_page : nullptr;
    NativeTooltipPageScope page_view(gps_, page ? background_graphics : nullptr);
    NativeUiReadScope page_cells(gps_, page ? &page->cells : nullptr);
    // Matching may also reserve an edge-clipped sidebar established by its
    // complete source. The skin-only frame list cannot rediscover that owner.
    const auto &occluders = match.native_help_background_frames
        ? *match.native_help_background_frames : frames;
    draw_with_help_clips(renderer, *gps_, occluders, &match,
        [&] {
            if (g_native_toolbar_tooltip && g_native_toolbar_tooltip->widget_frame &&
                (match.rule == kToolbarTooltipBodyRule || match.rule == kToolbarTooltipKeyRule)) {
                draw_with_help_clips(renderer, *gps_, g_native_toolbar_tooltip->occlusions, nullptr,
                    [&] { draw_hover_clipped_match(renderer, match); });
            } else draw_hover_clipped_match(renderer, match);
        });
}

// The overlay is presented after the game draws the tooltip. Draw each page
// caption only in the exposed strips, preserving its full unoccluded text box.
void Overlay::draw_hover_clipped_match(SDL_Renderer *renderer, const Match &match) {
    if (match.native_split_duplicate) return;
    const bool document_flow = match.legends_flow && match.legends_flow->laid_out;
    if (document_flow && !match.legends_flow_owner) return;
    const bool graphical_clear = match.graphical_clear_width > 0 &&
        match.graphical_clear_height > 0;
    if (!document_flow && match.target.empty() && !graphical_clear) return;
    if (!match.native_help_occluder &&
            (!g_native_toolbar_tooltip || !g_native_toolbar_tooltip->native_frame)) {
        draw_match(renderer, match);
        return;
    }
    const SDL_Rect frame = match.native_help_occluder ? *match.native_help_occluder
        : SDL_Rect{g_native_toolbar_tooltip->left, g_native_toolbar_tooltip->top,
            g_native_toolbar_tooltip->right - g_native_toolbar_tooltip->left + 1,
            g_native_toolbar_tooltip->bottom - g_native_toolbar_tooltip->top + 1};
    const int tile_w = gps_->tile_pixel_x, tile_h = gps_->tile_pixel_y;
    if (tile_w <= 0 || tile_h <= 0) return;
    const int origin_x = (gps_->screen_pixel_x - tile_w * gps_->dimx) / 2;
    const int origin_y = (gps_->screen_pixel_y - tile_h * gps_->dimy) / 2;
    const SDL_Rect display_frame{origin_x + frame.x * tile_w, origin_y + frame.y * tile_h,
        frame.w * tile_w, frame.h * tile_h};
    const int left = std::clamp(display_frame.x, 0, gps_->screen_pixel_x);
    const int top = std::clamp(display_frame.y, 0, gps_->screen_pixel_y);
    const int right = std::clamp(display_frame.x + display_frame.w, left, gps_->screen_pixel_x);
    const int bottom = std::clamp(display_frame.y + display_frame.h, top, gps_->screen_pixel_y);
    const SDL_Rect screen{0, 0, gps_->screen_pixel_x, gps_->screen_pixel_y};
    SDL_Rect bounds{};
    const auto include = [&](const SDL_Rect &rect) {
        if (rect.w <= 0 || rect.h <= 0) return;
        if (bounds.w <= 0 || bounds.h <= 0) bounds = rect;
        else SDL_UnionRect(&bounds, &rect, &bounds);
    };
    if (document_flow) {
        // A flow owns independently positioned rows. Keep its conservative
        // clipping path instead of bounding it by the owner's source row.
        bounds = screen;
    } else {
        if (graphical_clear) {
            include({origin_x + match.graphical_clear_x * tile_w,
                origin_y + match.graphical_clear_y * tile_h,
                match.graphical_clear_width * tile_w,
                match.graphical_clear_height * tile_h});
            if (match.graphical_auto_foreground) {
                include({origin_x + match.graphical_clear_x * tile_w,
                    origin_y + match.layout_y * tile_h +
                        std::max(0, match.layout_pixel_y - 5),
                    match.graphical_clear_width * tile_w, tile_h + 3});
            }
        }
        if (!match.target.empty()) {
            if (match.rule == -8 || (config_.clear_background && !g_copy_hook_active))
                include({origin_x + match.x * tile_w,
                    origin_y + match.y * tile_h, match.length * tile_w, tile_h});
            const int text_x = match.layout_x >= 0 ? match.layout_x : match.x;
            const bool native_baseline = match.native_split_text && !match.layout_fixed_baseline;
            const int text_y = native_baseline ? match.native_split_top_y
                : (match.layout_y >= 0 ? match.layout_y : match.y);
            const int pixel_y = native_baseline ? tile_h / 2 : match.layout_pixel_y;
            const int text_length = match.layout_length > 0 ? match.layout_length : match.length;
            const bool exact_box = match.layout_box_pixel_x >= 0 &&
                match.layout_box_pixel_width > 0;
            const bool locked = match.layout_ellipsize || match.layout_lock_font_pixels ||
                match.rule == kNativeKnowledgeDocumentRule;
            SDL_Rect text{
                (exact_box ? match.layout_box_pixel_x : origin_x + text_x * tile_w) +
                    config_.horizontal_padding,
                origin_y + text_y * tile_h + pixel_y,
                std::max(1, (exact_box ? match.layout_box_pixel_width : text_length * tile_w) -
                    2 * config_.horizontal_padding),
                match.layout_line_height_pixels > 0 ? match.layout_line_height_pixels : tile_h};
            const SDL_Rect text_region = native_text_draw_region(match);
            const auto include_text = [&](const SDL_Rect &rect) {
                SDL_Rect visible{};
                if (SDL_IntersectRect(&rect, &text_region, &visible)) include(visible);
            };
            include_text(text);
            // Background caching uses the same native anchor, fixed line box
            // and clipping region as the actual translated draw.
            std::string ellipsized;
            const std::string *display_text = &match.target;
            if (match.layout_ellipsize) {
                display_text = &ellipsized;
                if (const auto fitted = ellipsize_text(match.target, text.w))
                    ellipsized = fitted->text;
            }
            const auto *glyph = get_glyph_texture(renderer, *display_text,
                std::max(1, text.w), text.h, match.layout_font_pixels,
                match.layout_visual_height_pixels, locked);
            if (glyph && glyph->texture) {
                const bool left_align = match.layout_x >= 0 ? match.layout_left
                    : match.rule >= 0 && static_cast<size_t>(match.rule) < rules_.size() &&
                        rules_[static_cast<size_t>(match.rule)].left_align;
                SDL_Rect drawn = glyph->destination(text, left_align, locked);
                if (match.layout_right) drawn.x = text.x + text.w - drawn.w;
                include_text(drawn);
            }
        }
    }
    SDL_Rect visible_bounds{};
    if (!SDL_IntersectRect(&bounds, &screen, &visible_bounds)) return;
    bounds = visible_bounds;
    SDL_Rect saved_clip{};
    const bool had_clip = SDL_RenderIsClipEnabled(renderer) == SDL_TRUE;
    SDL_RenderGetClipRect(renderer, &saved_clip);
    if (had_clip) {
        if (!SDL_IntersectRect(&bounds, &saved_clip, &visible_bounds)) return;
        bounds = visible_bounds;
    }
    const bool tooltip_text = !match.native_help_occluder &&
        !match.native_hover_background && !match.native_help_background_frames &&
        (match.rule == kToolbarTooltipBodyRule || match.rule == kToolbarTooltipKeyRule ||
         (match.x > frame.x && match.y > frame.y &&
          match.x + match.length < frame.x + frame.w && match.y < frame.y + frame.h - 1));
    const SDL_Rect popup{left, top, right - left, bottom - top};
    if (!tooltip_text && !SDL_HasIntersection(&bounds, &popup)) {
        draw_match(renderer, match);
        return;
    }
    const auto draw_in = [&](SDL_Rect clip) {
        if (had_clip) {
            SDL_Rect intersection{};
            if (!SDL_IntersectRect(&clip, &saved_clip, &intersection)) return;
            clip = intersection;
        }
        if (clip.w <= 0 || clip.h <= 0) return;
        if (!SDL_HasIntersection(&bounds, &clip)) return;
        SDL_RenderSetClipRect(renderer, &clip);
        draw_match(renderer, match);
    };
    if (tooltip_text) {
        // Translated foreground belongs to the native widget's content area.
        // Keep its own skin and border intact even when glyph bounds are larger.
        SDL_Rect native_inner{display_frame.x + tile_w, display_frame.y + tile_h,
            std::max(0, display_frame.w - 2 * tile_w),
            std::max(0, display_frame.h - 2 * tile_h)};
        if (match.rule == kToolbarTooltipBodyRule && g_native_toolbar_tooltip->keys_y >= 0)
            native_inner.h = std::min(native_inner.h, std::max(0,
                origin_y + g_native_toolbar_tooltip->keys_y * tile_h - native_inner.y));
        draw_in(native_inner);
    } else {
        draw_in({0, 0, gps_->screen_pixel_x, top});
        draw_in({0, bottom, gps_->screen_pixel_x, gps_->screen_pixel_y - bottom});
        draw_in({0, top, left, bottom - top});
        draw_in({right, top, gps_->screen_pixel_x - right, bottom - top});
    }
    SDL_RenderSetClipRect(renderer, had_clip ? &saved_clip : nullptr);
}
