// gui/mass-remove autoarranges wrapped instructions and separate cycle fields.
// Own the connected Window, leaving its forward/backward hotkeys native.
{
    constexpr std::string_view mass_remove_scope = "DFHack GUI Mass remove: ";
    constexpr std::array<std::string_view, 5> captions{
        "Buildings:", "Constructions:", "Stockpiles:", "Zones:", "Mode:"};
    constexpr std::array<std::string_view, 7> options{
        "Leave alone", "Affect built and planned", "Affect built", "Affect planned",
        "Remove", "Remove or schedule for removal", "Cancel removal"};
    for (int title_y = 0; title_y < gps_->dimy; ++title_y) {
        constexpr std::string_view title = "Mass Remove";
        const size_t title_at = dfhack_context_rows[title_y].find(title);
        if (title_at == std::string::npos) continue;
        const auto frame = native_dfhack_frame(dfhack_context_rows, title_y,
            static_cast<int>(title_at), static_cast<int>(title.size()), 22, 9);
        if (!frame) continue;
        const int edge = frame->x + frame->w - 1, bottom = frame->y + frame->h - 1;
        const int left = frame->x + 2, right = edge - 1, top = frame->y + 2;
        if (right - left <= 3 || top > bottom - 2 ||
                dfhack_context_rows[bottom].compare(edge - 7, 6, "DFHack") != 0)
            continue;
        const auto first = trim_view(std::string_view(dfhack_context_rows[top]).substr(
            left, right - left - 3));
        if (!(first.starts_with("Designate buildings") ||
                first.starts_with("Please deselect"))) continue;
        dfhack_auxiliary_regions.push_back(*frame);
        gui_literal(static_cast<int>(title_at), title_y, title,
            static_cast<int>(title_at + title.size()), "Title", true);

        // WrappedLabel reserves three columns for scrolling. The intro and
        // first/second-corner prompt each terminate at an autoarrange gap.
        for (int y = top; y <= bottom - 2; ++y) {
            const auto band = std::string_view(dfhack_context_rows[y]).substr(
                left, right - left - 3);
            const auto text = trim_view(band);
            if (!(text.starts_with("Designate buildings") ||
                    text.starts_with("Please deselect") || text.starts_with("Select the")))
                continue;
            if (const auto prompt = gui_prompt("Mass remove", left, y,
                    right - 3, bottom - 2)) {
                append_gui_prompt(*prompt, left, right);
                y = prompt->rows.back().y;
            }
        }

        // CycleHotkeyLabel's caption and option have independent pens. Its
        // option gaps are 5/1/4/9/1 columns, so recover the live token edges.
        for (int y = top; y <= bottom - 2; ++y) {
            const auto &row = dfhack_context_rows[y];
            const size_t separator = row.find(": ", left);
            if (separator == std::string::npos || separator + 2 >= static_cast<size_t>(right))
                continue;
            size_t caption_at = separator + 2;
            while (caption_at < static_cast<size_t>(right) && row[caption_at] == ' ')
                ++caption_at;
            const auto tail = std::string_view(row).substr(caption_at, right - caption_at);
            for (size_t i = 0; i < captions.size(); ++i) {
                const auto caption = captions[i];
                if (!tail.starts_with(caption)) continue;
                const auto value = trim_view(tail.substr(caption.size()));
                if (std::find(options.begin(), options.end(), value) == options.end()) continue;
                const bool allowed = i < 2
                    ? value == "Leave alone" || value.starts_with("Affect ")
                    : i < 4 ? value == "Leave alone" || value == "Remove"
                    : value == "Remove or schedule for removal" || value == "Cancel removal";
                if (!allowed) continue;
                const int value_x = static_cast<int>(value.data() - row.data());
                auxiliary_literal(static_cast<int>(caption_at), y, caption,
                    value_x - 1, false, mass_remove_scope);
                auxiliary_literal(value_x, y, value, right, false, mass_remove_scope);
                break;
            }
        }
        const size_t pause = dfhack_context_rows[bottom].find("PAUSE FORCED", frame->x + 1);
        if (pause != std::string::npos && pause + 12 < static_cast<size_t>(edge - 7))
            gui_literal(static_cast<int>(pause), bottom, "PAUSE FORCED",
                static_cast<int>(pause + 12), "Frame status");
    }
}
