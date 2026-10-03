// Included in dfhack_auxiliary_help.inc's connected-frame loop after the
// footer roles are known. confirm.lua:142 supplies a 45-column prewrapped
// string to DialogWindow's plain Label, not a WrappedLabel.
{
    const auto fixed_confirm_dialog = [&]() -> bool {
        if (!confirm_action || action != "Yes, proceed") return false;
        using ConfirmPair = std::pair<std::string_view, std::string_view>;
        static constexpr std::array<ConfirmPair, 12> questions{{
            {"Cancel trade",
                "Are you sure you want leave this screen? Selected items will not be saved."},
            {"Mark all fortress goods",
                "Are you sure you want mark all fortress goods at the depot? Your current fortress goods selections will be lost."},
            {"Unmark all fortress goods",
                "Are you sure you want unmark all fortress goods at the depot? Your current fortress goods selections will be lost."},
            {"Mark all merchant goods",
                "Are you sure you want mark all merchant goods at the depot? Your current merchant goods selections will be lost."},
            {"Confirm trade",
                "Are you sure you want to trade the selected goods?"},
            {"Seize merchant goods",
                "Are you sure you want seize marked merchant goods? This will make the merchant unwilling to trade further and will damage relations with the merchant's civilization."},
            {"Offer fortress goods",
                "Are you sure you want to offer these goods? You will receive no payment."},
            {"Cancel trade agreement",
                "Are you sure you want to leave this screen? The trade agreement selection will not be saved until you hit the \"Done\" button at the bottom of the screen."},
            {"Delete hauling route",
                "Are you sure you want to delete this route?"},
            {"Delete hauling stop",
                "Are you sure you want to delete this stop?"},
            {"Remove depot",
                "Are you sure you want to remove this depot? Merchants are present and will lose profits."},
            {"Delete uniform",
                "Are you sure you want to delete this uniform?"},
        }};
        const auto question = std::find_if(questions.begin(), questions.end(),
            [&](const ConfirmPair &pair) { return pair.first == title; });
        if (question == questions.end()) return false;

        // showYesNoPrompt always receives on_settings from confirm.lua.
        // Its controls have b=2 in the same Window body whose accept has b=0.
        // The message Label has b=4, leaving a row between it and the controls.
        const int body_right = right - 1;
        const int controls_y = footer_y - 2;
        const int label_last = footer_y - 4;
        const int body_width = body_right - left;
        if (left < 0 || body_width <= 0 || body_right > gps_->dimx ||
                top < 0 || label_last < top || controls_y >= gps_->dimy)
            return false;
        const auto controls = std::string_view(dfhack_context_rows[controls_y]).substr(
            left, body_width);
        constexpr std::string_view settings = "Settings";
        if (!controls.ends_with(settings) || controls.size() < settings.size() + 3)
            return false;
        const size_t settings_at = controls.size() - settings.size();
        if (controls.substr(settings_at - 2, 2) != ": ") return false;
        size_t settings_key = settings_at - 2;
        while (settings_key > 0 && !native_prose_space(
                static_cast<unsigned char>(controls[settings_key - 1])))
            --settings_key;
        auto settings_binding = std::string(controls.substr(
            settings_key, settings_at - 2 - settings_key));
        std::replace(settings_binding.begin(), settings_binding.end(), '-', '+');
        if (!is_keybinding_code(settings_binding)) return false;
        const auto settings_source = controls.substr(settings_key);
        const auto controls_raw = read_row(controls_y);
        if (controls_raw.compare(left + static_cast<int>(settings_key),
                settings_source.size(), settings_source) != 0)
            return false;

        const auto body_target = exact_literal_translation(
            "DFHack output: " + std::string(question->second));
        const auto title_target = exact_literal_translation(
            "DFHack output: " + std::string(title));
        if (!body_target || !title_target || !contains_cjk_utf8(*body_target) ||
                !contains_cjk_utf8(*title_target) ||
                read_row(title_y).compare(at, title.size(), title) != 0 ||
                read_row(footer_y).compare(action_x, action.size(), action) != 0)
            return false;

        const auto expected = dfhack_item_native_wrap(question->second, 45);
        if (expected.empty() || expected.size() > static_cast<size_t>(label_last - top + 1))
            return false;
        std::vector<Match> rows;
        rows.reserve(expected.size());
        for (size_t index = 0; index < expected.size(); ++index) {
            const int y = top + static_cast<int>(index);
            const auto native_line = std::string_view(expected[index]);
            const auto ink = trim_view(native_line);
            if (ink.empty() || native_line.size() > static_cast<size_t>(body_width))
                return false;
            const auto band = std::string_view(dfhack_context_rows[y]).substr(left, body_width);
            const auto visible = trim_view(band);
            const size_t indent = static_cast<size_t>(ink.data() - native_line.data());
            if (visible != ink || static_cast<size_t>(visible.data() - band.data()) != indent)
                return false;
            const int x = left + static_cast<int>(indent);
            if (read_row(y).compare(x, ink.size(), ink) != 0) return false;
            rows.push_back({x, y, static_cast<int>(ink.size()), kDfhackHotkeysHintRule,
                {}, std::string(ink)});
        }
        const int question_last = top + static_cast<int>(expected.size()) - 1;
        if (question_last < label_last) {
            // get_ethics_message inserts a real blank before its second
            // paragraph. Do not consume that paragraph or a nonblank suffix.
            const auto boundary = std::string_view(dfhack_context_rows[question_last + 1]).substr(
                left, body_width);
            const auto boundary_raw = read_row(question_last + 1);
            if (!trim_view(boundary).empty() || !trim_view(std::string_view(boundary_raw).substr(
                    left, body_width)).empty())
                return false;
        }

        // The optional left-anchored pause control is a separate HotkeyLabel.
        // Never translate its key, or infer a partially overwritten control.
        constexpr std::string_view pause = "Pause this confirmation";
        std::optional<int> pause_at;
        size_t pause_size = 0;
        const size_t pause_separator = controls.find(": ");
        if (pause_separator != std::string_view::npos && pause_separator > 0) {
            auto pause_binding = std::string(controls.substr(0, pause_separator));
            std::replace(pause_binding.begin(), pause_binding.end(), '-', '+');
            const size_t caption_at = pause_separator + 2;
            const size_t caption_end = std::min(caption_at + pause.size(), settings_key);
            if (is_keybinding_code(pause_binding) &&
                    caption_end > caption_at &&
                    controls.substr(caption_at, caption_end - caption_at) ==
                        pause.substr(0, caption_end - caption_at) &&
                    controls_raw.compare(left, caption_end, controls.substr(0, caption_end)) == 0) {
                pause_at = left + static_cast<int>(caption_at);
                pause_size = caption_end - caption_at;
            }
        }

        // Own only this proven frame. The unknown ethics paragraph retains
        // native glyphs, while the translated question clips to its own rows.
        dfhack_auxiliary_regions.push_back(*frame);
        auxiliary_literal(at, title_y, title, title_end, true, "DFHack output: ");
        append_gui_prompt(GuiPrompt{std::move(rows), *body_target}, left, body_right);
        gui_literal(action_x, footer_y, action, body_right, "Confirmation action");
        gui_literal(left + static_cast<int>(settings_at), controls_y, settings,
            body_right, "Confirmation control");
        if (pause_at) {
            if (pause_size == pause.size())
                gui_literal(*pause_at, controls_y, pause,
                    left + static_cast<int>(settings_key), "Confirmation control");
            else if (const auto target = exact_literal_translation(
                    "DFHack GUI Confirmation control: " + std::string(pause));
                    target && contains_cjk_utf8(*target) && (only_y < 0 || only_y == controls_y)) {
                // The right-anchored Settings label can paint over the end
                // of the native left label. Its exact owned rectangle proves
                // the truncation; paint only inside the remaining left slot.
                Match match{*pause_at, controls_y, static_cast<int>(pause_size),
                    kDfhackHotkeysHintRule, *target, std::string(pause.substr(0, pause_size))};
                match.layout_x = *pause_at;
                match.layout_length = left + static_cast<int>(settings_key) - *pause_at;
                match.layout_left = true;
                match.layout_clip_right = left + static_cast<int>(settings_key);
                dfhack_auxiliary_matches.push_back(std::move(match));
            }
        }
        return true;
    };
    if (fixed_confirm_dialog()) continue;
}
