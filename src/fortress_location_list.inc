// Places/Locations emits one complete name, one complete type/faith caption,
// and an optional occupation count per picture record (PE 53.16 39d1f9).
// Own those native fields before generic templates split an identity and
// centre its translated fragments in unrelated English spans.
void Overlay::append_fortress_location_list_matches(std::vector<std::string> &rows,
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
    int tabs_y = -1;
    const auto panel = capture_fortress_places_panel(context, tabs_y);
    if (!panel) return;
    const int panel_right = panel->x + panel->w;
    const int panel_bottom = panel->y + panel->h;
    const auto drawn = captured_native_drawn_text_rows();
    const auto top_drawn = captured_native_drawn_text_rows(true);
    const auto clipped = captured_clipped_captions();

    struct Field {
        int x, y, end, right;
        std::string source, complete;
    };
    const auto field_at = [&](int left, int right, int y) -> std::optional<Field> {
        if (left >= right || y < 0 || y >= gps_->dimy) return std::nullopt;
        while (left < right && context[y][left] == ' ') ++left;
        if (left == right) return std::nullopt;
        int end = right;
        const std::string_view slot(context[y].data() + left, right - left);
        for (size_t at = 0; at < slot.size(); ++at)
            if (is_cp437_box_separator(slot, at)) {
                end = left + static_cast<int>(at);
                break;
            }
        while (end > left && context[y][end - 1] == ' ') --end;
        if (end == left) return std::nullopt;
        Field field{left, y, end, right, context[y].substr(left, end - left), {}};
        bool top = false;
        cell_at(left, y, &top);
        // Each line is a single native draw. Its actual source retains
        // internal spaces, even where the generic field splitter sees columns.
        for (const auto &draw : top ? top_drawn : drawn) {
            if (draw.x != left || draw.y != y || draw.source.empty() ||
                draw.source.size() > static_cast<size_t>(right - left) ||
                context[y].compare(left, draw.source.size(), draw.source) != 0) continue;
            const int draw_end = left + static_cast<int>(draw.source.size());
            if (draw_end < end && std::string_view(context[y]).substr(
                    draw_end, end - draw_end).find_first_not_of(' ') !=
                    std::string_view::npos) continue;
            field.source = draw.source;
            field.end = draw_end;
            field.complete = draw.complete_source;
            break;
        }
        if (field.complete.empty()) field.complete = field.source;
        for (const auto &capture : clipped) {
            if (capture.x == field.x && capture.y == y &&
                capture.visible == field.source && !capture.complete.empty()) {
                field.complete = capture.complete;
                break;
            }
        }
        return field;
    };
    const auto count_at = [&](int left, int right, int y) -> std::optional<Field> {
        constexpr std::string_view suffix = " assigned";
        const auto &line = context[y];
        for (size_t at = line.find(suffix, left); at != std::string::npos &&
                at + suffix.size() <= static_cast<size_t>(right);
             at = line.find(suffix, at + suffix.size())) {
            int start = static_cast<int>(at);
            while (start > left && line[start - 1] >= '0' && line[start - 1] <= '9') --start;
            if (start == static_cast<int>(at) ||
                (start > left && (start < left + 2 || line[start - 1] != ' ' ||
                    line[start - 2] != ' '))) continue;
            const int end = static_cast<int>(at + suffix.size());
            bool tail = true;
            for (int x = end; x < right; ++x)
                if (line[x] != ' ' && !is_cp437_box_separator(line, x)) tail = false;
            if (tail) return Field{start, y, end, right,
                line.substr(start, end - start), line.substr(start, end - start)};
        }
        return std::nullopt;
    };
    struct Description {
        std::string kind, name;
        bool dedication = false, profession = false;
    };
    const auto description = [](std::string_view source) -> std::optional<Description> {
        for (const std::string_view kind : {
                "Temple complex", "Temple", "Shrine", "Hospital", "Library", "Tavern"}) {
            if (source == kind) return Description{std::string(kind), {}};
            if (kind != "Temple complex" && kind != "Temple" && kind != "Shrine") continue;
            for (const std::string_view relation : {" of ", " to "}) {
                if (relation == " to " && kind != "Shrine") continue;
                const std::string prefix = std::string(kind) + std::string(relation);
                if (source.starts_with(prefix) && source.size() > prefix.size())
                    return Description{std::string(kind), std::string(source.substr(prefix.size())),
                        relation == " to "};
            }
        }
        for (const std::string_view suffix : {" grand guildhall", " guildhall", " meeting place"})
            if (source.ends_with(suffix) && source.size() > suffix.size())
                return Description{std::string(suffix.substr(1)),
                    std::string(source.substr(0, source.size() - suffix.size())), false, true};
        return std::nullopt;
    };
    const auto render_template = [&](std::string_view key, const std::string &value)
            -> std::optional<std::string> {
        const auto found = history_semantic_templates_.find(std::string(key));
        if (found == history_semantic_templates_.end()) return std::nullopt;
        bool complete = false;
        auto target = translate_template_captures(rules_[static_cast<size_t>(found->second)],
            {value}, &complete);
        return complete && !target.empty() ? std::optional<std::string>(std::move(target))
            : std::nullopt;
    };
    const auto translate_description = [&](const Description &value)
            -> std::optional<std::string> {
        if (value.profession) {
            if (value.kind == "meeting place")
                return render_template("{s} meeting place", value.name);
            auto profession = translate_unit_profession(value.name, true);
            if (!profession) profession = exact_literal_translation(value.name);
            if (!profession) profession = translate_compositional(value.name);
            auto kind = exact_literal_translation(value.kind == "grand guildhall"
                ? "Grand guildhall" : "Guildhall");
            if (profession && kind) return *profession + *kind;
            return std::nullopt;
        }
        const auto kind = exact_literal_translation(value.kind);
        if (!kind || value.name.empty()) return kind;
        // A faith may name either an entity or a deity. Both are complete
        // generated/native identities; never feed isolated title words to
        // the dictionary or phoneticize the type prefix with the name.
        auto name = contains_cjk_utf8(value.name)
            ? std::optional<std::string>(native_text_to_utf8(value.name))
            : translate_legends_name(value.name, true);
        if (!name) name = translate_legends_name(value.name, false);
        if (!name) name = translate_procedural_fragment(value.name, false, false, {},
            ProceduralFragmentContext::generated_name);
        if (!name) return std::nullopt;
        return (value.dedication ? "供奉" : "") + *name + "的" + *kind;
    };
    const auto append = [&](const Field &field, const std::optional<std::string> &translated,
                            int left) {
        const auto target = translated ? *translated : native_text_to_utf8(field.complete);
        const int length = field.end - field.x;
        if (length <= 0 || left >= field.right || target.empty() ||
            target.find("[C:") != std::string::npos || target.find_first_of("\r\n") != std::string::npos)
            return;
        if (rows[field.y].compare(field.x, length, field.source) == 0) {
            if (only_y < 0 || only_y == field.y) {
                Match match{field.x, field.y, length, kFortressLocationListRule, target, field.source};
                match.native_picture_caption_box = SDL_Rect{left, field.y, field.right - left, 1};
                match.native_picture_caption_source = field.complete;
                match.native_hover_untranslated = !translated;
                match.layout_x = left;
                match.layout_y = field.y;
                match.layout_length = field.right - left;
                match.layout_clip_right = field.right;
                match.layout_left = true;
                matches.push_back(std::move(match));
            }
            std::fill_n(rows[field.y].begin() + field.x, length, ' ');
        } else if (raw_layer) {
            // The composite pass draws the one complete field. A partial
            // native text layer only suppresses its equal physical bytes.
            for (int offset = 0; offset < length;) {
                while (offset < length && rows[field.y][field.x + offset] != field.source[offset]) ++offset;
                const int start = offset;
                while (offset < length && rows[field.y][field.x + offset] == field.source[offset]) ++offset;
                if (offset == start) continue;
                if (only_y < 0 || only_y == field.y)
                    matches.push_back({field.x + start, field.y, offset - start,
                        kFortressLocationListRule, {}, field.source.substr(start, offset - start)});
                std::fill_n(rows[field.y].begin() + field.x + start, offset - start, ' ');
            }
        }
    };

    for (int y = tabs_y + 1; y + 1 < panel_bottom; ++y) {
        if (only_y >= 0 && only_y != y && only_y != y + 1) continue;
        for (const auto &start : split_text_fields(context[y])) {
            if (start.start < panel->x || start.end > panel_right) continue;
            const auto box = native_picture_caption_rect(
                *gps_, start.start, y, false, nullptr, true, nullptr, true);
            if (!box || box->x < panel->x || box->x + box->w > panel_right ||
                box->y <= tabs_y || box->y + box->h > panel_bottom ||
                y != box->y + 1 || start.start < box->x ||
                std::string_view(context[y]).substr(box->x, start.start - box->x)
                    .find_first_not_of(' ') != std::string_view::npos) continue;
            const int left = start.start;
            int right = box->x + box->w;
            // Actions retain the rectangle fill underneath their foreground
            // artwork. Their complete current 3x3 skins own the right edge.
            for (int x = left; x + 3 <= right; ++x)
                if (native_square_button_at(*gps_, x, y, native_texture_button_stocks_recenter(*gps_)) ||
                    native_square_button_at(*gps_, x, y, native_texture_button_stocks_view_item(*gps_))) {
                    right = x;
                    break;
                }
            const auto first_count = count_at(left, right, y);
            const auto second_count = count_at(left, right, y + 1);
            const auto name = field_at(left, first_count ? first_count->x : right, y);
            const auto detail = field_at(left, second_count ? second_count->x : right, y + 1);
            if (!name || !detail || name->x != left || detail->x != left) continue;
            const auto type = description(detail->complete);
            if (!type) continue;
            auto title = contains_cjk_utf8(name->complete)
                ? std::optional<std::string>(native_text_to_utf8(name->complete))
                : translate_procedural_fragment(name->complete, false, false, {},
                    ProceduralFragmentContext::generated_name);
            if (!title) title = exact_literal_translation(name->complete);
            append(*name, title, left);
            append(*detail, translate_description(*type), left);
            for (const auto *count : {&first_count, &second_count})
                if (*count) {
                    const auto digits = (*count)->source.substr(0, (*count)->source.find(' '));
                    append(**count, render_template("{d} assigned", digits), (*count)->x);
                }
            break;
        }
    }
}

void Overlay::layout_fortress_location_list(SDL_Renderer *renderer) {
    if (!gps_ || !renderer || !face_ || gps_->tile_pixel_x <= 0 || gps_->tile_pixel_y <= 0) return;
    for (Match &match : prepared_matches_) {
        if (match.rule != kFortressLocationListRule || match.target.empty() ||
            match.native_split_duplicate || !match.native_picture_caption_box) continue;
        const SDL_Rect &box = *match.native_picture_caption_box;
        layout_fortress_text_rows(renderer, {{&match}}, box.x, box.x + box.w);
        match.layout_y = box.y;
        match.layout_pixel_y = 0;
        match.layout_fixed_baseline = true;
    }
}
