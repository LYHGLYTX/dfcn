// A live adventure report owns its drawn rows before any item, hover, name
// or generic UI recognizer edits screen_rows. Its native parent and exact
// draw addresses establish identity; inferred panel artwork only improves
// the layout bounds and must not decide whether the report is translated.
    {
        const auto paragraphs = native_adventure_announcement_paragraphs();
        const auto draws = paragraphs.empty() ? std::vector<NativeDrawnTextRow>{}
            : captured_native_drawn_text_rows();
        std::unordered_multimap<uintptr_t, const NativeDrawnTextRow *> by_address;
        for (const auto &draw : draws)
            if (draw.address) by_address.emplace(draw.address, &draw);
        const NativePanelBorders borders(*gps_);
        const auto settings = native_ui_settings();
        const auto report_panel = [&](const NativeDrawnTextRow &draw)
                -> std::optional<SDL_Rect> {
            // Classic report frames are CP437 artwork. Use the complete
            // four-sided ASCII reader already used by character panels;
            // generic texture/text boundary inference can reject this frame
            // beside its two-column shaded scrollbar.
            if (settings && settings->classic) {
                if (const auto frame = find_ascii_panel_frame(draw.x, draw.x + 1,
                        draw.y, gps_->dimx, gps_->dimy,
                        [&](int x, int y) {
                            bool top = false;
                            const auto *cell = cell_at(x, y, &top);
                            return cell ? cell[0] : 0;
                        }))
                    return SDL_Rect{frame->left + 1, frame->top + 1,
                        frame->right - frame->left - 1,
                        frame->bottom - frame->top - 1};
            }
            return native_panel_interior(borders, *gps_,
                SDL_Rect{draw.x, draw.y, 1, 1});
        };
        for (const auto &paragraph : paragraphs) {
            std::vector<Match> spans;
            std::optional<SDL_Rect> paragraph_panel;
            size_t first_line = 0, last_line = 0;
            bool intact = true;
            for (size_t line = 0; line < paragraph.rows.size(); ++line) {
                const auto &row = paragraph.rows[line];
                const auto [first, last] = by_address.equal_range(row.address);
                for (auto at = first; at != last; ++at) {
                    const auto &draw = *at->second;
                    if (draw.source != row.source || row.source.empty() ||
                        draw.y < 0 || draw.y >= gps_->dimy || draw.x < 0 ||
                        draw.x >= gps_->dimx)
                        continue;
                    // The native 95-column wrap does not subtract the speech
                    // inset. Its right tail can lie behind the scrollbar or
                    // frame. Establish that frame from the draw origin, then
                    // match only its exposed prefix, retaining parent::text
                    // as the complete translation unit.
                    const auto panel = report_panel(draw);
                    const int clip_right = panel
                        ? panel->x + panel->w - 2 : gps_->dimx;
                    if (clip_right <= draw.x) continue;
                    size_t exposed = std::min(row.source.size(),
                        static_cast<size_t>(clip_right - draw.x));
                    // Native wrapping retains the space after the last word.
                    // That padding can be overwritten by the scrollbar even
                    // though EVERY visible letter still matches this draw.
                    // Padding owns no ink: do not reject the first line of a
                    // complete report because its final space is now a widget.
                    while (exposed && row.source[exposed - 1] == ' ') --exposed;
                    if (!exposed) continue;
                    if (screen_rows[draw.y].compare(draw.x, exposed,
                            row.source, 0, exposed) != 0) continue;
                    bool visible = true;
                    for (size_t i = 0; i < exposed; ++i) {
                        if (row.source[i] == ' ') continue;
                        bool top = false;
                        cell_at(draw.x + static_cast<int>(i), draw.y, &top);
                        if (screen_override && screen_override !=
                                (top ? gps_->screen_top : gps_->screen)) visible = false;
                    }
                    if (!visible) continue;
                    if (panel) paragraph_panel = panel;
                    if (spans.empty()) first_line = line;
                    else if (line != last_line + 1 || draw.y != spans.back().y + 1) {
                        intact = false;
                        break;
                    }
                    spans.push_back({draw.x, draw.y, static_cast<int>(exposed),
                        kUiMessageRule, {}, row.source.substr(0, exposed)});
                    last_line = line;
                    break;
                }
                if (!intact) break;
            }
            if (!intact || spans.empty()) continue;
            const auto &first = spans.front();
            int left = first.x, right = first.x + first.length;
            for (const auto &span : spans) {
                left = std::min(left, span.x);
                right = std::max(right, span.x + span.length);
            }
            if (const auto &panel = paragraph_panel) {
                left = paragraph.centered ? panel->x + 1 : first.x;
                right = panel->x + panel->w - 2;
            }
            bool top = false;
            const auto *cell = cell_at(first.x, first.y, &top);
            const int foreground = cell ? (cell[1] << 16) | (cell[2] << 8) | cell[3] : 0xffffff;
            const auto source = native_announcement_display_source(paragraph.source);
            std::vector<int> colors;
            const auto target = translate_complete_announcement(source,
                std::vector<int>(source.size(), foreground), colors);
            std::optional<NativeParagraphViewport> viewport;
            if (first_line || last_line + 1 != paragraph.rows.size())
                viewport = NativeParagraphViewport{static_cast<int>(first_line),
                    static_cast<int>(paragraph.rows.size())};
            const size_t first_match = result.size();
            if (target && append_bounded_paragraph(spans, *target, screen_rows,
                    result, only_y, right, right, colors, false, left, viewport, {},
                    static_cast<int>(paragraph.rows.size()))) {
                if (paragraph.centered)
                    for (size_t at = first_match; at < result.size(); ++at)
                        result[at].layout_left = false;
                continue;
            }
            // Unknown complete records still own their original ink. Later
            // noun/name heuristics must not turn them into mixed fragments.
            spans.front().native_help_review_source = source;
            for (auto &span : spans) {
                span.native_help_source_only = true;
                std::fill_n(screen_rows[span.y].begin() + span.x, span.length, ' ');
                untranslated_help_rows.push_back(std::move(span));
            }
        }
    }
