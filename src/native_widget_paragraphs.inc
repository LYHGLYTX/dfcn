// Native multiline controls retain their complete source independently of
// which English rows survived the current writer viewport.
std::optional<std::string> Overlay::translate_native_widget_paragraph(
        std::string_view source) const {
    if (source.empty()) return std::nullopt;
    const std::vector<int> source_colors(source.size(), 0xffffff);
    std::vector<int> target_colors;
    const auto announcements = native_announcement_sources();
    if (announcements->originals.contains(native_announcement_display_source(source)))
        if (auto announcement = translate_complete_announcement(source, source_colors, target_colors);
                announcement && !announcement->empty()) return announcement;
    if (auto literal = exact_literal_translation(source); literal && !literal->empty())
        return literal;
    if (auto message = translate_help_paragraph(source, source_colors, target_colors, true))
        return message;
    return translate_help_paragraph(source, source_colors, target_colors, false);
}

int Overlay::native_multiline_required_rows(std::string_view source, int width) const {
    TranslationStateScope translation_scope;
    refresh_native_font_metrics();
    if (!config_.enabled || !face_ || !gps_ || width <= 0 || width > 262144 ||
            gps_->tile_pixel_x <= 0 || gps_->tile_pixel_y <= 0 ||
            int64_t(width) * gps_->tile_pixel_x > INT32_MAX) return 0;
    const auto target = translate_native_widget_paragraph(source);
    if (!target || target->empty()) return 0;
    const int origin_x = (gps_->screen_pixel_x - gps_->dimx * gps_->tile_pixel_x) / 2;
    const int origin_y = (gps_->screen_pixel_y - gps_->dimy * gps_->tile_pixel_y) / 2;
    Match measure{0, 0, 0, kUiMessageRule, {}, {}};
    measure.layout_native_clip = SDL_Rect{origin_x, origin_y,
        width * gps_->tile_pixel_x, gps_->tile_pixel_y};
    std::vector<std::string> unused_source;
    std::vector<Match> unused_output;
    int measured_rows = 0;
    // The same fitter measures and draws. Measurement stops before it emits
    // display rows or touches source suppression; no artificial game rows or
    // alternate approximate character-count wrapper are involved.
    if (!append_bounded_paragraph({std::move(measure)}, *target, unused_source,
            unused_output, -1, width, width, {}, false, 0, std::nullopt, {},
            0, 0, &measured_rows)) return 0;
    return measured_rows;
}

void Overlay::append_native_rendered_paragraphs(std::vector<std::string> &screen_rows,
        std::vector<Match> &matches, int only_y, const unsigned char *raw) const {
    if (!config_.enabled || !face_ || !gps_ || !gps_->screen ||
            gps_->dimx <= 0 || gps_->dimx > 1000 || gps_->dimy <= 0 || gps_->dimy > 1000 ||
            gps_->tile_pixel_x <= 0 || gps_->tile_pixel_y <= 0 ||
            screen_rows.size() != static_cast<size_t>(gps_->dimy) ||
            (raw && raw != gps_->screen && raw != gps_->screen_top)) return;
    const int tile_w = gps_->tile_pixel_x, tile_h = gps_->tile_pixel_y;
    const int origin_x = (gps_->screen_pixel_x - gps_->dimx * tile_w) / 2;
    const int origin_y = (gps_->screen_pixel_y - gps_->dimy * tile_h) / 2;
    auto paragraphs = captured_native_paragraphs();
    std::stable_sort(paragraphs.begin(), paragraphs.end(), [](const auto &a, const auto &b) {
        return a.sequence > b.sequence;
    });
    const std::array batches{captured_native_drawn_text_rows(false),
        captured_native_drawn_text_rows(true)};
    for (const auto &paragraph : paragraphs) {
        if (!paragraph.render || paragraph.source.empty() || paragraph.wrapped_lines.empty()) continue;
        const auto &render = *paragraph.render;
        if (render.addressed_row_loop) continue;
        const auto epoch = g_embark_item_capture_epoch.load(std::memory_order_acquire);
        if (!paragraph.owner || render.epoch != epoch || render.dimx != gps_->dimx ||
                render.dimy != gps_->dimy || !render.grid ||
                render.grid != (render.top_layer ? gps_->screen_top : gps_->screen) ||
                (raw && raw != render.grid) || render.width <= 0 || render.width > 262144 ||
                render.width != paragraph.paragraph_width || render.writer_clip.w <= 0 ||
                render.writer_clip.h <= 0 || int64_t(render.width) * tile_w > INT32_MAX ||
                int64_t(render.x) + render.width > INT32_MAX) continue;
        const SDL_Rect screen{0, 0, gps_->dimx, gps_->dimy};
        SDL_Rect viewport{};
        if (!SDL_IntersectRect(&screen, &render.writer_clip, &viewport)) continue;
        // The writer can impose a positive draw width independently of the
        // multiline wrap helper. It clips pixels; it never rewraps the source.
        if (render.writer_width > 0) {
            if (int64_t(render.x) + render.writer_width > INT32_MAX) continue;
            const SDL_Rect writer_span{render.x, viewport.y,
                render.writer_width, viewport.h};
            SDL_Rect limited{};
            if (!SDL_IntersectRect(&viewport, &writer_span, &limited)) continue;
            viewport = limited;
        }
        const int left = std::max(viewport.x, render.x);
        const int right = static_cast<int>(std::min<int64_t>(
            int64_t(viewport.x) + viewport.w, int64_t(render.x) + render.width));
        if (left >= right) continue;
        // A specialized reader that already owns this actual control keeps
        // its typed Match metadata. Native render capture is not permission
        // to replace item/record/document semantics with a generic sentence.
        if (std::any_of(matches.begin(), matches.end(), [&](const Match &match) {
                return match.native_geometry && match.native_geometry->control &&
                    match.native_geometry->control->owner == paragraph.owner &&
                    native_text_geometry_current(*gps_, *match.native_geometry);
            })) continue;
        const auto target = translate_native_widget_paragraph(paragraph.source);
        if (!target || target->empty()) continue;
        const SDL_Rect visible_pixels{origin_x + viewport.x * tile_w,
            origin_y + viewport.y * tile_h, viewport.w * tile_w, viewport.h * tile_h};
        const auto &draws = batches[render.top_layer ? 1 : 0];
        std::vector<Match> source_rows;
        bool claimed = false, occluded = false, visible_source_ink = false;
        int foreground = render.foreground_rgb;
        const size_t first_line = static_cast<size_t>(std::clamp<int64_t>(
            int64_t(viewport.y) - render.y, 0, paragraph.wrapped_lines.size()));
        const size_t last_line = static_cast<size_t>(std::clamp<int64_t>(
            int64_t(viewport.y) + viewport.h - render.y, 0, paragraph.wrapped_lines.size()));
        for (size_t line = first_line; line < last_line && !claimed; ++line) {
            const auto &native = paragraph.wrapped_lines[line];
            const int y = static_cast<int>(int64_t(render.y) + line);
            const int end = static_cast<int>(std::min<int64_t>(right,
                int64_t(render.x) + static_cast<int64_t>(native.size())));
            if (end <= left || screen_rows[y].size() != static_cast<size_t>(gps_->dimx)) continue;
            std::vector<const NativeDrawnTextRow *> owners(static_cast<size_t>(end - left), nullptr);
            // Resolve final writes before selecting this owner. Filtering by
            // owner first would let an overwritten English row reappear.
            for (auto at = draws.rbegin(); at != draws.rend(); ++at) {
                const auto &draw = *at;
                if (draw.y != y || draw.draw_epoch != epoch || draw.draw_grid != render.grid ||
                        draw.draw_dimx != render.dimx || draw.draw_dimy != render.dimy) continue;
                const int first = std::max(left, draw.x);
                const int last = static_cast<int>(std::min<int64_t>(end,
                    int64_t(draw.x) + static_cast<int64_t>(draw.source.size())));
                for (int x = first; x < last; ++x)
                    if (!owners[x - left]) owners[x - left] = &draw;
            }
            int run = -1;
            const auto flush = [&](int end_x) {
                if (run < 0) return;
                const auto physical = std::string_view(native).substr(
                    static_cast<size_t>(run - render.x), static_cast<size_t>(end_x - run));
                const auto ink = trim_view(physical);
                if (!ink.empty()) {
                    const int x = run + static_cast<int>(ink.data() - physical.data());
                    Match source{x, y, static_cast<int>(ink.size()), kUiMessageRule, {}, std::string(ink)};
                    bind_native_text_geometry(*gps_, source, render.grid);
                    if (!source.native_geometry || !source.native_geometry->control ||
                            source.native_geometry->control->owner != paragraph.owner ||
                            !native_text_geometry_current(*gps_, *source.native_geometry)) claimed = true;
                    else {
                        source.layout_native_clip = visible_pixels;
                        source.layout_foreground_rgb = foreground;
                        source_rows.push_back(std::move(source));
                    }
                }
                run = -1;
            };
            for (int x = left; x < end && !claimed; ++x) {
                const size_t at = static_cast<size_t>(x) * gps_->dimy + y;
                const auto *draw = owners[x - left];
                const unsigned char expected = native[static_cast<size_t>(x - render.x)];
                const unsigned char actual = render.grid[at * 8];
                visible_source_ink = visible_source_ink || expected != ' ';
                const bool same_layer = native_ui_top_layer_at(*gps_, at) == render.top_layer;
                const bool owned = draw && draw->text_control &&
                    draw->text_control->owner == paragraph.owner && draw->text_control->multiline &&
                    same_layer &&
                    (actual ? actual : ' ') == expected &&
                    draw->source[static_cast<size_t>(x - draw->x)] == static_cast<char>(expected);
                if (!owned) {
                    // A later native owner or foreground layer replaces this
                    // source. Leave its recovery to the existing occlusion
                    // reader instead of drawing a full paragraph through it.
                    if (expected != ' ' || (actual && actual != ' ') || !same_layer)
                        occluded = true;
                    flush(x);
                    continue;
                }
                // screen_rows records earlier semantic claims; native bytes
                // alone cannot grant ownership over an already translated field.
                if (screen_rows[y][x] != static_cast<char>(expected)) { claimed = true; break; }
                if (foreground < 0 && expected != ' ')
                    foreground = (render.grid[at * 8 + 1] << 16) |
                        (render.grid[at * 8 + 2] << 8) | render.grid[at * 8 + 3];
                if (run < 0) run = x;
            }
            flush(end);
        }
        if (claimed || occluded || (source_rows.empty() && visible_source_ink) ||
                render.epoch != g_embark_item_capture_epoch.load(std::memory_order_acquire) ||
                foreground < 0) continue;
        for (auto &row : source_rows) row.layout_foreground_rgb = foreground;
        if (source_rows.empty()) {
            // Scrolling can expose translated continuation lines after every
            // English row has left the viewport. The actual render still
            // proves origin, width, writer clip and foreground in that case.
            Match anchor{left, viewport.y, 0, kUiMessageRule, {}, {}};
            anchor.layout_native_clip = visible_pixels;
            anchor.layout_foreground_rgb = foreground;
            source_rows.push_back(std::move(anchor));
        }
        std::vector<int> colors;
        const std::vector<int> source_colors(paragraph.source.size(), foreground);
        for (bool messages : {true, false}) {
            std::vector<int> candidate_colors;
            const auto colored = translate_help_paragraph(paragraph.source,
                source_colors, candidate_colors, messages);
            if (colored && *colored == *target) { colors = std::move(candidate_colors); break; }
        }
        // Writer origin stays fixed even above the viewport. Native scrolling
        // selects pixels from this full layout; English row counts never
        // select or truncate a different Chinese substring.
        const uint32_t half = render.flags_known ? render.flags & ((1u << 3) | (1u << 4)) : 0;
        const bool split_half = half == (1u << 3) || half == (1u << 4);
        const int64_t native_origin_y = int64_t(render.y) - (half == (1u << 4) ? 1 : 0);
        if (native_origin_y < INT32_MIN || native_origin_y > INT32_MAX) continue;
        const size_t first_output = matches.size();
        if (!append_bounded_paragraph(std::move(source_rows), *target, screen_rows,
            matches, only_y, render.x + render.width, render.x + render.width,
            colors, false, render.x, std::nullopt, {}, 0,
            static_cast<int>(native_origin_y), nullptr, true)) continue;
        // Half-text flags describe the actual native baseline. Preserve that
        // offset on every display row, including source-free continuations.
        if (split_half)
            for (size_t at = first_output; at < matches.size(); ++at) {
                matches[at].layout_pixel_y += tile_h / 2;
                if (matches[at].native_flow) {
                    auto flow = std::make_shared<NativeTextFlowGeometry>(*matches[at].native_flow);
                    flow->pixel_y += tile_h / 2;
                    matches[at].native_flow = std::move(flow);
                }
            }
    }
}
