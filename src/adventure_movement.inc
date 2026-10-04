// Included inside find_matches before complete UI messages and word rules.
// Movement gaits and visibility grades have meanings local to this modal.
// The glossary owns their wording; native headings and the closed frame own
// the fields, including immediate glyph suppression on either screen layer.
    {
        std::vector<std::string> context = screen_rows;
        // Shortcut protection has already removed a-f from the work buffer.
        // Read the same native menu for glyph suppression and final drawing;
        // otherwise the raw pass hides a gait that the composed pass misses.
        for (int y = 0; y < gps_->dimy; ++y) {
            for (int x = 0; x < gps_->dimx; ++x) {
                const unsigned char ch = visible_char_at(x, y);
                context[y][x] = ch ? static_cast<char>(ch) : ' ';
            }
        }
        const auto find_caption = [&](int y, int left, int right,
                                      std::string_view literal)
                -> std::optional<LogicalTextField> {
            const auto &row = context[y];
            for (int x = left; x < right; ++x) {
                if (row[x] != literal.front() ||
                    (x > left && ascii_word_byte(row[x - 1]))) continue;
                const auto end = catalog_literal_end(row, x, literal, false);
                if (!end || *end > static_cast<size_t>(right) ||
                    (*end < static_cast<size_t>(right) && ascii_word_byte(row[*end])))
                    continue;
                return LogicalTextField{x, static_cast<int>(*end),
                    row.substr(x, *end - x)};
            }
            return std::nullopt;
        };
        const NativePanelBorders borders(*gps_);
        for (int title_y = 0; title_y < gps_->dimy; ++title_y) {
            const auto title = find_caption(title_y, 0, gps_->dimx, "How will");
            if (!title) continue;
            const auto ending = find_caption(title_y, title->end, gps_->dimx, "move?");
            if (!ending) continue;
            const auto panel = native_panel_interior(borders, *gps_,
                title->start, ending->end, title_y);
            if (!panel) continue;
            const int right = panel->x + panel->w;
            const int bottom = panel->y + panel->h;
            // Gaits belong to the movement heading and its closed modal.
            // Optional stealth/swimming sections bound only their own fields.
            int headings_y = bottom;
            std::optional<LogicalTextField> factors;
            for (int y = title_y + 1; y < bottom; ++y) {
                const auto score = find_caption(y, panel->x, right,
                    "Visual Stealth (w/o Skill)");
                if (!score) continue;
                factors = find_caption(y, score->end, right, "Visual Stealth Factors");
                if (factors) {
                    headings_y = y;
                    break;
                }
            }

            const auto append_field = [&](int y, int first, int end, int field_right) {
                if (first >= end || first < panel->x || end > field_right ||
                    field_right > right) return;
                const std::string source = context[y].substr(first, end - first);
                // Context may use the composed grid; source ownership must
                // still agree byte-for-byte with this exact visible layer.
                if (screen_rows[y].compare(first, source.size(), source) != 0) return;
                for (int x = first; x < end; ++x) {
                    if (is_cp437_box_separator(context[y], x)) return;
                    if (screen_override) {
                        bool top = false;
                        cell_at(x, y, &top);
                        if (screen_override != (top ? gps_->screen_top : gps_->screen)) return;
                    }
                }
                const auto target = exact_literal_translation(
                    "Adventure movement: " + normalize_utterance(source));
                if (!target || target->empty()) return;
                append_setup_paragraph({Match{first, y, end - first,
                    kUiMessageRule, {}, source}}, *target, field_right, field_right);
            };

            // Creature definitions supply the gait labels. Read the complete
            // field between its shortcut and Speed, without assuming that a
            // shortcut always selects a walking gait. Neither the shortcut
            // nor its numeric speed is part of the translated source span.
            for (int y = title_y + 1; y < headings_y; ++y) {
                const auto &row = context[y];
                const auto is_shortcut = [&](int x, int edge) {
                    return x + 2 < edge && row[x] >= 'a' && row[x] <= 'f' &&
                        row[x + 1] == ' ';
                };
                int gait_right = right;
                int key_x = panel->x;
                while (key_x < right && row[key_x] == ' ') ++key_x;
                // Classic row buttons retain a real character for the left
                // cap. Locate the shortcut inside the complete native skin,
                // rather than treating the panel's first non-space as a key.
                // Unframed rows keep their original panel-wide bounds.
                for (int x = key_x; x + 2 < right; ++x) {
                    if (!is_shortcut(x, right)) continue;
                    const auto button = native_button_text_rect(*gps_, x, x + 1, y);
                    if (!button || button->x < panel->x ||
                        button->x + button->w > right || button->y <= title_y ||
                        button->y + button->h > headings_y ||
                        !std::all_of(row.begin() + button->x, row.begin() + x,
                            [](char ch) { return ch == ' '; })) continue;
                    key_x = x;
                    gait_right = button->x + button->w;
                    break;
                }
                if (!is_shortcut(key_x, gait_right)) continue;
                int first = key_x + 2;
                while (first < gait_right && row[first] == ' ') ++first;
                const auto speed = find_caption(y, first, gait_right, "Speed:");
                if (!speed || speed->end >= gait_right || speed->start <= first ||
                    row[speed->start - 1] != ' ') continue;
                int end = speed->start;
                while (end > first && row[end - 1] == ' ') --end;
                append_field(y, first, end, speed->start);
            }

            if (!factors) continue;
            int swimming_y = -1;
            for (int y = headings_y + 1; y < bottom; ++y) {
                if (find_caption(y, panel->x, right, "Swimming Preference")) {
                    swimming_y = y;
                    break;
                }
            }
            if (swimming_y < 0) continue;

            // The two headings divide the grade and factor columns. Only a
            // complete column field can use a scoped alias, so a word inside
            // the explanatory sentence cannot acquire a grade's meaning.
            for (int y = headings_y + 1; y < swimming_y; ++y) {
                for (const auto &[left, field_right] :
                        {std::pair{panel->x, factors->start},
                         std::pair{factors->start, right}}) {
                    const std::string_view band(context[y].data() + left,
                        static_cast<size_t>(field_right - left));
                    const std::string_view field = trim_view(band);
                    if (field.empty()) continue;
                    const int first = left + static_cast<int>(field.data() - band.data());
                    append_field(y, first, first + static_cast<int>(field.size()), field_right);
                }
            }
            // Double-height native headings may occupy the adjacent row;
            // the same modal has already supplied all of its owned fields.
            title_y = swimming_y;
        }
    }
