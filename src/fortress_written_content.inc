// The selected Written content list owns two complete book-title fields.
// Its quoted translation is not a generated person's name or an artifact gloss.
if (config_.compositional_rules && fortress_items_panel) {
    const auto &panel = *fortress_items_panel;
    const auto &tabs = background_rows[fortress_items_tabs_y];
    const std::array<std::string_view, 4> labels = {
        "Artifacts", "Symbols", "Named objects", "Written content"};
    std::array<int, 4> colors{};
    bool selected = true;
    for (size_t index = 0; index < labels.size(); ++index) {
        const size_t x = tabs.find(labels[index]);
        bool top = false;
        const auto *cell = x == std::string::npos ? nullptr
            : cell_at(static_cast<int>(x), fortress_items_tabs_y, &top);
        if (!cell || cell[0] != labels[index].front()) { selected = false; break; }
        colors[index] = (cell[1] << 16) | (cell[2] << 8) | cell[3];
    }
    selected = selected && colors[0] == colors[1] && colors[1] == colors[2] &&
        colors[3] != colors[0];
    if (selected) {
        int panel_right = panel.x + panel.w;
        const int bottom = panel.y + panel.h;
        for (const auto &bar : native_vertical_scrollbar_spans(*gps_, panel))
            panel_right = std::min(panel_right, bar.x);
        constexpr uint32_t top_half = 1u << 3, bottom_half = 1u << 4;
        constexpr uint32_t half_mask = top_half | bottom_half;
        struct BookField {
            int x, y, end, height;
            uint32_t half;
            bool top_layer;
            std::string source;
        };
        const auto physical_field = [&](int x, int y, int right) -> std::optional<BookField> {
            if (x < panel.x || x >= right || y <= fortress_items_tabs_y || y >= bottom ||
                background_rows[y][x] == ' ') return std::nullopt;
            int end = x;
            while (end < right && !is_cp437_box_separator(background_rows[y], end)) ++end;
            while (end > x && background_rows[y][end - 1] == ' ') --end;
            uint32_t half = UINT32_MAX;
            bool layer = false;
            for (int column = x; column < end; ++column) {
                const unsigned char ch = background_rows[y][column];
                if (ch == ' ') continue;
                bool top = false;
                const auto *cell = cell_at(column, y, &top);
                const auto *flags = top ? gps_->screentexpos_top_flag : gps_->screentexpos_flag;
                const uint32_t current = flags
                    ? flags[static_cast<size_t>(column) * gps_->dimy + y] & half_mask : 0;
                if (ch < 0x20 || !cell || cell[0] != ch || current == half_mask ||
                    (half != UINT32_MAX && (half != current || layer != top))) return std::nullopt;
                half = current;
                layer = top;
            }
            if (half == UINT32_MAX) return std::nullopt;
            return BookField{x, y, end, 1, half, layer, background_rows[y].substr(x, end - x)};
        };
        const auto logical_field = [&](int x, int y, int right) -> std::optional<BookField> {
            auto field = physical_field(x, y, right);
            if (!field || !field->half) return field;
            auto mate = physical_field(x, y + (field->half == top_half ? 1 : -1), right);
            if (!mate || mate->end != field->end || mate->source != field->source ||
                mate->top_layer != field->top_layer ||
                mate->half != (field->half == top_half ? bottom_half : top_half)) return std::nullopt;
            if (field->half == bottom_half) field = std::move(mate);
            field->height = 2;
            return field;
        };
        const auto complete_source = [&](const BookField &field, int right) {
            std::optional<std::string> complete;
            for (const auto &capture : clipped_template_captions) {
                if (capture.x != field.x || capture.y < field.y ||
                    capture.y >= field.y + field.height || capture.complete.empty() ||
                    trim_view(std::string_view(capture.visible).substr(0, right - field.x)) !=
                        field.source) continue;
                if (complete && *complete != capture.complete) return field.source;
                complete = capture.complete;
            }
            return complete.value_or(field.source);
        };
        const auto claim = [&](const BookField &field, int right, bool quoted) {
            std::string source = complete_source(field, right);
            std::string_view title = source;
            const bool complete_quotes = title.size() >= 2 &&
                title.front() == '"' && title.back() == '"';
            if (quoted && complete_quotes) title = title.substr(1, title.size() - 2);
            const auto target = quoted && !complete_quotes ? std::nullopt
                : memoize_identity_translation('B', title, [&] {
                    return translate_written_item_caption(title, true);
                });
            const bool unknown = !target || target->empty();
            const std::string translated = unknown ? cp437_to_utf8(field.source)
                : quoted ? "“" + *target + "”" : *target;
            bool representative = false;
            for (int y = field.y; y < field.y + field.height; ++y) {
                auto &row = screen_rows[y];
                bool owns_layer = true;
                for (int x = field.x; x < field.end && owns_layer; ++x) {
                    if (field.source[x - field.x] == ' ') continue;
                    bool top = false;
                    const auto *cell = cell_at(x, y, &top);
                    owns_layer = cell && cell[0] == static_cast<unsigned char>(field.source[x - field.x]) &&
                        (!screen_override || screen_override == (top ? gps_->screen_top : gps_->screen));
                }
                if (!owns_layer) continue;
                // Earlier typed matches may already have reserved part of this
                // field. The current native bytes still prove its full owner.
                bool source_intact = true;
                for (int x = field.x; x < field.end; ++x)
                    if (row[x] != ' ' && row[x] != field.source[x - field.x]) source_intact = false;
                if (!source_intact) continue;
                std::fill_n(row.begin() + field.x, field.end - field.x, ' ');
                std::erase_if(result, [&](const Match &part) {
                    return part.y == y && part.x < field.end && part.x + part.length > field.x;
                });
                if (only_y >= 0 && only_y != y) continue;
                Match match{field.x, y, field.end - field.x,
                    kFortressItemCaptionRule, translated, field.source};
                match.layout_x = field.x;
                match.layout_length = right - field.x;
                match.layout_clip_right = right;
                match.layout_left = true;
                match.native_hover_untranslated = unknown;
                bool top = false;
                if (const auto *cell = cell_at(field.x, y, &top))
                    match.layout_foreground_rgb = (cell[1] << 16) | (cell[2] << 8) | cell[3];
                if (field.height == 2) {
                    match.native_split_text = true;
                    match.native_split_top_y = field.y;
                    match.native_split_duplicate = representative;
                    match.layout_y = field.y;
                    match.layout_pixel_y = gps_->tile_pixel_y / 2;
                    if (representative) match.target.clear();
                }
                representative = true;
                result.push_back(std::move(match));
            }
        };
        for (int y = fortress_items_tabs_y + 2; y < bottom; ++y) {
            for (const auto &seed : split_text_fields(background_rows[y])) {
                if (seed.start < panel.x || seed.end > panel_right || seed.text.front() != '"') continue;
                int right = panel_right;
                // Stocks recenter/view controls are three-column widgets;
                // their centre proves the left cap which bounds BOTH titles.
                bool action_found = false;
                for (int row : {y - 1, y - 2, y, y + 1}) {
                    if (row <= fortress_items_tabs_y || row >= bottom) continue;
                    for (int x = seed.start; x < right; ++x)
                        if (native_item_action_at(*gps_, x, row)) {
                            right = x - 1;
                            action_found = true;
                            break;
                        }
                    if (action_found) break;
                }
                const auto quote = logical_field(seed.start, y, right);
                if (!quote || quote->y != y || quote->source.front() != '"') continue;
                std::optional<BookField> title;
                for (int x : {seed.start - 1, seed.start}) {
                    auto candidate = logical_field(x, y - 1, right);
                    if (!candidate || candidate->y + candidate->height != y ||
                        candidate->source.front() == '"') continue;
                    title = std::move(candidate);
                    break;
                }
                if (!title) continue;
                claim(*title, right, false);
                claim(*quote, right, true);
            }
        }
    }
}
