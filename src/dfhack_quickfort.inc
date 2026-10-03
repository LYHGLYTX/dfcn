// gui/quickfort owns authored controls around unmodified blueprint paths,
// section identifiers, filter input, and descriptions supplied by a blueprint.
{
    constexpr std::string_view quickfort_scope = "DFHack GUI Quickfort: ";
    const auto quickfort_catalog = g_dfhack_output_snapshot.load(std::memory_order_acquire);
    const auto quickfort_target = [&](std::string_view source) {
        return exact_literal_translation(std::string(quickfort_scope) + std::string(source));
    };
    const auto quickfort_emit = [&](int x, int y, std::string_view source,
            std::string_view target, int right) {
        if (source.empty() || right <= x || x + static_cast<int>(source.size()) > right ||
                !contains_cjk_utf8(target) || read_row(y).compare(x, source.size(), source) != 0)
            return;
        append_gui_prompt(GuiPrompt{{Match{x, y, static_cast<int>(source.size()),
            kDfhackHotkeysHintRule, {}, std::string(source)}}, std::string(target)}, x, right);
    };
    const auto quickfort_literal = [&](int x, int y, std::string_view source, int right) {
        auxiliary_literal(x, y, source, right, false, quickfort_scope);
    };
    const auto quickfort_number = [&](std::string_view source, std::string_view pattern)
            -> std::optional<std::string> {
        const auto target = quickfort_target(pattern);
        if (!target) return std::nullopt;
        Rule rule;
        rule.source = pattern;
        rule.target = *target;
        rule.help_prose = true;
        split_template(rule.source, &rule.template_literals, &rule.template_kinds);
        if (!compile_template_target(rule)) return std::nullopt;
        std::vector<std::string> captures;
        if (!match_dfhack_output_template(rule, source, captures)) return std::nullopt;
        std::vector<std::optional<std::string>> raw;
        for (const auto &capture : captures) raw.emplace_back(native_text_to_utf8(capture));
        return fill_template(rule, captures, nullptr, nullptr, &raw);
    };
    // The key token precedes ': '. CycleHotkeyLabel draws its caption and
    // value separately, occasionally leaving more than one layout space.
    const auto quickfort_controls = [&](int y, int left, int right,
            const auto &sources) {
        const auto &row = dfhack_context_rows[y];
        for (size_t separator = row.find(": ", left);
                separator != std::string::npos && separator + 2 < static_cast<size_t>(right);
                separator = row.find(": ", separator + 2)) {
            size_t start = separator + 2;
            while (start < static_cast<size_t>(right) && row[start] == ' ') ++start;
            for (const auto source : sources) {
                if (start + source.size() > static_cast<size_t>(right) ||
                        row.compare(start, source.size(), source) != 0) continue;
                const size_t end = start + source.size();
                if (end < static_cast<size_t>(right) && row[end] != ' ' &&
                        !is_cp437_box_separator(row, end)) continue;
                quickfort_literal(static_cast<int>(start), y, source,
                    static_cast<int>(end));
                break;
            }
        }
    };
    const auto quickfort_prose = [&](int y, int left, int right, int bottom,
            std::string_view complete) {
        const auto target = quickfort_target(complete);
        if (!target) return;
        std::vector<Match> rows;
        std::string source;
        for (int last = y; last < bottom && last < y + 8; ++last) {
            const auto band = std::string_view(dfhack_context_rows[last]).substr(left, right - left);
            const auto text = trim_view(band);
            if (text.empty() || std::any_of(text.begin(), text.end(), [](unsigned char ch) {
                    return ch >= 0xb3 && ch <= 0xda;
                })) return;
            const int x = left + static_cast<int>(text.data() - band.data());
            if (read_row(last).compare(x, text.size(), text) != 0) return;
            rows.push_back({x, last, static_cast<int>(text.size()), kDfhackHotkeysHintRule,
                {}, std::string(text)});
            if (!source.empty()) source += ' ';
            source += text;
            if (source == complete) {
                append_gui_prompt(GuiPrompt{rows, *target}, left, right);
                return;
            }
            if (!complete.starts_with(source)) return;
        }
    };

    for (int title_y = 0; quickfort_catalog && title_y < gps_->dimy; ++title_y) {
        for (const auto title : {std::string_view("Load quickfort blueprint"),
                std::string_view("Quickfort")}) {
            const size_t title_at = dfhack_context_rows[title_y].find(title);
            if (title_at == std::string::npos) continue;
            const auto frame = native_dfhack_frame(dfhack_context_rows, title_y,
                static_cast<int>(title_at), static_cast<int>(title.size()), 30, 20);
            if (!frame) continue;
            const int edge = frame->x + frame->w - 1;
            const int bottom = frame->y + frame->h - 1;
            const int left = frame->x + 2, top = frame->y + 2, right = edge - 1;
            if (right <= left || top >= bottom ||
                    dfhack_context_rows[bottom].compare(edge - 7, 6, "DFHack") != 0)
                continue;
            const auto at_source = [&](int x, int y, std::string_view source) {
                return x >= left && y >= top && y < bottom - 1 &&
                    x + static_cast<int>(source.size()) <= right &&
                    dfhack_context_rows[y].compare(x, source.size(), source) == 0;
            };
            const auto row_text = [&](int y) {
                return trim_view(std::string_view(dfhack_context_rows[y]).substr(left, right - left));
            };
            if (title == "Load quickfort blueprint") {
                const size_t load_at = dfhack_context_rows[bottom - 3].find(
                    "Load selected blueprint", left + 16);
                const size_t delete_at = dfhack_context_rows[bottom - 2].find(
                    "Delete selected blueprint", left + 15);
                if (!at_source(left + 1, top, "Filters:") ||
                        !at_source(left, bottom - 3, "Double click or") ||
                        !at_source(left, bottom - 2, "Shift click or") ||
                        load_at == std::string::npos || delete_at == std::string::npos ||
                        load_at + 23 > static_cast<size_t>(right) ||
                        delete_at + 25 > static_cast<size_t>(right)) continue;
                dfhack_auxiliary_regions.push_back(*frame);
                gui_literal(static_cast<int>(title_at), title_y, title,
                    static_cast<int>(title_at + title.size()), "Title", true);
                quickfort_literal(left + 1, top, "Filters:", left + 12);
                constexpr std::array<std::string_view, 4> filters{
                    "Library:", "Hidden:", "Show", "Hide"};
                quickfort_controls(top, left + 12, std::min(right, left + 32), filters);
                quickfort_controls(top, left + 35, std::min(right, left + 54), filters);
                quickfort_literal(left, bottom - 3, "Double click or", left + 16);
                quickfort_literal(static_cast<int>(load_at), bottom - 3,
                    "Load selected blueprint", right);
                quickfort_literal(left, bottom - 2, "Shift click or", left + 15);
                quickfort_literal(static_cast<int>(delete_at), bottom - 2,
                    "Delete selected blueprint", right);
                // FilteredList's edit row is top+2; list rows begin at top+4.
                // Only its authored empty status is translated. Every loaded
                // path, -n section, mode, and blueprint comment stays native.
                if (row_text(top + 4) == "No matches")
                    quickfort_literal(left, top + 4, "No matches", right);
                const int desc_y = bottom - 8, desc_x = left + 1;
                if (at_source(desc_x, desc_y, "No description")) {
                    const auto desc = trim_view(std::string_view(dfhack_context_rows[desc_y]).substr(
                        desc_x, right - desc_x - 1));
                    if (desc == "No description")
                        quickfort_literal(desc_x, desc_y, "No description", right - 1);
                }
                continue;
            }

            // Main-window fields before the path block have fixed positions;
            // after that block the wrapped path and section can change height.
            const auto summary = row_text(top);
            const size_t load_at = dfhack_context_rows[top + 3].find("Load new blueprint", left);
            if ((summary != "Reposition with the mouse." &&
                    summary != "Blueprint shows help text.") ||
                    !at_source(left, top + 1, "Click or hit ") ||
                    !at_source(left, top + 5, "Current blueprint:") ||
                    load_at == std::string::npos ||
                    load_at + 18 > static_cast<size_t>(right)) continue;
            int counts_y = -1;
            std::optional<std::string> total_target, invalid_target;
            for (int y = top + 7; y + 1 < bottom - 1; ++y) {
                total_target = quickfort_number(row_text(y), "Blueprint tiles: {d}");
                invalid_target = quickfort_number(row_text(y + 1), "Invalid tiles:   {d}");
                if (total_target && invalid_target) { counts_y = y; break; }
            }
            if (counts_y < 0) continue;
            dfhack_auxiliary_regions.push_back(*frame);
            gui_literal(static_cast<int>(title_at), title_y, title,
                static_cast<int>(title_at + title.size()), "Title", true);
            quickfort_literal(left, top, summary, right);
            // Keep SELECT's highlighted key glyphs in their native slot.
            quickfort_literal(left, top + 1, "Click or hit", left + 13);
            const size_t apply_at = dfhack_context_rows[top + 1].find("to apply.", left + 13);
            if (apply_at != std::string::npos && apply_at + 9 <= static_cast<size_t>(right))
                quickfort_literal(static_cast<int>(apply_at), top + 1, "to apply.", right);
            quickfort_literal(static_cast<int>(load_at), top + 3, "Load new blueprint", right);
            quickfort_literal(left, top + 5, "Current blueprint:", right);
            if (counts_y == top + 8 && row_text(top + 6) == "No blueprint loaded")
                quickfort_literal(left, top + 6, "No blueprint loaded", right);
            quickfort_emit(left, counts_y, row_text(counts_y), *total_target, right);
            quickfort_emit(left, counts_y + 1, row_text(counts_y + 1), *invalid_target, right);

            constexpr std::array<std::string_view, 18> controls{
                "Zoom to locked position", "Unlock blueprint position", "Lock blueprint position",
                "Baseline dig priority:", "Add marker:", "Blueprint:", "Damp dig:", "Warm dig:",
                "Repeat:", "Down z-levels", "Up z-levels", "No", "Transform:", "On", "Off",
                "Generate manager orders", "Preview manager orders", "Undo blueprint"};
            for (int y = counts_y + 2; y < bottom - 1; ++y) {
                const bool transform_status_row = at_source(left + 2, y, ",.[]:");
                if (!transform_status_row) quickfort_controls(y, left, right, controls);
                constexpr std::string_view materials =
                    "Build mode blueprints will use DFHack building planner material filter settings.";
                if (row_text(y).starts_with("Build mode blueprints"))
                    quickfort_prose(y, left, right, bottom - 1, materials);
                // Transform's punctuation keys are independent of its status
                // WrappedLabel at l=8. Translate only the finite action codes.
                if (!transform_status_row) continue;
                const int status_x = left + 8;
                const auto status = trim_view(std::string_view(dfhack_context_rows[y]).substr(
                    status_x, right - status_x));
                if (status == "No transform") {
                    quickfort_literal(status_x, y, status, right);
                    continue;
                }
                std::string target;
                bool known = !status.empty();
                for (size_t start = 0; known && start < status.size();) {
                    const size_t comma = status.find(", ", start);
                    const auto action = status.substr(start,
                        comma == std::string_view::npos ? status.size() - start : comma - start);
                    const auto translated = quickfort_target(action);
                    known = (action == "cw" || action == "ccw" || action == "fliph" ||
                        action == "flipv") && translated.has_value();
                    if (known) {
                        if (!target.empty()) target += "，";
                        target += *translated;
                    }
                    if (comma == std::string_view::npos) break;
                    start = comma + 2;
                }
                if (known) quickfort_emit(status_x, y, status, target, right);
            }
        }
    }
}
