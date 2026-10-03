// gui/autodump autoarranges a count-bearing WrappedLabel and hotkey controls.
// Recover its complete prose before generic item words or name heuristics.
{
    constexpr std::string_view autodump_scope = "DFHack GUI Autodump: ";
    constexpr std::string_view introduction = "Double click on a tile to teleport ";
    struct AutodumpControl {
        std::string_view key, caption;
        bool toggle;
    };
    constexpr std::array<AutodumpControl, 9> controls{{
        {"Ctrl+d", "Dump to tile under mouse cursor", false},
        {"Ctrl+y", "Destroy items", false},
        {"Ctrl+z", "Undo destroy items", false},
        {"Ctrl+a", "Select all items on this z-level", false},
        {"Ctrl+c", "Clear selected items", false},
        {"Ctrl+f", "Include forbidden items", true},
        {"Ctrl+j", "Include items claimed by jobs", true},
        {"Ctrl+t", "Include items dropped by traders", true},
        {"Ctrl+m", "Forbid after teleporting", true},
    }};
    for (int title_y = 0; title_y < gps_->dimy; ++title_y) {
        constexpr std::string_view title = "Autodump";
        const size_t title_at = dfhack_context_rows[title_y].find(title);
        if (title_at == std::string::npos) continue;
        const auto frame = native_dfhack_frame(dfhack_context_rows, title_y,
            static_cast<int>(title_at), static_cast<int>(title.size()), 26, 10);
        if (!frame) continue;
        const int edge = frame->x + frame->w - 1, bottom = frame->y + frame->h - 1;
        const int left = frame->x + 2, right = edge - 1, top = frame->y + 2;
        const int wrap_right = right - 3;
        if (wrap_right <= left || top > bottom - 2 ||
                dfhack_context_rows[bottom].compare(edge - 7, 6, "DFHack") != 0)
            continue;
        std::vector<Match> help_rows;
        std::string help_source;
        for (int y = top; y <= bottom - 2; ++y) {
            const auto band = std::string_view(dfhack_context_rows[y]).substr(left, wrap_right - left);
            const auto text = trim_view(band);
            if (text.empty()) break;
            const int x = left + static_cast<int>(text.data() - band.data());
            if (read_row(y).compare(x, text.size(), text) != 0) break;
            help_rows.push_back({x, y, static_cast<int>(text.size()),
                kDfhackHotkeysHintRule, {}, std::string(text)});
            if (!help_source.empty()) help_source += ' ';
            help_source += text;
        }
        if (help_rows.empty() || !help_source.starts_with(introduction)) continue;
        dfhack_auxiliary_regions.push_back(*frame);
        gui_literal(static_cast<int>(title_at), title_y, title,
            static_cast<int>(title_at + title.size()), "Title", true);
        for (const auto suffix : {std::string_view(" highlighted item(s)."),
                std::string_view(" item(s) marked for dumping.")}) {
            if (!help_source.ends_with(suffix) ||
                    help_source.size() <= introduction.size() + suffix.size()) continue;
            const auto count = std::string_view(help_source).substr(introduction.size(),
                help_source.size() - introduction.size() - suffix.size());
            if (!std::all_of(count.begin(), count.end(), [](unsigned char ch) {
                    return ch >= '0' && ch <= '9';
                })) continue;
            auto target = exact_literal_translation(std::string(autodump_scope) +
                std::string(introduction) + "{d}" + std::string(suffix));
            if (!target) continue;
            const auto placeholder = target->find("{d}");
            if (placeholder == std::string::npos) continue;
            target->replace(placeholder, 3, count);
            append_gui_prompt(GuiPrompt{help_rows, *target}, left, right);
            break;
        }
        // Control placement follows the live WrappedLabel height. Match each
        // visible key/caption pair instead of requiring clipped lower controls.
        for (int y = help_rows.back().y + 2; y <= bottom - 2; ++y) {
            const auto band = std::string_view(dfhack_context_rows[y]).substr(left, right - left);
            const auto text = trim_view(band);
            const auto separator = text.find(": ");
            if (separator == std::string_view::npos) continue;
            std::string key(trim_view(text.substr(0, separator)));
            std::replace(key.begin(), key.end(), '-', '+');
            const auto caption = trim_view(text.substr(separator + 2));
            for (const auto &control : controls) {
                if (lower(key) != lower(std::string(control.key)) ||
                        !caption.starts_with(control.caption)) continue;
                const auto option = trim_view(caption.substr(control.caption.size()));
                if (control.toggle ? option != "On" && option != "Off" : !option.empty())
                    continue;
                const int x = left + static_cast<int>(caption.data() - band.data());
                int caption_right = right;
                if (control.toggle)
                    caption_right = left + static_cast<int>(option.data() - band.data()) - 1;
                auxiliary_literal(x, y, control.caption, caption_right, false, autodump_scope);
                if (control.toggle) {
                    const int option_x = left + static_cast<int>(option.data() - band.data());
                    auxiliary_literal(option_x, y, option, right, false, autodump_scope);
                }
                break;
            }
        }
        const auto pause = dfhack_context_rows[bottom].find("PAUSE FORCED", frame->x + 1);
        if (pause != std::string::npos && pause + 12 < static_cast<size_t>(edge - 7))
            gui_literal(static_cast<int>(pause), bottom, "PAUSE FORCED",
                static_cast<int>(pause + 12), "Frame status");
    }
}
