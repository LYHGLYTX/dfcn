// The launcher is a document beside an executable autocomplete list. Own
// both before native page recognizers or global word translations run.
std::vector<std::string> dfhack_context_rows(gps_->dimy,
    std::string(gps_->dimx, ' '));
for (int y = 0; y < gps_->dimy; ++y)
    for (int x = 0; x < gps_->dimx; ++x) {
        bool top = false;
        const auto *cell = cell_at(x, y, &top);
        dfhack_context_rows[y][x] = cell && cell[0] ? static_cast<char>(cell[0]) : ' ';
    }
retain_native_dfhack_border_chars(*gps_, dfhack_context_rows);
std::vector<SDL_Rect> dfhack_launcher_frames;
std::vector<SDL_Rect> dfhack_launcher_regions;
std::vector<Match> dfhack_launcher_matches;
{
    constexpr std::string_view title = "DFHack Launcher";
    for (int title_y = 0; title_y < gps_->dimy; ++title_y) {
        const size_t title_at = dfhack_context_rows[title_y].find(title);
        if (title_at == std::string::npos) continue;
        const auto frame = native_dfhack_frame(dfhack_context_rows, title_y,
            static_cast<int>(title_at), static_cast<int>(title.size()));
        if (!frame) continue;
        const int left = frame->x, right = frame->x + frame->w - 1;
        const int top = frame->y, bottom = frame->y + frame->h - 1;
        const int divider = right - 29;
        // These two native labels and their documented offsets distinguish
        // the launcher from an arbitrary DFHack dialog with the same skin.
        if (divider <= left + 20 || top + 9 >= bottom ||
                dfhack_context_rows[top + 2].find("Tab/Shift+Tab", divider) == std::string::npos ||
                dfhack_context_rows[top + 7].find("Showing:", divider) == std::string::npos)
            continue;
        bool connected = true;
        for (int y = top + 1; connected && y < bottom; ++y) {
            const auto ch = static_cast<unsigned char>(dfhack_context_rows[y][divider]);
            connected = ch == 0xb3 || ch == 0xba || ch == 0xc5 ||
                ch == 0xce || ch == 0xb4 || ch == 0xb9;
        }
        if (!connected) continue;
        dfhack_launcher_frames.push_back(*frame);
        dfhack_launcher_regions.push_back(*frame);
        const auto caption = [&](std::string_view source, int y, int begin, int end) {
            const size_t at = dfhack_context_rows[y].find(source, begin);
            if (at == std::string::npos || at + source.size() > static_cast<size_t>(end)) return;
            const auto target = exact_literal_translation("DFHack help: " + std::string(source));
            if (!target || !contains_cjk_utf8(*target) || (only_y >= 0 && only_y != y) ||
                    screen_rows[y].compare(at, source.size(), source) != 0) return;
            Match match{static_cast<int>(at), y, static_cast<int>(source.size()),
                kDfhackHotkeysHintRule, *target, std::string(source)};
            match.layout_x = static_cast<int>(at);
            match.layout_length = end - match.layout_x;
            match.layout_clip_right = end;
            match.layout_left = true;
            dfhack_launcher_matches.push_back(std::move(match));
        };
        caption(title, top, left + 1, right);
        caption("run", top + 4, left + 1, left + 12);
        caption("history search:", top + 4, left + 12, divider);
        caption("Click or select via", top + 1, divider + 1, right);
        caption("Tags:", top + 4, divider + 1, right - 12);
        for (std::string_view source : {"Dev default", "Default", "Custom"})
            caption(source, top + 4, divider + 1, right);
        caption("Reset tag filter", top + 5, divider + 1, right);
        caption("Showing:", top + 7, divider + 1, divider + 10);
        caption("Matching tools", top + 7, divider + 10, right);
        caption("Similar tools", top + 7, divider + 10, right);
        caption("Tagged tools", top + 7, divider + 10, right);
        caption("Help", top + 6, left + 1, left + 10);
        caption("Output", top + 6, left + 10, left + 22);
        // In graphical mode tab text is repeated on its second half.
        caption("Help", top + 7, left + 1, left + 10);
        caption("Output", top + 7, left + 10, left + 22);
        caption("Clear output", top + 6, left + 20, divider);
        caption("Copy output to clipboard", top + 7, left + 20, divider);
        caption("Copied", top + 7, left + 20, divider);
        // The output page also contains help/--help responses. Both pages
        // use the same complete catalogue; unknown ordinary output keeps
        // its native bytes instead of falling through to global word rules.
        {
            const int body_left = left + 2, body_right = divider - 3;
            const int body_top = top + 9;
            const int tile_w = gps_->tile_pixel_x, tile_h = gps_->tile_pixel_y;
            const int origin_x = (gps_->screen_pixel_x - gps_->dimx * tile_w) / 2;
            const int origin_y = (gps_->screen_pixel_y - gps_->dimy * tile_h) / 2;
            const auto read_help_row = [&](int y) -> std::optional<Match> {
                const auto band = std::string_view(dfhack_context_rows[y]).substr(
                    body_left, body_right - body_left);
                const auto ink = trim_view(band);
                if (ink.empty() || std::any_of(ink.begin(), ink.end(), [](unsigned char ch) {
                        return ch < ' ' || (ch >= 0xb3 && ch <= 0xda);
                    })) return std::nullopt;
                const int x = body_left + static_cast<int>(ink.data() - band.data());
                if (screen_rows[y].compare(x, ink.size(), ink) != 0) return std::nullopt;
                return Match{x, y, static_cast<int>(ink.size()), kDfhackHotkeysHintRule,
                    {}, std::string(ink)};
            };
            for (int y = body_top; y < bottom;) {
                if (!read_help_row(y)) { ++y; continue; }
                std::vector<Match> rows;
                int end = y;
                while (end < bottom) {
                    const auto row = read_help_row(end);
                    if (!row) break;
                    rows.push_back(*row);
                    ++end;
                }
                bool claimed = false;
                for (size_t count = rows.size(); count > 0; --count) {
                    std::vector<Match> paragraph(rows.begin(), rows.begin() + count);
                    NativeParagraphViewport viewport{};
                    std::string complete_source;
                    auto target = translate_dfhack_help_rows(paragraph, body_right - body_left,
                        &viewport, &complete_source);
                    if (!target) continue;
                    if (!contains_cjk_utf8(*target)) {
                        // Documentation commands/code are native ink; they
                        // still belong to this document, never a word rule.
                        y += static_cast<int>(count);
                        claimed = true;
                        break;
                    }
                    int clip_bottom = y + static_cast<int>(count);
                    if (count == rows.size())
                        while (clip_bottom < bottom && !read_help_row(clip_bottom)) ++clip_bottom;
                    paragraph.front().layout_native_clip = SDL_Rect{
                        origin_x + body_left * tile_w, origin_y + y * tile_h,
                        (body_right - body_left) * tile_w, (clip_bottom - y) * tile_h};
                    const bool fitted = append_bounded_paragraph(std::move(paragraph), *target,
                        screen_rows, dfhack_launcher_matches, only_y, body_right, body_right,
                        {}, false, body_left,
                        viewport.total_lines > static_cast<int>(count)
                            ? std::optional<NativeParagraphViewport>(viewport) : std::nullopt);
                    if (!fitted) continue;
                    y += static_cast<int>(count);
                    claimed = true;
                    break;
                }
                if (!claimed) ++y;
            }
        }
        // Reserve input, executable list, and complete help/output sources
        // regardless of translation coverage. This never suppresses native
        // glyphs: only translated Match records own suppression/drawing.
        for (int y = top; y <= bottom; ++y)
            std::fill_n(screen_rows[y].begin() + left, frame->w, ' ');
    }
}
