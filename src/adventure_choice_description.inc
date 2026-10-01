// Story subjects and poetic forms put their description in a separate frame
// above the action list, outside the title/list panel handled below. Route
// each complete card to its semantic grammar before translating its rows.
        for (const auto &choice : choice_panels) {
            if (choice.kind != ChoiceKind::Action) continue;
            const int left = choice.bounds.x;
            const int right = left + choice.bounds.w;
            std::optional<SDL_Rect> description;
            for (int y = choice.bounds.y - 2; y > 1; --y) {
                if (!borders.at(left - 1, y, 6) || !borders.at(right, y, 8)) continue;
                const auto panel = native_panel_interior(borders, *gps_, left, right, y - 1);
                if (panel && panel->x == left && panel->w == choice.bounds.w &&
                    panel->y + panel->h < choice.bounds.y) description = panel;
                // Only the nearest aligned closed frame belongs to this list.
                break;
            }
            if (!description) continue;
            const auto card = capture_panel_text_card(*description);
            if (!card) continue;

            constexpr uint32_t top_half = 1u << 3, bottom_half = 1u << 4;
            const auto row_half = [&](const Match &row) {
                uint32_t half = UINT32_MAX;
                for (int x = row.x; x < row.x + row.length; ++x) {
                    if (row.source[x - row.x] == ' ') continue;
                    bool top = false;
                    cell_at(x, row.y, &top);
                    const auto *flags = top ? gps_->screentexpos_top_flag : gps_->screentexpos_flag;
                    const uint32_t current = flags
                        ? flags[static_cast<size_t>(x) * gps_->dimy + row.y] & (top_half | bottom_half) : 0;
                    if (current == (top_half | bottom_half) ||
                        (half != UINT32_MAX && half != current)) return UINT32_MAX;
                    half = current;
                }
                return half;
            };
            std::vector<Match> rows, duplicates;
            bool intact = true;
            for (const auto &line : card->rows) {
                // Compare against visible native ink, before earlier phrase
                // matches erased their spans from the working screen_rows.
                // The complete card supersedes those overlapping matches;
                // occluded or non-text cells still cannot supply its source.
                if (context[line.y].compare(line.x, line.source.size(), line.source) != 0) {
                    intact = false;
                    break;
                }
                for (size_t i = 0; i < line.source.size(); ++i) {
                    bool top = false;
                    cell_at(line.x + static_cast<int>(i), line.y, &top);
                    if (screen_override && screen_override != (top ? gps_->screen_top : gps_->screen)) {
                        intact = false;
                        break;
                    }
                }
                if (!intact) break;
                Match row{line.x, line.y, static_cast<int>(line.source.size()),
                    kUiMessageRule, {}, line.source};
                row.layout_foreground_rgb = line.foregrounds.front();
                const uint32_t half = row_half(row);
                if (half == bottom_half && !rows.empty() &&
                    rows.back().y + 1 == row.y && rows.back().x == row.x &&
                    rows.back().source == row.source && row_half(rows.back()) == top_half) {
                    // Two complementary native font halves are one source
                    // line, with two independent glyph-suppression spans.
                    rows.back().native_split_text = true;
                    rows.back().native_split_top_y = rows.back().y;
                    row.native_split_text = true;
                    row.native_split_duplicate = true;
                    row.native_split_top_y = rows.back().y;
                    duplicates.push_back(std::move(row));
                } else if (half == bottom_half || half == UINT32_MAX) {
                    intact = false;
                    break;
                } else rows.push_back(std::move(row));
            }
            if (!intact || rows.empty() || std::any_of(rows.begin(), rows.end(),
                    [&](const Match &row) {
                        return row_half(row) == top_half && !row.native_split_text;
                    })) continue;

            std::string source;
            for (const Match &row : rows) {
                if (!source.empty()) source += ' ';
                source += row.source;
            }
            NativeParagraphViewport viewport;
            if (const auto native = native_source_for_rows(rows, -1, nullptr, &viewport);
                native && viewport.first_line == 0 &&
                viewport.total_lines == static_cast<int>(rows.size())) source = *native;
            const bool poetic = source.find(" poetic ") != std::string::npos;
            // Biographies retain h-rule actor/species and sentence handling.
            // Neither grammar may claim just an incomplete translated head.
            const auto target = poetic
                ? translate_poetic_form_description(source)
                : translate_legends_text(source, false, false);
            if (!target) continue;
            if (poetic) {
                for (Match &row : rows) row.rule = kPoeticDescriptionRule;
                for (Match &row : duplicates) row.rule = kPoeticDescriptionRule;
            }
            std::vector<Match> translated;
            if (!append_bounded_paragraph(rows, *target, screen_rows, translated,
                    only_y, right, right)) continue;
            // The common paragraph layout owns every Chinese baseline,
            // including additional rows with no native source span.
            for (Match &row : duplicates) {
                std::fill_n(screen_rows[row.y].begin() + row.x, row.length, ' ');
                if (only_y < 0 || only_y == row.y) translated.push_back(std::move(row));
            }
            // Complete prose replaces any earlier overlapping field match.
            std::erase_if(result, [&](const Match &match) {
                return std::any_of(card->rows.begin(), card->rows.end(), [&](const auto &row) {
                    return match.y == row.y && match.x < row.x + static_cast<int>(row.source.size()) &&
                        row.x < match.x + match.length;
                });
            });
            result.insert(result.end(), std::make_move_iterator(translated.begin()),
                std::make_move_iterator(translated.end()));
        }
