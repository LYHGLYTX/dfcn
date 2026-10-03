// gui/autotraining.lua uses fixed widget offsets within an inset Window.
// The List icons, names/aliases, numeric EditField and filter stay native;
// the noble List alone contains human captions derived from position codes.
{
    constexpr std::string_view title = "Training Setup";
    constexpr std::string_view squads = "Select squads for automatic training:";
    constexpr std::string_view options = "General options:";
    constexpr std::string_view threshold = "Need threshold for training:";
    constexpr std::string_view enabled = "Autotraining is";
    constexpr std::string_view nobles = "Ignored noble positions:";
    constexpr std::string_view units = "Select units to exclude from automatic training:";
    const auto training_field = [&](int x, int y, std::string_view source,
            std::string_view target, int right) {
        if (source.empty() || !contains_cjk_utf8(target) || x < 0 || y < 0 ||
                y >= gps_->dimy || right > gps_->dimx || right <= x ||
                x + static_cast<int>(source.size()) > right ||
                read_row(y).compare(x, source.size(), source) != 0) return;
        std::vector<Match> rows{{x, y, static_cast<int>(source.size()),
            kDfhackHotkeysHintRule, {}, std::string(source)}};
        rows.front().layout_native_clip = auxiliary_pixels({x, y, right - x, 1});
        append_bounded_paragraph(std::move(rows), target, screen_rows,
            dfhack_auxiliary_matches, only_y, right, right, {}, false, x);
    };
    const auto training_caption = [&](int x, int y, std::string_view source, int right) {
        auto target = exact_literal_translation("DFHack GUI Autotraining caption: " +
            std::string(source));
        if (!target) target = exact_literal_translation("DFHack help: " + std::string(source));
        if (target) training_field(x, y, source, *target, right);
    };
    for (int title_y = 0; title_y < gps_->dimy; ++title_y) {
        const size_t at = dfhack_context_rows[title_y].find(title);
        if (at == std::string::npos) continue;
        const auto frame = native_dfhack_frame(dfhack_context_rows, title_y,
            static_cast<int>(at), static_cast<int>(title.size()), 55, 20);
        if (!frame) continue;
        const int edge = frame->x + frame->w - 1, bottom = frame->y + frame->h - 1;
        const int left = frame->x + 2, right = edge - 1, top = title_y + 2;
        const auto same = [&](int y, std::string_view text) {
            return y < bottom - 1 && left + static_cast<int>(text.size()) <= right &&
                dfhack_context_rows[y].compare(left, text.size(), text) == 0;
        };
        const auto divider = [&](int y) {
            return y < bottom - 1 && std::all_of(dfhack_context_rows[y].begin() + left,
                dfhack_context_rows[y].begin() + right,
                [](unsigned char ch) { return ch == 196; });
        };
        if (dfhack_context_rows[bottom].compare(edge - 7, 6, "DFHack") != 0 ||
                !same(top, squads) || !same(top + 7, options) || !same(top + 11, nobles) ||
                !divider(top + 6) || !divider(top + 10)) continue;
        dfhack_auxiliary_regions.push_back(*frame);
        gui_literal(static_cast<int>(at), title_y, title,
            static_cast<int>(at + title.size()), "Title", true);
        for (const auto &[offset, source] : {
                std::pair{0, squads}, std::pair{7, options}, std::pair{11, nobles},
                std::pair{24, units}})
            if (same(top + offset, source))
                training_caption(left, top + offset, source, right);
        // EditField paints its hotkey before label_text, followed immediately
        // by the live text area. Own only the complete static label's span.
        const auto &edit = dfhack_context_rows[top + 8];
        const size_t threshold_at = edit.find(threshold, left);
        if (threshold_at != std::string::npos &&
                threshold_at + threshold.size() <= static_cast<size_t>(right))
            training_caption(static_cast<int>(threshold_at), top + 8, threshold,
                static_cast<int>(threshold_at + threshold.size()));
        const auto &toggle = dfhack_context_rows[top + 9];
        const size_t enabled_at = toggle.find(enabled, left);
        if (enabled_at != std::string::npos &&
                enabled_at + enabled.size() + 1 < static_cast<size_t>(right)) {
            const int state_x = static_cast<int>(enabled_at + enabled.size()) + 1;
            training_caption(static_cast<int>(enabled_at), top + 9, enabled, state_x - 1);
            const auto state = trim_view(std::string_view(toggle).substr(state_x, right - state_x));
            if (state == "Enabled" || state == "Disabled")
                gui_literal(state_x, top + 9, state, right, "Autotraining state");
        }
        // getPositions converts code spelling to title-case words for display.
        // Scope exact entries to this field, then use the complete profession
        // grammar. Never apply either path to the neighboring named Lists.
        const int caption_left = left + 2, caption_right = right - 2;
        for (int y = top + 12; y < top + 23 && y < bottom - 1; ++y) {
            if (dfhack_context_rows[y][caption_right - 1] != ' ') continue;
            const auto caption = trim_view(std::string_view(dfhack_context_rows[y]).substr(
                caption_left, caption_right - caption_left));
            if (caption.empty()) continue;
            auto target = exact_literal_translation("DFHack GUI Autotraining noble: " +
                std::string(caption));
            if (!target) target = translate_dfhack_caption("profession", caption);
            if (target) training_field(caption_left, y, caption, *target, caption_right);
        }
        // FilteredList begins at top+25 with its untouched edit row, and the
        // empty-list Label at offset two. No person choice is translated.
        if (top + 27 < bottom - 1 && dfhack_context_rows[top + 27].compare(
                caption_left, 10, "No matches") == 0)
            gui_literal(caption_left, top + 27, "No matches", caption_right, "List status");
    }
}
