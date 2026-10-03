// Included in the connected-frame loop. devel/tile-browser.lua:14-68
// supplies this Window, a keyed EditField, numeric stripes and two arrows.
// Its texture report is machine/graphical data, not command-output prose.
{
    const auto tile_browser_window = [&]() -> bool {
        constexpr std::string_view browser_title = "Tile Browser";
        constexpr std::string_view index_caption = "Start index:";
        constexpr std::string_view index_label = "Start index: ";
        constexpr std::string_view numeric_stripe = "0123456789 0123456789";
        if (title != browser_title) return false;
        const int body_right = right - 1;
        const int stripe_x = left + 8;
        const int second_column = left + 18;
        const int previous_arrow = left + 6;
        const int next_arrow = left + 24;
        if (left < 0 || top < 0 || body_right > gps_->dimx ||
                footer_y >= gps_->dimy || footer_y - 3 < top + 3 ||
                stripe_x + static_cast<int>(numeric_stripe.size()) > body_right ||
                next_arrow >= body_right ||
                read_row(title_y).compare(at, title.size(), title) != 0 ||
                read_row(bottom).compare(right - 7, 6, "DFHack") != 0)
            return false;

        const auto index_band = std::string_view(dfhack_context_rows[top]).substr(
            left, body_right - left);
        const auto index_separator = index_band.find(": ");
        if (index_separator == std::string_view::npos || index_separator == 0)
            return false;
        auto index_key = std::string(index_band.substr(0, index_separator));
        std::replace(index_key.begin(), index_key.end(), '-', '+');
        const size_t caption_at = index_separator + 2;
        if (!is_keybinding_code(index_key) ||
                caption_at + index_label.size() > index_band.size() ||
                index_band.substr(caption_at, index_label.size()) != index_label)
            return false;
        const auto index_raw = read_row(top);
        const size_t label_end = caption_at + index_label.size();
        if (index_raw.compare(left, label_end, index_band.substr(0, label_end)) != 0)
            return false;
        // The TextFieldArea starts after the label's trailing space. Its
        // entered texpos value and cursor are deliberately outside this span.
        const int index_x = left + static_cast<int>(caption_at);

        for (const int y : {top + 2, footer_y - 2}) {
            if (dfhack_context_rows[y].compare(stripe_x,
                        numeric_stripe.size(), numeric_stripe) != 0 ||
                    read_row(y).compare(stripe_x,
                        numeric_stripe.size(), numeric_stripe) != 0)
                return false;
        }
        const auto footer_raw = read_row(footer_y);
        for (const auto &[x, arrow] : {
                std::pair{previous_arrow, static_cast<unsigned char>(24)},
                std::pair{next_arrow, static_cast<unsigned char>(25)}}) {
            if (static_cast<unsigned char>(dfhack_context_rows[footer_y][x]) != arrow ||
                    static_cast<unsigned char>(footer_raw[x]) != arrow)
                return false;
        }

        // Arrow Labels are painted after the HotkeyLabels at fixed l=6/24.
        // A long key display can therefore have an overwritten key byte.
        // The proved window establishes these two control roles; require a
        // whole native ': caption' in its own column, without parsing that
        // damaged key or reconstructing a clipped/overwritten caption.
        const auto action_caption = [&](int column_left, int column_right,
                int arrow_x, unsigned char arrow, std::string_view caption)
                -> std::optional<int> {
            const auto band = std::string_view(dfhack_context_rows[footer_y]).substr(
                column_left, column_right - column_left);
            const std::string pattern = ": " + std::string(caption);
            const size_t separator = band.find(pattern);
            if (separator == std::string_view::npos || separator == 0 ||
                    band.find(pattern, separator + pattern.size()) != std::string_view::npos)
                return std::nullopt;
            const size_t caption_at = separator + 2;
            const size_t end = caption_at + caption.size();
            const int caption_x = column_left + static_cast<int>(caption_at);
            if (caption_x <= arrow_x && arrow_x < caption_x + static_cast<int>(caption.size()))
                return std::nullopt;
            for (size_t offset = end; offset < band.size(); ++offset) {
                const int x = column_left + static_cast<int>(offset);
                if (band[offset] != ' ' &&
                        !(x == arrow_x && static_cast<unsigned char>(band[offset]) == arrow))
                    return std::nullopt;
            }
            if (footer_raw.compare(column_left, end, band.substr(0, end)) != 0)
                return std::nullopt;
            return caption_x;
        };
        const auto previous_x = action_caption(left, second_column,
            previous_arrow, 24, "Prev");
        const auto next_x = action_caption(second_column, body_right,
            next_arrow, 25, "Next");

        // Own the whole source-proved Window. No renderer is applied to its
        // raw texpos report, numeric stripes, tile textures, value, cursor,
        // keys or arrows; only complete fixed captions get exact Output keys.
        dfhack_auxiliary_regions.push_back(*frame);
        auxiliary_literal(at, title_y, title, title_end, true, "DFHack output: ");
        auxiliary_literal(index_x, top, index_caption,
            index_x + static_cast<int>(index_caption.size()), false, "DFHack output: ");
        if (previous_x)
            auxiliary_literal(*previous_x, footer_y, "Prev", *previous_x + 4,
                false, "DFHack output: ");
        if (next_x)
            auxiliary_literal(*next_x, footer_y, "Next", *next_x + 4,
                false, "DFHack output: ");
        return true;
    };
    if (tile_browser_window()) continue;
}
