// gui/suspendmanager.lua:11-38 has one fixed Window and two ToggleHotkeyLabels.
// Read their complete caption/option tokens, not isolated boolean words.
{
    const auto suspendmanager_window = [&]() -> bool {
        constexpr std::string_view manager_title = "Suspendmanager";
        if (title != manager_title || frame->w != 38 || frame->h != 11 ||
                read_row(title_y).compare(at, title.size(), title) != 0)
            return false;
        const int body_right = right - 1;
        const int body_width = body_right - left;
        if (body_width != 34 || footer_y != top + 6) return false;

        struct Toggle {
            int y, width, caption_x = 0, option_x = 0;
            std::string_view caption, first, second, option;
        };
        std::array<Toggle, 2> toggles{{
            {top, 34, 0, 0, "Suspendmanager is", "Enabled", "Disabled", {}},
            {top + 2, 33, 0, 0, "Prevent blocking jobs:", "Yes", "No", {}},
        }};
        for (auto &toggle : toggles) {
            const auto band = std::string_view(dfhack_context_rows[toggle.y]).substr(
                left, toggle.width);
            const size_t separator = band.find(": ");
            if (separator == std::string_view::npos || separator == 0) return false;
            auto key = std::string(band.substr(0, separator));
            std::replace(key.begin(), key.end(), '-', '+');
            const size_t caption_at = separator + 2;
            const size_t option_at = caption_at + toggle.caption.size() + 1;
            if (!is_keybinding_code(key) || option_at >= band.size() ||
                    band.substr(caption_at, toggle.caption.size()) != toggle.caption ||
                    band[option_at - 1] != ' ')
                return false;
            const auto option_band = band.substr(option_at);
            toggle.option = trim_view(option_band);
            if (toggle.option.data() != option_band.data() ||
                    (toggle.option != toggle.first && toggle.option != toggle.second) ||
                    read_row(toggle.y).compare(left, band.size(), band) != 0)
                return false;
            toggle.caption_x = left + static_cast<int>(caption_at);
            toggle.option_x = left + static_cast<int>(option_at);
        }
        // The second toggle has w=33; the fixed Window has one additional
        // body column. Every other body row is empty in this two-control UI.
        if (dfhack_context_rows[top + 2][body_right - 1] != ' ' ||
                read_row(top + 2)[body_right - 1] != ' ')
            return false;
        for (int y = top; y <= footer_y; ++y) {
            if (y == top || y == top + 2) continue;
            const auto raw = read_row(y);
            if (!trim_view(std::string_view(dfhack_context_rows[y]).substr(
                        left, body_width)).empty() ||
                    !trim_view(std::string_view(raw).substr(left, body_width)).empty())
                return false;
        }

        dfhack_auxiliary_regions.push_back(*frame);
        gui_literal(at, title_y, title, title_end, "Title", true);
        for (const auto &toggle : toggles) {
            // Bound each overlay to its original Label token so the actual
            // Ctrl/Alt binding and the independently colored option survive.
            gui_literal(toggle.caption_x, toggle.y, toggle.caption,
                toggle.caption_x + static_cast<int>(toggle.caption.size()),
                "Suspendmanager caption");
            gui_literal(toggle.option_x, toggle.y, toggle.option,
                toggle.option_x + static_cast<int>(toggle.option.size()),
                "Suspendmanager state");
        }
        return true;
    };
    if (suspendmanager_window()) continue;
}
