// The fortress map hover is ONE native widget. Its live frame, not a known
// terrain word or the coverage of a dictionary entry, owns every text row.
// Translation remains in the shared phrase/matching machinery; this layer
// only captures the widget and composes its translated/native inline runs.
std::optional<NativeFortressHoverCard> Overlay::capture_fortress_hover_card(
        std::vector<std::string> &rows, const unsigned char *screen_override) const {
    if (gps_->tile_pixel_x <= 0 || gps_->tile_pixel_y <= 0) return std::nullopt;
    int header_y = -1, stocks_x = -1;
    for (int y = 0; y < std::min(3, gps_->dimy); ++y) {
        std::string context(gps_->dimx, ' ');
        for (int x = 0; x < gps_->dimx; ++x) {
            const unsigned char ch = visible_char_at(x, y);
            context[x] = ch ? ch : ' ';
        }
        for (std::string_view label : {"Pop", "Population", "Stocks"}) {
            const size_t at = context.find(label);
            if (at == std::string::npos ||
                !has_word_boundaries(context, at, at + label.size())) continue;
            if (label == "Stocks") stocks_x = static_cast<int>(at);
            else header_y = y;
        }
    }
    if (header_y < 0 || stocks_x < 0) return std::nullopt;

    const NativePanelBorders borders(*gps_);
    std::vector<std::string> border_rows(gps_->dimy);
    const auto border = [&](int x, int y, int part) {
        if (x < 0 || x >= gps_->dimx || y < 0 || y >= gps_->dimy) return false;
        bool top = false;
        const auto *cell = cell_at(x, y, &top);
        unsigned char ch = cell ? cell[0] : 0;
        // UTF-8 continuation bytes can share CP437 border byte values. Text
        // in a Unicode/custom name is not a nested window that cancels layout.
        if (is_cp437_box_drawing_byte(ch)) {
            auto &native = border_rows[y];
            if (native.empty()) {
                native.resize(gps_->dimx, ' ');
                for (int column = 0; column < gps_->dimx; ++column) {
                    const auto *at = cell_at(column, y, &top);
                    native[column] = at && at[0] ? at[0] : ' ';
                }
            }
            if (!is_cp437_box_separator(native, x)) ch = 0;
        }
        return borders.at(x, y, part, ch);
    };
    int hud_right = stocks_x + 1;
    while (hud_right < gps_->dimx && !border(hud_right, header_y + 1, 5)) ++hud_right;
    if (hud_right >= gps_->dimx) return std::nullopt;
    std::optional<SDL_Rect> interior;
    // The hover hangs below the three-row HUD and shares its right border.
    // Its left edge may cross Stocks at a different UI scale/window width;
    // the actual HUD edge, not a minimum text x, identifies this attachment.
    // Its upper corners can be joined into the HUD's lower edge; demand a
    // continuous horizontal edge and connected sides/bottom instead of
    // requiring the two corners of a freestanding tooltip.
    for (int top = header_y + 2; top <= header_y + 5 && top + 2 < gps_->dimy; ++top) {
        for (int left = 0; left + 2 <= hud_right; ++left) {
            if (!border(left, top + 1, 3)) continue;
            int right = left + 2;
            while (right < gps_->dimx && !border(right, top + 1, 5)) ++right;
            if (right != hud_right) continue;
            bool closed = true;
            for (int x = left + 1; x < right; ++x)
                if (!border(x, top, 1) && !border(x, top, 7)) {
                    closed = false;
                    break;
                }
            if (!closed) continue;
            int bottom = top + 2;
            for (; bottom < gps_->dimy; ++bottom) {
                if (border(left, bottom, 6) && border(right, bottom, 8)) {
                    for (int x = left + 1; x < right; ++x)
                        if (!border(x, bottom, 7)) { closed = false; break; }
                    break;
                }
                if (!border(left, bottom, 3) || !border(right, bottom, 5)) {
                    closed = false;
                    break;
                }
            }
            if (!closed || bottom >= gps_->dimy) continue;
            SDL_Rect candidate{left + 1, top + 1, right - left - 1, bottom - top - 1};
            // A foreground subwindow invalidates this background card. Never
            // replay a hidden card just because two outer sides survive.
            for (int y = candidate.y; closed && y < bottom; ++y)
                for (int x = candidate.x; x < right; ++x)
                    if (border(x, y, 0) || border(x, y, 2) ||
                        border(x, y, 3) || border(x, y, 5) ||
                        border(x, y, 6) || border(x, y, 8) ||
                        native_picture_box_right(*gps_, x, y) > x ||
                        native_item_action_at(*gps_, x, y)) {
                        // Building/item detail panels also attach below the
                        // HUD and share its right edge. Their picture boxes
                        // and action strips make them interactive panels, not
                        // map hover prose. In particular retain the native
                        // caption inset after the wagon/item picture.
                        closed = false;
                        break;
                    }
            if (!closed) continue;
            if (!interior || candidate.w * candidate.h < interior->w * interior->h)
                interior = candidate;
        }
    }
    if (!interior) return std::nullopt;

    NativeFortressHoverCard card;
    card.interior = *interior;
    for (int y = interior->y; y < interior->y + interior->h; ++y) {
        std::string source(interior->w, ' ');
        std::vector<int> colors(interior->w, 0xffffff);
        for (int column = 0; column < interior->w; ++column) {
            const int x = interior->x + column;
            bool top = false;
            const auto *active = cell_at(x, y, &top);
            const auto *cell = screen_override
                ? screen_override + (static_cast<size_t>(x) * gps_->dimy + y) * 8
                : active;
            // The native frame establishes current logical text ownership,
            // even when its graphical background obscures a few final-grid
            // cells. A raw-layer suppression pass may own only matching bytes
            // from that layer, never the inactive map or an older popup.
            const unsigned char ch = cell && active && cell[0] == active[0] ? cell[0] : 0;
            source[column] = ch ? ch : ' ';
            if (active) colors[column] = (active[1] << 16) | (active[2] << 8) | active[3];
            rows[y][x] = source[column];
        }
        const size_t first = source.find_first_not_of(' ');
        if (first == std::string::npos) continue;
        const size_t end = source.find_last_not_of(' ') + 1;
        card.rows.push_back({interior->x + static_cast<int>(first), y,
            source.substr(first, end - first),
            std::vector<int>(colors.begin() + first, colors.begin() + end)});
    }
    return card.rows.empty() ? std::nullopt : std::optional(std::move(card));
}

void Overlay::append_fortress_hover_phrases(const NativeFortressHoverCard &card,
        std::vector<std::string> &rows, std::vector<Match> &matches, int only_y) const {
    for (const auto &row : card.rows) {
        // Whole-row translations precede fragment matching. Color changes
        // remain semantic boundaries unless the ordinary matcher knows how
        // to map them: do not flatten an item's colored quality/status runs.
        bool uniform = true;
        for (size_t i = 0; i < row.source.size(); ++i)
            if (row.source[i] != ' ' && row.foregrounds[i] != row.foregrounds.front())
                uniform = false;
        if (!uniform) continue;
        std::string normalized;
        bool space = false;
        for (unsigned char ch : row.source) {
            if (ch == ' ') { space = true; continue; }
            if (space && !normalized.empty()) normalized += ' ';
            normalized += static_cast<char>(ch);
            space = false;
        }
        auto target = exact_literal_translation(normalized);
        if (!target && config_.compositional_rules)
            target = RULESETS.translate_tile_description(cp437_to_utf8(normalized));
        if (!target || target->empty() || target->find("[C:") != std::string::npos ||
            target->find_first_of("\r\n") != std::string::npos) continue;
        Match match{row.x, row.y, static_cast<int>(row.source.size()),
            kFortressHoverPhraseRule, std::move(*target), row.source};
        match.layout_foreground_rgb = row.foregrounds.front();
        std::fill_n(rows[row.y].begin() + row.x, row.source.size(), ' ');
        if (only_y < 0 || only_y == row.y) matches.push_back(std::move(match));
    }
}

void Overlay::compose_fortress_hover_rows(const NativeFortressHoverCard &card,
        std::vector<Match> &matches, int only_y) const {
    const auto normalized_source = [](std::string_view source) {
        std::string normalized;
        bool space = false;
        for (unsigned char ch : source) {
            if (ch == ' ' || ch == '\t') { space = true; continue; }
            if (space && !normalized.empty()) normalized += ' ';
            normalized += static_cast<char>(ch);
            space = false;
        }
        return normalized;
    };
    std::vector<Match> composed;
    for (const auto &row : card.rows) {
        if (only_y >= 0 && only_y != row.y) continue;
        const int end = row.x + static_cast<int>(row.source.size());
        std::vector<const Match *> parts;
        for (const Match &match : matches) {
            if (match.y != row.y || match.x < row.x || match.x + match.length > end ||
                match.length <= 0 || match.source.empty()) continue;
            // Generic composition can normalize native multi-space padding
            // while keeping the original physical length. Keep those valid
            // translations; source ownership still uses the captured bytes.
            const auto physical = std::string_view(row.source).substr(match.x - row.x, match.length);
            if (physical != match.source) {
                auto actual = normalized_source(physical);
                auto expected = normalized_source(match.source);
                if (match.rule >= 0 && static_cast<size_t>(match.rule) < rules_.size() &&
                    rules_[static_cast<size_t>(match.rule)].case_insensitive) {
                    actual = lower(actual);
                    expected = lower(expected);
                }
                if (actual != expected) continue;
            }
            parts.push_back(&match);
        }
        std::sort(parts.begin(), parts.end(), [](const Match *a, const Match *b) {
            return a->x != b->x ? a->x < b->x : a->length > b->length;
        });
        Match line{row.x, row.y, static_cast<int>(row.source.size()),
            kFortressHoverRowRule, {}, row.source};
        std::vector<uint32_t> output;
        bool gap = false;
        const auto cjk = [](uint32_t cp) {
            return (cp >= 0x3400 && cp <= 0x9fff) || (cp >= 0xf900 && cp <= 0xfaff) ||
                (cp >= 0x20000 && cp <= 0x323af);
        };
        const auto closes = [](uint32_t cp) {
            return cp == ')' || cp == ']' || cp == '}' || cp == ',' || cp == '.' ||
                cp == ':' || cp == ';' || cp == 0xff0c || cp == 0x3001 || cp == 0x3002 ||
                cp == 0xff09 || cp == 0xff1a || cp == 0xff1b;
        };
        const auto opens = [](uint32_t cp) {
            return cp == '(' || cp == '[' || cp == '{' || cp == 0xff08;
        };
        const auto append = [&](std::string_view text, int color, const std::vector<int> *colors) {
            std::vector<uint32_t> cps;
            if (!decode_utf8(std::string(text), cps)) return;
            for (size_t i = 0; i < cps.size(); ++i) {
                const uint32_t cp = cps[i];
                const int rgb = colors && colors->size() == cps.size() ? (*colors)[i] : color;
                if (cp == ' ' || cp == '\t' || cp == '\n' || cp == '\r') { gap = true; continue; }
                if (gap && !output.empty() && !(cjk(output.back()) && cjk(cp)) &&
                    !closes(cp) && !opens(output.back())) {
                    output.push_back(' ');
                    line.layout_glyph_foreground_rgb.push_back(rgb);
                }
                gap = false;
                output.push_back(cp);
                line.layout_glyph_foreground_rgb.push_back(rgb);
            }
        };
        size_t part_index = 0;
        for (int cursor = row.x; cursor < end;) {
            while (part_index < parts.size() && parts[part_index]->x < cursor) ++part_index;
            const Match *part = part_index < parts.size() && parts[part_index]->x == cursor
                ? parts[part_index++] : nullptr;
            if (part) {
                if (row.source[static_cast<size_t>(cursor - row.x)] == ' ') gap = true;
                const int color = part->layout_foreground_rgb >= 0 ? part->layout_foreground_rgb
                    : row.foregrounds[static_cast<size_t>(cursor - row.x)];
                if (!part->layout_glyph_foreground_rgb.empty()) {
                    append(part->target, color, &part->layout_glyph_foreground_rgb);
                } else {
                    // Reuse the renderer's source-to-target color mapping,
                    // including complete label/value matches. Joining runs
                    // must not flatten colors which ordinary drawing retains.
                    for (const auto &piece : colored_match_text(*part, color))
                        append(piece.text, (piece.r << 16) | (piece.g << 8) | piece.b, nullptr);
                }
                cursor += part->length;
                if (row.source[static_cast<size_t>(cursor - row.x - 1)] == ' ') gap = true;
            } else {
                const size_t at = static_cast<size_t>(cursor - row.x);
                const unsigned char ch = row.source[at];
                // Literal fallback is a display run, not a new translation.
                // This includes every depth/count/temperature suffix and any
                // unknown mod text. They move WITH the translated row instead
                // of retaining an unrelated native-English x coordinate.
                const size_t utf8 = valid_utf8_grid_sequence_length(row.source, at);
                const bool whole_utf8 = utf8 > 0 && (part_index >= parts.size() ||
                    parts[part_index]->x >= cursor + static_cast<int>(utf8));
                append(whole_utf8 ? row.source.substr(at, utf8)
                    : cp437_to_utf8(row.source.substr(at, 1)), row.foregrounds[at], nullptr);
                cursor += whole_utf8 ? static_cast<int>(utf8) : 1;
                if ((ch >= 'a' && ch <= 'z') || (ch >= 'A' && ch <= 'Z'))
                    line.native_hover_untranslated = true;
            }
        }
        for (uint32_t cp : output) append_utf8_codepoint(line.target, cp);
        line.layout_x = card.interior.x;
        line.layout_length = card.interior.w;
        line.layout_y = row.y;
        line.layout_left = true;
        line.layout_clip_right = card.interior.x + card.interior.w;
        line.layout_foreground_rgb = row.foregrounds.front();
        line.layout_font_pixels = std::clamp(
            static_cast<int>(gps_->tile_pixel_y * config_.font_scale), 1, gps_->tile_pixel_y);
        line.layout_lock_font_pixels = true;
        line.layout_line_height_pixels = gps_->tile_pixel_y;
        composed.push_back(std::move(line));
    }
    std::erase_if(matches, [&](const Match &match) {
        return std::any_of(composed.begin(), composed.end(), [&](const Match &line) {
            return match.y == line.y && match.x < line.x + line.length &&
                line.x < match.x + match.length;
        });
    });
    matches.insert(matches.end(), std::make_move_iterator(composed.begin()),
        std::make_move_iterator(composed.end()));
}

void Overlay::layout_fortress_hover(SDL_Renderer *renderer) {
    if (!gps_ || !face_ || !renderer || gps_->tile_pixel_x <= 0 || gps_->tile_pixel_y <= 0) return;
    std::vector<std::vector<Match *>> rows;
    int left = -1, right = -1;
    for (Match &match : prepared_matches_) {
        if (match.rule != kFortressHoverRowRule || match.target.empty()) continue;
        left = match.layout_x;
        right = left + match.layout_length;
        rows.push_back({&match});
    }
    if (rows.empty()) return;
    layout_fortress_text_rows(renderer, rows, left, right);
    static bool logged = false;
    if (!logged) {
        log_line("INFO", "Activated whole fortress hover layout: columns=" +
            std::to_string(left) + ".." + std::to_string(right) + "; rows=" +
            std::to_string(rows.size()) + "; fixed font=" +
            std::to_string(rows.front().front()->layout_font_pixels) + "px");
        logged = true;
    }
}
