// gui/teleport autoarranges its selection prompt above filters and a unit list.
// Keep hotkeys, toggle colors, counts, and generated unit identities typed.
{
    constexpr std::string_view teleport_scope = "DFHack GUI Teleport: ";
    constexpr std::string_view introduction = "Draw boxes around units to select";
    constexpr std::string_view count_prefix =
        "Draw boxes around units to select, or double click on a tile to teleport ";
    constexpr std::string_view count_suffix = " selected unit(s).";
    constexpr std::array<std::string_view, 6> qualifiers{
        " (citizen)", " (resident)", " (hostile)", " (merchant)", " (wild)", " (friendly)"};
    for (int title_y = 0; title_y < gps_->dimy; ++title_y) {
        constexpr std::string_view title = "Teleport";
        const size_t title_at = dfhack_context_rows[title_y].find(title);
        if (title_at == std::string::npos) continue;
        const auto frame = native_dfhack_frame(dfhack_context_rows, title_y,
            static_cast<int>(title_at), static_cast<int>(title.size()), 26, 20);
        if (!frame) continue;
        const int edge = frame->x + frame->w - 1, bottom = frame->y + frame->h - 1;
        const int left = frame->x + 2, right = edge - 1, top = frame->y + 2;
        if (right - left <= 3 || top >= bottom - 2 ||
                dfhack_context_rows[bottom].compare(edge - 7, 6, "DFHack") != 0)
            continue;
        std::vector<Match> help_rows;
        std::string help_source;
        for (int y = top; y <= bottom - 2; ++y) {
            const auto band = std::string_view(dfhack_context_rows[y]).substr(
                left, right - left - 3);
            const auto text = trim_view(band);
            if (text.empty()) break;
            const int x = left + static_cast<int>(text.data() - band.data());
            if (read_row(y).compare(x, text.size(), text) != 0) break;
            help_rows.push_back({x, y, static_cast<int>(text.size()),
                kDfhackHotkeysHintRule, {}, std::string(text)});
            if (!help_source.empty()) help_source += ' ';
            help_source += text;
        }
        if (help_rows.empty() || !(help_source == introduction ||
                help_source.starts_with(count_prefix))) continue;
        dfhack_auxiliary_regions.push_back(*frame);
        gui_literal(static_cast<int>(title_at), title_y, title,
            static_cast<int>(title_at + title.size()), "Title", true);
        auto help_target = exact_literal_translation(std::string(teleport_scope) + help_source);
        if (!help_target && help_source.starts_with(count_prefix) &&
                help_source.ends_with(count_suffix) &&
                help_source.size() > count_prefix.size() + count_suffix.size()) {
            const auto count = std::string_view(help_source).substr(count_prefix.size(),
                help_source.size() - count_prefix.size() - count_suffix.size());
            if (std::all_of(count.begin(), count.end(), [](unsigned char ch) {
                    return ch >= '0' && ch <= '9';
                })) {
                help_target = exact_literal_translation(std::string(teleport_scope) +
                    std::string(count_prefix) + "{d}" + std::string(count_suffix));
                if (help_target) {
                    const size_t placeholder = help_target->find("{d}");
                    if (placeholder == std::string::npos) help_target.reset();
                    else help_target->replace(placeholder, 3, count);
                }
            }
        }
        if (help_target) append_gui_prompt(GuiPrompt{help_rows, *help_target}, left, right);

        struct TeleportControl { std::string_view caption; bool toggle; };
        constexpr std::array<TeleportControl, 6> controls{{
            {"Teleport units to mouse cursor", false},
            {"Include citizen units", true},
            {"Include friendly units", true},
            {"Include hostile units", true},
            {"Deselect unit", false},
            {"Clear list", false},
        }};
        // Filters have authored trailing spaces before option_gap. Trim only
        // the separator, preserving each key and the On/Off token's own pen.
        for (int y = help_rows.back().y + 2; y <= bottom - 3; ++y) {
            const auto &row = dfhack_context_rows[y];
            for (size_t separator = row.find(": ", left);
                    separator != std::string::npos && separator + 2 < static_cast<size_t>(right);
                    separator = row.find(": ", separator + 2)) {
                size_t caption_at = separator + 2;
                while (caption_at < static_cast<size_t>(right) && row[caption_at] == ' ')
                    ++caption_at;
                const auto tail = std::string_view(row).substr(caption_at, right - caption_at);
                for (const auto &control : controls) {
                    if (!tail.starts_with(control.caption)) continue;
                    const size_t value_at = caption_at + control.caption.size();
                    if (value_at < static_cast<size_t>(right) && row[value_at] != ' ') continue;
                    if (!control.toggle) {
                        // The second lower hotkey begins at panel-left + 26.
                        const int allocation = control.caption == "Deselect unit"
                            ? std::min(right, left + 27) : right;
                        auxiliary_literal(static_cast<int>(caption_at), y, control.caption,
                            allocation, false, teleport_scope);
                        break;
                    }
                    size_t option_at = value_at;
                    while (option_at < static_cast<size_t>(right) && row[option_at] == ' ')
                        ++option_at;
                    if (option_at >= static_cast<size_t>(std::min(right, left + 29))) continue;
                    const auto option = trim_view(std::string_view(row).substr(option_at,
                        std::min(right, left + 29) - static_cast<int>(option_at)));
                    if (option != "On" && option != "Off") continue;
                    auxiliary_literal(static_cast<int>(caption_at), y, control.caption,
                        static_cast<int>(option_at) - 1, false, teleport_scope);
                    auxiliary_literal(static_cast<int>(option_at), y, option,
                        std::min(right, left + 29), false, teleport_scope);
                    break;
                }
            }
        }

        // The lower Panel is repositioned by the parent's autoarrange. It
        // starts after H intro rows, action+gap, three filters, and a gap.
        const int header_y = top + static_cast<int>(help_rows.size()) + 8;
        const int panel_left = left + 1, panel_right = right - 1;
        if (header_y <= bottom - 3 && panel_right > panel_left) {
            for (const std::string_view source : {"No selected units", "Selected units:"})
                if (dfhack_context_rows[header_y].compare(panel_left, source.size(), source) == 0)
                    auxiliary_literal(panel_left, header_y, source, panel_right, false, teleport_scope);

            const auto emit_identity = [&](int y, std::string_view source,
                    const std::optional<std::string> &target, int x, int allocation_right) {
                if (!target || !contains_cjk_utf8(*target) ||
                        read_row(y).compare(x, source.size(), source) != 0 ||
                        (only_y >= 0 && only_y != y)) return;
                Match match{x, y, static_cast<int>(source.size()), kDfhackHotkeysHintRule,
                    *target, std::string(source)};
                match.layout_x = x;
                match.layout_length = allocation_right - x;
                match.layout_clip_right = allocation_right;
                match.layout_left = true;
                match.layout_font_pixels = unified_font_pixels();
                match.layout_lock_font_pixels = true;
                dfhack_auxiliary_matches.push_back(std::move(match));
            };
            const auto readable_name = [&](std::string_view source) -> std::optional<std::string> {
                size_t open = source.find('"');
                // A player's `nickname' may contain literal double quotes.
                const size_t nickname = source.find('`');
                const size_t nickname_end = nickname == std::string_view::npos
                    ? std::string_view::npos : source.rfind('\'');
                if (open != std::string_view::npos && nickname < open && nickname_end > open &&
                        nickname_end != std::string_view::npos)
                    open = source.find('"', nickname_end + 1);
                if (open == std::string_view::npos) return translate_unit_identity(source, true);
                const size_t close = source.find('"', open + 1);
                if (close == std::string_view::npos) return std::nullopt;
                const auto native = trim_view(source.substr(0, open));
                const auto gloss = trim_view(source.substr(open + 1, close - open - 1));
                auto role = trim_view(source.substr(close + 1));
                if (native.empty() || gloss.empty() || role.empty() || role.front() != ',')
                    return std::nullopt;
                role = trim_view(role.substr(1));
                if (role.empty()) return std::nullopt;
                std::optional<std::string> identity;
                if (native.find('`') == std::string_view::npos && !contains_cjk_utf8(native))
                    identity = translate_procedural_fragment(std::string(native) + ", \"" +
                        std::string(gloss) + "\"");
                else {
                    const auto person = translate_unit_identity(native, true);
                    const auto meaning = translate_legends_name(gloss, false);
                    if (person && meaning) identity = *person + "，“" + *meaning + "”";
                }
                const auto profession = translate_unit_profession(role, true);
                return identity && profession
                    ? std::optional<std::string>(*identity + "，" + *profession) : std::nullopt;
            };
            const int list_right = panel_right - 2;
            for (int y = header_y + 2; y <= bottom - 7 && list_right > panel_left; ++y) {
                const auto band = std::string_view(dfhack_context_rows[y]).substr(
                    panel_left, list_right - panel_left);
                const auto source = trim_view(band);
                // List clips each identity rather than wrapping it. A blank
                // before the scrollbar establishes a complete visible row.
                if (source.empty() || band.back() != ' ') continue;
                auto name = source;
                std::optional<std::string> qualifier;
                for (const auto suffix : qualifiers)
                    if (name.ends_with(suffix)) {
                        qualifier = exact_literal_translation(std::string(teleport_scope) +
                            std::string(trim_view(suffix)));
                        name = trim_view(name.substr(0, name.size() - suffix.size()));
                        break;
                    }
                auto target = readable_name(name);
                if (target && qualifier) *target += *qualifier;
                const int x = panel_left + static_cast<int>(source.data() - band.data());
                emit_identity(y, source, target, x, list_right);
            }
            // The Enter token is independent of both prose fields and keeps
            // its original green pen and position in the footer Label.
            constexpr std::string_view prefix = "Click name or hit ";
            constexpr std::string_view suffix = " to zoom to unit";
            const int footer_y = bottom - 3;
            if (dfhack_context_rows[footer_y].compare(panel_left, prefix.size(), prefix) == 0) {
                const int key_x = panel_left + static_cast<int>(prefix.size());
                if (dfhack_context_rows[footer_y].compare(key_x, 5, "Enter") == 0 &&
                        dfhack_context_rows[footer_y].compare(key_x + 5, suffix.size(), suffix) == 0) {
                    auxiliary_literal(panel_left, footer_y, trim_view(prefix), key_x - 1,
                        false, teleport_scope);
                    auxiliary_literal(key_x + 6, footer_y, trim_view(suffix), panel_right,
                        false, teleport_scope);
                }
            }
        }
        const size_t pause = dfhack_context_rows[bottom].find("PAUSE FORCED", frame->x + 1);
        if (pause != std::string::npos && pause + 12 < static_cast<size_t>(edge - 7))
            gui_literal(static_cast<int>(pause), bottom, "PAUSE FORCED",
                static_cast<int>(pause + 12), "Frame status");
    }
}
