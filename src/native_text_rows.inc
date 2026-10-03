// Shared composition for bounded native text cards and typed record lists.
// Physical source spans own suppression; translated runs share one baseline
// and retain their per-codepoint colors, including untranslated fallback.
static bool native_paragraph_owns_card_row(const Match &match,
        const NativeTextCardRow &row) {
    if (match.rule != kUiMessageRule || match.y != row.y ||
        match.length != static_cast<int>(match.source.size())) return false;
    const auto owned = trim_view(match.source);
    const auto current = trim_view(row.source);
    // Captured draws can retain edge padding that the paragraph reader
    // trims. Compare the actual ink at its original position; padding must
    // not create another paragraph or restore an empty translated tail.
    return !owned.empty() && owned == current &&
        match.x + static_cast<int>(owned.data() - match.source.data()) ==
        row.x + static_cast<int>(current.data() - row.source.data());
}

std::optional<NativeTextCard> Overlay::capture_panel_text_card(const SDL_Rect &panel,
        bool allow_row_buttons) const {
    const NativePanelBorders borders(*gps_);
    const int right = panel.x + panel.w, bottom = panel.y + panel.h;
    NativeTextCard card;
    card.interior = panel;
    for (int y = panel.y; y < bottom; ++y) {
        std::string source(panel.w, ' ');
        std::vector<int> colors(panel.w, 0xffffff);
        for (int x = panel.x; x < right; ++x) {
            bool top = false;
            const auto *cell = cell_at(x, y, &top);
            const unsigned char ch = cell && cell[0] ? cell[0] : ' ';
            // Capture the SAME active card during glyph suppression and at
            // Present. A transparent gap or a field on the other layer must
            // not reject the entire card in just the suppression pass. The
            // mask writer checks each source byte against its actual layer;
            // it never suppresses unrelated background text at these cells.
            source[x - panel.x] = ch;
            if (cell) colors[x - panel.x] = (cell[1] << 16) | (cell[2] << 8) | cell[3];
        }
        const size_t first = source.find_first_not_of(' ');
        if (first == std::string::npos && panel.h == 1) continue;
        // An empty single-row summary card contains no text to claim. A
        // multi-row card must still reject controls on blank rows so its
        // surrounding text can never be joined across a graphical boundary.
        for (int x = panel.x; x < right; ++x) {
            // A nested frame or control invalidates this read-only card.
            // Never relayout a foreground action or a hidden background row.
            if (borders.at(x, y, 0) || borders.at(x, y, 2) ||
                borders.at(x, y, 3) || borders.at(x, y, 5) ||
                borders.at(x, y, 6) || borders.at(x, y, 8) ||
                native_picture_box_right(*gps_, x, y) > x ||
                native_item_action_at(*gps_, x, y)) return std::nullopt;
        }
        if (first == std::string::npos) continue;
        const size_t end = source.find_last_not_of(' ') + 1;
        const int first_x = panel.x + static_cast<int>(first);
        // Civilization records use the ordinary three-row rectangle skin.
        // Their typed caller owns ONLY caption layout, never the clickable
        // row background/hitbox. Other cards still reject all such controls;
        // nested frames, portraits and item actions remain excluded above.
        if (!allow_row_buttons &&
            native_button_text_rect(*gps_, first_x, panel.x + static_cast<int>(end), y))
            return std::nullopt;
        card.rows.push_back({first_x, y, source.substr(first, end - first),
            std::vector<int>(colors.begin() + first, colors.begin() + end)});
    }
    return card.rows.empty() ? std::nullopt : std::optional(std::move(card));
}

void Overlay::compose_native_text_rows(const NativeTextCard &card,
        std::vector<Match> &matches, int only_y, int row_rule,
        bool preserve_word_spaces, bool center_vertical) const {
    if (card.rows.empty()) return;
    const bool workshop_button = row_rule == kWorkshopTaskRowRule && card.button_box;
    bool paired_halves = false;
    if (workshop_button) {
        // A native half-font line occupies two physical rows. Only an exact
        // source pair with complementary live flags is one displayed line;
        // a title and a differently colored requirement are separate lines.
        constexpr uint32_t upper = 1u << 3, lower = 1u << 4;
        for (size_t i = 1; i < card.rows.size() && !paired_halves; ++i) {
            const auto &a = card.rows[i - 1], &b = card.rows[i];
            if (a.x != b.x || a.y + 1 != b.y || a.source != b.source) continue;
            bool pair = true, ink = false;
            for (size_t byte = 0; byte < a.source.size() && pair; ++byte) {
                if (a.source[byte] == ' ') continue;
                bool a_top = false, b_top = false;
                const int x = a.x + static_cast<int>(byte);
                const auto *a_cell = cell_at(x, a.y, &a_top);
                const auto *b_cell = cell_at(x, b.y, &b_top);
                const auto *flags = a_top ? gps_->screentexpos_top_flag : gps_->screentexpos_flag;
                const size_t at = static_cast<size_t>(x) * gps_->dimy + a.y;
                pair = a_cell && b_cell && a_top == b_top && flags &&
                    (flags[at] & (upper | lower)) == upper &&
                    (flags[at + 1] & (upper | lower)) == lower;
                ink = true;
            }
            paired_halves = pair && ink;
        }
    }
    const bool center_block = center_vertical && !paired_halves;
    // A control can contain a caption plus a disabled-action reason. Centre
    // the complete text block inside its actual skin, not each glyph run or
    // only the first row. Preserve native gaps and source suppression spans.
    const int source_height = card.rows.back().y - card.rows.front().y + 1;
    const int vertical_padding = center_block
        ? std::max(0, card.interior.h - source_height) * gps_->tile_pixel_y / 2 : 0;
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
        if (row_rule == kCharacterOverviewRowRule &&
            std::any_of(matches.begin(), matches.end(), [&](const Match &match) {
                return match.native_overview_complete_row && match.y == row.y &&
                    match.layout_x == card.interior.x &&
                    match.layout_length == card.interior.w;
            })) continue;
        // Site news, artifact prose and complete card messages have already
        // been reflowed as documents.
        // Preserve every owned source span, including now-empty tail rows;
        // row composition must not restore the native wrapping or English.
        if (std::any_of(matches.begin(), matches.end(), [&](const Match &match) {
                return (match.rule == kWorldSiteHistoryRule ||
                        match.rule == kWorldArtifactDescriptionRule ||
                        (row_rule != kCharacterGroupRowRule &&
                         native_paragraph_owns_card_row(match, row))) && match.y == row.y;
            })) continue;
        const int end = row.x + static_cast<int>(row.source.size());
        struct RowPart {
            const Match *match;
            int x, length;
        };
        std::vector<RowPart> parts;
        for (const Match &match : matches) {
            if (match.y != row.y || match.length <= 0 || match.source.empty()) continue;
            const int first = std::max(match.x, row.x);
            const int last = std::min(match.x + match.length, end);
            if (first >= last) continue;
            std::string_view source = match.source;
            if (first != match.x || last != match.x + match.length) {
                // Dictionary phrases can include edge padding (` furniture`).
                // Longest-match selection has already removed the shorter
                // bare-word match. A card trims its row's padding, not its
                // meaning: retain the translation when ONLY spaces overhang.
                // Never borrow text from a neighbouring field or guess byte
                // offsets inside a normalized/captured source of another size.
                if (source.size() != static_cast<size_t>(match.length) ||
                    source.substr(0, first - match.x).find_first_not_of(' ') !=
                        std::string_view::npos ||
                    source.substr(last - match.x).find_first_not_of(' ') !=
                        std::string_view::npos) continue;
                source = source.substr(first - match.x, last - first);
            }
            // Generic composition can normalize native multi-space padding
            // while keeping the original physical length. Keep those valid
            // translations; source ownership still uses the captured bytes.
            const auto physical = std::string_view(row.source).substr(first - row.x, last - first);
            if (physical != source) {
                auto actual = normalized_source(physical);
                auto expected = normalized_source(source);
                if (match.rule >= 0 && static_cast<size_t>(match.rule) < rules_.size() &&
                    rules_[static_cast<size_t>(match.rule)].case_insensitive) {
                    actual = lower(actual);
                    expected = lower(expected);
                }
                if (actual != expected) continue;
            }
            parts.push_back({&match, first, last - first});
        }
        std::sort(parts.begin(), parts.end(), [](const RowPart &a, const RowPart &b) {
            return a.x != b.x ? a.x < b.x : a.length > b.length;
        });
        Match line{row.x, row.y, static_cast<int>(row.source.size()),
            row_rule, {}, row.source};
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
                if (gap && !output.empty() && (preserve_word_spaces || !(cjk(output.back()) && cjk(cp))) &&
                    !closes(cp) && !opens(output.back()) &&
                    !(preserve_word_spaces && output.back() == 0x3001)) {
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
            while (part_index < parts.size() && parts[part_index].x < cursor) ++part_index;
            const RowPart *span = part_index < parts.size() && parts[part_index].x == cursor
                ? &parts[part_index++] : nullptr;
            const Match *part = span ? span->match : nullptr;
            if (part) {
                std::optional<Match> bounded;
                if (span->x != part->x || span->length != part->length) {
                    bounded = *part;
                    bounded->source = part->source.substr(span->x - part->x, span->length);
                    bounded->x = span->x;
                    bounded->length = span->length;
                    part = &*bounded;
                }
                line.native_hover_untranslated = line.native_hover_untranslated ||
                    part->native_hover_untranslated;
                if (!part->native_help_review_source.empty())
                    line.native_help_review_source = part->native_help_review_source;
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
                    parts[part_index].x >= cursor + static_cast<int>(utf8));
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
        line.layout_y = center_block
            ? card.interior.y + row.y - card.rows.front().y : row.y;
        line.layout_pixel_y = vertical_padding;
        line.layout_fixed_baseline = workshop_button && center_block;
        line.layout_reflowed_control = line.layout_fixed_baseline;
        line.layout_left = !row.centered;
        line.layout_clip_right = card.interior.x + card.interior.w;
        line.native_picture_caption_box = card.button_box;
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
