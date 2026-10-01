// All consumers match every visible row against the native wrap output.
// A closed widget may cover the end of a row with its right border. Only
// that explicit clipping boundary permits a prefix match; never guess the
// missing letters, use one matching line, or borrow a neighbouring panel.
static std::optional<std::string> native_source_for_rows(
        const std::vector<Match> &rows, int clip_right = -1,
        std::vector<std::string> *native_lines = nullptr,
        NativeParagraphViewport *viewport = nullptr,
        const std::vector<int> &row_clip_rights = {}) {
    if (viewport) *viewport = {};
    if (rows.empty() || (!row_clip_rights.empty() && row_clip_rights.size() != rows.size()))
        return std::nullopt;
    if (native_lines) native_lines->clear();
    std::lock_guard<std::mutex> lock(g_native_paragraph_mutex);
    const NativeParagraphCapture *complete = nullptr;
    for (const auto &capture : g_native_paragraph_captures) {
        if (capture.wrapped_lines.size() < rows.size() ||
            (complete && complete->sequence >= capture.sequence)) continue;
        for (size_t begin = 0; begin + rows.size() <= capture.wrapped_lines.size(); ++begin) {
            bool same = true;
            for (size_t line = 0; line < rows.size(); ++line) {
                auto expected = trim_view(capture.wrapped_lines[begin + line]);
                // A record counter can cover only the first wrapped line;
                // continuation lines still own their complete native width.
                const int row_right = row_clip_rights.empty() ? clip_right : row_clip_rights[line];
                if (row_right >= 0) {
                    if (row_right <= rows[line].x) { same = false; break; }
                    expected = trim_view(expected.substr(0,
                        static_cast<size_t>(row_right - rows[line].x)));
                }
                if (expected != rows[line].source) { same = false; break; }
            }
            if (same) {
                complete = &capture;
                if (viewport) *viewport = {static_cast<int>(begin),
                    static_cast<int>(capture.wrapped_lines.size())};
                if (native_lines) native_lines->assign(
                    capture.wrapped_lines.begin() + begin,
                    capture.wrapped_lines.begin() + begin + rows.size());
                break;
            }
        }
    }
    return complete ? std::optional<std::string>(complete->source) : std::nullopt;
}

// Shared measured reflow for bounded native paragraphs. Source rows retain
// independent suppression ownership even when Chinese uses fewer lines.
// Translation and layout are shared by setup, help, chronicles and site news.
bool Overlay::append_bounded_paragraph(std::vector<Match> rows,
        std::string_view target, std::vector<std::string> &screen_rows,
        std::vector<Match> &matches, int only_y, int clip_right, int box_right,
        const std::vector<int> &foregrounds, bool clipped_start, int box_left,
        std::optional<NativeParagraphViewport> viewport,
        const std::vector<std::pair<size_t, size_t>> &word_ranges,
        int complete_layout_rows) const {
    std::vector<uint32_t> codepoints;
    if (!face_ || !gps_ || gps_->tile_pixel_x <= 0 || gps_->tile_pixel_y <= 0 ||
        rows.empty() || !decode_utf8(target, codepoints) || codepoints.empty())
        return false;
    if (!foregrounds.empty() && foregrounds.size() != codepoints.size()) return false;
    // Structured owners can retain semantic word units while ordinary prose
    // keeps CJK character wrapping. These are codepoint ranges, just like
    // foreground spans; they do not change or omit any translated text.
    std::vector<bool> break_allowed(codepoints.size() + 1, true);
    for (const auto &[begin, end] : word_ranges) {
        if (begin > end || end > codepoints.size()) return false;
        for (size_t at = begin + 1; at < end; ++at) break_allowed[at] = false;
    }
    const bool scrollable = viewport && viewport->first_line >= 0 &&
        viewport->total_lines > static_cast<int>(rows.size()) &&
        viewport->first_line + static_cast<int>(rows.size()) <= viewport->total_lines;
    // An announcement retains every native row even when only its tail is
    // visible. The complete allocation identifies its scrolling range, not
    // a limit on the number of Chinese rows or on their fixed font size.
    if (complete_layout_rows > 0 &&
        (static_cast<size_t>(complete_layout_rows) < rows.size() ||
         (viewport && complete_layout_rows != viewport->total_lines))) return false;
    const int first_y = rows.front().y;
    auto nonstarter = [](uint32_t cp) {
        switch (cp) {
        case '.': case ',': case '!': case '?': case ':': case ';':
        case ')': case ']': case '}': case '%':
        case 0x3002: case 0x3001: case 0xff01: case 0xff1f:
        case 0xff0c: case 0xff1a: case 0xff1b: case 0xff09:
        case 0x300b: case 0x300d: case 0x300f: case 0x3011:
        case 0x2019: case 0x201d: case 0x2026:
            return true;
        default: return false;
        }
    };
    auto opener = [](uint32_t cp) {
        return cp == '(' || cp == '[' || cp == '{' || cp == 0xff08 ||
            cp == 0x300a || cp == 0x300c || cp == 0x300e ||
            cp == 0x3010 || cp == 0x2018 || cp == 0x201c;
    };
    const int tile_w = gps_->tile_pixel_x, tile_h = gps_->tile_pixel_y;
    const int origin_x = (gps_->screen_pixel_x - gps_->dimx * tile_w) / 2;
    const int origin_y = (gps_->screen_pixel_y - gps_->dimy * tile_h) / 2;
    SDL_Rect native_region = native_text_draw_region(rows.front());
    int left = gps_->dimx;
    for (const Match &row : rows) {
        left = std::min(left, row.x);
    }
    // Without an explicit text-box edge, use the native containing region.
    // The longest English line is only a source span, never a wrap budget.
    int right = (native_region.x + native_region.w - origin_x) / tile_w;
    // A centered native paragraph's ink origin is not its widget margin.
    // Let the owner supply both edges without changing suppression spans.
    if (box_left >= 0) left = box_left;
    if (box_right >= 0) right = box_right;
    else if (clip_right >= 0) right = clip_right;
    if (clip_right >= 0) right = std::min(right, clip_right);
    left = std::max(left, (native_region.x - origin_x + tile_w - 1) / tile_w);
    right = std::min(right, (native_region.x + native_region.w - origin_x) / tile_w);
    const int native_top = origin_y + first_y * tile_h;
    int native_bottom = native_region.y + native_region.h;
    if (scrollable) {
        // These rows are the visible native scroll allocation, not extra
        // space that the translation may grow into below the viewport.
        native_bottom = std::min(native_bottom, origin_y + (rows.back().y + 1) * tile_h);
    }
    const SDL_Rect paragraph_region{origin_x + left * tile_w, native_top,
        (right - left) * tile_w, std::max(0, native_bottom - native_top)};
    SDL_Rect visible_region{};
    if (!SDL_IntersectRect(&native_region, &paragraph_region, &visible_region)) return false;
    native_region = visible_region;
    const int width = right - left;
    const int span_pixels = width * gps_->tile_pixel_x -
        2 * config_.horizontal_padding - 2;
    if (span_pixels <= 0) return false;
    const int font_pixels = unified_font_pixels();
    const auto line_metrics = font_line_metrics(font_pixels);
    const int line_height = std::max(gps_->tile_pixel_y,
        line_metrics ? line_metrics->bottom - line_metrics->top + 2 : font_pixels + 2);
    // A stable paragraph repeats the same fixed-size kerning and wrapping
    // during early suppression and final drawing. Cache only that
    // pure result; none of its source rows, ownership or coordinates survive.
    std::string layout_key;
    const auto key_value = [&](const auto &value) {
        layout_key.append(reinterpret_cast<const char *>(&value), sizeof(value));
    };
    key_value(target.size());
    layout_key.append(target);
    key_value(foregrounds.size());
    for (int foreground : foregrounds) key_value(foreground);
    key_value(word_ranges.size());
    for (const auto &[begin, end] : word_ranges) {
        key_value(begin);
        key_value(end);
    }
    key_value(width);
    key_value(span_pixels);
    key_value(gps_->tile_pixel_x);
    key_value(gps_->tile_pixel_y);
    key_value(config_.horizontal_padding);
    key_value(config_.font_scale);
    key_value(config_.min_font_pixels);
    key_value(font_pixels);
    key_value(rows.size());
    key_value(viewport.has_value());
    key_value(scrollable);
    if (viewport) key_value(viewport->total_lines);
    key_value(clipped_start);
    key_value(complete_layout_rows);
    const auto cached_layout = paragraph_layout_cache_.find(layout_key);
    const bool layout_cached = cached_layout != paragraph_layout_cache_.end();
    std::vector<std::string> lines;
    std::vector<std::vector<int>> line_foregrounds;
    if (layout_cached) {
        lines = cached_layout->second.lines;
        line_foregrounds = cached_layout->second.foregrounds;
    }
    if (!layout_cached) {
        // Use the same hinted bitmap bounds and advances as rasterize().
        // Counting nominal ems is not enough to lock the font: one tall
        // or overhanging glyph used to shrink just its own row at draw
        // time, while punctuation left usable width unnecessarily blank.
        if (!set_font_pixel_size(font_pixels)) return false;
        using SetupGlyph = ParagraphGlyphMetrics;
        std::unordered_map<uint32_t, SetupGlyph> glyphs;
        bool has_ink = false;
        for (uint32_t cp : codepoints) {
            if (cp == '\n') continue; // document paragraph boundary, not a glyph
            if (glyphs.contains(cp)) continue;
            SetupGlyph metrics;
            const uint64_t key = (static_cast<uint64_t>(font_pixels) << 32) | cp;
            if (const auto cached = paragraph_glyph_metrics_.find(key);
                cached != paragraph_glyph_metrics_.end()) {
                metrics = cached->second;
            } else {
                // Use the same resolved face and bitmap as final drawing.
                // A symbol missing from the primary Chinese font must not
                // reject the whole paragraph before fallback can render it.
                const FontGlyph glyph = resolve_font_glyph(cp, font_pixels);
                const auto bitmap = font_glyph_bitmap(glyph, font_pixels);
                if (!bitmap) return false;
                metrics.face = glyph.face;
                metrics.index = glyph.index;
                metrics.advance = bitmap->advance;
                metrics.has_ink = bitmap->width > 0 && bitmap->rows > 0;
                if (metrics.has_ink) {
                    metrics.left = bitmap->left;
                    metrics.right = metrics.left + static_cast<int>(bitmap->width);
                    metrics.top = -bitmap->top;
                    metrics.bottom = metrics.top + static_cast<int>(bitmap->rows);
                }
                if (paragraph_glyph_metrics_.size() >= 16384)
                    paragraph_glyph_metrics_.clear();
                paragraph_glyph_metrics_.emplace(key, metrics);
            }
            has_ink = has_ink || metrics.has_ink;
            glyphs.emplace(cp, metrics);
        }
        if (!has_ink) return false;
        for (size_t begin = 0; begin < codepoints.size();) {
            while (begin < codepoints.size() && codepoints[begin] == ' ') ++begin;
            if (begin == codepoints.size()) break;
            if (codepoints[begin] == '\n') {
                lines.emplace_back();
                if (!foregrounds.empty()) line_foregrounds.emplace_back();
                ++begin;
                continue;
            }
            size_t end = begin, last_break = begin;
            int pen = 0, ink_left = 0, ink_right = 0;
            FT_UInt previous = 0;
            FT_Face previous_face = nullptr;
            for (; end < codepoints.size(); ++end) {
                if (codepoints[end] == '\n') break;
                const SetupGlyph &metrics = glyphs.at(codepoints[end]);
                if (previous_face == metrics.face && FT_HAS_KERNING(metrics.face) &&
                        previous && metrics.index) {
                    FT_Vector delta{};
                    FT_Get_Kerning(metrics.face, previous, metrics.index,
                        FT_KERNING_DEFAULT, &delta);
                    pen += static_cast<int>(delta.x >> 6);
                }
                ink_left = std::min(ink_left, pen + metrics.left);
                ink_right = std::max(ink_right, pen + metrics.right);
                pen += metrics.advance;
                if (std::max(pen, ink_right) - ink_left > span_pixels) {
                    if (last_break > begin) {
                        end = last_break;
                        break;
                    }
                    if (end > begin && break_allowed[end]) break;
                    // A single wide glyph or protected semantic word grows
                    // its output row. Keep the fixed glyph size and consume
                    // the complete word before selecting another row.
                    if (break_allowed[end + 1]) {
                        ++end;
                        break;
                    }
                }
                previous = metrics.index;
                previous_face = metrics.face;
                if (break_allowed[end + 1] && (end + 1 == codepoints.size() ||
                    (!nonstarter(codepoints[end + 1]) && !opener(codepoints[end]) &&
                     (codepoints[end] >= 0x80 || codepoints[end + 1] >= 0x80 ||
                      codepoints[end] == ' ')))) last_break = end + 1;
            }
            size_t text_end = end;
            while (text_end > begin && codepoints[text_end - 1] == ' ') --text_end;
            std::string line;
            for (size_t cp = begin; cp < text_end; ++cp)
                append_utf8_codepoint(line, codepoints[cp]);
            lines.push_back(std::move(line));
            if (!foregrounds.empty())
                line_foregrounds.emplace_back(foregrounds.begin() + begin,
                    foregrounds.begin() + text_end);
            begin = end < codepoints.size() && codepoints[end] == '\n' ? end + 1 : end;
        }
        // Store the complete measured layout, before selecting a viewport.
        // Scroll position changes only that selection. Never cap the cached
        // Chinese line count at the number of native English source rows.
        // Account for EVERY retained line under the same memory cap.
        // Bound both retained paragraphs and text/color payload. FIFO eviction
        // avoids clearing every visible paragraph when a long report is added.
        constexpr size_t maximum_entries = 256;
        constexpr size_t maximum_bytes = 4 * 1024 * 1024;
        size_t bytes = 2 * layout_key.size() + sizeof(ParagraphLayoutCacheEntry) +
            lines.size() * sizeof(std::string) +
            line_foregrounds.size() * sizeof(std::vector<int>);
        for (const auto &line : lines) bytes += line.size();
        for (const auto &colors : line_foregrounds) bytes += colors.size() * sizeof(int);
        if (bytes <= maximum_bytes) {
            while (!paragraph_layout_cache_order_.empty() &&
                    (paragraph_layout_cache_.size() >= maximum_entries ||
                     paragraph_layout_cache_bytes_ > maximum_bytes - bytes)) {
                const auto oldest = paragraph_layout_cache_.find(paragraph_layout_cache_order_.front());
                if (oldest != paragraph_layout_cache_.end()) {
                    paragraph_layout_cache_bytes_ -= oldest->second.bytes;
                    paragraph_layout_cache_.erase(oldest);
                }
                paragraph_layout_cache_order_.pop_front();
            }
            const auto [entry, inserted] = paragraph_layout_cache_.emplace(
                layout_key, ParagraphLayoutCacheEntry{lines, line_foregrounds, font_pixels, bytes});
            if (inserted) {
                try {
                    paragraph_layout_cache_order_.push_back(std::move(layout_key));
                } catch (...) {
                    paragraph_layout_cache_.erase(entry);
                    throw;
                }
                paragraph_layout_cache_bytes_ += bytes;
            }
        }
    }

    if (scrollable) {
        // Map the native scroll positions to the translated layout while
        // retaining the actual height of its native text viewport.
        const size_t native_range = static_cast<size_t>(viewport->total_lines) - rows.size();
        const size_t visible_lines = static_cast<size_t>(std::max(1, native_region.h / line_height));
        const size_t target_range = lines.size() > visible_lines
            ? lines.size() - visible_lines : 0;
        const size_t first = static_cast<size_t>(
            (static_cast<uint64_t>(viewport->first_line) * target_range + native_range / 2) /
                native_range);
        lines.erase(lines.begin(), lines.begin() + first);
        if (lines.size() > visible_lines) lines.resize(visible_lines);
        if (!line_foregrounds.empty()) {
            line_foregrounds.erase(line_foregrounds.begin(), line_foregrounds.begin() + first);
            if (line_foregrounds.size() > visible_lines) line_foregrounds.resize(visible_lines);
        }
    }

    Match continuation = rows.front();
    continuation.length = 0;
    continuation.source.clear();
    continuation.target.clear();
    continuation.native_help_review_source.clear();
    continuation.layout_glyph_foreground_rgb.clear();
    continuation.graphical_clear_width = continuation.graphical_clear_height = 0;
    continuation.native_split_text = continuation.native_split_duplicate = false;
    continuation.legends_flow.reset();
    continuation.legends_flow_owner = false;
    if (continuation.layout_foreground_rgb < 0) {
        bool top = false;
        if (const auto *cell = cell_at(continuation.x, continuation.y, &top))
            continuation.layout_foreground_rgb =
                (cell[1] << 16) | (cell[2] << 8) | cell[3];
    }
    // The native text box keeps its origin even when the translation is
    // taller. Drawing intersects its viewport instead of moving the block.
    const int display_top = first_y * tile_h;
    const size_t output_rows = std::max(rows.size(), lines.size());
    for (size_t line = 0; line < output_rows; ++line) {
        Match row = line < rows.size() ? std::move(rows[line]) : continuation;
        // Keep EVERY native source row for glyph suppression,
        // including short words with no standalone rule. Extra Chinese rows
        // only own layout space, never unrelated native glyphs beneath them.
        if (line < rows.size())
            std::fill_n(screen_rows[static_cast<size_t>(row.y)].begin() + row.x,
                row.length, ' ');
        row.target = line < lines.size() ? std::move(lines[line]) : std::string{};
        if (line < line_foregrounds.size() && !line_foregrounds[line].empty()) {
            row.layout_foreground_rgb = line_foregrounds[line].front();
            row.layout_glyph_foreground_rgb = std::move(line_foregrounds[line]);
        }
        row.layout_x = left;
        const int pixel_y = display_top + static_cast<int>(line) * line_height;
        row.layout_y = pixel_y / gps_->tile_pixel_y;
        row.layout_pixel_y = pixel_y % gps_->tile_pixel_y;
        row.layout_line_height_pixels = line_height;
        row.layout_fixed_baseline = true;
        row.layout_clip_right = clip_right;
        row.layout_native_clip = native_region;
        row.layout_length = width;
        row.layout_left = true;
        row.layout_font_pixels = font_pixels;
        row.layout_lock_font_pixels = true;
        if (only_y < 0 || row.y == only_y) matches.push_back(std::move(row));
    }
    return true;
}
