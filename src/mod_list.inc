// viewscreen_titlest::managing_mods owns authored package identifiers.
// PE 53.16: Steam 0x25a2e8..0x25a7df; classic 0x258a53..0x258db4.
// Both writers join name + displayed_version, shorten that complete field,
// and draw Installed and the hover description in separate native columns.
struct NativeModListLayout {
    int left = 0, right = 0, first_y = 0, bottom = 0;
    int header_right = 0;
    int details_left = 0, details_right = 0, frame_right = 0;
    std::array<Match, 2> headers{};

    bool owns_name(const Match &match) const {
        return match.y >= first_y && match.y < bottom &&
            (match.y - first_y) % 3 < 2 &&
            match.x < right && left < match.x + match.length;
    }

    bool owns_details(const Match &match) const {
        return match.y >= 2 && match.y < bottom &&
            match.x < frame_right && details_left < match.x + match.length;
    }
};

template<class ReadChar>
static std::optional<NativeModListLayout> native_mod_list_layout(
        const graphicst &gps, const ReadChar &read_char) {
    constexpr std::string_view install =
        "Mods install automatically when chosen during world creation.";
    constexpr std::string_view click = "Click a mod to open its folder.";
    constexpr std::string_view click_legacy =
        "Click a mod to open its folder. This may not work on all systems.";
    const auto literal_at = [&](int x, int y, std::string_view source) {
        if (x < 0 || x >= gps.dimx || y < 0 || y >= gps.dimy ||
            source.size() > static_cast<size_t>(gps.dimx - x)) return false;
        for (size_t offset = 0; offset < source.size(); ++offset)
            if (read_char(x + static_cast<int>(offset), y) !=
                static_cast<unsigned char>(source[offset])) return false;
        return true;
    };
    const NativePanelBorders borders(gps);
#ifdef _WIN32
    // These PE writers use absolute top rows even when L/R are inset.
    // Immediate glyph matching also calls this reader; do not scan the map.
    for (int y : {3, 6}) {
        if (y >= gps.dimy) continue;
#else
    for (int y = 0; y < gps.dimy; ++y) {
#endif
        for (int x = 0; x + static_cast<int>(install.size()) <= gps.dimx; ++x) {
            if (read_char(x, y) != 'M' || !literal_at(x, y, install)) continue;
            const auto panel = native_panel_interior(borders, gps,
                x, x + static_cast<int>(install.size()), y);
            if (!panel || x != panel->x + 1) continue;
            // The native instructions occupy consecutive rows. The optional
            // Publish mods section moves the whole block down three rows.
            const int click_y = y + 1;
            if (!literal_at(x, click_y, click)) continue;
            const int frame_left = panel->x - 1;
            const int frame_right = panel->x + panel->w;
            const int divider = (frame_left + 2 * frame_right) / 3;
            std::optional<SDL_Rect> done;
            for (int row = std::max(panel->y, y - 1);
                    row <= std::min(click_y, panel->y + panel->h - 1) && !done; ++row) {
                for (int column = divider - 10; column < divider - 4; ++column) {
                    if (!literal_at(column, row, "Done")) continue;
                    const auto button = native_intro_button_text_rect(gps,
                        column, column + 4, row);
                    if (button && button->x + 10 == divider &&
                        button->y >= panel->y && button->y + button->h <= panel->y + panel->h)
                        done = button;
                }
            }
            if (!done) continue;
            int name_right = x + 40;
            if (name_right >= divider - 10) name_right = divider - 19;
            if (name_right <= x || click_y + 3 >= panel->y + panel->h) continue;
            const auto click_source = literal_at(x, click_y, click_legacy)
                ? click_legacy : click;
            NativeModListLayout layout{x, name_right, click_y + 3,
                panel->y + panel->h, done->x - 1,
                divider + 2, frame_right - 2, frame_right};
            layout.headers = {{
                Match{x, y, static_cast<int>(install.size()), kUiMessageRule, {}, std::string(install)},
                Match{x, click_y, static_cast<int>(click_source.size()), kUiMessageRule, {}, std::string(click_source)},
            }};
            return layout;
        }
    }
    return std::nullopt;
}

// The hover record is a typed column, not a bag of dictionary words.
// Translate only fixed labels. Authored content keeps its native rendering.
void Overlay::append_mod_list_details(const NativeModListLayout &layout,
        std::vector<std::string> &rows, std::vector<Match> &matches) const {
    const int left = layout.details_left, right = layout.details_right;
    if (right <= left || layout.bottom <= 2) return;
    auto context = rows;
    for (int y = 2; y < layout.bottom; ++y)
        for (int x = left; x < layout.frame_right; ++x) {
            bool top = false;
            const auto *cell = cell_at(x, y, &top);
            context[y][x] = cell && cell[0] ? static_cast<char>(cell[0]) : ' ';
        }
    const int tile_w = gps_->tile_pixel_x, tile_h = gps_->tile_pixel_y;
    const int origin_x = (gps_->screen_pixel_x - gps_->dimx * tile_w) / 2;
    const int origin_y = (gps_->screen_pixel_y - gps_->dimy * tile_h) / 2;
    const auto field = [&](int y) -> std::optional<Match> {
        if (y < 2 || y >= layout.bottom) return std::nullopt;
        const auto band = std::string_view(context[y]).substr(left, layout.frame_right - left);
        const auto source = trim_view(band);
        if (source.empty()) return std::nullopt;
        const int x = left + static_cast<int>(source.data() - band.data());
        return Match{x, y, static_cast<int>(source.size()), kUiMessageRule, {}, std::string(source)};
    };
    const auto append_field = [&](Match row, std::string_view label,
                                  std::string_view value) {
        if (rows[row.y].compare(row.x, row.source.size(), row.source) != 0) return;
        const auto target = exact_literal_translation("Mod details label: " + std::string(label));
        if (!target) return;
        row.target = *target;
        row.target += native_text_to_utf8(value);
        row.layout_x = left;
        row.layout_length = right - left;
        row.layout_clip_right = right;
        row.layout_left = true;
        row.layout_font_pixels = unified_font_pixels();
        row.layout_line_height_pixels = tile_h;
        row.layout_lock_font_pixels = true;
        row.layout_ellipsize = true;
        row.layout_native_clip = SDL_Rect{origin_x + left * tile_w,
            origin_y + row.y * tile_h, (right - left) * tile_w, tile_h};
        matches.push_back(std::move(row));
    };
    struct Metadata { int y; std::string_view prefix, label; };
    for (const Metadata &metadata : {
            Metadata{3, "Author: ", "Author"},
            Metadata{4, "Version: ", "Version"},
            Metadata{5, "Earliest compatible version: ", "Earliest compatible version"}}) {
        auto row = field(metadata.y);
        if (!row || row->x != left || !row->source.starts_with(metadata.prefix)) continue;
        // Own the complete field so author IDs and dotted version suffixes
        // cannot be consumed by word rules or partial numeric templates.
        const std::string value = row->source.substr(metadata.prefix.size());
        append_field(std::move(*row), metadata.label, value);
    }
    for (int y : {6, 7}) {
        auto row = field(y);
        if (!row || row->x != left || row->source != "Description:") continue;
        append_field(std::move(*row), "Description", {});
        break;
    }
    // Native relationship rows draw a bright-white prefix, then a separate
    // bright-cyan ID at the current cursor. The ID is neither translated nor
    // redrawn, so its original font, color and horizontal position survive.
    const auto palette_at = [&](int x, int y, int palette) {
        bool top = false;
        const auto *cell = cell_at(x, y, &top);
        return cell && cell[1] == gps_->uccolor[palette][0] &&
            cell[2] == gps_->uccolor[palette][1] &&
            cell[3] == gps_->uccolor[palette][2];
    };
    struct Dependency { std::string_view prefix, label; };
    for (int y = 5; y < std::min(layout.bottom, gps_->dimy - 12); ++y) {
        auto row = field(y);
        if (!row || row->x != left) continue;
        for (const Dependency &dependency : {
                Dependency{"Must be after ", "Must be after"},
                Dependency{"Must be before ", "Must be before"},
                Dependency{"Requires ", "Requires"},
                Dependency{"Conflicts with ", "Conflicts with"}}) {
            const int length = static_cast<int>(dependency.prefix.size());
            if (row->source.size() <= dependency.prefix.size() ||
                !row->source.starts_with(dependency.prefix) ||
                left + length >= right || !palette_at(left + length, y, 11)) continue;
            bool label_ink = true;
            for (int offset = 0; offset < length; ++offset)
                if (dependency.prefix[offset] != ' ' &&
                    !palette_at(left + offset, y, 15)) label_ink = false;
            if (!label_ink ||
                rows[y].compare(left, dependency.prefix.size(), dependency.prefix) != 0) continue;
            const auto target = exact_literal_translation(
                "Mod dependency label: " + std::string(dependency.label));
            if (!target) continue;
            Match label{left, y, length, kUiMessageRule, *target,
                std::string(dependency.prefix)};
            label.layout_x = left;
            label.layout_length = length;
            label.layout_clip_right = left + length;
            label.layout_left = true;
            label.layout_font_pixels = unified_font_pixels();
            label.layout_line_height_pixels = tile_h;
            label.layout_lock_font_pixels = true;
            label.layout_ellipsize = true;
            label.layout_native_clip = SDL_Rect{origin_x + left * tile_w,
                origin_y + y * tile_h, length * tile_w, tile_h};
            matches.push_back(std::move(label));
            break;
        }
    }
    // Reserve the whole right column only in the matching work buffer.
    // Titles, prose and dependency IDs retain native glyphs, wrapping and
    // spacing. Only fixed metadata rows and relationship prefixes change.
    for (int y = 2; y < layout.bottom; ++y)
        std::fill(rows[y].begin() + left, rows[y].begin() + layout.frame_right, ' ');
}
