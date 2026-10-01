// Read the declared skin in both modes. Classic text changes the center's
// glyph and foreground but retains its background; the frame must still
// match its exact CP437 glyphs and palette. Texture-only strips cannot own
// classic schedule cells, and the generic three-row reader cannot own months.
static std::optional<std::pair<int, int>> native_schedule_skin_text_span(
        const graphicst &gps, int first, int end, int y, const int32_t (*skin)[3]) {
    if (first < 0 || end <= first || end > gps.dimx || y < 0 || y >= gps.dimy)
        return std::nullopt;
    const bool classic = native_ui_classic().value_or(false);
    const auto middle = [&](int x) {
        return native_ui_skin_at(gps, x, y, skin[1][1], classic, true);
    };
    if (!middle(first)) return std::nullopt;
    int left = first, right = first;
    while (left > 0 && middle(left)) --left;
    while (right < gps.dimx && middle(right)) ++right;
    if (right < end || !native_ui_skin_at(gps, left, y, skin[0][1], classic) ||
        !native_ui_skin_at(gps, right, y, skin[2][1], classic)) return std::nullopt;
    return {{left + 1, right}};
}

static std::optional<SDL_Rect> native_schedule_category_box(
        const graphicst &gps, int first, int end, int y) {
    const bool classic = native_ui_classic().value_or(false);
    const int32_t (*skins[])[3] = {
        native_texture_button_category_rectangle(gps),
        native_texture_button_category_rectangle_selected(gps),
    };
    for (const auto *skin : skins) {
        const auto span = native_schedule_skin_text_span(gps, first, end, y, skin);
        if (!span) continue;
        const int left = span->first - 1, right = span->second;
        const auto at = [&](int x, int row, int column_part, int row_part) {
            return native_ui_skin_at(gps, x, row, skin[column_part][row_part], classic);
        };
        int top = y, bottom = y;
        while (top > 0 && at(left, top, 0, 1) && at(right, top, 2, 1)) --top;
        while (bottom + 1 < gps.dimy &&
                at(left, bottom, 0, 1) && at(right, bottom, 2, 1)) ++bottom;
        if (y <= top || y >= bottom || !at(left, top, 0, 0) ||
            !at(right, top, 2, 0) || !at(left, bottom, 0, 2) ||
            !at(right, bottom, 2, 2)) continue;
        bool complete = true;
        for (int x = left + 1; x < right && complete; ++x) {
            if (!at(x, top, 1, 0) || !at(x, bottom, 1, 2)) { complete = false; break; }
            for (int row = top + 1; row < bottom; ++row)
                if (!native_ui_skin_at(gps, x, row, skin[1][1], classic, true)) {
                    complete = false;
                    break;
                }
        }
        if (complete) return SDL_Rect{left + 1, top + 1, right - left - 1, bottom - top - 1};
    }
    return std::nullopt;
}

// Order cells contain their own action buttons, so only the status row uses
// the outer grid skin. Month/header cells use the complete category reader.
static std::optional<std::pair<int, int>> native_schedule_cell_text_span(
        const graphicst &gps, int first, int end, int y) {
    const int32_t (*skins[])[3] = {
        native_texture_grid_cell_inactive(gps), native_texture_grid_cell_active(gps),
    };
    for (const auto *skin : skins)
        if (const auto span = native_schedule_skin_text_span(gps, first, end, y, skin)) return span;
    if (const auto box = native_schedule_category_box(gps, first, end, y))
        return {{box->x, box->x + box->w}};
    return std::nullopt;
}

// A monthly squad schedule is a column of calendar fields alongside a grid
// of orders and Edit/Copy controls. Own these fields before generated names
// can interpret Limestone as lime + stone or transliterate Obsidian.
void Overlay::append_fortress_schedule_rows(std::vector<std::string> &rows,
        std::vector<Match> &matches, int only_y, bool raw_layer) const {
    if (!gps_ || rows.size() != static_cast<size_t>(gps_->dimy)) return;
    auto context = rows;
    if (raw_layer) {
        for (int y = 0; y < gps_->dimy; ++y)
            for (int x = 0; x < gps_->dimx; ++x) {
                const auto ch = visible_char_at(x, y);
                context[y][x] = ch ? static_cast<char>(ch) : ' ';
            }
    }
    static constexpr std::array<std::string_view, 12> months{{
        "Granite", "Slate", "Felsite", "Hematite", "Malachite", "Galena",
        "Limestone", "Sandstone", "Timber", "Moonstone", "Opal", "Obsidian",
    }};
    struct Field {
        int x, y;
        std::string source;
        SDL_Rect box;
        int month = -1;
        bool action = false;
    };
    std::vector<Field> calendar;
    for (int y = 0; y < gps_->dimy; ++y) {
        for (size_t month = 0; month < months.size(); ++month) {
            const auto source = months[month];
            for (size_t at = context[y].find(source); at != std::string::npos;
                    at = context[y].find(source, at + 1)) {
                const int x = static_cast<int>(at), end = x + static_cast<int>(source.size());
                if (!has_word_boundaries(context[y], at, end)) continue;
                const auto box = native_schedule_category_box(*gps_, x, end, y);
                if (!box || trim_view(std::string_view(context[y]).substr(box->x, box->w))
                        != source) continue;
                calendar.push_back({x, y, std::string(source), *box, static_cast<int>(month)});
            }
        }
    }
    if (calendar.empty()) return;

    // 53.16 PE 0x14044b8ef..0x14044bdaf uses GRID_CELL_BUTTON for the copy
    // action; Edit shares that family. The ordinary reader does not include it,
    // so using that reader here discarded every calendar field on this page.
    const auto &button_skin = native_texture_grid_cell_button(*gps_);
    std::array<int32_t, 9> action_skin{};
    for (int row = 0; row < 3; ++row)
        for (int column = 0; column < 3; ++column)
            action_skin[row * 3 + column] = button_skin[column][row];
    const bool classic = native_ui_classic().value_or(false);
    // Consecutive visible months identify the calendar column even when the
    // user renames or reorders all routines. Typed neighbouring grid controls
    // distinguish it from a calendar, material list or squad names.
    std::vector<Field> fields;
    for (const Field &seed : calendar) {
        std::vector<Field> group;
        for (const Field &field : calendar)
            if (field.box.x == seed.box.x && field.box.w == seed.box.w)
                group.push_back(field);
        int previous = -1, previous_box_y = -1, count = 0;
        bool ordered = true;
        for (const Field &field : group) {
            if (field.box.y == previous_box_y && field.month == previous) continue;
            if (previous >= 0 && field.month != previous + 1) { ordered = false; break; }
            previous = field.month;
            previous_box_y = field.box.y;
            ++count;
        }
        if (!ordered || count < 2) continue;
        const int grid_left = seed.box.x + seed.box.w;
        const int body_top = group.front().box.y;
        const int body_bottom = group.back().box.y + group.back().box.h;
        std::vector<Field> actions;
        for (int y = body_top; y < body_bottom; ++y) {
            for (size_t at = context[y].find("Edit", grid_left); at != std::string::npos;
                    at = context[y].find("Edit", at + 4)) {
                size_t copy_at = std::string::npos;
                std::string_view copy_caption;
                for (std::string_view caption : {"Copy", "Done", "Paste"}) {
                    const auto candidate = context[y].find(caption, at + 4);
                    if (candidate < copy_at) { copy_at = candidate; copy_caption = caption; }
                }
                const auto next_edit = context[y].find("Edit", at + 4);
                if (copy_at == std::string::npos ||
                    (next_edit != std::string::npos && next_edit < copy_at) ||
                    !has_word_boundaries(context[y], at, at + 4) ||
                    !has_word_boundaries(context[y], copy_at, copy_at + copy_caption.size())) continue;
                const auto edit = native_nineslice_button_text_rect(*gps_, static_cast<int>(at),
                    static_cast<int>(at + 4), y, action_skin, classic);
                const auto copy = native_nineslice_button_text_rect(*gps_, static_cast<int>(copy_at),
                    static_cast<int>(copy_at + copy_caption.size()), y, action_skin, classic);
                if (!edit || !copy || edit->y != copy->y ||
                    edit->x + edit->w >= copy->x) continue;
                actions.push_back({static_cast<int>(at), y, "Edit", *edit, -1, true});
                actions.push_back({static_cast<int>(copy_at), y, std::string(copy_caption), *copy, -1, true});
            }
        }
        if (actions.empty()) continue;
        fields = std::move(group);
        fields.insert(fields.end(), actions.begin(), actions.end());
        for (int y = 0; y < body_bottom; ++y) {
            for (std::string_view source : {"Current month", "Off duty", "Staggered training",
                    "Constant training", "Ready", "Train", "No orders"}) {
                for (size_t at = context[y].find(source); at != std::string::npos;
                        at = context[y].find(source, at + 1)) {
                    const int x = static_cast<int>(at), end = x + static_cast<int>(source.size());
                    if (!has_word_boundaries(context[y], at, end)) continue;
                    auto span = native_schedule_cell_text_span(*gps_, x, end, y);
                    if (!span) span = native_button_text_span(*gps_, x, end, y);
                    if (!span || trim_view(std::string_view(context[y]).substr(
                            span->first, span->second - span->first)) != source) continue;
                    if (source == "Current month") {
                        if (span->first != seed.box.x || span->second != grid_left ||
                            y < body_top) continue;
                    } else if (span->first < grid_left) continue;
                    fields.push_back({x, y, std::string(source),
                        {span->first, y, span->second - span->first, 1}});
                }
            }
        }
        break;
    }
    for (const Field &field : fields) {
        if (only_y >= 0 && only_y != field.y) continue;
        std::optional<std::string> target;
        if (field.month >= 0) {
            std::vector<size_t> origins;
            target = RULESETS.translate_with_origins(field.source, "::day::month", origins);
        } else target = exact_literal_translation(field.source);
        if (!target || target->empty()) continue;
        const int length = static_cast<int>(field.source.size());
        auto &row = rows[field.y];
        if (row.compare(field.x, length, field.source) == 0) {
            Match match{field.x, field.y, length, kFortressScheduleRule, *target, field.source};
            match.layout_x = field.box.x;
            match.layout_length = field.box.w;
            match.layout_clip_right = field.box.x + field.box.w;
            match.layout_left = !field.action;
            const int tile_w = gps_->tile_pixel_x, tile_h = gps_->tile_pixel_y;
            match.layout_native_clip = SDL_Rect{
                (gps_->screen_pixel_x - gps_->dimx * tile_w) / 2 + field.box.x * tile_w,
                (gps_->screen_pixel_y - gps_->dimy * tile_h) / 2 + field.box.y * tile_h,
                field.box.w * tile_w, field.box.h * tile_h};
            matches.push_back(std::move(match));
            std::fill_n(row.begin() + field.x, length, ' ');
        } else if (raw_layer) {
            // Complete fields can straddle native layers. Each layer erases
            // only its matching bytes; the composite owns the Chinese label.
            for (int offset = 0; offset < length;) {
                while (offset < length && row[field.x + offset] != field.source[offset]) ++offset;
                const int start = offset;
                while (offset < length && row[field.x + offset] == field.source[offset]) ++offset;
                if (start == offset) continue;
                matches.push_back({field.x + start, field.y, offset - start,
                    kFortressScheduleRule, {}, field.source.substr(start, offset - start)});
                std::fill_n(row.begin() + field.x + start, offset - start, ' ');
            }
        }
    }
}

void Overlay::layout_fortress_monthly_schedule(SDL_Renderer *renderer) {
    if (!gps_ || !face_ || !renderer ||
        gps_->tile_pixel_x <= 0 || gps_->tile_pixel_y <= 0) return;
    std::vector<Match *> fields;
    for (Match &match : prepared_matches_)
        if (match.rule == kFortressScheduleRule && !match.target.empty() &&
                !match.native_split_duplicate) fields.push_back(&match);
    if (fields.empty()) return;
    const int height = gps_->tile_pixel_y;
    const int pixels = unified_font_pixels();
    const int tile_w = gps_->tile_pixel_x;
    const int origin_x = (gps_->screen_pixel_x - gps_->dimx * tile_w) / 2;
    for (Match *field : fields) {
        const int native_width = std::max(1, field->layout_length * tile_w);
        const int left = field->layout_x >= 0 ? field->layout_x : field->x;
        field->layout_box_pixel_x = origin_x + left * tile_w;
        field->layout_box_pixel_width = native_width;
        field->layout_font_pixels = pixels;
        field->layout_lock_font_pixels = true;
        field->layout_ellipsize = true;
        field->layout_visual_height_pixels = 0;
        field->layout_line_height_pixels = height;
    }
}
