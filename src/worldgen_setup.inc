// Detailed parameters have their own persistent toolbar/footer identity.
// Yes/No and Range rows are shared widgets, NOT evidence of the Game settings
// page. Claim this form before the generic settings/prose passes can move its
// Width, Height, seed and preset fields into a single settings-label column.
bool Overlay::layout_worldgen_parameters(SDL_Renderer *renderer) {
    if (!gps_ || !face_ || !renderer || gps_->tile_pixel_x <= 0 ||
        gps_->tile_pixel_y <= 0) return false;
    auto &matches = prepared_matches_;
    const Match *new_set = nullptr, *basic = nullptr, *create = nullptr;
    for (const Match &match : matches) {
        if (match.target.empty() || match.native_split_duplicate) continue;
        const std::string source = lower(trim(match.source));
        if (source == "new parameter set") new_set = &match;
        if (source == "basic options") basic = &match;
        if (source == "create world") create = &match;
    }
    if (!new_set || !basic || !create || new_set->y >= basic->y ||
        std::abs(basic->y - create->y) > 1) return false;

    const int tile_w = gps_->tile_pixel_x, tile_h = gps_->tile_pixel_y;
    const int origin_x = (gps_->screen_pixel_x - gps_->dimx * tile_w) / 2;
    const int origin_y = (gps_->screen_pixel_y - gps_->dimy * tile_h) / 2;
    const auto settings = native_ui_settings();
    const NativePanelBorders borders(*gps_);
    struct Field {
        size_t index;
        int left, width;
        bool action;
        std::optional<SDL_Rect> clip{};
    };
    std::vector<Field> fields;
    for (size_t index = 0; index < matches.size(); ++index) {
        const Match &match = matches[index];
        if (match.target.empty() || match.native_split_duplicate ||
            match.x < 0 || match.y < 0 || match.y >= gps_->dimy ||
            match.length <= 0 || match.length > gps_->dimx - match.x) continue;
        const std::string source = lower(trim(match.source));
        const bool action = source == "new parameter set" || source == "save" ||
            source == "load" || source == "copy" || source == "delete" ||
            source == "create world" || source == "basic options" ||
            source == "mods" || source == "back to main menu" ||
            source == "back to title menu";
        int left = match.x, right = match.x + match.length;
        // A complete current button supplies the horizontal text budget. The
        // optional second-line caption is part of this form's native control,
        // not a reason to merge adjacent rows or their equally-valued ranges.
        std::optional<SDL_Rect> button;
        if (settings) button = native_intro_button_text_rect(*gps_, left,
            right, match.y, *settings, true);
        if (button) {
            if (action) left = button->x;
            right = button->x + button->w;
        }
        std::optional<SDL_Rect> clip;
        if (button) {
            clip = SDL_Rect{origin_x + left * tile_w, origin_y + button->y * tile_h,
                (right - left) * tile_w, button->h * tile_h};
        } else if (const auto panel = native_panel_interior(borders, *gps_,
                match.x, match.x + match.length, match.y)) {
            right = panel->x + panel->w;
            for (const Match &other : matches) {
                if (!other.target.empty() && !other.native_split_duplicate && other.y == match.y &&
                    other.x >= match.x + match.length && other.x < right)
                    right = other.x;
            }
            clip = SDL_Rect{origin_x + left * tile_w,
                origin_y + (match.native_split_text ? match.native_split_top_y : match.y) * tile_h,
                (right - left) * tile_w, (match.native_split_text ? 2 : 1) * tile_h};
        }
        // Unframed fields retain their native anchor without treating their
        // English glyph run as evidence of a control's drawing boundary.
        fields.push_back({index, origin_x + left * tile_w,
            (right - left) * tile_w, action, clip});
    }

    // Preserve native row/half-row baselines and confirmed control bounds.
    const int pixels = unified_font_pixels();
    for (Field &field : fields) {
        Match &match = matches[field.index];
        match.layout_x = (field.left - origin_x) / tile_w;
        match.layout_length = (field.width + tile_w - 1) / tile_w;
        if (field.clip) {
            match.layout_box_pixel_x = field.left;
            match.layout_box_pixel_width = field.width;
            match.layout_native_clip = field.clip;
            match.layout_ellipsize = true;
        }
        match.layout_left = !field.action;
        match.layout_font_pixels = pixels;
        match.layout_visual_height_pixels = 0;
        match.layout_line_height_pixels = tile_h;
        match.layout_lock_font_pixels = true;
    }
    static bool logged = false;
    if (!logged) {
        logged = true;
        log_line("INFO", "Detailed world parameters layout: native field anchors; fields=" +
            std::to_string(fields.size()) + "; font_pixels=" + std::to_string(pixels));
    }
    return true;
}

// Basic world creation is a matrix of independent native buttons, not the
// scrolling detailed-parameters form. English run lengths are suppression
// spans only: they do not describe either the heading column or the buttons.
bool Overlay::layout_worldgen_setup(SDL_Renderer *renderer) {
    if (!gps_ || !face_ || !renderer || gps_->tile_pixel_x <= 0 ||
        gps_->tile_pixel_y <= 0) return false;
    auto &matches = prepared_matches_;
    std::vector<size_t> headings;
    bool has_size = false, has_history = false;
    int footer_y = -1;
    for (size_t i = 0; i < matches.size(); ++i) {
        const Match &match = matches[i];
        if (match.target.empty() || match.native_split_duplicate) continue;
        const std::string source = lower(match.source);
        if (source == "create world") footer_y = match.y;
        if (source == "world map size") has_size = true;
        if (source == "history length") has_history = true;
        if (source == "world map size" || source == "history length" ||
            source == "number of civilizations" || source == "maximum number of sites" ||
            source == "number of beasts" || source == "natural savagery" ||
            source == "real world extinct creatures" ||
            source == "real-world extinct creatures" || source == "mineral occurrence")
            headings.push_back(i);
    }
    // The detailed form and welcome dialog must not inherit these columns.
    if (!has_size || !has_history || headings.size() < 6 || footer_y < 0)
        return false;
    const auto settings = native_ui_settings();
    if (!settings) return false;
    const int tile_w = gps_->tile_pixel_x, tile_h = gps_->tile_pixel_y;
    const int origin_x = (gps_->screen_pixel_x - gps_->dimx * tile_w) / 2;
    const int origin_y = (gps_->screen_pixel_y - gps_->dimy * tile_h) / 2;
    const int padding = std::max(0, config_.horizontal_padding);
    struct Button { size_t index; SDL_Rect rect; };
    std::vector<Button> buttons;
    int first_y = footer_y, heading_left = gps_->dimx;
    for (size_t i : headings) {
        first_y = std::min(first_y, matches[i].y);
        heading_left = std::min(heading_left, matches[i].x);
    }
    int option_right = -1;
    for (size_t i = 0; i < matches.size(); ++i) {
        const Match &match = matches[i];
        if (match.target.empty() || match.native_split_duplicate ||
            match.y <= first_y || match.y > footer_y + 1) continue;
        if (const auto rect = native_intro_button_text_rect(*gps_, match.x,
                match.x + match.length, match.y, *settings)) {
            buttons.push_back({i, *rect});
            if (match.y < footer_y) option_right = std::max(option_right, rect->x + rect->w);
        }
    }
    if (buttons.empty() || option_right <= heading_left) return false;

    // Hints retain the native setting row and their separate field anchors.
    std::map<int, std::vector<size_t>> hints;
    std::map<int, int> row_rights;
    const NativePanelBorders borders(*gps_);
    for (size_t h : headings) {
        const Match &heading = matches[h];
        // A foreground modal can share the heading's native row. Its title
        // and prose are not setting hints, even if their translations were
        // not claimed by a document owner. Never pull text across a current
        // frame edge into the background's heading/hint columns.
        int row_right = heading.x + heading.length;
        while (row_right < gps_->dimx &&
            !borders.at(row_right, heading.y, 3) &&
            !borders.at(row_right, heading.y, 5)) ++row_right;
        row_rights[heading.y] = row_right;
        for (size_t i = 0; i < matches.size(); ++i) {
            const Match &match = matches[i];
            if (match.target.empty() || match.native_split_duplicate ||
                match.y != heading.y || match.x < heading.x + heading.length ||
                match.x + match.length > row_right)
                continue;
            hints[heading.y].push_back(i);
        }
    }
    for (auto &[row, indices] : hints) {
        (void)row;
        std::sort(indices.begin(), indices.end(), [&](size_t a, size_t b) {
            return matches[a].x < matches[b].x;
        });
    }
    // The skin owns button widths; adjacent native fields own the heading
    // and hint columns. Translated glyph widths never move these boundaries.
    struct Field {
        size_t index;
        int left, width;
        bool left_align;
        SDL_Rect clip;
    };
    std::vector<Field> fields;
    const int pixels = unified_font_pixels();
    for (const Button &button : buttons) {
        const SDL_Rect clip{origin_x + button.rect.x * tile_w,
            origin_y + button.rect.y * tile_h,
            button.rect.w * tile_w, button.rect.h * tile_h};
        fields.push_back({button.index, clip.x, clip.w, false, clip});
    }
    const auto append_field = [&](size_t index, int right) {
        const Match &match = matches[index];
        const int left = origin_x + match.x * tile_w;
        const int width = (right - match.x) * tile_w;
        if (width <= 2 * padding) return;
        const SDL_Rect clip{left,
            origin_y + (match.native_split_text ? match.native_split_top_y : match.y) * tile_h,
            width, (match.native_split_text ? 2 : 1) * tile_h};
        fields.push_back({index, left, width, true, clip});
    };
    for (size_t index : headings) {
        const auto found = hints.find(matches[index].y);
        const int right = found != hints.end() && !found->second.empty()
            ? matches[found->second.front()].x
            : std::min(option_right, row_rights[matches[index].y]);
        append_field(index, right);
    }
    for (const auto &[row, indices] : hints) {
        for (size_t position = 0; position < indices.size(); ++position) {
            const int right = position + 1 < indices.size()
                ? matches[indices[position + 1]].x : row_rights[row];
            append_field(indices[position], right);
        }
    }
    for (Field &field : fields) {
        Match &match = matches[field.index];
        match.layout_x = std::max(0, (field.left - origin_x) / tile_w);
        match.layout_length = std::max(1, (field.width + tile_w - 1) / tile_w);
        match.layout_box_pixel_x = field.left;
        match.layout_box_pixel_width = field.width;
        match.layout_left = field.left_align;
        match.layout_font_pixels = pixels;
        match.layout_visual_height_pixels = 0;
        match.layout_line_height_pixels = tile_h;
        match.layout_lock_font_pixels = true;
        match.layout_native_clip = field.clip;
        match.layout_ellipsize = true;
        // Keep source spans, split-caption identity, colors, skin and native
        // click regions untouched. This also excludes hints from prose reflow.
    }
    static bool logged = false;
    if (!logged) {
        logged = true;
        log_line("INFO", "World creation setup layout: headings=" +
            std::to_string(headings.size()) + "; native_buttons=" +
            std::to_string(buttons.size()) + "; font_pixels=" + std::to_string(pixels));
    }
    return true;
}
