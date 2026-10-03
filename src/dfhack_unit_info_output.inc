// gui/unit-info-viewer.lua reserves two one-row name Labels above chunks.
// add_chunk wraps each complete paragraph at frame_body.width-3, preserves
// its pen, and appends a blank separator. Names never enter this prose reader.
{
    constexpr std::string_view title = "Unit info";
    constexpr std::string_view initial = "Please select a unit.";
    for (int title_y = 0; title_y < gps_->dimy; ++title_y) {
        const size_t at = dfhack_context_rows[title_y].find(title);
        if (at == std::string::npos) continue;
        const auto frame = native_dfhack_frame(dfhack_context_rows, title_y,
            static_cast<int>(at), static_cast<int>(title.size()), 40, 10);
        if (!frame) continue;
        const int edge = frame->x + frame->w - 1;
        const int bottom = frame->y + frame->h - 1;
        const int left = frame->x + 2, right = edge - 1;
        const int chunks_top = title_y + 5, chunks_bottom = bottom - 2;
        if (chunks_top > chunks_bottom || right <= left ||
                dfhack_context_rows[bottom].compare(edge - 7, 6, "DFHack") != 0)
            continue;
        // Ownership excludes generic name/word rules without suppressing any
        // native glyph. Only complete translated chunks acquire draw matches.
        dfhack_auxiliary_regions.push_back(*frame);
        gui_literal(static_cast<int>(at), title_y, title,
            static_cast<int>(at + title.size()), "Title", true);
        const auto first = trim_view(std::string_view(dfhack_context_rows[chunks_top]).substr(
            left, right - left));
        if (first == initial) {
            gui_literal(left, chunks_top, initial, right, "Unit info caption");
            continue;
        }
        // Label clips the bottom; it does not expose a scrollbar. The shared
        // reader recovers only complete known paragraphs or verified native
        // slices, and flushes each blank-separated chunk independently.
        int body_top = chunks_top;
        std::vector<Match> description;
        std::string source;
        int separator = chunks_top;
        for (; separator <= chunks_bottom; ++separator) {
            const auto band = std::string_view(dfhack_context_rows[separator]).substr(left, right - left);
            const auto text = trim_view(band);
            if (text.empty()) break;
            if (!source.empty()) source += ' ';
            source += text;
            description.push_back({left + static_cast<int>(text.data() - band.data()),
                separator, static_cast<int>(text.size()), kDfhackHotkeysHintRule, {}, std::string(text)});
        }
        // Caste descriptions already have exact translations in the ordinary
        // game dictionary. A visible blank proves the first chunk ended;
        // cropped unknown descriptions never acquire a guessed translation.
        if (!description.empty() && separator <= chunks_bottom) {
            const auto target = exact_literal_translation(normalize_dfhack_help(source));
            if (target && contains_cjk_utf8(*target)) {
                description.front().layout_native_clip = auxiliary_pixels(
                    {left, chunks_top, right - left, separator - chunks_top + 1});
                append_bounded_paragraph(std::move(description), *target, screen_rows,
                    dfhack_auxiliary_matches, only_y, right, right, {}, false, left);
                body_top = separator + 1;
            }
        }
        if (body_top <= chunks_bottom)
            auxiliary_body({left, body_top, right - left, chunks_bottom - body_top + 1},
                frame->w - 7, false, true);
    }
}
