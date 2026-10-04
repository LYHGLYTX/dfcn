// Title management and world/arena creation own authored package identifiers.
// PE 53.16: Steam 0x25a2e8..0x25a7df; classic 0x258a53..0x258db4.
// World/arena selector renderers: Steam 0xe00178 and 0xdf70b8 onward.
// Writers join name + displayed_version and shorten that complete field;
// package metadata and its wrapped prose use a separate native column.
struct NativeModListLayout {
    int left = 0, right = 0, first_y = 0, bottom = 0;
    int header_right = 0;
    int details_left = 0, details_right = 0, frame_right = 0;
    std::array<Match, 2> headers{};
    std::vector<SDL_Rect> name_columns;
    NativeModDetails details;

    bool owns_name(const Match &match) const {
        return std::any_of(name_columns.begin(), name_columns.end(),
            [&](const SDL_Rect &column) {
                return match.y >= column.y && match.y < column.y + column.h &&
                    match.x < column.x + column.w && column.x < match.x + match.length;
            });
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
    const NativeModDetails details = native_mod_details();
    if (details.kind == NativeModScreenKind::NewRegion ||
            details.kind == NativeModScreenKind::NewArena) {
        // The current screen's doing_mods flag owns both lists even before
        // any package is hovered. Native 53.16 places the selector above its
        // ten-row footer, with two dividers derived from the actual L/R frame.
        const int bottom = gps.dimy - 11;
        if (bottom <= 2) return std::nullopt;
        for (int frame_left = 0; frame_left < gps.dimx; ++frame_left) {
            if (!borders.at(frame_left, 0, 0) ||
                    !borders.at(frame_left, 1, 3) ||
                    !borders.at(frame_left, bottom - 1, 3)) continue;
            for (int frame_right = gps.dimx - 1; frame_right > frame_left; --frame_right) {
                if (!borders.at(frame_right, 0, 2) ||
                        !borders.at(frame_right, 1, 5) ||
                        !borders.at(frame_right, bottom - 1, 5)) continue;
                const int details_divider = (frame_left + 2 * frame_right) / 3;
                const int names_divider = (frame_left + details_divider) / 2;
                if (names_divider <= frame_left + 1 ||
                        details_divider <= names_divider + 1 ||
                        frame_right <= details_divider + 4) continue;
                NativeModListLayout layout;
                layout.left = frame_left + 1;
                layout.right = details_divider;
                layout.first_y = 2;
                layout.bottom = bottom;
                layout.details_left = details_divider + 2;
                layout.details_right = frame_right - 2;
                layout.frame_right = frame_right;
                layout.name_columns = {
                    {frame_left + 1, 2, names_divider - frame_left - 1, bottom - 2},
                    {names_divider + 1, 2, details_divider - names_divider - 1, bottom - 2},
                };
                layout.details = details;
                return layout;
            }
        }
        return std::nullopt;
    }
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
            NativeModListLayout layout;
            layout.left = x;
            layout.right = name_right;
            layout.first_y = click_y + 3;
            layout.bottom = panel->y + panel->h;
            layout.header_right = done->x - 1;
            layout.details_left = divider + 2;
            layout.details_right = frame_right - 2;
            layout.frame_right = frame_right;
            layout.headers = {{
                Match{x, y, static_cast<int>(install.size()), kUiMessageRule, {}, std::string(install)},
                Match{x, click_y, static_cast<int>(click_source.size()), kUiMessageRule, {}, std::string(click_source)},
            }};
            layout.name_columns.push_back({layout.left, layout.first_y,
                layout.right - layout.left, layout.bottom - layout.first_y});
            layout.details = details;
            return layout;
        }
    }
    return std::nullopt;
}

// The hover record owns its entire column. Only a native vanilla header can
// select the official description catalog; all authored names and third-party
// prose retain their original glyphs, wrapping and spacing.
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
    int description_y = -1;
    for (int y : {6, 7}) {
        auto row = field(y);
        if (!row || row->x != left || row->source != "Description:") continue;
        description_y = y + 2;
        append_field(std::move(*row), "Description", {});
        break;
    }
    const auto &details = layout.details;
    if (description_y >= 0 && details.header && details.header->vanilla &&
            !details.header->description.empty() && !details.description_rows.empty()) {
        const auto target = exact_literal_translation(
            "Vanilla mod description: " + details.header->description);
        std::vector<Match> description;
        bool same = target.has_value();
        for (size_t line = 0; same && line < details.description_rows.size(); ++line) {
            const int y = description_y + static_cast<int>(line);
            if (y >= layout.bottom) break;
            const auto expected = trim_view(details.description_rows[line]);
            auto row = field(y);
            if (expected.empty()) {
                same = !row;
                continue;
            }
            // The current native wrap output supplies every source row.
            // A matching prefix or one known word never owns a description.
            if (!row || row->x != left || row->source != expected ||
                    rows[y].compare(row->x, row->source.size(), row->source) != 0) {
                same = false;
                break;
            }
            description.push_back(std::move(*row));
        }
        if (same && !description.empty()) {
            const int bottom = std::min(layout.bottom, description_y +
                static_cast<int>(details.description_rows.size()));
            for (Match &row : description)
                row.layout_native_clip = SDL_Rect{origin_x + left * tile_w,
                    origin_y + description_y * tile_h, (right - left) * tile_w,
                    (bottom - description_y) * tile_h};
            // One measured Chinese paragraph replaces all English rows,
            // including source-only tails when the translation is shorter.
            append_bounded_paragraph(std::move(description), *target, rows,
                matches, -1, right, right, {}, false, left);
        }
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
    // Native prose is white; this exact cyan instruction is a separate game
    // field after the prose/dependencies. Its translation does not depend on
    // identifying a package or translating that package's description.
    if (description_y >= 0) {
        for (int y = description_y + 1; y < layout.bottom; ++y) {
            auto row = field(y);
            if (!row || row->x != left || row->source != "Click now to open to this mod folder." ||
                    rows[y].compare(row->x, row->source.size(), row->source) != 0) continue;
            bool instruction = true;
            for (size_t offset = 0; offset < row->source.size(); ++offset)
                if (row->source[offset] != ' ' &&
                        !palette_at(left + static_cast<int>(offset), y, 11)) instruction = false;
            const auto target = instruction ? exact_literal_translation(row->source) : std::nullopt;
            if (!target) continue;
            row->target = *target;
            row->layout_x = left;
            row->layout_length = right - left;
            row->layout_clip_right = right;
            row->layout_left = true;
            row->layout_font_pixels = unified_font_pixels();
            row->layout_line_height_pixels = tile_h;
            row->layout_lock_font_pixels = true;
            row->layout_ellipsize = true;
            row->layout_native_clip = SDL_Rect{origin_x + left * tile_w,
                origin_y + y * tile_h, (right - left) * tile_w, tile_h};
            matches.push_back(std::move(*row));
        }
    }
    // Reserve the whole right column only in the matching work buffer.
    // No generic word, title or captured-paragraph reader can translate an
    // authored field or bring back fragments of the original description.
    for (int y = 2; y < layout.bottom; ++y)
        std::fill(rows[y].begin() + left, rows[y].begin() + layout.frame_right, ' ');
}
