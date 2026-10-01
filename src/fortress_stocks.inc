// Stocks has a two-field category column and a separate, indented item list.
// Neither uses per-English-run centering. Recover the current widgets, not
// a category/item glossary or screenshot coordinates; leave native source
// masks, item icons, controls and hitboxes intact.
void Overlay::layout_fortress_stocks(SDL_Renderer *renderer) {
    if (!gps_ || !face_ || !renderer ||
        gps_->tile_pixel_x <= 0 || gps_->tile_pixel_y <= 0) return;
    bool population = false, stocks = false;
    for (const Match &match : prepared_matches_) {
        if (match.y < 0 || match.y > 2 || match.target.empty()) continue;
        population = population || match.source == "Pop" || match.source == "Population";
        stocks = stocks || match.source == "Stocks";
    }
    if (!population || !stocks) return;
    const auto settings = native_ui_settings();
    const bool classic = settings && settings->classic;

    struct Field { int left, right; std::string source; };
    struct Row {
        int y, button_left, button_right, label_left, count_left;
        std::vector<Match *> label, count;
    };
    std::vector<Row> rows;
    // Use the current skin in either native representation: texture handles
    // in graphics mode, packed characters/palette colors in classic mode.
    // Caption ink replaces only the blank centre, never the side caps.
    const int32_t (*skins[])[3] = {
        native_texture_button_category_rectangle(*gps_),
        native_texture_button_category_rectangle_selected(*gps_),
        native_texture_button_category_rectangle_on(*gps_),
        native_texture_button_category_rectangle_on_selected(*gps_),
        native_texture_button_category_rectangle_off(*gps_),
        native_texture_button_category_rectangle_off_selected(*gps_),
    };
    for (const Match &match : prepared_matches_) {
        if (match.y <= 3 || match.y >= gps_->dimy || match.target.empty() ||
            match.native_split_text || match.native_split_duplicate) continue;
        for (const auto *skin : skins) {
            const auto centre = [&](int x) {
                return native_ui_skin_at(*gps_, x, match.y, skin[1][1], classic, true);
            };
            if (skin[1][1] <= 0 || skin[0][1] == skin[1][1] ||
                skin[2][1] == skin[1][1] || !centre(match.x)) continue;
            int left = match.x, right = match.x;
            while (left > 0 && centre(left)) --left;
            while (right < gps_->dimx && centre(right)) ++right;
            if (right >= gps_->dimx ||
                !native_ui_skin_at(*gps_, left, match.y, skin[0][1], classic) ||
                !native_ui_skin_at(*gps_, right, match.y, skin[2][1], classic)) continue;
            if (std::any_of(rows.begin(), rows.end(), [&](const Row &row) {
                    return row.y == match.y && row.button_left == left;
                })) break;
            // The exact left/centre/right skin row above establishes the
            // button width. Do not require its upper/lower border: scrolling
            // can clip either border while the caption row remains visible.
            // The two native fields and adjoining search pane below still
            // distinguish Stocks from unrelated category controls, even
            // when filtering leaves just one category.
            bool complete = true;
            std::vector<Field> fields;
            for (int x = left + 1; x < right;) {
                unsigned char ch = visible_char_at(x, match.y);
                if (ch == 0 || ch == ' ') { ++x; continue; }
                Field field{x, x, {}};
                while (x < right) {
                    ch = visible_char_at(x, match.y);
                    if (ch < ' ' || ch >= 0x7f) break;
                    const unsigned char next = x + 1 < right
                        ? visible_char_at(x + 1, match.y) : 0;
                    if (ch == ' ' && (next == 0 || next == ' ')) break;
                    field.source.push_back(ch);
                    ++x;
                }
                if (field.source.empty()) { complete = false; break; }
                while (!field.source.empty() && field.source.back() == ' ')
                    field.source.pop_back();
                field.right = field.left + static_cast<int>(field.source.size());
                fields.push_back(std::move(field));
                if (fields.size() > 2) break;
            }
            if (!complete || fields.size() != 2) continue;
            const Field &label = fields[0], &count = fields[1];
            if (label.right + 1 >= count.left) continue;
            std::string_view number = count.source;
            if (number.starts_with('~')) number.remove_prefix(1);
            const bool numeric = !number.empty() &&
                std::all_of(number.begin(), number.end(),
                    [](char ch) { return ch >= '0' && ch <= '9'; });
            if (!numeric && count.source != "?" && lower(count.source) != "none") continue;
            // The native button and its two fields establish the row even
            // when a caption is only partly translated. A count match can
            // discover it too. Do not let the visible glossary coverage
            // determine either pane's geometry as categories scroll past.
            auto label_parts = fortress_text_row(label.left, match.y);
            if (!label_parts.empty() &&
                label_parts.back()->x + label_parts.back()->length != label.right)
                label_parts.clear();
            auto count_parts = fortress_text_row(count.left, match.y);
            if (!count_parts.empty() &&
                count_parts.back()->x + count_parts.back()->length != count.right)
                count_parts.clear();
            rows.push_back({match.y, left, right, label.left, count.left,
                std::move(label_parts), std::move(count_parts)});
            break;
        }
    }

    // Category buttons share the label origin and button edges. Count widths
    // must not split the column; neither filtering nor clipping must require
    // a second visible category to keep the item pane's layout alive.
    std::map<std::array<int, 3>, std::vector<Row *>> columns;
    for (Row &row : rows)
        columns[{row.button_left, row.button_right, row.label_left}]
            .push_back(&row);
    struct Slot { std::vector<Match *> parts; int left, right; };
    auto layout_slots = [&](std::vector<Slot> &slots) {
        for (Slot &slot : slots)
            layout_fortress_text_rows(renderer, {slot.parts}, slot.left, slot.right);
    };

    // Stocks and building/container details use the same native action skins.
    auto action_at = [&](int x, int y) { return native_item_action_at(*gps_, x, y); };
    const NativePanelBorders borders(*gps_);
    for (auto &[key, column] : columns) {
        std::sort(column.begin(), column.end(),
            [](const Row *a, const Row *b) { return a->y < b->y; });
        // Identify the same two-pane widget for unfiltered and filtered
        // Stocks: a framed category/count column with a complete text box
        // above the adjoining item pane. Do not use the query spelling,
        // translated names, row count, or a remembered unfiltered geometry.
        const auto panel = native_panel_interior(borders, *gps_,
            key[0], key[1] + 1, column.front()->y);
        if (!panel || column.back()->y >= panel->y + panel->h) continue;
        std::optional<SDL_Rect> search;
        for (int top = panel->y; top < column.front()->y && !search; ++top) {
            for (int x = key[1] + 1; x < panel->x + panel->w; ++x) {
                const auto box = native_textbox_rect_at(*gps_, x, top);
                if (!box || box->x + box->w > panel->x + panel->w ||
                    box->y + box->h > panel->y + panel->h) continue;
                search = box;
                break;
            }
        }
        if (!search) continue;
        int label_right = key[1];
        for (const Row *row : column)
            label_right = std::min(label_right, row->count_left - 1);
        std::vector<Slot> categories;
        for (Row *row : column) {
            // Only this proved category field has the Stocks item-type
            // meaning. ITEM_ARMOR includes tunics/dresses as well as armor;
            // concrete items, armor stands and workshop menus keep their
            // own translations. Resolve table-owned senses before measuring
            // the label, without putting them in the global item cache.
            if (row->label.size() == 1) {
                Match &label = *row->label.front();
                if (auto target = exact_literal_translation(
                        "Stocks category: " + lower(trim(label.source)))) {
                    label.target = std::move(*target);
                    label.layout_glyph_foreground_rgb.clear();
                }
            }
            if (!row->label.empty())
                categories.push_back({row->label, key[2], label_right});
            if (!row->count.empty())
                categories.push_back({row->count, row->count_left, key[1]});
        }
        layout_slots(categories);

        // The item pane is below its own search box. Identify
        // each row by its actual Stocks action strip, including headers and
        // individual items. This also works for a single filtered result or
        // when scrolling has moved the group's header out of view. Its own
        // controls establish visibility: the independently scrolling category
        // list may end earlier, or expose an unrecognized caption at an edge.
        // Using that column's first/last translated y skipped otherwise visible
        // items and sent them back to per-English-run centering after a wheel
        // event in the OTHER pane. Scan this pane's full visible height, not
        // the whole screen or controls belonging to a neighbouring window.
        std::vector<Slot> items;
        int list_right = search->x + search->w;
        for (int y = search->y + search->h; y < panel->y + panel->h; ++y) {
            int controls_left = -1;
            for (int x = search->x + 1; x + 1 < search->x + search->w; ++x) {
                if (action_at(x, y)) { controls_left = x - 1; break; }
            }
            if (controls_left < 0) continue;
            std::vector<Match *> parts;
            bool complete = true;
            for (Match &part : prepared_matches_) {
                if (part.y != y || part.x < search->x || part.x >= controls_left) continue;
                if (part.target.empty() || part.native_split_text ||
                    part.native_split_duplicate || part.legends_flow ||
                    part.x + part.length > controls_left) {
                    complete = false;
                    break;
                }
                parts.push_back(&part);
            }
            if (!complete || parts.empty()) continue;
            std::sort(parts.begin(), parts.end(),
                [](const Match *a, const Match *b) { return a->x < b->x; });
            const int left = parts.front()->x;
            // Only move fully translated fields. Keep native quality marks
            // and [counts] inside their existing matches; never strand an
            // untranslated middle/tail field underneath a shifted caption.
            int cursor = left;
            auto skip_blanks = [&](int end) {
                for (; cursor < end; ++cursor) {
                    const unsigned char ch = visible_char_at(cursor, y);
                    if (ch != 0 && ch != ' ') return false;
                }
                return true;
            };
            for (const Match *part : parts) {
                if (part->x < cursor || !skip_blanks(part->x)) {
                    complete = false;
                    break;
                }
                cursor = part->x + part->length;
            }
            if (!complete || !skip_blanks(controls_left) || left >= controls_left - 1)
                continue;
            items.push_back({std::move(parts), left, controls_left - 1});
            list_right = std::min(list_right, controls_left - 1);
        }
        // Native x already contains the group/item indentation and the
        // clearance after the item icon. Use the narrowest action-strip
        // boundary across the list. Names, group headers and counts use the
        // fixed UI font; only the visible suffix can be ellipsized.
        for (Slot &item : items) item.right = list_right;
        layout_slots(items);
    }
}
