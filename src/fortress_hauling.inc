// Hauling names are complete editable labels. Generic word/name matching
// must not translate custom names or centre each fragment in its English
// span. The current native action strip establishes each row's identity.
struct FortressHaulingRow {
    int left, right, source_right;
    bool stop;
};

static std::optional<FortressHaulingRow> native_fortress_hauling_row(
        const graphicst &gps, const NativePanelBorders &borders, int y) {
    for (int action = 3; action + 16 <= gps.dimx; ++action) {
        // 53.16 button_main[417..428], not the similarly named hover
        // instruction enum. Both graphical and classic skins are read.
        const bool route = native_main_button_at(gps, action, y, 417) &&
            native_main_button_at(gps, action + 4, y, 418) &&
            native_main_button_at(gps, action + 8, y, 425) &&
            native_main_button_at(gps, action + 12, y, 427);
        const bool stop = !route && action + 20 <= gps.dimx &&
            native_main_button_at(gps, action, y, 422) &&
            native_main_button_at(gps, action + 4, y, 423) &&
            native_main_button_at(gps, action + 8, y, 424) &&
            native_main_button_at(gps, action + 12, y, 426) &&
            native_main_button_at(gps, action + 16, y, 428);
        if (!route && !stop) continue;
        // The entire action strip belongs inside the list frame. A name's
        // left edge must not depend on its length or the Add button caption.
        const auto panel = native_panel_interior(borders, gps,
            SDL_Rect{action, y - 1, stop ? 20 : 16, 3});
        if (!panel) continue;
        const int left = panel->x + (stop ? 2 : 1);
        const int right = action - (stop ? 11 : 1);
        if (right <= left) continue;
        return FortressHaulingRow{left, right, action - (stop ? 9 : 0), stop};
    }
    return std::nullopt;
}

void Overlay::append_fortress_hauling_rows(std::vector<std::string> &rows,
        std::vector<Match> &matches, int only_y, bool raw_layer) const {
    if (!gps_ || rows.size() != static_cast<size_t>(gps_->dimy)) return;
    auto context = rows;
    // Other field owners may already have consumed the work buffer. Read
    // page identity from the live grid in both matching passes.
    for (int y = 0; y < gps_->dimy; ++y)
        for (int x = 0; x < gps_->dimx; ++x) {
            const auto ch = visible_char_at(x, y);
            context[y][x] = ch ? static_cast<char>(ch) : ' ';
        }
    const auto append = [&](int x, int y, const std::string &source,
                            const std::string &target, int rule, int left, int right) {
        if (source.empty() || target.empty() || right <= left ||
            (only_y >= 0 && only_y != y)) return;
        const int length = static_cast<int>(source.size());
        if (rows[y].compare(x, length, source) == 0) {
            Match match{x, y, length, rule, target, source};
            match.layout_x = left;
            match.layout_length = right - left;
            match.layout_clip_right = right;
            match.layout_left = rule == kFortressHaulingNameRule;
            matches.push_back(std::move(match));
            std::fill_n(rows[y].begin() + x, length, ' ');
        } else if (raw_layer) {
            // A complete caption can span native layers. Its final composite
            // owns the overlay; each raw layer suppresses only equal bytes.
            for (int offset = 0; offset < length;) {
                while (offset < length && rows[y][x + offset] != source[offset]) ++offset;
                const int start = offset;
                while (offset < length && rows[y][x + offset] == source[offset]) ++offset;
                if (offset == start) continue;
                matches.push_back({x + start, y, offset - start, rule, {},
                    source.substr(start, offset - start)});
                std::fill_n(rows[y].begin() + x + start, offset - start, ' ');
            }
        }
    };

    const NativePanelBorders borders(*gps_);
    constexpr std::string_view add_route = "Add new route";
    for (int y = 1; y + 1 < gps_->dimy; ++y) {
        const auto at = context[y].find(add_route);
        if (at == std::string::npos) continue;
        const int x = static_cast<int>(at), end = x + static_cast<int>(add_route.size());
        const auto button = native_button_text_rect(*gps_, x, end, y);
        if (!button) continue;
        const auto frame = native_panel_interior(borders, *gps_, x, end, y);
        if (!frame) continue;
        if (const auto target = exact_literal_translation(add_route))
            append(x, y, std::string(add_route), *target, kFortressHaulingCaptionRule,
                button->x, button->x + button->w);
    }
    const auto clipped = captured_clipped_captions();
    const int first_y = only_y >= 0 ? std::max(1, only_y) : 1;
    const int last_y = only_y >= 0 ? std::min(gps_->dimy - 1, only_y + 1)
        : gps_->dimy - 1;
    for (int y = first_y; y < last_y; ++y) {
        const auto row = native_fortress_hauling_row(*gps_, borders, y);
        if (!row) continue;
        const bool stop = row->stop;
        // PE 0x3f0a5e..0x3f0b09: stop names are indented one cell and
        // reserve the vehicle-status icon and its loading percentage.
        const int left = row->left, right = row->right;
        const int source_right = row->source_right;
        const std::string_view slot(context[y].data() + left, source_right - left);
        const auto visible = trim_view(slot);
        if (visible.empty()) continue;
        const int x = left + static_cast<int>(visible.data() - slot.data());
        const std::string source(visible);
        std::string complete = source;
        for (const auto &capture : clipped) {
            if (capture.x == x && capture.y == y && capture.visible == source) {
                complete = capture.complete;
                break;
            }
        }
        if (complete.find_first_of("\r\n") != std::string::npos) continue;
        std::string target;
        const std::string_view prefix = stop ? "Stop " : "Route ";
        if (complete.starts_with(prefix) && complete.size() > prefix.size() &&
            std::all_of(complete.begin() + prefix.size(), complete.end(),
                [](unsigned char ch) { return ch >= '0' && ch <= '9'; })) {
            if (const auto label = exact_literal_translation(stop ? "Hauling: Stop" : "Hauling: Route"))
                target = *label + " " + complete.substr(prefix.size());
        }
        if (target.empty()) {
            // Names such as Mag1 and WastePitGather are user content,
            // not generated dwarf identities or independently translated
            // dictionary words. Keep UTF-8 names and ASCII digits intact.
            std::vector<uint32_t> codepoints;
            target = decode_utf8(complete, codepoints) ? complete : cp437_to_utf8(complete);
        }
        append(x, y, source, target, kFortressHaulingNameRule, left, right);
    }
}

void Overlay::layout_fortress_hauling(SDL_Renderer *renderer) {
    if (!gps_ || !renderer || !face_ || gps_->tile_pixel_y <= 0) return;
    const int pixels = std::clamp(static_cast<int>(gps_->tile_pixel_y * config_.font_scale),
        1, gps_->tile_pixel_y);
    const NativePanelBorders borders(*gps_);
    for (Match &match : prepared_matches_) {
        if (match.target.empty() || match.native_split_duplicate) continue;
        if (match.rule == kFortressHaulingNameRule) {
            const auto row = native_fortress_hauling_row(*gps_, borders, match.y);
            if (!row) continue;
            // Restore the native name column after generic panel layout;
            // every route uses the same list inset, including custom names.
            match.layout_x = row->left;
            match.layout_length = row->right - row->left;
            match.layout_clip_right = row->right;
            match.layout_left = true;
            match.layout_box_pixel_x = -1;
            match.layout_box_pixel_width = 0;
            match.layout_right = false;
            layout_fortress_text_rows(renderer, {{&match}}, row->left, row->right);
        } else if (match.rule == kFortressHaulingCaptionRule) {
            // One Chinese caption uses the whole green button, rather than
            // centring only the translated Add within its old three cells.
            match.layout_left = match.layout_right = false;
            match.layout_box_pixel_x = -1;
            match.layout_box_pixel_width = 0;
            match.layout_font_pixels = pixels;
            match.layout_lock_font_pixels = true;
            match.layout_visual_height_pixels = 0;
            match.layout_line_height_pixels = gps_->tile_pixel_y;
        }
    }
}
