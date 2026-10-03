// internal/notify/notifications.lua supplies two unwrapped Label paragraphs,
// separated by a blank row. The first contains a formatInt minute value.
{
    const auto save_reminder_dialog = [&]() -> bool {
        const bool fortress = title == "Save now?" && confirm_action &&
            action == "Yes, proceed";
        const bool adventure = title == "Save reminder" && viewer && action == "Ok";
        if ((!fortress && !adventure) || top + 2 > footer_y - 2) return false;
        const int body_right = right - 1;
        const auto paragraph_row = [&](int y) -> std::optional<Match> {
            const auto band = std::string_view(dfhack_context_rows[y]).substr(
                left, body_right - left);
            const auto text = trim_view(band);
            const int x = left + static_cast<int>(text.data() - band.data());
            if (text.empty() || read_row(y).compare(x, text.size(), text) != 0)
                return std::nullopt;
            return Match{x, y, static_cast<int>(text.size()), kDfhackHotkeysHintRule,
                {}, std::string(text)};
        };
        auto elapsed = paragraph_row(top);
        auto prompt = paragraph_row(top + 2);
        if (!elapsed || !prompt) return false;
        constexpr std::string_view prefix = "It has been ";
        constexpr std::string_view suffix = " minutes since your last save.";
        const std::string_view sentence = elapsed->source;
        if (!sentence.starts_with(prefix) || !sentence.ends_with(suffix) ||
                sentence.size() <= prefix.size() + suffix.size()) return false;
        const auto minutes = sentence.substr(prefix.size(),
            sentence.size() - prefix.size() - suffix.size());
        // formatInt can use locale grouping, SI suffixes or scientific
        // notation. The fixed sentence owns the value; do not reformat it.
        if (minutes.size() > 48 ||
                !std::any_of(minutes.begin(), minutes.end(), [](unsigned char ch) {
                    return ch >= '0' && ch <= '9';
                }) || std::any_of(minutes.begin(), minutes.end(), [](unsigned char ch) {
                    return ch < ' ';
                })) return false;
        const std::string_view expected_prompt = fortress
            ? "Would you like to save now? (Note: You can also close this reminder and save manually)"
            : "Close this popup to open the options menu and select \"Save and continue playing\"";
        if (prompt->source != expected_prompt) return false;
        for (int y = top; y <= footer_y - 1; ++y) {
            if (y == top || y == top + 2) continue;
            if (!trim_view(std::string_view(dfhack_context_rows[y]).substr(
                    left, body_right - left)).empty()) return false;
        }
        auto elapsed_target = exact_literal_translation(
            "DFHack GUI Confirmation prompt: It has been {d} minutes since your last save.");
        const auto prompt_target = exact_literal_translation(
            "DFHack GUI Confirmation prompt: " + prompt->source);
        if (!elapsed_target || !prompt_target ||
                !exact_literal_translation("DFHack GUI Title: " + std::string(title)))
            return false;
        const size_t value = elapsed_target->find("{d}");
        if (value == std::string::npos) return false;
        elapsed_target->replace(value, 3, native_text_to_utf8(minutes));

        dfhack_auxiliary_regions.push_back(*frame);
        gui_literal(at, title_y, title, title_end, "Title", true);
        append_gui_prompt(GuiPrompt{{*elapsed}, *elapsed_target}, left, body_right);
        append_gui_prompt(GuiPrompt{{*prompt}, *prompt_target}, left, body_right);
        gui_literal(action_x, footer_y, action, body_right,
            fortress ? "Confirmation action" : "Viewer action");
        gui_literal(frame->x + 3, bottom, "PAUSE FORCED", frame->x + 15,
            "Frame status");
        return true;
    };
    if (save_reminder_dialog()) continue;
}
