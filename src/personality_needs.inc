// Creation shows each need and its strength as two separate native fields.
// Their English spans are not column bounds: centring each Chinese caption
// inside those spans makes both columns wander with the source word length.
void Overlay::layout_adventure_personality_needs(SDL_Renderer *renderer) {
    if (!gps_ || !face_ || !renderer ||
        gps_->tile_pixel_x <= 0 || gps_->tile_pixel_y <= 0) return;
    const auto row = [](const Match &match) {
        return match.native_split_text ? match.native_split_top_y : match.y;
    };
    int footer_y = gps_->dimy;
    bool personality = false;
    for (const Match &match : prepared_matches_) {
        if (match.target.empty() || match.native_split_duplicate) continue;
        if (match.source == "Accept personality") personality = true;
        if (match.source == "Accept personality" || match.source == "Full customization" ||
            match.source == "Change dream/goal (if possible)" ||
            match.source == "Randomize personality")
            footer_y = std::min(footer_y, row(match));
    }
    if (!personality) return;

    // These identify native fields only; translated captions and deity names
    // remain owned by the existing dictionary and template matcher.
    static constexpr std::string_view names[] = {
        "Socialize", "Drink alcohol", "Meditate", "Stay occupied", "Be creative",
        "Admire art", "Excitement", "Learn something", "Be with family",
        "Be with friends", "Hear eloquence", "Uphold tradition", "Self-examination",
        "Make merry", "Craft object", "Martial training", "Practice skill",
        "Take it easy", "Make romance", "See animal", "See great beast",
        "Acquire object", "Eat good meal", "Fight", "Cause trouble", "Argue",
        "Be extravagant", "Wander", "Help somebody", "Think abstractly"
    };
    const auto is_name = [&](const Match &match) {
        if (std::find(std::begin(names), std::end(names), match.source) != std::end(names))
            return true;
        return match.rule >= 0 && static_cast<size_t>(match.rule) < rules_.size() &&
            (rules_[static_cast<size_t>(match.rule)].source == "Pray to {s}" ||
             rules_[static_cast<size_t>(match.rule)].source == "Pray {s}");
    };
    const auto is_strength = [](std::string_view source) {
        return source == "Slight Need" || source == "Moderate Need" ||
            source == "Strong Need" || source == "Intense Need";
    };
    const auto complete_field = [&](const Match &match) {
        if (match.target.empty() || match.native_split_duplicate || match.legends_flow ||
            match.x < 0 || match.y < 0 || match.y >= gps_->dimy ||
            match.length <= 0 || match.length > gps_->dimx - match.x ||
            match.source.size() != static_cast<size_t>(match.length)) return false;
        std::string visible(static_cast<size_t>(gps_->dimx), ' ');
        for (int x = 0; x < gps_->dimx; ++x) {
            const unsigned char ch = visible_char_at(x, match.y);
            if (ch) visible[static_cast<size_t>(x)] = static_cast<char>(ch);
        }
        const auto edge = [&](int x, int direction) {
            if (x < 0 || x >= gps_->dimx) return true;
            if (is_cp437_box_separator(visible, static_cast<size_t>(x))) return true;
            if (visible[static_cast<size_t>(x)] != ' ') return false;
            x += direction;
            return x < 0 || x >= gps_->dimx || visible[static_cast<size_t>(x)] == ' ' ||
                is_cp437_box_separator(visible, static_cast<size_t>(x));
        };
        const bool fold_case = match.rule >= 0 && static_cast<size_t>(match.rule) < rules_.size() &&
            rules_[static_cast<size_t>(match.rule)].case_insensitive;
        return template_literal_at(visible, static_cast<size_t>(match.x), match.source, fold_case) &&
            edge(match.x - 1, -1) && edge(match.x + match.length, 1);
    };

    struct NeedRow { Match *name, *strength; };
    std::vector<NeedRow> entries;
    for (Match &strength : prepared_matches_) {
        if (!is_strength(strength.source) || row(strength) >= footer_y ||
            !complete_field(strength)) continue;
        Match *name = nullptr;
        for (Match &candidate : prepared_matches_) {
            if (row(candidate) != row(strength) ||
                candidate.x + candidate.length >= strength.x ||
                !is_name(candidate) || !complete_field(candidate)) continue;
            if (!name || candidate.x > name->x) name = &candidate;
        }
        if (name) entries.push_back({name, &strength});
    }
    if (entries.empty()) return;
    int name_left = gps_->dimx, name_right = 0;
    int strength_left = gps_->dimx;
    for (const NeedRow &entry : entries) {
        name_left = std::min(name_left, entry.name->x);
        name_right = std::max(name_right, entry.name->x + entry.name->length);
        strength_left = std::min(strength_left, entry.strength->x);
    }
    if (name_right >= strength_left) return;
    name_right = strength_left - 1;
    const int tile_w = gps_->tile_pixel_x, tile_h = gps_->tile_pixel_y;
    const int pixels = unified_font_pixels();
    const int origin_x = (gps_->screen_pixel_x - gps_->dimx * tile_w) / 2;
    const int origin_y = (gps_->screen_pixel_y - gps_->dimy * tile_h) / 2;
    const NativePanelBorders borders(*gps_);
    for (const NeedRow &entry : entries) {
        const auto panel = native_panel_interior(borders, *gps_,
            entry.strength->x, entry.strength->x + entry.strength->length,
            entry.strength->y);
        for (Match *label : {entry.name, entry.strength}) {
            const bool name = label == entry.name;
            const int field_left = name ? name_left : strength_left;
            // The next native field proves the name column's edge. For the
            // final column only the owning panel proves a right boundary;
            // the English strength word's last glyph does not.
            const int field_right = name ? name_right : panel
                ? panel->x + panel->w : -1;
            label->layout_x = field_left;
            label->layout_left = true;
            if (field_right > field_left) {
                const int pixel_x = origin_x + field_left * tile_w;
                const int width = (field_right - field_left) * tile_w;
                label->layout_length = field_right - field_left;
                label->layout_box_pixel_x = pixel_x;
                label->layout_box_pixel_width = width;
                label->layout_clip_right = field_right;
                label->layout_native_clip = SDL_Rect{pixel_x,
                    origin_y + row(*label) * tile_h, width,
                    (label->native_split_text ? 2 : 1) * tile_h};
                label->layout_ellipsize = true;
            }
            label->layout_font_pixels = pixels;
            label->layout_lock_font_pixels = true;
            label->layout_line_height_pixels = tile_h;
        }
    }
}
