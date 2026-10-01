// Depot inspection and goods assignment own complete, independent fields.
// Identify their native controls and enclosing panel, not a resolution,
// broker name, item material or a remembered unfiltered list.
void Overlay::append_fortress_depot_fields(std::vector<std::string> &rows,
        std::vector<Match> &matches, int only_y, bool raw_layer) const {
    auto context = rows;
    if (raw_layer) {
        for (int y = 0; y < gps_->dimy; ++y)
            for (int x = 0; x < gps_->dimx; ++x) {
                const auto ch = visible_char_at(x, y);
                context[y][x] = ch ? static_cast<char>(ch) : ' ';
            }
    }
    const NativePanelBorders borders(*gps_);
    constexpr std::string_view move_goods = "Move goods to/from depot";
    std::optional<SDL_Rect> panel;
    std::optional<SDL_Rect> goods_search;
    // The goods chooser has a filter beside its trade-specific sort controls
    // and above its assignment controls. Unlike Stocks, its categories have
    // NO count column and its items have no
    // forbid/dump/view strip. Recover this widget before generic matching
    // centres every caption in its unrelated English footprint.
    for (int y = 1; y < gps_->dimy && !panel; ++y) {
        for (int x = 0; x + 2 < gps_->dimx && !panel; ++x) {
            const bool assignment = native_trade_assignment_at(*gps_, x, y);
            bool toolbar = false;
            // ASSIGN_TRADE_CULLING_MANDATES_ON through SORT_BY_VALUE_OFF.
            // The current header also proves the chooser when scrolling an
            // expanded container leaves no assignable parent on screen.
            for (int kind = 274; !assignment && !toolbar && kind <= 279; ++kind)
                toolbar = native_main_button_at(*gps_, x, y, kind);
            if (!assignment && !toolbar) continue;
            const auto bounds = native_panel_interior(
                borders, *gps_, x, x + (toolbar ? 4 : 3), y);
            if (!bounds) continue;
            for (int top = toolbar ? y - 1 : bounds->y;
                 top + (toolbar ? 1 : 3) <= y && !panel; ++top) {
                for (int left = bounds->x; left < x; ++left) {
                    const auto search = native_textbox_rect_at(*gps_, left, top);
                    if (!search || search->x + search->w > x ||
                        search->y < bounds->y ||
                        search->y + search->h > bounds->y + bounds->h) continue;
                    panel = bounds;
                    goods_search = search;
                    break;
                }
            }
        }
    }
    for (int y = 0; y < gps_->dimy && !panel; ++y) {
        const auto at = context[y].find(move_goods);
        if (at == std::string::npos) continue;
        const int x = static_cast<int>(at), end = x + static_cast<int>(move_goods.size());
        if (native_button_text_span(*gps_, x, end, y))
            panel = native_panel_interior(borders, *gps_, x, end, y);
    }
    if (!panel) return;
    const int right = panel->x + panel->w, bottom = panel->y + panel->h;
    const auto captures = captured_clipped_captions();
    const auto complete_source = [&](int x, int y, const std::string &visible) {
        for (const auto &capture : captures)
            if (capture.x == x && capture.y == y && capture.visible == visible)
                return capture.complete;
        return visible;
    };
    const auto append = [&](int x, int y, int end, int clip_right,
                            const std::optional<std::string> &target,
                            int display_left = -1) {
        if (display_left < 0) display_left = x;
        if (end <= x || end > right || x < panel->x || clip_right > right) return;
        if (display_left < panel->x || display_left >= clip_right) return;
        const auto source = context[y].substr(x, end - x);
        for (int at = x; at < end; ++at) {
            const auto ch = visible_char_at(at, y);
            if ((ch ? ch : ' ') != static_cast<unsigned char>(context[y][at]) ||
                is_cp437_box_separator(context[y], at)) return;
        }
        const auto emit = [&](int first, int last, bool complete) {
            if (only_y < 0 || only_y == y) {
                Match match{first, y, last - first, kFortressDepotFieldRule,
                    complete ? target.value_or(native_text_to_utf8(source)) : std::string{},
                    context[y].substr(first, last - first)};
                match.native_hover_untranslated = complete && !target;
                match.layout_x = display_left;
                match.layout_y = y;
                match.layout_length = clip_right - display_left;
                match.layout_clip_right = clip_right;
                match.layout_left = true;
                match.layout_font_pixels = std::clamp(
                    static_cast<int>(gps_->tile_pixel_y * config_.font_scale),
                    1, gps_->tile_pixel_y);
                match.layout_lock_font_pixels = true;
                match.layout_line_height_pixels = gps_->tile_pixel_y;
                matches.push_back(std::move(match));
            }
            std::fill(rows[y].begin() + first, rows[y].begin() + last, ' ');
        };
        if (rows[y].compare(x, end - x, source) == 0) emit(x, end, true);
        else if (raw_layer) {
            // Both suppression and final drawing use the same composite
            // field. Only equal physical bytes belong to this raw layer;
            // a colored caption never erases a covered map or another pane.
            for (int at = x; at < end;) {
                while (at < end && rows[y][at] != context[y][at]) ++at;
                const int first = at;
                while (at < end && rows[y][at] == context[y][at]) ++at;
                if (first < at) emit(first, at, false);
            }
        }
    };
    if (goods_search) {
        const int list_left = goods_search->x;
        const int list_top = goods_search->y + goods_search->h;
        int list_right = right;
        for (const auto &scrollbar : native_vertical_scrollbar_spans(*gps_, *panel))
            if (scrollbar.x >= goods_search->x + goods_search->w)
                list_right = std::min(list_right, scrollbar.x);
        // A scalar owns its label, approximation marker, number and currency
        // together. This also prevents the translated Value label and native
        // digits from being independently centred. Preserve CP437 currency
        // and item-quality symbols; they are printable game glyphs.
        struct Scalar {
            int x, y, end;
            std::string_view label;
            std::string value;
        };
        const auto scalar_at = [&](int y, int limit, std::string_view label)
                -> std::optional<Scalar> {
            if (y >= bottom) return std::nullopt;
            const auto at = context[y].find(label, list_left);
            if (at == std::string::npos || at + label.size() >= static_cast<size_t>(limit) ||
                !has_word_boundaries(context[y], at, at + label.size())) return std::nullopt;
            const int x = static_cast<int>(at);
            int end = limit;
            while (end > x && context[y][end - 1] == ' ') --end;
            const auto value = trim_view(std::string_view(context[y]).substr(
                x + label.size(), end - x - label.size()));
            if (value.empty() || !std::all_of(value.begin(), value.end(), [](unsigned char ch) {
                    return (ch >= '0' && ch <= '9') || ch == '~' || ch == '?' ||
                        ch == ',' || ch == '.' || ch == '-' || ch == '+' || ch == 15;
                })) return std::nullopt;
            return Scalar{x, y, end, label, native_text_to_utf8(value)};
        };
        struct GoodsRow {
            int y, right;
        };
        std::vector<GoodsRow> goods;
        int controls_left = list_right;
        for (int y = list_top; y < bottom; ++y) {
            int control = -1, picture_right = -1;
            for (int x = list_left; x < list_right; ++x) {
                if (native_trade_assignment_at(*gps_, x, y)) {
                    control = x;
                    break;
                }
                const int edge = native_picture_box_right(*gps_, x, y);
                if (edge > x && edge <= list_right) {
                    picture_right = edge;
                    x = edge - 1;
                }
            }
            if (control < 0 && picture_right < 0) continue;
            const int limit = control >= 0 ? control : list_right;
            // The proved chooser owns every visible picture/assignment row.
            // Expanded contents have no checkbox; their current picture's
            // middle strip still proves the name when scrolling has clipped
            // its bottom border AND the value on the next row. Do not make
            // a visible name depend on a different field staying on screen.
            // Native 53.16 emits their name at 0xd8248e and their value label
            // and amount at 0xd8267b / 0xd826f6, on the next logical row.
            if (control >= 0) controls_left = std::min(controls_left, control);
            goods.push_back({y, limit});
        }
        // Metrics own their visible rows independently, too. At the upper
        // scroll edge a Value field survives after its name/picture middle
        // has gone under the filter. Read it through this SAME scalar parser
        // instead of falling back to a label overlay plus native digits.
        // Only the current chooser viewport and current control boundary
        // establish this scan; no previous frame's item or margin is reused.
        std::vector<Scalar> metrics;
        std::vector<int> metric_starts(bottom - list_top, controls_left);
        int metric_left = controls_left;
        for (int y = list_top; y < bottom; ++y) {
            for (const std::string_view label : {"Distance:", "Value:"}) {
                auto field = scalar_at(y, controls_left, label);
                if (!field) continue;
                metric_left = std::min(metric_left, field->x);
                metric_starts[y - list_top] = std::min(
                    metric_starts[y - list_top], field->x);
                metrics.push_back(std::move(*field));
            }
        }
        const int name_right = std::min(controls_left, metric_left) - 1;

        // Each pane scrolls independently. Read every visible category's
        // closed middle strip, even if its top/bottom skin is clipped, and
        // use the button's inner edge as the common text origin.
        for (int y = panel->y; y < bottom; ++y) {
            for (int x = panel->x; x < list_left; ++x) {
                const unsigned char ch = context[y][x];
                if (ch <= ' ' || ch >= 0x7f) continue;
                const auto button = native_button_text_span(*gps_, x, x + 1, y);
                if (!button || button->first < panel->x || button->second >= list_left) continue;
                int first = button->first, end = button->second;
                while (first < end && context[y][first] == ' ') ++first;
                while (end > first && context[y][end - 1] == ' ') --end;
                if (first < end) {
                    const auto source = complete_source(first, y,
                        context[y].substr(first, end - first));
                    append(first, y, end, button->second,
                        translate_fortress_item_caption(source), button->first);
                }
                x = button->second;
            }
        }
        for (const auto &row : goods) {
            // Retain the game's group/item indentation and leave picture
            // boxes untouched. A native clipped caption is recovered through
            // the same full item parser used by inventory and Stocks search,
            // including group counts, designation marks and container names.
            int first = list_left;
            while (first < name_right) {
                const int picture_right = native_picture_box_right(*gps_, first, row.y);
                if (picture_right > first) { first = picture_right; continue; }
                if (context[row.y][first] != ' ') break;
                ++first;
            }
            const int source_right = std::min(row.right, metric_starts[row.y - list_top]);
            int end = source_right;
            while (end > first && context[row.y][end - 1] == ' ') --end;
            if (first < end && first < name_right) {
                const auto source = complete_source(first, row.y,
                    context[row.y].substr(first, end - first));
                append(first, row.y, end, name_right,
                    translate_fortress_item_caption(source));
            }
        }
        for (const auto &field : metrics) {
            const auto label = exact_literal_translation(field.label);
            std::optional<std::string> target;
            if (label) target = *label + field.value;
            append(field.x, field.y, field.end, controls_left,
                target, metric_left);
        }
        return;
    }
    // These are native field identities, not another translation table.
    // The complete TSV entry wins regardless of per-word native colors.
    constexpr std::string_view captions[] = {
        "Trade Depot", "Move goods to/from depot", "Broker requested at depot",
        "Anyone requested at depot", "No trader needed at depot",
        "Broker can access depot", "Broker cannot access depot",
        "You do not have a broker.",
    };
    for (int y = panel->y; y < bottom; ++y) {
        for (const auto caption : captions) {
            const auto at = context[y].find(caption, panel->x);
            if (at == std::string::npos || at + caption.size() > static_cast<size_t>(right) ||
                !has_word_boundaries(context[y], at, at + caption.size())) continue;
            const int x = static_cast<int>(at), end = x + static_cast<int>(caption.size());
            int clip_right = end;
            if (const auto button = native_button_text_span(*gps_, x, end, y))
                clip_right = std::min(right, button->second);
            // Non-button labels retain their native footprint. In particular
            // the title cannot borrow the rename/remove controls' space.
            append(x, y, end, clip_right, exact_literal_translation(caption));
        }
    }

    constexpr std::string_view broker = "Broker: ";
    for (int y = panel->y; y < bottom; ++y) {
        const auto at = context[y].find(broker, panel->x);
        if (at == std::string::npos || at + broker.size() >= static_cast<size_t>(right)) continue;
        const int x = static_cast<int>(at), name_x = x + static_cast<int>(broker.size());
        int end = right;
        while (end > name_x && context[y][end - 1] == ' ') --end;
        if (end == name_x) continue;
        // The native name is drawn separately after the label, and may be
        // clipped before its profession. Recover THAT capture, not a prefix
        // translated as an independent given name. Reuse the roster grammar.
        const auto identity = complete_source(name_x, y, context[y].substr(name_x, end - name_x));
        auto person = exact_literal_translation(identity);
        if (!person && config_.compositional_rules)
            person = translate_procedural_fragment(identity);
        const auto label = exact_literal_translation("Trade depot broker label");
        std::optional<std::string> target;
        if (label && person) target = *label + *person;
        append(x, y, end, right, target);

        // Native broker records draw identity, activity, access on separate
        // rows (53.16: addst at 0x13dc745, activity at 0x13dc77f/0x13dc810,
        // access at 0x13dc7e6/0x13dc841). Require the access row at the same
        // margin before owning the intervening job. Do not merge these into
        // prose or move the cyan job into the white name/profession line.
        if (y + 2 >= bottom) continue;
        const auto access = trim_view(std::string_view(context[y + 2]).substr(x, right - x));
        if (access != "Broker can access depot" && access != "Broker cannot access depot") continue;
        int job_end = right;
        while (job_end > x && context[y + 1][job_end - 1] == ' ') --job_end;
        if (job_end == x || context[y + 1][x] == ' ') continue;
        const auto activity = complete_source(x, y + 1, context[y + 1].substr(x, job_end - x));
        append(x, y + 1, job_end, right, translate_fortress_activity(activity));
    }
}

void Overlay::layout_fortress_depot(SDL_Renderer *renderer) {
    if (!gps_ || !face_ || !renderer || gps_->tile_pixel_x <= 0 || gps_->tile_pixel_y <= 0) return;
    // Same native margins and one measured font per column. Source spans,
    // portrait/background textures, selected colors and click areas stay put.
    std::map<std::pair<int, int>, std::vector<std::vector<Match *>>> columns;
    for (auto &match : prepared_matches_) {
        if (match.rule != kFortressDepotFieldRule || match.target.empty() ||
            match.native_split_duplicate) continue;
        match.layout_box_pixel_x = -1;
        match.layout_box_pixel_width = 0;
        columns[{match.layout_x, match.layout_clip_right}].push_back({&match});
    }
    for (const auto &[bounds, column] : columns)
        layout_fortress_text_rows(renderer, column, bounds.first, bounds.second, true);
}
