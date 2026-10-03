// Included in the connected-frame loop. devel/input-monitor.lua uses a
// resizable Window, two plain Labels, an INTERIOR_FRAME Panel and a b=0
// HotkeyLabel. Its input stream is debug data, never command-output prose.
{
    const auto input_monitor_window = [&]() -> bool {
        constexpr std::string_view monitor_title = "Input Monitor";
        constexpr std::string_view modifier_caption = "Modifier keys:";
        constexpr std::string_view mouse_caption = "Mouse buttons:";
        constexpr std::string_view stream_caption = "Input stream (newest at bottom):";
        constexpr std::string_view close_caption = "Hit ESC twice or click here twice to close";
        constexpr std::string_view modifier_row = "Modifier keys: Shift Ctrl Alt";
        constexpr std::string_view mouse_row = "Mouse buttons: Lbut Mbut Rbut";
        if (title != monitor_title || action_x < 0 || action != close_caption ||
                footer.data() != footer_band.data()) return false;

        // Window has frame_inset=1 plus its framed Panel's one-cell gap.
        // The stream Panel has t=4, b=2, no inset, and one framed gap.
        const int body_right = right - 1;
        const int body_width = body_right - left;
        const int panel_left = left;
        const int panel_right = body_right - 1;
        const int panel_top = top + 4;
        const int panel_bottom = footer_y - 2;
        const int stream_x = panel_left + 1;
        const int stream_y = panel_top + 1;
        if (left < 0 || top < 0 || body_right > gps_->dimx ||
                footer_y >= gps_->dimy || body_width <= 0 ||
                panel_bottom < panel_top + 2 ||
                modifier_row.size() > static_cast<size_t>(body_width) ||
                mouse_row.size() > static_cast<size_t>(body_width) ||
                stream_caption.size() > static_cast<size_t>(panel_right - stream_x) ||
                action_x + static_cast<int>(close_caption.size()) > body_right)
            return false;

        // Require whole authored fields, including their native fixed key
        // names. A clipped Label is not reconstructed from a guessed prefix.
        const auto complete_row = [&](int x, int y, int field_right,
                std::string_view source) {
            if (x < 0 || y < 0 || y >= gps_->dimy || field_right > gps_->dimx ||
                    x + static_cast<int>(source.size()) > field_right)
                return false;
            const auto band = std::string_view(dfhack_context_rows[y]).substr(
                x, field_right - x);
            const auto raw = read_row(y);
            return band.starts_with(source) &&
                trim_view(band.substr(source.size())).empty() &&
                raw.compare(x, source.size(), source) == 0 &&
                trim_view(std::string_view(raw).substr(x + source.size(),
                    field_right - x - source.size())).empty();
        };
        if (!complete_row(left, top, body_right, modifier_row) ||
                !complete_row(left, top + 2, body_right, mouse_row) ||
                !complete_row(stream_x, stream_y, panel_right, stream_caption) ||
                !complete_row(left, footer_y, body_right, footer) ||
                read_row(title_y).compare(at, title.size(), title) != 0)
            return false;

        // FRAME_INTERIOR has single-line borders and no DFHack signature.
        // Prove its actual rectangle, rather than recognizing a log header
        // at an arbitrary offset in another Window.
        const auto panel_byte = [&](int x, int y, unsigned char expected) {
            if (static_cast<unsigned char>(dfhack_context_rows[y][x]) != expected)
                return false;
            const auto raw = read_row(y);
            return static_cast<unsigned char>(raw[x]) == expected;
        };
        if (!panel_byte(panel_left, panel_top, 0xda) ||
                !panel_byte(panel_right, panel_top, 0xbf) ||
                !panel_byte(panel_left, panel_bottom, 0xc0) ||
                !panel_byte(panel_right, panel_bottom, 0xd9))
            return false;
        for (int x = panel_left + 1; x < panel_right; ++x)
            if (!panel_byte(x, panel_top, 0xc4) ||
                    !panel_byte(x, panel_bottom, 0xc4)) return false;
        for (int y = panel_top + 1; y < panel_bottom; ++y)
            if (!panel_byte(panel_left, y, 0xb3) ||
                    !panel_byte(panel_right, y, 0xb3)) return false;

        for (const auto source : {monitor_title, modifier_caption, mouse_caption,
                stream_caption, close_caption}) {
            const auto target = exact_literal_translation(
                "DFHack output: " + std::string(source));
            if (!target || !contains_cjk_utf8(*target)) return false;
        }

        // Own the whole proven Window so generic rules cannot translate
        // keys, _STRING values or the stream. Caption rectangles stop before
        // the next native token; no key glyph or dynamic pen is repainted.
        dfhack_auxiliary_regions.push_back(*frame);
        auxiliary_literal(at, title_y, title, title_end, true, "DFHack output: ");
        auxiliary_literal(left, top, modifier_caption,
            left + static_cast<int>(modifier_caption.size()), false, "DFHack output: ");
        auxiliary_literal(left, top + 2, mouse_caption,
            left + static_cast<int>(mouse_caption.size()), false, "DFHack output: ");
        auxiliary_literal(stream_x, stream_y, stream_caption,
            panel_right, false, "DFHack output: ");
        auxiliary_literal(action_x, footer_y, close_caption,
            body_right, false, "DFHack output: ");
        return true;
    };
    if (input_monitor_window()) continue;
}
