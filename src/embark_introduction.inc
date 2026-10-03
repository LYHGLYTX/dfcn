// Arrival prose is wrapped BEFORE its colored runs reach the grid. Reassemble
// the whole modal, not the English line lengths or its per-color fragments.
void Overlay::append_embark_introduction_matches(std::vector<std::string> &rows,
        std::vector<Match> &matches, int only_y, bool raw_layer) const {
    constexpr std::string_view heading = "A Dwarven Outpost:";
    constexpr std::string_view motto = "Strike the earth!";
    if (raw_layer) {
        // Body colors and the Okay widget can occupy different native layers.
        // Use the current composite as context, but suppress ONLY identical
        // source bytes on the layer whose glyph copies are being intercepted.
        std::vector<std::string> context(rows.size(), std::string(gps_->dimx, ' '));
        for (int y = 0; y < gps_->dimy; ++y)
            for (int x = 0; x < gps_->dimx; ++x) {
                const unsigned char ch = visible_char_at(x, y);
                context[y][x] = ch ? ch : ' ';
            }
        std::vector<Match> document;
        append_embark_introduction_matches(context, document, -1);
        if (!document.empty()) {
            for (const Match &span : document) {
                if (span.length <= 0 || (only_y >= 0 && only_y != span.y)) continue;
                int cursor = 0;
                while (cursor < span.length) {
                    while (cursor < span.length &&
                        rows[span.y][span.x + cursor] != span.source[cursor]) ++cursor;
                    const int start = cursor;
                    while (cursor < span.length &&
                        rows[span.y][span.x + cursor] == span.source[cursor]) ++cursor;
                    if (cursor == start) continue;
                    matches.push_back({span.x + start, span.y, cursor - start,
                        kEmbarkIntroductionRule, {}, span.source.substr(start, cursor - start)});
                    std::fill_n(rows[span.y].begin() + span.x + start, cursor - start, ' ');
                }
            }
            return;
        }
        // The final composite may itself be incomplete. An intact raw layer
        // still has to be allowed to supply the complete document below.
    }
    int left = -1, top = -1;
    for (int y = 0; y < gps_->dimy; ++y) {
        const size_t x = rows[y].find(heading);
        if (x == std::string::npos) continue;
        left = static_cast<int>(x);
        top = y;
        break;
    }
    if (top < 0) return;

    const NativePanelBorders borders(*gps_);
    const auto panel = native_panel_interior(borders, *gps_, left,
        left + static_cast<int>(heading.size()), top);
    if (!panel) return;
    // Mirror the prose inset inside the complete modal, never across the map.
    const int panel_right = panel->x + panel->w;
    const int right = panel_right - (left - panel->x);
    if (right <= left) return;
    // Classic buttons have real CP437 ink above their caption. Stop at the
    // complete button's TOP, or its upper border becomes the document tail
    // and the intact "Strike the earth!" signature is rejected.
    int bottom = -1;
    for (int y = top + 1; y < panel->y + panel->h && bottom < 0; ++y) {
        for (size_t x = rows[y].find("Okay"); x != std::string::npos;
             x = rows[y].find("Okay", x + 1)) {
            if (!has_word_boundaries(rows[y], x, x + 4) ||
                static_cast<int>(x) < left || static_cast<int>(x) + 4 > right) continue;
            const auto button = native_button_text_rect(*gps_,
                static_cast<int>(x), static_cast<int>(x) + 4, y);
            if (!button || button->x - 1 < panel->x ||
                button->x + button->w + 1 > panel_right || button->y <= top ||
                button->y + button->h > panel->y + panel->h) continue;
            bottom = button->y;
            break;
        }
    }
    if (bottom < 0) return;

    std::vector<Match> native_rows;
    std::string source;
    for (int y = top; y < bottom; ++y) {
        const std::string_view band(rows[y].data() + left,
            static_cast<size_t>(right - left));
        const std::string_view text = trim_view(band);
        if (text.empty()) continue;
        const int x = left + static_cast<int>(text.data() - band.data());
        if (!source.empty()) source.push_back(' ');
        source.append(text);
        native_rows.push_back({x, y, static_cast<int>(text.size()),
            kEmbarkIntroductionRule, {}, std::string(text)});
    }
    source = normalize_utterance(source);
    // A complete signature prevents map text, another dialog or an incomplete
    // draw layer from being mistaken for this document. Never invent a tail.
    if (!source.starts_with(heading) || !source.ends_with(motto)) return;
    const std::string_view body = trim_view(std::string_view(source).substr(
        heading.size(), source.size() - heading.size() - motto.size()));
    constexpr std::string_view supplies = "There are almost no supplies left,";
    constexpr std::string_view history = "A new chapter of dwarven history begins";
    const size_t second = body.find(supplies), third = body.find(history);
    if (second == std::string_view::npos || third == std::string_view::npos ||
        second >= third) return;
    const std::array<std::string_view, 3> paragraphs = {{
        trim_view(body.substr(0, second)),
        trim_view(body.substr(second, third - second)),
        trim_view(body.substr(third)),
    }};
    if (source != embark_introduction_source_) {
        std::array<std::string, 5> targets;
        const auto title = exact_literal_translation(heading);
        const auto slogan = exact_literal_translation(motto);
        if (!title || !slogan) return;
        targets.front() = *title;
        targets.back() = *slogan;
        for (size_t p = 0; p < paragraphs.size(); ++p) {
            const int index = embark_introduction_rules_[p];
            if (index < 0) return;
            const Rule &rule = rules_[static_cast<size_t>(index)];
            size_t end = 0;
            std::vector<std::string> captures;
            if (!match_template(rule, paragraphs[p], 0, &end, &captures) ||
                end != paragraphs[p].size()) return;
            std::vector<std::optional<std::string>> translated;
            for (const std::string &capture : captures) {
                std::optional<std::string> target;
                if (p == 1) {
                    // Both residents and hungry wildlife are creature nouns.
                    target = translate_creature_descriptor(capture);
                } else {
                    target = exact_literal_translation(capture);
                    if (!target && p == 2 && split_generated_name_identity(capture))
                        target = translate_procedural_fragment(capture);
                    // The civilization and the unglossed site are native
                    // names, not isolated English dictionary words.
                    if (!target) target = translate_procedural_fragment(capture, true);
                }
                // Unknown mod vocabulary remains one coherent field instead
                // of returning to word-by-word translation of the paragraph.
                translated.push_back(target ? target :
                    std::optional<std::string>(cp437_to_utf8(capture)));
            }
            targets[p + 1] = fill_template(rule, captures,
                &capture_translations_, nullptr, &translated);
        }
        embark_introduction_source_ = source;
        embark_introduction_targets_ = std::move(targets);
    }

    std::array<int, 3> foregrounds{{0xffffff, 0xc0c0c0, 0x00ff00}};
    const std::array<std::string_view, 3> color_anchors{{heading, "You have arrived.", "Strike"}};
    for (size_t role = 0; role < color_anchors.size(); ++role) {
        for (const Match &row : native_rows) {
            const size_t at = row.source.find(color_anchors[role]);
            if (at == std::string::npos) continue;
            bool top_layer = false;
            const auto *cell = cell_at(row.x + static_cast<int>(at), row.y, &top_layer);
            if (cell && cell[0] == static_cast<unsigned char>(color_anchors[role].front()))
                foregrounds[role] = (cell[1] << 16) | (cell[2] << 8) | cell[3];
            break;
        }
    }

    // Keep exact native ownership, including the trailing period and ALL
    // green fragments. Reflow changes only output positions, never the grid.
    for (Match &row : native_rows) {
        std::fill_n(rows[row.y].begin() + row.x, row.length, ' ');
        if (only_y < 0 || only_y == row.y) matches.push_back(std::move(row));
    }
    if (only_y >= 0) return; // immediate glyph suppression needs no display rows

    std::array<std::string, 5> sections{{std::string(heading),
        std::string(paragraphs[0]), std::string(paragraphs[1]),
        std::string(paragraphs[2]), std::string(motto)}};
    for (size_t p = 0; p < sections.size(); ++p) {
        Match display{left, top, 0, kEmbarkIntroductionRule,
            embark_introduction_targets_[p], std::move(sections[p])};
        display.layout_x = left;
        display.layout_y = top;
        display.layout_length = right - left;
        display.layout_clip_right = right;
        display.layout_left = true;
        // The native palette distinguishes the title, body and green motto.
        display.layout_foreground_rgb = foregrounds[p == 0 ? 0 : p == 4 ? 2 : 1];
        matches.push_back(std::move(display));
    }
}

bool Overlay::layout_embark_introduction(SDL_Renderer *renderer) {
    std::vector<Match> sections;
    for (const Match &match : prepared_matches_)
        if (match.rule == kEmbarkIntroductionRule && !match.target.empty())
            sections.push_back(match);
    if (sections.size() != 5 || !face_ || !renderer ||
        gps_->tile_pixel_x <= 0 || gps_->tile_pixel_y <= 0) return false;
    const int top = sections.front().y;
    const int left = sections.front().layout_x;
    const int right = left + sections.front().layout_length;
    int bottom = gps_->dimy;
    for (const Match &match : prepared_matches_) {
        if (match.source == "Okay" && match.y > top &&
            match.x > left && match.x + match.length < right) {
            const auto button = native_button_text_rect(*gps_,
                match.x, match.x + match.length, match.y);
            if (button && button->y > top)
                bottom = std::min(bottom, button->y);
        }
    }
    if (bottom == gps_->dimy) return false;
    const int tile_h = gps_->tile_pixel_y;
    const int width = (right - left) * gps_->tile_pixel_x -
        2 * config_.horizontal_padding;
    // Keep one complete native row above the button FRAME free of reading text.
    const int height = (bottom - top - 1) * tile_h;
    if (width <= 2 || height <= 0) return false;

    auto nonstarter = [](uint32_t cp) {
        switch (cp) {
        case ',': case '.': case '!': case '?': case ':': case ';':
        case ')': case ']': case '}': case '%':
        case 0x3001: case 0x3002: case 0xff0c: case 0xff01: case 0xff1f:
        case 0xff1a: case 0xff1b: case 0xff09: case 0x2019: case 0x201d:
        case 0x3009: case 0x300b: case 0x300d: case 0x300f: case 0x3011:
            return true;
        default: return false;
        }
    };
    auto opener = [](uint32_t cp) {
        return cp == '(' || cp == '[' || cp == '{' || cp == 0xff08 ||
            cp == 0x2018 || cp == 0x201c || cp == 0x3008 || cp == 0x300a ||
            cp == 0x300c || cp == 0x300e || cp == 0x3010;
    };
    std::array<std::vector<uint32_t>, 5> codepoints;
    for (size_t p = 0; p < sections.size(); ++p)
        if (!decode_utf8(sections[p].target, codepoints[p]) || codepoints[p].empty())
            return false;
    struct Metrics { FT_UInt index; int advance, left, right; };
    std::vector<Match> output;
    const int pixels = unified_font_pixels();
    const int tile_w = gps_->tile_pixel_x;
    const int padding = config_.horizontal_padding;
    const int origin_x = (gps_->screen_pixel_x - gps_->dimx * tile_w) / 2;
    const int origin_y = (gps_->screen_pixel_y - gps_->dimy * tile_h) / 2;
    // Wrap inside the native modal's prose area. Its Okay button and frame
    // remain fixed even when the translation needs more rows than fit.
    {
        if (!set_font_pixel_size(pixels)) return false;
        std::unordered_map<uint32_t, Metrics> glyphs;
        int ink_top = 0, ink_bottom = 0;
        for (const auto &paragraph : codepoints) {
            for (uint32_t cp : paragraph) {
                if (glyphs.contains(cp)) continue;
                Metrics metrics{FT_Get_Char_Index(face_, cp), 0, 0, 0};
                if (native_load_font_glyph(face_, metrics.index, config_.font_bold) != 0) return false;
                metrics.advance = static_cast<int>(face_->glyph->advance.x >> 6);
                if (FT_Render_Glyph(face_->glyph, FT_RENDER_MODE_NORMAL) != 0) return false;
                metrics.left = face_->glyph->bitmap_left;
                metrics.right = metrics.left + static_cast<int>(face_->glyph->bitmap.width);
                ink_top = std::min(ink_top, -face_->glyph->bitmap_top);
                ink_bottom = std::max(ink_bottom, -face_->glyph->bitmap_top +
                    static_cast<int>(face_->glyph->bitmap.rows));
                glyphs.emplace(cp, metrics);
            }
        }
        const int line_height = std::max(tile_h,
            ink_bottom - ink_top + 2);
        const int gap = std::max(2, pixels / 2);
        int offset = 0;
        bool fits = true;
        output.clear();
        for (size_t p = 0; p < sections.size() && fits; ++p) {
            if (p) offset += gap;
            const auto &cps = codepoints[p];
            for (size_t start = 0; start < cps.size();) {
                while (start < cps.size() && cps[start] == ' ') ++start;
                if (start == cps.size()) break;
                size_t end = start, last_break = start;
                int pen = 0, ink_left = 0, ink_right = 0;
                FT_UInt previous = 0;
                for (; end < cps.size(); ++end) {
                    const Metrics &metrics = glyphs.at(cps[end]);
                    if (FT_HAS_KERNING(face_) && previous && metrics.index) {
                        FT_Vector delta{};
                        FT_Get_Kerning(face_, previous, metrics.index, FT_KERNING_DEFAULT, &delta);
                        pen += static_cast<int>(delta.x >> 6);
                    }
                    ink_left = std::min(ink_left, pen + metrics.left);
                    ink_right = std::max(ink_right, pen + metrics.right);
                    pen += metrics.advance;
                    const int measured_width = std::max(pen, ink_right) - ink_left + 2;
                    if (measured_width > width) {
                        if (last_break > start) end = last_break;
                        else if (end == start) {
                            ++end;
                        }
                        break;
                    }
                    previous = metrics.index;
                    if (end + 1 == cps.size() ||
                        (!nonstarter(cps[end + 1]) && !opener(cps[end]) &&
                         (cps[end] >= 0x80 || cps[end + 1] >= 0x80 || cps[end] == ' ')))
                        last_break = end + 1;
                }
                if (end == start) { fits = false; break; }
                Match line = sections[p];
                line.target.clear();
                for (size_t i = start; i < end; ++i) append_utf8_codepoint(line.target, cps[i]);
                line.layout_font_pixels = pixels;
                line.layout_lock_font_pixels = true;
                line.layout_line_height_pixels = line_height;
                line.layout_pixel_y = offset;
                output.push_back(std::move(line));
                offset += line_height;
                start = end;
            }
        }
        if (!fits) return false;
        // Shared font metrics choose line advance, never the modal's width.
        int actual_line_height = line_height;
        for (const Match &line : output) {
            const auto *glyph = get_glyph_texture(renderer, line.target,
                width, line_height, pixels, 0, true);
            if (!glyph || !glyph->texture) return false;
            actual_line_height = std::max(actual_line_height, glyph->line_height);
        }
        const int box_width = width + 2 * padding;
        const int box_x = origin_x + left * tile_w;
        const int box_y = origin_y + top * tile_h;
        for (size_t i = 0; i < output.size(); ++i) {
            Match &line = output[i];
            line.layout_x = left;
            line.layout_length = right - left;
            line.layout_box_pixel_x = box_x;
            line.layout_box_pixel_width = box_width;
            line.layout_clip_right = right;
            line.layout_native_clip = SDL_Rect{box_x, box_y, box_width, height};
            line.layout_y = top;
            line.layout_pixel_y += static_cast<int>(i) * (actual_line_height - line_height);
            line.layout_line_height_pixels = actual_line_height;
            line.layout_fixed_baseline = true;
        }
        std::erase_if(prepared_matches_, [](const Match &match) {
            return match.rule == kEmbarkIntroductionRule && !match.target.empty();
        });
        prepared_matches_.insert(prepared_matches_.end(),
            std::make_move_iterator(output.begin()), std::make_move_iterator(output.end()));
        return true;
    }
}
