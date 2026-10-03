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
        std::string source;
        bool selected;
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
            // Stocks' native renderer places these fields at left + 2 and
            // right - 7; both belong to this row's category button.
            if (label.left != left + 2 || count.left != right - 7 ||
                label.right + 1 >= count.left) continue;
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
                std::move(label_parts), std::move(count_parts), label.source,
                skin == skins[1] || skin == skins[3] || skin == skins[5]});
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
    struct Slot {
        std::vector<Match *> parts;
        int left, right;
    };
    auto layout_slots = [&](std::vector<Slot> &slots) {
        for (Slot &slot : slots)
            layout_fortress_text_rows(renderer, {slot.parts}, slot.left, slot.right);
    };

    // Stocks and building/container details use the same native action skins.
    auto action_at = [&](int x, int y) { return native_item_action_at(*gps_, x, y); };
    const auto scrollbar_cap = [&](int x, int y, bool bottom) {
        const auto pair = [&](int32_t left, int32_t right) {
            return left > 0 && right > 0 &&
                native_ui_skin_at(*gps_, x, y, left, classic) &&
                native_ui_skin_at(*gps_, x + 1, y, right, classic);
        };
        const auto &track = native_texture_scrollbar(*gps_);
        if (pair(track[0][bottom ? 2 : 0], track[1][bottom ? 2 : 0])) return true;
        const auto *hover = bottom ? native_texture_scrollbar_down_hover(*gps_)
            : native_texture_scrollbar_up_hover(*gps_);
        const auto *pressed = bottom ? native_texture_scrollbar_down_pressed(*gps_)
            : native_texture_scrollbar_up_pressed(*gps_);
        return pair(hover[0], hover[1]) || pair(pressed[0], pressed[1]);
    };
    const auto scrollbar = [&](const SDL_Rect &area, int top) -> std::optional<SDL_Rect> {
        for (const auto &bar : native_vertical_scrollbar_spans(*gps_, area))
            if (bar.y == top && bar.h >= 3 &&
                scrollbar_cap(bar.x, bar.y, false) &&
                scrollbar_cap(bar.x, bar.y + bar.h - 1, true)) return bar;
        return std::nullopt;
    };
    for (auto &[key, column] : columns) {
        std::sort(column.begin(), column.end(),
            [](const Row *a, const Row *b) { return a->y < b->y; });
        // The two native scrolling controls own these lists. DFHack's shortcut
        // card can cover the outer window rail with custom artwork whose pen
        // character is absent from the graphical grid. Requiring that unrelated
        // frame (or recognizing the card as a native border) drops both panes
        // back to English-run centering. The native FILTER is four columns
        // after the category cap, or six when its two-column scrollbar is
        // present. Complete scrollbars supply the shared visible bottom;
        // small lists legitimately omit either or both scrolling controls.
        std::optional<SDL_Rect> search;
        std::optional<SDL_Rect> category_bar;
        for (int top = 0; top < column.front()->y && !search; ++top) {
            for (int gap : {4, 6}) {
                const int x = key[1] + gap;
                const auto box = native_textbox_rect_at(*gps_, x, top);
                if (!box) continue;
                const auto bar = gap == 6 ? scrollbar(SDL_Rect{key[1] + 1, box->y,
                    2, gps_->dimy - box->y}, box->y) : std::nullopt;
                if (bar && column.back()->y >= bar->y + bar->h) continue;
                search = box;
                category_bar = bar;
                break;
            }
        }
        if (!search) continue;
        int label_right = key[1];
        for (const Row *row : column)
            label_right = std::min(label_right, row->count_left - 1);
        std::vector<Slot> categories;
        bool selected_category_visible = false, wood_context = false;
        for (Row *row : column) {
            if (row->selected) {
                selected_category_visible = true;
                wood_context = wood_context || lower(trim(row->source)) == "logs";
            }
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

        const int list_top = search->y + search->h;
        const int search_right = search->x + search->w;
        const auto item_bar = scrollbar(SDL_Rect{search_right - 2, list_top,
            2, gps_->dimy - list_top}, list_top);
        if (item_bar && category_bar &&
            item_bar->y + item_bar->h != category_bar->y + category_bar->h) continue;
        const int pane_right = item_bar ? item_bar->x : search_right;
        const int list_bottom = item_bar ? item_bar->y + item_bar->h
            : category_bar ? category_bar->y + category_bar->h : gps_->dimy;
        const auto source_of = [](const Match &part) -> std::string_view {
            return part.native_item_caption_source.empty()
                ? std::string_view(part.source)
                : std::string_view(part.native_item_caption_source);
        };
        for (const Match &part : prepared_matches_)
            if (!part.native_split_duplicate && !part.target.empty() &&
                    part.y >= list_top && part.y < list_bottom &&
                    part.x >= search->x && part.x + part.length < pane_right &&
                    translate_wood_item_caption(source_of(part), false, false))
                wood_context = true;

        // The item pane is below its own search box. Identify
        // each row by its actual Stocks action strip, including headers and
        // individual items. This also works for a single filtered result or
        // when scrolling has moved the group's header out of view. Its own
        // controls establish visibility: the independently scrolling category
        // list may end earlier, or expose an unrecognized caption at an edge.
        // Using that column's first/last translated y skipped otherwise visible
        // items and sent them back to per-English-run centering after a wheel
        // event in the OTHER pane. When neither list needs scrolling, its
        // actual Stocks inspect controls still establish each visible row;
        // unrelated state actions in the bottom toolbar do not own names.
        std::vector<Slot> items;
        int list_right = pane_right;
        for (int y = list_top; y < list_bottom; ++y) {
            int controls_left = -1;
            for (int x = search->x + 1; x + 1 < pane_right; ++x) {
                if (action_at(x, y)) { controls_left = x - 1; break; }
            }
            if (controls_left < 0) continue;
            bool item_record = false;
            for (int x = controls_left + 1; x + 1 < pane_right; ++x) {
                if (native_item_action_skin_at(*gps_, x, y,
                        native_texture_button_stocks_recenter(*gps_), classic)) {
                    item_record = true;
                    break;
                }
            }
            if (!category_bar && !item_bar) {
                // Group headers have state actions but no individual item
                // to inspect. Filtering can remove both scrollbars, so an
                // inspect-only requirement would discard every such header.
                bool inspect = false, state_action = false;
                for (int x = controls_left; x + 3 <= pane_right && !inspect; ++x)
                    inspect = native_square_button_at(*gps_, x, y,
                        native_texture_button_stocks_view_item(*gps_));
                for (int x = controls_left + 1; x + 1 < pane_right && !state_action; ++x)
                    state_action = native_item_state_action_at(*gps_, x, y);
                if (!inspect && !state_action) continue;
            }
            // Translation ownership is independent of layout completeness.
            // A header can have a separately drawn/native [count], or its
            // retained half-font owner can sit on the other text row from
            // the action strip. Neither makes it a concrete item caption.
            std::vector<Match *> captions;
            for (Match &part : prepared_matches_) {
                const bool same_row = part.y == y || (part.native_split_text &&
                    (part.native_split_top_y == y || part.native_split_top_y + 1 == y));
                if (same_row && !part.native_split_duplicate && !part.target.empty() &&
                        !part.legends_flow && part.x >= search->x &&
                        part.x + part.length <= controls_left)
                    captions.push_back(&part);
            }
            std::sort(captions.begin(), captions.end(),
                [](const Match *a, const Match *b) { return a->x < b->x; });
            if (!captions.empty()) {
                const int first = captions.front()->x;
                std::string native;
                for (int x = first; x < controls_left; ++x) {
                    const auto ch = visible_char_at(x, captions.front()->y);
                    native.push_back(ch ? static_cast<char>(ch) : ' ');
                }
                while (!native.empty() && native.back() == ' ') native.pop_back();
                const auto count = item_number_suffix(native);
                // Stocks' individual records have a recenter action; group
                // rows have only state actions. Counts can be drawn in a
                // separate half/field, so they do not establish this role.
                const bool group = !item_record;
                const auto allow_bare = [&](std::string_view source) {
                    if (wood_context) return true;
                    if (selected_category_visible) return false;
                    auto name = trim_view(source);
                    for (;;) {
                        const size_t previous = name.size();
                        if (const auto suffix = item_number_suffix(name); !suffix.empty())
                            name = trim_view(name.substr(0, name.size() - suffix.size()));
                        name = split_item_designation(name).item;
                        if (name.size() == previous) break;
                    }
                    // Bare ash also names a furnace product, so it needs
                    // the selected category or another explicit log caption.
                    const auto folded = lower(std::string(name));
                    return folded != "ash" && folded != "ashes";
                };
                // The generic matcher may own the species and log noun as
                // separate runs, including a final logs+[count] run. Join a
                // fully owned field first; when the count is unowned, join
                // only the name and leave that count at its native position.
                const auto rewrite_field = [&](std::string_view field) {
                    const int end = first + static_cast<int>(field.size());
                    std::vector<Match *> fields;
                    int cursor = first;
                    for (Match *caption : captions) {
                        if (caption->x >= end) break;
                        if (caption->x < cursor || caption->x + caption->length > end)
                            return false;
                        while (cursor < caption->x && native[cursor - first] == ' ') ++cursor;
                        if (cursor != caption->x) return false;
                        cursor = caption->x + caption->length;
                        fields.push_back(caption);
                    }
                    if (cursor != end || fields.size() < 2) return false;
                    if (auto target = translate_wood_item_caption(
                            field, group, allow_bare(field), wood_context)) {
                        Match &caption = *fields.front();
                        caption.source = std::string(field);
                        caption.length = end - first;
                        caption.native_item_caption_source = caption.source;
                        caption.native_item_group_caption = group;
                        caption.target = std::move(*target);
                        caption.native_hover_untranslated = false;
                        caption.layout_length = caption.length;
                        caption.layout_clip_right = end;
                        caption.layout_glyph_foreground_rgb.clear();
                        for (size_t i = 1; i < fields.size(); ++i) fields[i]->target.clear();
                        return true;
                    }
                    return false;
                };
                const auto name = trim_view(std::string_view(native).substr(
                    0, native.size() - count.size()));
                if (!rewrite_field(native) && !rewrite_field(name))
                    for (Match *caption : captions) {
                        const auto source = source_of(*caption);
                        // A bare material fragment is not a whole item name.
                        const bool bare = captions.size() == 1 && allow_bare(source);
                        if (auto target = translate_wood_item_caption(
                                source, group, bare, wood_context)) {
                            caption->target = std::move(*target);
                            caption->native_item_group_caption = group;
                            caption->native_hover_untranslated = false;
                            caption->layout_glyph_foreground_rgb.clear();
                        }
                    }
            }
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
