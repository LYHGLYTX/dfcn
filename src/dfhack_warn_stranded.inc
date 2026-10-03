// warn-stranded.lua:213-267 uses a Window, a b=3 WrappedLabel, and
// two columns of HotkeyLabels. The list above them remains native data.
{
    const auto warn_stranded_window = [&]() -> bool {
        constexpr std::string_view warning_title = "Stranded citizen warning";
        constexpr std::string_view instructions =
            "Select to zoom to unit. Double click to toggle unit ignore. Shift double click to toggle a group.";
        if (title != warning_title) return false;
        const int body_right = right - 1;
        const int body_width = body_right - left;
        const int second_column = left + 23;
        if (body_width <= 26 || second_column >= body_right ||
                footer_y - 6 < top ||
                read_row(title_y).compare(at, title.size(), title) != 0)
            return false;

        struct Control {
            int x, y, right;
            std::string_view caption;
        };
        std::array<Control, 4> controls{{
            {left, footer_y - 1, second_column, "Toggle ignore"},
            {second_column, footer_y - 1, body_right, "Toggle group"},
            {left, footer_y, second_column, "Ignore all"},
            {second_column, footer_y, body_right, "Clear all ignored"},
        }};
        for (auto &control : controls) {
            const auto band = std::string_view(dfhack_context_rows[control.y]).substr(
                control.x, control.right - control.x);
            const auto separator = band.find(": ");
            if (separator == std::string_view::npos || separator == 0) return false;
            auto key = std::string(band.substr(0, separator));
            std::replace(key.begin(), key.end(), '-', '+');
            const size_t caption_at = separator + 2;
            if (!is_keybinding_code(key) ||
                    caption_at + control.caption.size() > band.size() ||
                    band.substr(caption_at, control.caption.size()) != control.caption ||
                    !trim_view(band.substr(caption_at + control.caption.size())).empty())
                return false;
            const auto raw = read_row(control.y);
            if (raw.compare(control.x, band.size(), band) != 0) return false;
            control.x += static_cast<int>(caption_at);
        }

        // WrappedLabel gets this Window's full body width, then reserves
        // three scrollbar columns. Its auto height and b=3 anchor the final
        // hard row three rows above the b=0 controls, at every native resize.
        const int wrap_width = body_width - 3;
        const auto expected = dfhack_item_native_wrap(instructions, wrap_width);
        if (expected.empty()) return false;
        const int instruction_last = footer_y - 3;
        const int instruction_top = instruction_last - static_cast<int>(expected.size()) + 1;
        const int list_last = footer_y - 6;
        if (instruction_top <= list_last) return false;
        std::vector<Match> rows;
        rows.reserve(expected.size());
        for (size_t index = 0; index < expected.size(); ++index) {
            const int y = instruction_top + static_cast<int>(index);
            const auto native_line = std::string_view(expected[index]);
            const auto ink = trim_view(native_line);
            const auto band = std::string_view(dfhack_context_rows[y]).substr(left, body_width);
            const auto visible = trim_view(band);
            const size_t indent = static_cast<size_t>(ink.data() - native_line.data());
            if (ink.empty() || native_line.size() > static_cast<size_t>(wrap_width) ||
                    visible != ink ||
                    static_cast<size_t>(visible.data() - band.data()) != indent)
                return false;
            const int x = left + static_cast<int>(indent);
            const auto raw = read_row(y);
            if (raw.compare(x, ink.size(), ink) != 0 ||
                    trim_view(std::string_view(raw).substr(left, body_width)) != ink)
                return false;
            rows.push_back({x, y, static_cast<int>(ink.size()), kDfhackHotkeysHintRule,
                {}, std::string(ink)});
        }
        const auto blank_row = [&](int y) {
            const auto raw = read_row(y);
            return trim_view(std::string_view(dfhack_context_rows[y]).substr(
                    left, body_width)).empty() &&
                trim_view(std::string_view(raw).substr(left, body_width)).empty();
        };
        for (int y = list_last + 1; y < instruction_top; ++y)
            if (!blank_row(y)) return false;
        if (!blank_row(footer_y - 2)) return false;

        const auto body_target = exact_literal_translation(
            "DFHack output: " + std::string(instructions));
        if (!body_target || !contains_cjk_utf8(*body_target)) return false;
        for (const auto source : {warning_title, std::string_view("Toggle ignore"),
                std::string_view("Toggle group"), std::string_view("Ignore all"),
                std::string_view("Clear all ignored")}) {
            const auto target = exact_literal_translation("DFHack output: " + std::string(source));
            if (!target || !contains_cjk_utf8(*target)) return false;
        }

        // Do not pass citizen names, pronouns, [IGNORED], IDs or group
        // designations through generic output/body or profession readers.
        dfhack_auxiliary_regions.push_back(*frame);
        auxiliary_literal(at, title_y, title, title_end, true, "DFHack output: ");
        append_gui_prompt(GuiPrompt{std::move(rows), *body_target}, left, left + wrap_width);
        for (const auto &control : controls)
            auxiliary_literal(control.x, control.y, control.caption,
                control.right, false, "DFHack output: ");
        return true;
    };
    if (warn_stranded_window()) continue;
}
