// Both Escape menus use one font group. English captions describe
// suppression spans, not the width or centre of the underlying buttons.
bool Overlay::layout_pause_menu(SDL_Renderer *renderer) {
    if (!gps_ || !face_ || !renderer || gps_->tile_pixel_x <= 0 ||
        gps_->tile_pixel_y <= 0) return false;
    auto &matches = prepared_matches_;
    const auto has_caption = [&](std::string_view source) {
        return std::any_of(matches.begin(), matches.end(), [&](const Match &match) {
            return !match.target.empty() && !match.native_split_duplicate &&
                match.source == source;
        });
    };
    const bool compact = has_caption("Return to title menu") && has_caption("Continue");
    const auto is_action = [compact](std::string_view source) {
        if (compact) return is_embark_pause_action(source);
        return source == "Save and return to title menu" ||
            source == "Save and continue playing" ||
            source == "Retire the fortress (for the time being)" ||
            source == "Retire at this location (or rest a while)" ||
            source == "Abandon the fortress to ruin" ||
            source == "Quit without saving" || source == "Settings" ||
            source == "Return to game";
    };
    std::vector<size_t> actions;
    bool save = false, resume = false, settings = false;
    int first_y = gps_->dimy, last_y = -1;
    for (size_t i = 0; i < matches.size(); ++i) {
        const Match &match = matches[i];
        if (match.target.empty() || match.native_split_duplicate ||
            !is_action(match.source)) continue;
        actions.push_back(i);
        save |= match.source == "Save and return to title menu";
        resume |= match.source == "Return to game";
        settings |= match.source == "Settings";
        first_y = std::min(first_y, match.y);
        last_y = std::max(last_y, match.y);
    }
    // Compact-menu captions are detached while laying out the page behind
    // them. Its geometry is supplied by the modal owner only after replay
    // bounds have been resolved; never borrow a covered background button.
    if (compact) {
        if (!embark_pause_menu_active_ || !embark_pause_pixel_bounds_valid_)
            return false;
    } else if (!save || !resume || !settings || actions.size() < 4) return false;

    const int tile_w = gps_->tile_pixel_x, tile_h = gps_->tile_pixel_y;
    const int origin_x = (gps_->screen_pixel_x - gps_->dimx * tile_w) / 2;
    const int origin_y = (gps_->screen_pixel_y - gps_->dimy * tile_h) / 2;
    const int padding = std::max(0, config_.horizontal_padding);
    const auto ui = native_ui_settings();
    const NativePanelBorders borders(*gps_);
    struct Button { size_t index; std::optional<SDL_Rect> pixels; };
    std::vector<Button> buttons;
    int left = 0, right = gps_->screen_pixel_x;
    size_t native_buttons = 0;
    for (size_t i : actions) {
        const Match &match = matches[i];
        std::optional<SDL_Rect> pixels;
        if (compact) {
            // stabilize_embark_pause_menu owns the screen-centred native
            // button span. Source x is widget-local on this smaller modal.
            if (match.layout_x >= 0 && match.layout_length > 0)
                pixels = SDL_Rect{origin_x + match.layout_x * tile_w,
                    origin_y + match.y * tile_h, match.layout_length * tile_w, tile_h};
        } else {
            std::optional<SDL_Rect> rect;
            if (ui) rect = native_intro_button_text_rect(*gps_, match.x,
                match.x + match.length, match.y, *ui);
            if (!rect) rect = native_button_text_rect(*gps_, match.x,
                match.x + match.length, match.y);
            if (rect) pixels = SDL_Rect{origin_x + rect->x * tile_w,
                origin_y + rect->y * tile_h, rect->w * tile_w, rect->h * tile_h};
            else pixels = native_caption_button_rect(match);
        }
        if (pixels) {
            left = std::max(left, pixels->x);
            right = std::min(right, pixels->x + pixels->w);
            ++native_buttons;
        }
        buttons.push_back({i, pixels});
    }
    // Require current widget evidence. A shared intersection also tolerates
    // selected borders without moving labels by half an English grid cell.
    if (native_buttons < 2 || right - left <= 2 * padding) return false;

    struct Field {
        size_t index;
        int left, width, y, offset;
        bool left_align;
        std::vector<int> colors;
        std::optional<SDL_Rect> clip{};
    };
    std::vector<Field> fields;
    for (const Button &button : buttons) {
        const Match &match = matches[button.index];
        int y = match.y, offset = 0;
        if (button.pixels) {
            const int top = button.pixels->y + (button.pixels->h - tile_h) / 2 - origin_y;
            y = top / tile_h;
            offset = top - y * tile_h;
        }
        fields.push_back({button.index,
            button.pixels ? button.pixels->x : left,
            button.pixels ? button.pixels->w : right - left,
            y, offset, false, {}, button.pixels});
    }
    // The title uses the same exact pixel centre as the buttons. Its own
    // English run has an unrelated odd/even length and must not pick a centre.
    for (size_t i = 0; !compact && i < matches.size(); ++i) {
        const Match &match = matches[i];
        if (!match.target.empty() && !match.native_split_duplicate &&
            match.source == "Dwarf Fortress" && match.y < first_y &&
            origin_x + match.x * tile_w >= left &&
            origin_x + (match.x + match.length) * tile_w <= right)
            fields.push_back({i, left, right - left, match.y, 0, false, {}});
    }

    std::vector<size_t> soundtrack;
    std::optional<SDL_Rect> footer;
    for (size_t i = 0; i < matches.size(); ++i) {
        const Match &match = matches[i];
        if (match.target.empty() || match.native_split_duplicate ||
            match.y <= last_y || !is_embark_pause_soundtrack(match.source)) continue;
        const auto panel = native_panel_interior(borders, *gps_, match.x,
            match.x + match.length, match.y);
        if (panel) {
            if (footer && (footer->x != panel->x || footer->y != panel->y ||
                    footer->w != panel->w || footer->h != panel->h)) continue;
            footer = panel;
        }
        soundtrack.push_back(i);
    }
    // Use the music panel's interior and one native-cell inset, not the
    // changing widths/centres of the current and previous English track names.
    // If its frame is unavailable, the verified button column remains stable.
    const int footer_left = footer ? origin_x + (footer->x + 1) * tile_w : left;
    const int footer_width = footer ? (footer->w - 2) * tile_w : right - left;
    for (size_t i : soundtrack) {
        const Match &match = matches[i];
        bool top_layer = false;
        const auto *cell = cell_at(match.x, match.y, &top_layer);
        const int foreground = match.layout_foreground_rgb >= 0
            ? match.layout_foreground_rgb : cell
                ? (cell[1] << 16) | (cell[2] << 8) | cell[3] : 0xffffff;
        // Resolve the existing label/title/artist colors BEFORE assigning a
        // display row. Rasterize the result once: separate colored textures
        // otherwise choose their own size, baseline and extra edge padding.
        Match colored_source = match;
        colored_source.layout_y = -1;
        std::vector<int> colors = match.layout_glyph_foreground_rgb;
        if (colors.empty()) {
            for (const ColoredText &part : colored_match_text(colored_source, foreground)) {
                std::vector<uint32_t> cps;
                if (!decode_utf8(part.text, cps)) return false;
                colors.insert(colors.end(), cps.size(),
                    (part.r << 16) | (part.g << 8) | part.b);
            }
        }
        std::optional<SDL_Rect> clip;
        if (footer) clip = SDL_Rect{footer_left, origin_y + footer->y * tile_h,
            footer_width, footer->h * tile_h};
        fields.push_back({i, footer_left, footer_width, match.y, 0, true,
            std::move(colors), clip});
    }

    // Retain each native button and footer area at the shared fixed font.
    const int pixels = unified_font_pixels();
    for (Field &field : fields) {
        Match &match = matches[field.index];
        match.layout_x = std::max(0, (field.left - origin_x) / tile_w);
        match.layout_length = std::max(1, (field.width + tile_w - 1) / tile_w);
        match.layout_box_pixel_x = field.left;
        match.layout_box_pixel_width = field.width;
        match.layout_y = field.y;
        match.layout_pixel_y = field.offset;
        match.layout_fixed_baseline = true;
        match.layout_left = field.left_align;
        match.layout_font_pixels = pixels;
        match.layout_lock_font_pixels = true;
        match.layout_visual_height_pixels = 0;
        match.layout_line_height_pixels = tile_h;
        match.layout_native_clip = field.clip ? field.clip : std::optional<SDL_Rect>{
            SDL_Rect{field.left, origin_y + field.y * tile_h + field.offset,
                field.width, tile_h}};
        match.layout_ellipsize = true;
        if (!field.colors.empty()) match.layout_glyph_foreground_rgb = std::move(field.colors);
        // Source x/y/length and native split identities still own suppression.
        // Neither the button skin nor its native click target is modified.
    }
    static bool logged = false;
    if (!logged) {
        logged = true;
        log_line("INFO", "Pause menu layout: native_buttons=" +
            std::to_string(native_buttons) + "; soundtrack_rows=" +
            std::to_string(soundtrack.size()) + "; shared_font_pixels=" + std::to_string(pixels));
    }
    return true;
}
