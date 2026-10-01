// The final grid is not the source of an overflowing summary row: a later
// right-column draw can overwrite the middle of a left-column name/skill.
// Reconstruct meaning from this draw pass, and claim only surviving bytes.
std::unordered_set<int> recovered_rows;
if (!cards.empty()) {
    int left = gps_->dimx, right = 0, divider = -1;
    for (const auto &card : cards) {
        if (card.interior.x < left) {
            left = card.interior.x;
            divider = left + card.interior.w;
        }
        right = std::max(right, card.interior.x + card.interior.w);
    }
    const std::array draw_layers{captured_native_drawn_text_rows(false),
        captured_native_drawn_text_rows(true)};
    const auto captions = captured_clipped_captions();
    const auto settings = native_ui_settings();
    const bool classic = settings && settings->classic;
    const long vertical = native_texture_interior_border_n_s(*gps_);
    const auto source_row_matches = [&](int x, int source_y, bool top_layer, int y) {
        if (x < 0 || x >= gps_->dimx || source_y < 0 ||
                source_y >= gps_->dimy || y < 0 || y >= gps_->dimy ||
                !native_item_row_layer_at(*gps_, x, source_y, top_layer) ||
                !native_item_row_layer_at(*gps_, x, y, top_layer)) return false;
        if (source_y == y) return true;
        const auto *flags = top_layer ? gps_->screentexpos_top_flag : gps_->screentexpos_flag;
        if (!flags) return false;
        const auto half_at = [&](int row) {
            return flags[static_cast<size_t>(x) * gps_->dimy + row] &
                ((1u << 3) | (1u << 4));
        };
        const auto half = half_at(source_y);
        const int mate = half == (1u << 3) ? source_y + 1
            : half == (1u << 4) ? source_y - 1 : -1;
        return y == mate && half_at(y) ==
            (half == (1u << 3) ? (1u << 4) : (1u << 3));
    };
    std::unordered_set<int> visited;
    for (const auto &card : cards) {
        const int y = card.interior.y;
        if (!visited.insert(y).second || y < 0 || y >= gps_->dimy || divider < 0)
            continue;
        struct DrawPart {
            const NativeDrawnTextRow *draw;
            int column, end, color = -1;
            std::string complete;
            bool top_layer = false, blank = false, skill_status = false;
            bool valid = true;
        };
        std::vector<DrawPart> parts;
        std::array<std::vector<int>, 2> layer_owners{
            std::vector<int>(static_cast<size_t>(gps_->dimx), -1),
            std::vector<int>(static_cast<size_t>(gps_->dimx), -1)};
        std::vector<int> owners(static_cast<size_t>(gps_->dimx), -1);
        std::string visible(static_cast<size_t>(gps_->dimx), ' ');
        std::vector<int> colors(static_cast<size_t>(gps_->dimx), -1);
        for (int x = left; x < gps_->dimx; ++x) {
            bool top = false;
            const auto *cell = cell_at(x, y, &top);
            if (!cell) continue;
            visible[x] = cell[0] ? cell[0] : ' ';
            colors[x] = (cell[1] << 16) | (cell[2] << 8) | cell[3];
        }
        const bool intact_divider = classic
            ? native_ui_skin_at(*gps_, divider, y, vertical, true)
            : native_ui_texture_at(*gps_, divider, y, vertical);
        bool needs_recovery = false;
        for (size_t layer = 0; layer < draw_layers.size(); ++layer)
        for (const auto &draw : draw_layers[layer]) {
            const bool top_layer = layer != 0;
            if (draw.x < left || draw.x >= right ||
                draw.source.empty() ||
                !source_row_matches(draw.x, draw.y, top_layer, y)) continue;
            bool skill_status = false;
            if (draw.x == divider) {
                // DF draws the rust badge separately after the rated skill.
                // A 29-cell title fills this column and puts the badge's
                // leading space directly on the divider. Its native draw
                // still belongs to the adjacent left skill, not the need
                // that is drawn later in the right cell.
                if (draw.source != " (Rusty)" && draw.source != " (V Rusty)") continue;
                for (auto previous = parts.rbegin(); previous != parts.rend(); ++previous) {
                    if (previous->column != 0 || previous->top_layer != top_layer ||
                        previous->draw->y != draw.y ||
                        previous->draw->x + static_cast<int>(previous->draw->source.size()) !=
                            draw.x || previous->complete != previous->draw->source) continue;
                    const auto skills = translate_rated_skill_list(previous->complete);
                    if (!skills || skills->size() != 1 ||
                        skills->front().status_start != std::string::npos) continue;
                    skill_status = true;
                    break;
                }
                if (!skill_status) continue;
            }
            const int column = draw.x < divider || skill_status ? 0 : 1;
            const int boundary = column == 0 ? divider : right;
            DrawPart part{&draw, column,
                std::min(gps_->dimx, draw.x + static_cast<int>(draw.source.size())),
                -1, draw.complete_source.empty() ? draw.source : draw.complete_source,
                top_layer, false, skill_status};
            // Positive-width addst abbreviates a private copy (including
            // deity names). Its retained draw keeps that complete identity.
            // Widget clipping instead keeps the full source in the draw and
            // records the shorter physical footprint in the caption table.
            for (const auto &caption : captions) {
                if (caption.x != draw.x || caption.y != draw.y) continue;
                if (caption.visible == draw.source) part.complete = caption.complete;
                if (caption.complete == draw.source &&
                    draw.source.starts_with(caption.visible))
                    part.end = std::min(part.end,
                        draw.x + static_cast<int>(caption.visible.size()));
            }
            if (column == 0 && intact_divider) part.end = std::min(part.end, divider);
            if (part.end <= draw.x) continue;
            part.blank = draw.source.find_first_not_of(' ') == std::string::npos &&
                part.complete.find_first_not_of(' ') == std::string::npos;
            needs_recovery = needs_recovery || (!part.blank && (
                draw.x + static_cast<int>(draw.source.size()) > boundary ||
                part.complete != draw.source));
            const int index = static_cast<int>(parts.size());
            for (int x = draw.x; x < part.end; ++x) layer_owners[layer][x] = index;
            parts.push_back(std::move(part));
        }
        if (!needs_recovery || parts.empty()) continue;
        // Preserve draw order within each logical layer. The current visible
        // layer and matching font halves must agree at every surviving cell;
        // a top caption cannot lend its bytes to a covered base draw.
        for (size_t index = 0; index < parts.size(); ++index) {
            auto &part = parts[index];
            int blank_color = -1;
            bool owns_cell = false;
            for (int x = part.draw->x; x < part.end; ++x) {
                if (layer_owners[part.top_layer ? 1 : 0][x] != static_cast<int>(index))
                    continue;
                owns_cell = true;
                if (!source_row_matches(x, part.draw->y, part.top_layer, y) ||
                    visible[x] != part.draw->source[x - part.draw->x] ||
                    native_foreground_picture_at(*gps_, x, y) ||
                    native_item_action_at(*gps_, x, y)) {
                    part.valid = false;
                    break;
                }
                owners[x] = static_cast<int>(index);
                if (visible[x] != ' ' && part.color < 0) part.color = colors[x];
                if (visible[x] == ' ' && blank_color < 0) blank_color = colors[x];
            }
            // A clearing draw still owns its surviving spaces. A proved
            // rust continuation can retain only its leading divider space
            // after the right-hand need overwrites every status glyph; that
            // space retains the badge's own foreground color.
            if ((part.blank || part.skill_status) && part.color < 0)
                part.color = blank_color;
            if (part.color < 0 && (!part.blank || owns_cell)) part.valid = false;
        }
        // All nonblank text inside either captured cell must have a current
        // draw owner. A popup, uncaptured glyph or stale pass keeps the normal
        // bounded-row path; it cannot authorize suppressing another control.
        bool complete = true;
        for (const auto &physical : cards) {
            if (physical.interior.y != y) continue;
            for (const auto &row : physical.rows) {
                for (int x = row.x; x < row.x + static_cast<int>(row.source.size()); ++x) {
                    if (visible[x] == ' ') continue;
                    if (owners[x] < 0 || !parts[owners[x]].valid) complete = false;
                }
            }
        }
        if (!complete || std::any_of(parts.begin(), parts.end(),
                [](const DrawPart &part) { return !part.valid; })) continue;
        struct ColumnText {
            std::string source, target;
            std::vector<int> source_colors, target_colors;
            bool translated = false;
        };
        std::array<ColumnText, 2> columns;
        for (int column = 0; column < 2 && complete; ++column) {
            std::vector<const DrawPart *> ordered;
            for (const auto &part : parts)
                if (part.column == column && !part.blank) ordered.push_back(&part);
            std::sort(ordered.begin(), ordered.end(), [](const auto *a, const auto *b) {
                return a->draw->x < b->draw->x;
            });
            auto &text = columns[column];
            int end = -1;
            for (const auto *part : ordered) {
                if (end > part->draw->x) { complete = false; break; }
                if (end >= 0 && end < part->draw->x) {
                    text.source += ' ';
                    text.source_colors.push_back(part->color);
                }
                text.source += part->complete;
                text.source_colors.insert(text.source_colors.end(),
                    part->complete.size(), part->color);
                end = part->draw->x + static_cast<int>(part->draw->source.size());
            }
            if (text.source.empty()) continue;
            const std::string source = normalize_utterance(text.source);
            auto target = exact_literal_translation("Character overview: " + source);
            if (!target) target = exact_literal_translation(source);
            if (!target) target = translate_procedural_fragment(source);
            if (!target) target = translate_fortress_activity(source);
            if (!target) target = translate_ui_message_capture(source, true);
            text.translated = target.has_value();
            text.target = target ? *target : native_text_to_utf8(text.source);
            const auto color_at = [&](size_t at) {
                while (at < text.source.size() && text.source[at] == ' ') ++at;
                return text.source_colors[std::min(at, text.source_colors.size() - 1)];
            };
            const auto append_colors = [&](std::string_view value, size_t at) {
                std::vector<uint32_t> cps;
                if (decode_utf8(std::string(value), cps))
                    text.target_colors.insert(text.target_colors.end(), cps.size(), color_at(at));
            };
            // A skill's rust status and a need's value have independent
            // colors. Their offsets come from complete grammar, never from
            // the now-overwritten grid cells at the same byte positions.
            const auto skills = translate_rated_skill_list(text.source);
            if (skills && skills->size() == 1 && skills->front().target == text.target) {
                const auto &skill = skills->front();
                const size_t status = skill.status_target_start == std::string::npos
                    ? skill.target.size() : skill.status_target_start;
                append_colors(skill.title, skill.title_start);
                append_colors(std::string_view(skill.target).substr(
                    skill.title.size(), status - skill.title.size()), skill.start);
                if (skill.status_start != std::string::npos)
                    append_colors(std::string_view(skill.target).substr(status), skill.status_start);
            } else {
                const size_t source_colon = text.source.find(':');
                const size_t target_colon = text.target.find("：");
                if (source_colon != std::string::npos && target_colon != std::string::npos) {
                    append_colors(std::string_view(text.target).substr(0, target_colon + 3), 0);
                    append_colors(std::string_view(text.target).substr(target_colon + 3), source_colon + 1);
                } else append_colors(text.target, 0);
            }
        }
        if (!complete) continue;
        // The first surviving span in a column carries its complete display
        // row. All other spans, including tails beyond the opposite column
        // and overwritten divider cells, only remove the original glyphs.
        std::array<bool, 2> placed{};
        for (int x = left; x < gps_->dimx;) {
            if (owners[x] < 0 || parts[owners[x]].blank) { ++x; continue; }
            const int column = parts[owners[x]].column;
            const int begin = x++;
            while (x < gps_->dimx && owners[x] >= 0 &&
                !parts[owners[x]].blank &&
                parts[owners[x]].column == column && x != divider &&
                x != divider + 1 && x != right) ++x;
            auto &text = columns[column];
            const bool display = !placed[column] && !text.target.empty();
            Match span{begin, y, x - begin, kCharacterOverviewRowRule,
                display ? text.target : std::string{}, visible.substr(begin, x - begin)};
            span.layout_foreground_rgb = parts[owners[begin]].color;
            if (display) {
                span.native_overview_complete_row = true;
                span.layout_x = column == 0 ? left : divider + 1;
                span.layout_length = (column == 0 ? divider : right) - span.layout_x;
                span.layout_clip_right = column == 0 ? divider : right;
                span.layout_left = true;
                span.layout_glyph_foreground_rgb = std::move(text.target_colors);
                span.native_hover_untranslated = !text.translated;
                if (!text.translated) span.native_help_review_source = text.source;
                placed[column] = true;
            }
            std::fill_n(screen_rows[y].begin() + begin, x - begin, ' ');
            std::erase_if(matches, [&](const Match &match) {
                return match.y == y && match.x < x && begin < match.x + match.length;
            });
            if (only_y < 0 || only_y == y) matches.push_back(std::move(span));
        }
        recovered_rows.insert(y);
    }
}
