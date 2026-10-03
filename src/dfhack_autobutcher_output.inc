// gui/autobutcher.lua paints a fixed-column List inside FRAME_INTERIOR.
// Captions have proved widget roles; table quantities, keys and sort arrows
// remain native. The only dynamic grammar field is the complete race name.
{
    const auto butcher_field = [&](int x, int y, std::string_view source,
            std::string_view target, int right) {
        if (source.empty() || !contains_cjk_utf8(target) || x < 0 || y < 0 ||
                y >= gps_->dimy || right > gps_->dimx || right <= x ||
                x + static_cast<int>(source.size()) > right ||
                read_row(y).compare(x, source.size(), source) != 0) return;
        std::vector<Match> rows{{x, y, static_cast<int>(source.size()),
            kDfhackHotkeysHintRule, {}, std::string(source)}};
        rows.front().layout_native_clip = auxiliary_pixels({x, y, right - x, 1});
        append_bounded_paragraph(std::move(rows), target, screen_rows,
            dfhack_auxiliary_matches, only_y, right, right, {}, false, x);
    };
    const auto butcher_role = [&](int x, int y, std::string_view source,
            int right, std::string_view role) {
        gui_literal(x, y, source, right, "Autobutcher " + std::string(role));
    };
    const auto butcher_find = [&](int y, int left, int right,
            std::string_view source, std::string_view role) {
        const size_t at = dfhack_context_rows[y].find(source, left);
        if (at != std::string::npos && at + source.size() <= static_cast<size_t>(right))
            butcher_role(static_cast<int>(at), y, source, right, role);
    };
    const auto butcher_panel = [&](int left, int top, int right, int bottom) {
        if (left < 0 || top < 0 || right >= gps_->dimx || bottom >= gps_->dimy ||
                right - left < 3 || bottom - top < 5) return false;
        const auto ch = [&](int x, int y) {
            return static_cast<unsigned char>(dfhack_context_rows[y][x]);
        };
        if (ch(left, top) != 218 || ch(right, top) != 191 ||
                ch(left, bottom) != 192 || ch(right, bottom) != 217) return false;
        for (int x = left + 1; x < right; ++x)
            if (ch(x, top) != 196 || ch(x, bottom) != 196) return false;
        for (int y = top + 1; y < bottom; ++y)
            if (ch(left, y) != 179 || ch(right, y) != 179) return false;
        return true;
    };
    const auto butcher_toggle = [&](int y, int left, int right, std::string_view caption) {
        const size_t at = dfhack_context_rows[y].find(caption, left);
        if (at == std::string::npos || at + caption.size() + 1 >= static_cast<size_t>(right))
            return;
        const int option_x = static_cast<int>(at + caption.size()) + 1;
        butcher_role(static_cast<int>(at), y, caption, option_x - 1, "caption");
        const auto option = trim_view(std::string_view(dfhack_context_rows[y]).substr(
            option_x, right - option_x));
        if (option == "On" || option == "Off" || option == "Enabled" || option == "Disabled")
            butcher_role(option_x, y, option, right, "state");
    };
    constexpr std::string_view title = "Autobutcher";
    constexpr std::string_view legend =
        "Columns show butcherable stock (+ protected stock, if any) / target:";
    constexpr std::string_view instructions =
        "Double click on a value to edit/toggle or use the hotkeys listed below.";
    for (int title_y = 0; title_y < gps_->dimy; ++title_y) {
        const size_t at = dfhack_context_rows[title_y].find(title);
        if (at == std::string::npos) continue;
        // Panel's implicit resize_min is the original frame size (97x31).
        const auto frame = native_dfhack_frame(dfhack_context_rows, title_y,
            static_cast<int>(at), static_cast<int>(title.size()), 97, 31);
        if (!frame) continue;
        const int edge = frame->x + frame->w - 1, bottom = frame->y + frame->h - 1;
        const int left = frame->x + 2, right = edge - 1, top = title_y + 2;
        const int panel_left = left, panel_right = edge - 2;
        const int panel_top = top + 2, panel_bottom = bottom - 10;
        const int table_left = panel_left + 1, table_right = panel_right;
        const int header_y = panel_top + 1, footer_y = bottom - 8;
        if (dfhack_context_rows[bottom].compare(edge - 7, 6, "DFHack") != 0 ||
                !butcher_panel(panel_left, panel_top, panel_right, panel_bottom) ||
                dfhack_context_rows[header_y].compare(table_left, 5, "Total") != 0 ||
                dfhack_context_rows[header_y].compare(table_left + 8, 4, "Race") != 0 ||
                dfhack_context_rows[header_y + 1].compare(table_left, 5, "stock") != 0 ||
                dfhack_context_rows[footer_y].compare(left, legend.size(), legend) != 0 ||
                dfhack_context_rows[footer_y + 1].compare(left, instructions.size(), instructions) != 0)
            continue;
        dfhack_auxiliary_regions.push_back(*frame);
        gui_literal(static_cast<int>(at), title_y, title,
            static_cast<int>(at + title.size()), "Title", true);
        butcher_find(top, left, left + 31, "Sort by:", "caption");
        const size_t sort_at = dfhack_context_rows[top].find("Sort by:", left);
        if (sort_at != std::string::npos) {
            const int option_x = static_cast<int>(sort_at + 8) + 1;
            const auto band = trim_view(std::string_view(dfhack_context_rows[top]).substr(
                option_x, left + 31 - option_x));
            if (!band.empty() && (static_cast<unsigned char>(band.back()) == 30 ||
                    static_cast<unsigned char>(band.back()) == 31)) {
                const auto option = band.substr(0, band.size() - 1);
                constexpr std::array<std::string_view, 9> sorts{
                    "Total stock", "Race", "female kids", "male kids", "make kids",
                    "Female adults", "Male adults", "Watch?", "Butchering ordered"};
                if (std::find(sorts.begin(), sorts.end(), option) != sorts.end())
                    butcher_role(option_x, top, option,
                        option_x + static_cast<int>(option.size()), "sort");
            }
        }
        butcher_toggle(top, left + 35, left + 84, "Show only rows with non-zero targets");
        for (const auto &[offset, caption] : {
                std::pair{0, std::string_view("Total")}, std::pair{8, std::string_view("Race")},
                std::pair{37, std::string_view("female")}, std::pair{47, std::string_view("male")},
                std::pair{55, std::string_view("Female")}, std::pair{65, std::string_view("Male")},
                std::pair{72, std::string_view("Watch?")}, std::pair{81, std::string_view("Butchering")}})
            butcher_role(table_left + offset, header_y, caption,
                table_left + offset + static_cast<int>(caption.size()), "header");
        for (const auto &[offset, caption] : {
                std::pair{0, std::string_view("stock")}, std::pair{38, std::string_view("kids")},
                std::pair{47, std::string_view("kids")}, std::pair{55, std::string_view("adults")},
                std::pair{64, std::string_view("adults")}, std::pair{82, std::string_view("ordered")}})
            butcher_role(table_left + offset, header_y + 1, caption,
                table_left + offset + static_cast<int>(caption.size()), "header");
        constexpr std::string_view disabled = "Enable autobutcher to change settings";
        const int list_y = header_y + 3;
        if (dfhack_context_rows[list_y].compare(table_left + 8, disabled.size(), disabled) == 0)
            butcher_role(table_left + 8, list_y, disabled, table_right, "caption");
        else for (int y = list_y; y < panel_bottom; ++y) {
            const auto band = std::string_view(dfhack_context_rows[y]).substr(
                table_left, table_right - table_left);
            // make_row_text fixes these four eight-cell count/target fields.
            // Prove their numeric spelling before reading a dynamic caption;
            // an overlapping dialog cannot turn arbitrary prose into a race.
            bool quantities = true;
            for (int offset : {34, 43, 52, 61}) {
                const auto field = band.substr(offset, 8);
                const auto target = trim_view(field.substr(6));
                if (target.empty() || !std::all_of(field.begin(), field.end(), [](unsigned char ch) {
                        return ch == ' ' || ch == '+' || ch == '/' || (ch >= '0' && ch <= '9'); }))
                    quantities = false;
            }
            if (!quantities) continue;
            const auto race_field = band.substr(8, 25);
            const auto race = trim_view(race_field);
            if (!race.empty() && race_field.back() == ' ') {
                if (race == "!! ALL RACES PLUS NEW" || race == "!! ONLY NEW RACES")
                    butcher_role(table_left + 8, y, race, table_left + 33, "row");
                else if (const auto target = translate_dfhack_caption("creature", race))
                    butcher_field(table_left + 8, y, race, *target, table_left + 33);
            }
            const auto state_field = band.substr(70, 7);
            const auto state = trim_view(state_field);
            if (state == "yes" || state == "no") {
                const int state_x = table_left + 70 + static_cast<int>(state.data() - state_field.data());
                butcher_role(state_x, y, state, table_left + 77, "state");
            }
        }
        butcher_role(left, footer_y, legend, right, "caption");
        butcher_role(left, footer_y + 1, instructions, right, "caption");
        for (const auto &[row, column, allocation, caption] : {
                std::tuple{3, 0, 17, std::string_view("f kids")},
                std::tuple{4, 0, 17, std::string_view("m kids")},
                std::tuple{3, 17, 36, std::string_view("F adults")},
                std::tuple{4, 17, 36, std::string_view("M adults")},
                std::tuple{5, 0, 17, std::string_view("Butcher race")},
                std::tuple{5, 17, 36, std::string_view("Unbutcher race")},
                std::tuple{3, 36, 54, std::string_view("Toggle watch")},
                std::tuple{4, 36, 54, std::string_view("Delete row")},
                std::tuple{3, 54, right - left, std::string_view("Set row targets to 0")},
                std::tuple{4, 54, right - left, std::string_view("Set row targets to N")},
                std::tuple{5, 36, 54, std::string_view("Butcher all")},
                std::tuple{5, 54, right - left, std::string_view("Unbutcher all")}})
            butcher_find(footer_y + row, left + column, left + allocation, caption, "caption");
        butcher_toggle(footer_y + 6, left, left + 26, "Autobutcher is");
        butcher_toggle(footer_y + 6, left + 36, left + 60, "Autowatch is");
    }

    // InputBox titles contain race captions, while their edit row is opaque.
    // The common reader above already owns the exact role-scoped prompts;
    // supplement only the title and the variable-input error's fixed tokens.
    for (int title_y = 0; title_y < gps_->dimy; ++title_y) {
        const auto &row = dfhack_context_rows[title_y];
        for (const std::string_view prefix : {"Race: ", "Set whole row for ", "Invalid Number"}) {
            const size_t at = row.find(prefix);
            if (at == std::string::npos) continue;
            size_t end = at + prefix.size();
            while (end < row.size()) {
                const auto ch = static_cast<unsigned char>(row[end]);
                if (ch == 191 || ch == 187 || ch == 196 || ch == 205) break;
                ++end;
            }
            const auto full_title = trim_view(std::string_view(row).substr(at, end - at));
            const auto frame = native_dfhack_frame(dfhack_context_rows, title_y,
                static_cast<int>(at), static_cast<int>(full_title.size()), 23, 7);
            if (!frame) continue;
            const int edge = frame->x + frame->w - 1, bottom = frame->y + frame->h - 1;
            const int left = frame->x + 2, right = edge - 1, top = title_y + 2;
            if (dfhack_context_rows[bottom].compare(edge - 7, 6, "DFHack") != 0) continue;
            if (prefix != "Invalid Number") {
                const auto prompt = gui_prompt("Input prompt", left, top, edge, bottom - 4);
                if (!prompt) continue;
                std::string source;
                for (const auto &line : prompt->rows) {
                    if (!source.empty()) source += ' ';
                    source += line.source;
                }
                constexpr std::array<std::string_view, 5> input_prompts{
                    "Enter desired target for female kids:", "Enter desired target for male kids:",
                    "Enter desired target for female adults:", "Enter desired target for male adults:",
                    "Enter desired value for all targets:"};
                if (std::find(input_prompts.begin(), input_prompts.end(), source) == input_prompts.end() ||
                        full_title.size() <= prefix.size()) continue;
                const auto race = full_title.substr(prefix.size());
                const auto label = exact_literal_translation("DFHack GUI Autobutcher title prefix: " +
                    std::string(trim_view(prefix)));
                if (!label) continue;
                auto target = exact_literal_translation("DFHack GUI Autobutcher race: " + std::string(race));
                if (!target) target = translate_dfhack_caption("creature", race);
                dfhack_auxiliary_regions.push_back(*frame);
                butcher_field(static_cast<int>(at), title_y, full_title,
                    *label + (target ? *target : native_text_to_utf8(race)),
                    static_cast<int>(at + full_title.size()));
            } else {
                constexpr std::string_view error = "This is not a number:";
                constexpr std::string_view zero = "(for zero enter a 0)";
                if (full_title != prefix || dfhack_context_rows[top].compare(left,
                        error.size(), error) != 0 || top + 1 >= bottom - 2 ||
                        trim_view(std::string_view(dfhack_context_rows[top + 1]).substr(
                            left, right - left)) != zero) continue;
                // Label inserts exactly one newline before zero's advice.
                // Keep the entered invalid text after the fixed prefix intact.
                dfhack_auxiliary_regions.push_back(*frame);
                gui_literal(static_cast<int>(at), title_y, full_title,
                    static_cast<int>(at + full_title.size()), "Title", true);
                butcher_role(left, top, error, left + static_cast<int>(error.size()), "error");
                butcher_role(left, top + 1, zero, right, "error");
            }
        }
    }
}
