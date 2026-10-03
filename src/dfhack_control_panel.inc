// Included inside the auxiliary DFHack reader. Control-panel prose and
// settings belong to complete GUI fields, including every tab and subtab.
// Reserving the window excludes dictionary/name readers without suppressing
// any native glyph that lacks a complete translation.
{
    const auto covered_before_panel = dfhack_auxiliary_regions;
    const size_t panel_matches_begin = dfhack_auxiliary_matches.size();
    std::vector<SDL_Rect> control_frames;
    const auto panel_field = [&](int x, int y, std::string_view source,
            std::string_view target, int right, int height = 1) {
        if (source.empty() || !contains_cjk_utf8(target) || x < 0 || y < 0 ||
                y + height > gps_->dimy || right > gps_->dimx || right <= x ||
                x + static_cast<int>(source.size()) > right ||
                read_row(y).compare(x, source.size(), source) != 0) return;
        std::vector<Match> rows{{x, y, static_cast<int>(source.size()),
            kDfhackHotkeysHintRule, {}, std::string(source)}};
        rows.front().layout_native_clip = auxiliary_pixels({x, y, right - x, height});
        append_bounded_paragraph(std::move(rows), target, screen_rows,
            dfhack_auxiliary_matches, only_y, right, right, {}, false, x);
    };
    const auto panel_caption = [&](std::string_view source, int y, int left,
            int right, bool centered = false) {
        const size_t at = dfhack_context_rows[y].find(source, left);
        if (at != std::string::npos && at + source.size() <= static_cast<size_t>(right))
            auxiliary_literal(static_cast<int>(at), y, source,
                centered ? static_cast<int>(at + source.size()) : right, centered);
    };
    const auto panel_value = [&](std::string_view source) {
        const auto target = exact_literal_translation("DFHack help: " + std::string(source));
        return target ? *target : std::string(source);
    };
    const auto panel_template = [&](std::string_view source, std::string_view value)
            -> std::optional<std::string> {
        auto target = exact_literal_translation("DFHack help: " + std::string(source));
        if (!target) return std::nullopt;
        const size_t at = target->find("{d}");
        if (at == std::string::npos) return std::nullopt;
        target->replace(at, 3, panel_value(value));
        return target;
    };
    const auto preference_values = [&](int y, int left, int right) {
        const auto raw = read_row(y);
        const auto band = std::string_view(raw).substr(left, right - left);
        const auto text = trim_view(band);
        constexpr std::string_view prefix = "(default: ";
        constexpr std::string_view divider = ", current: ";
        if (!text.starts_with(prefix) || !text.ends_with(')')) return;
        const size_t split = text.find(divider, prefix.size());
        if (split == std::string_view::npos) return;
        const auto def = text.substr(prefix.size(), split - prefix.size());
        const auto cur = text.substr(split + divider.size(),
            text.size() - split - divider.size() - 1);
        const auto default_target = panel_template("default: {d}", def);
        const auto current_target = panel_template("current: {d}", cur);
        if (!default_target || !current_target) return;
        const int x = left + static_cast<int>(text.data() - band.data());
        // Keep the current token's original color (yellow when modified).
        // The two fields also keep their exact native allocation boundaries.
        const int current_x = x + static_cast<int>(split + 2);
        panel_field(x, y, text.substr(0, split + 2),
            "（" + *default_target + "，", current_x);
        panel_field(current_x, y, text.substr(split + 2),
            *current_target + "）", right);
    };
    constexpr std::array<std::string_view, 5> main_tabs{
        "Automation", "Bug Fixes", "Gameplay", "UI Overlays", "Preferences"};
    constexpr std::array<std::string_view, 3> empty_tools_lines{
        "Please load a fort to see the fort-mode tools. Alternately,",
        "please switch to the \"Autostart\" tab to configure which",
        "tools should be run or enabled on embark."};
    constexpr std::string_view title = "DFHack Control Panel";
    for (int title_y = 0; title_y < gps_->dimy; ++title_y) {
        const size_t at = dfhack_context_rows[title_y].find(title);
        if (at == std::string::npos) continue;
        const auto frame = native_dfhack_frame(dfhack_context_rows, title_y,
            static_cast<int>(at), static_cast<int>(title.size()), 26, 20);
        if (!frame) continue;
        const int right = frame->x + frame->w - 1;
        const int bottom = frame->y + frame->h - 1;
        const int left = frame->x + 2, body_right = right - 1;
        const int content_bottom = bottom - 10;
        if (dfhack_context_rows[bottom].compare(right - 7, 6, "DFHack") != 0 ||
                body_right - left < 20) continue;
        std::array<bool, main_tabs.size()> seen{};
        int tabs_bottom = -1;
        // TabBar wraps its two-row tabs as the window is resized. Read the
        // real labels instead of assuming the default window's top offsets.
        for (int y = title_y + 2; y < content_bottom; ++y) {
            bool found = false;
            for (size_t tab = 0; tab < main_tabs.size(); ++tab) {
                const size_t x = dfhack_context_rows[y].find(main_tabs[tab], left);
                if (x == std::string::npos ||
                        x + main_tabs[tab].size() > static_cast<size_t>(body_right)) continue;
                seen[tab] = true;
                found = true;
            }
            if (found) tabs_bottom = y;
            else if (std::all_of(seen.begin(), seen.end(), [](bool value) { return value; }))
                break;
        }
        if (tabs_bottom < 0 || !std::all_of(seen.begin(), seen.end(),
                [](bool value) { return value; })) continue;
        control_frames.push_back(*frame);
        dfhack_auxiliary_regions.push_back(*frame);
        auxiliary_literal(static_cast<int>(at), title_y, title,
            static_cast<int>(at + title.size()), true);
        for (int y = title_y + 2; y <= tabs_bottom; ++y)
            for (const auto tab : main_tabs) panel_caption(tab, y, left, body_right, true);
        const int content_top = tabs_bottom + 2;
        const int list_right = body_right - 3;
        const auto first_blank = [&](int start) {
            int y = start;
            for (; y < content_bottom; ++y) {
                const auto raw = read_row(y);
                if (trim_view(std::string_view(raw).substr(left, list_right - left)).empty()) break;
            }
            return y;
        };
        const int intro_end = first_blank(content_top);
        std::array<bool, 2> subtabs_seen{};
        std::vector<int> subtab_rows;
        int subtabs_bottom = -1;
        const auto tab_edge = [](unsigned char ch) {
            return ch == ' ' || ch == '-' || ch == '/' || ch == '\\' ||
                (ch >= 0xb3 && ch <= 0xda);
        };
        // The subtab bar can occupy several pairs of rows. Match unquoted
        // tab fields, rather than the same words inside explanatory prose.
        for (int y = intro_end; y < content_bottom; ++y) {
            const auto &raw = dfhack_context_rows[y];
            bool tab_row = false;
            size_t tab = 0;
            for (const auto label : {std::string_view("Enabled"), std::string_view("Autostart")}) {
                const size_t x = raw.find(label, left);
                const size_t end = x == std::string::npos ? x : x + label.size();
                if (x != std::string::npos && end <= static_cast<size_t>(body_right) &&
                        (x == static_cast<size_t>(left) || tab_edge(raw[x - 1])) &&
                        (end == static_cast<size_t>(body_right) || tab_edge(raw[end]))) {
                    subtabs_seen[tab] = true;
                    tab_row = true;
                }
                ++tab;
            }
            if (tab_row) {
                subtab_rows.push_back(y);
                subtabs_bottom = y;
            } else if (subtabs_seen[0] && subtabs_seen[1]) break;
        }
        const bool command_tab = subtabs_seen[0] && subtabs_seen[1];
        int blurb_top = subtabs_bottom + 1;
        if (command_tab)
            while (blurb_top < content_bottom) {
                const auto raw = read_row(blurb_top);
                if (!trim_view(std::string_view(raw).substr(left, list_right - left)).empty()) break;
                ++blurb_top;
            }
        const int blurb_end = command_tab ? first_blank(blurb_top) : intro_end;
        const int list_top = blurb_end + 3;
        std::string introduction;
        for (int y = content_top; y < intro_end; ++y) {
            const auto raw = read_row(y);
            if (!introduction.empty()) introduction += ' ';
            introduction += trim_view(std::string_view(raw).substr(left, list_right - left));
        }
        const bool preferences = normalize_dfhack_help(introduction) ==
            "These are the customizable DFHack system settings.";
        const int row_height = preferences ? 3 : 2;
        if (intro_end > content_top)
            auxiliary_body({left, content_top, list_right - left,
                intro_end - content_top}, list_right - left, false);
        if (command_tab) {
            for (const int y : subtab_rows)
                for (const auto subtab : {"Enabled", "Autostart"})
                    panel_caption(subtab, y, left, body_right, true);
            if (blurb_end > blurb_top)
                auxiliary_body({left, blurb_top, list_right - left, blurb_end - blurb_top},
                    list_right - left, false);
        }
        // This ordinary Label has three explicit NEWLINE fields, no search
        // row and no WrappedLabel scrollbar. Locate the complete actual
        // block independently of the hidden list's layout or blank rows.
        std::string empty_tools_source;
        for (const auto line : empty_tools_lines) {
            if (!empty_tools_source.empty()) empty_tools_source += ' ';
            empty_tools_source += line;
        }
        const auto empty_tools_target = exact_literal_translation(
            "DFHack help: " + empty_tools_source);
        for (int y = content_top; empty_tools_target && y + 3 <= content_bottom; ++y) {
            std::vector<Match> rows;
            bool complete = true;
            for (size_t line = 0; line < empty_tools_lines.size(); ++line) {
                const int row_y = y + static_cast<int>(line);
                const auto source = trim_view(empty_tools_lines[line].substr(0,
                    std::min(empty_tools_lines[line].size(), static_cast<size_t>(body_right - left))));
                const auto field = std::string_view(dfhack_context_rows[row_y]).substr(left, body_right - left);
                if (source.empty() || trim_view(field) != source) { complete = false; break; }
                rows.push_back({left, row_y, static_cast<int>(source.size()),
                    kDfhackHotkeysHintRule, {}, std::string(source)});
            }
            if (!complete) continue;
            // No list follows this empty-state Label. Its remaining main
            // panel space can accommodate the complete Chinese paragraph
            // when a narrow window needs more than the three native rows.
            rows.front().layout_native_clip = auxiliary_pixels(
                {left, y, body_right - left, content_bottom - y});
            append_bounded_paragraph(std::move(rows), *empty_tools_target, screen_rows,
                dfhack_auxiliary_matches, only_y, body_right, body_right, {}, false, left);
            break;
        }
        if (list_top < content_bottom)
            panel_caption("No matches", list_top, left, list_right);
        // Subtabs and short captions are separate text fields, never pieces
        // of either the introduction or the selected tool's description.
        for (int y = content_top; y < content_bottom; ++y) {
            const auto raw = read_row(y);
            // The list's three-cell icon is followed by its complete name.
            // Graphical paintTile clears icon characters, so use the real
            // FilteredList row allocation and exact label catalogue instead
            // of requiring ASCII brackets in a graphical icon's cells.
            // Commands/overlay ids stay executable in DFHack; only the
            // displayed label is replaced by its role-scoped Chinese name.
            if (y >= list_top && (y - list_top) % row_height == 0) {
                for (int offset : {12, 8, 4}) {
                    const int x = left + offset;
                    if (x >= list_right) continue;
                    const auto name = trim_view(std::string_view(raw).substr(x, list_right - x));
                    constexpr std::string_view global = " (global)";
                    const bool is_global = name.ends_with(global);
                    const auto command = is_global ? name.substr(0, name.size() - global.size()) : name;
                    const auto tool = exact_literal_translation(
                        "DFHack GUI Control tool: " + std::string(command));
                    if (tool) {
                        panel_field(x, y, name, *tool + (is_global ? "（全局）" : ""),
                            list_right, y + 1 < content_bottom ? 2 : 1);
                        break;
                    }
                    if (offset == 4) {
                        const auto pref = exact_literal_translation("DFHack help: " + std::string(name));
                        if (pref && contains_cjk_utf8(*pref))
                            panel_field(x, y, name, *pref, list_right);
                    }
                }
            }
            if (preferences && y > list_top && (y - list_top) % row_height == 1)
                preference_values(y, left, list_right);
        }
        // ConfigPanel's description box has its own frame and a two-row
        // scrolling WrappedLabel. Recover its complete text at its own width.
        auxiliary_body({left + 1, bottom - 8, body_right - left - 5, 2},
            body_right - left - 5, false);
        const int second_column = left + 26;
        for (int y = bottom - 4; y <= bottom - 2; ++y) {
            const int first_right = y == bottom - 2 ? std::min(second_column, body_right) : body_right;
            for (const auto action : {"Toggle enabled", "Toggle overlay", "Toggle/edit setting",
                    "Show full tool help or run custom command", "Show overlay help", "Restore defaults"})
                panel_caption(action, y, left, first_right);
            for (const auto action : {"Launch tool-specific config UI",
                    "Launch widget position adjustment UI"})
                panel_caption(action, y, std::min(second_column, body_right), body_right);
        }
    }
    // A foreground dialog owns its covered pixels before a parent panel's
    // reflow. Keep already collected common dialog translations intact.
    std::vector<SDL_Rect> panel_dialogs;
    for (int y = 0; y < gps_->dimy; ++y) {
        constexpr std::string_view edit_title = "Edit setting";
        const size_t at = dfhack_context_rows[y].find(edit_title);
        if (at == std::string::npos) continue;
        const auto dialog = native_dfhack_frame(dfhack_context_rows, y,
            static_cast<int>(at), static_cast<int>(edit_title.size()), 26, 7);
        if (!dialog || !std::any_of(control_frames.begin(), control_frames.end(),
                [&](const SDL_Rect &parent) { return dialog->x > parent.x && dialog->y > parent.y &&
                    dialog->x + dialog->w < parent.x + parent.w &&
                    dialog->y + dialog->h < parent.y + parent.h; })) continue;
        const int left = dialog->x + 2, right = dialog->x + dialog->w - 2;
        constexpr std::string_view edit_prompt = "Please set a new value for";
        if (dfhack_context_rows[y + 2].compare(left, edit_prompt.size(), edit_prompt) != 0 ||
                dfhack_context_rows[y + dialog->h - 3].find("Save", left) == std::string::npos)
            continue;
        panel_dialogs.push_back(*dialog);
    }
    const auto overlaps = [&](const Match &match, const SDL_Rect &box) {
        const SDL_Rect source{match.x, match.y, match.length, 1};
        if (SDL_HasIntersection(&source, &box)) return true;
        // Paragraphs can draw into blank rows beneath their source.
        if (match.layout_native_clip) {
            const auto pixels = auxiliary_pixels(box);
            return SDL_HasIntersection(&*match.layout_native_clip, &pixels) == SDL_TRUE;
        }
        return false;
    };
    dfhack_auxiliary_matches.erase(std::remove_if(
        dfhack_auxiliary_matches.begin() + panel_matches_begin, dfhack_auxiliary_matches.end(),
        [&](const Match &match) {
            for (const auto &box : covered_before_panel)
                if (box.h > 1 && overlaps(match, box)) return true;
            return std::any_of(panel_dialogs.begin(), panel_dialogs.end(),
                [&](const SDL_Rect &box) { return overlaps(match, box); });
        }), dfhack_auxiliary_matches.end());
    for (const auto &dialog : panel_dialogs) {
        const int left = dialog.x + 2, right = dialog.x + dialog.w - 2;
        const int top = dialog.y + 2, footer_y = dialog.y + dialog.h - 3;
        dfhack_auxiliary_regions.push_back(dialog);
        panel_caption("Edit setting", dialog.y, dialog.x + 1, right, true);
        panel_caption("Please set a new value for", top, left, right);
        const auto raw_name = read_row(top + 1);
        const auto name = trim_view(std::string_view(raw_name).substr(left + 4, right - left - 4));
        if (const auto target = exact_literal_translation("DFHack help: " + std::string(name)))
            panel_field(left + 4, top + 1, name, *target, right);
        const auto raw_spec = read_row(top + 2);
        const auto spec = trim_view(std::string_view(raw_spec).substr(left, right - left));
        if (spec.starts_with("(default: ") && spec.ends_with(')')) {
            std::string translated = "（";
            bool complete = true;
            const auto values = spec.substr(1, spec.size() - 2);
            for (size_t begin = 0; begin < values.size();) {
                const size_t end = values.find(", ", begin);
                const auto field = values.substr(begin,
                    end == std::string_view::npos ? values.size() - begin : end - begin);
                std::optional<std::string> target;
                for (const auto prefix : {"default: ", "at least ", "at most "})
                    if (field.starts_with(prefix)) target = panel_template(
                        std::string(prefix) + "{d}", field.substr(std::string_view(prefix).size()));
                if (!target) { complete = false; break; }
                if (begin) translated += "，";
                translated += *target;
                if (end == std::string_view::npos) break;
                begin = end + 2;
            }
            if (complete) panel_field(left, top + 2, spec, translated + "）", right);
        }
        // Numeric input remains native. The enum CycleHotkeyLabel contains
        // a key prefix and one complete registered number-format option.
        for (const auto option : {"None (ex: 1234567)", "English (ex: 1,234,567)",
                "System locale", "SI suffix (ex: 1.23M)", "Scientific (ex: 1.2e+06)"})
            panel_caption(option, top + 4, left, right);
        panel_caption("Save", footer_y, left, std::min(left + 15, right));
        panel_caption("Reset to default", footer_y, left + 15, right);
    }
}
