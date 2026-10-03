// gui/design has movable, resizable controls above three WrappedLabels.
// Own the proved window before generic words or generated-name heuristics.
{
    constexpr std::string_view design_scope = "DFHack GUI Design: ";
    const auto design_catalog = g_dfhack_output_snapshot.load(std::memory_order_acquire);
    for (int title_y = 0; design_catalog && title_y < gps_->dimy; ++title_y) {
        constexpr std::string_view title = "Design";
        const size_t title_at = dfhack_context_rows[title_y].find(title);
        if (title_at == std::string::npos) continue;
        const auto frame = native_dfhack_frame(dfhack_context_rows, title_y,
            static_cast<int>(title_at), static_cast<int>(title.size()));
        if (!frame) continue;
        const int edge = frame->x + frame->w - 1, bottom = frame->y + frame->h - 1;
        const int left = frame->x + 2, right = edge - 1, top = frame->y + 2;
        if (right <= left || top >= bottom ||
                dfhack_context_rows[bottom].compare(edge - 7, 6, "DFHack") != 0)
            continue;
        const auto caption_in_row = [&](int y, std::string_view caption) {
            const size_t at = dfhack_context_rows[y].find(caption, left);
            return at != std::string::npos && at >= static_cast<size_t>(left + 2) &&
                at + caption.size() <= static_cast<size_t>(right) &&
                dfhack_context_rows[y].compare(at - 2, 2, ": ") == 0;
        };
        if (!caption_in_row(top, "Designation:") ||
                !caption_in_row(bottom - 3, "Show alignment guides:") ||
                !caption_in_row(bottom - 2, "Auto-commit on click:")) continue;

        std::vector<std::pair<std::string, std::string>> literals;
        std::vector<Rule> templates;
        for (const auto &[key, target] : design_catalog->gui_fields) {
            if (!key.starts_with(design_scope) || !contains_cjk_utf8(target)) continue;
            Rule rule;
            rule.source = key.substr(design_scope.size());
            rule.target = target;
            rule.help_prose = true;
            split_template(rule.source, &rule.template_literals, &rule.template_kinds);
            if (rule.template_kinds.empty()) literals.emplace_back(rule.source, rule.target);
            else if (compile_template_target(rule)) templates.push_back(std::move(rule));
        }
        std::sort(literals.begin(), literals.end(), [](const auto &a, const auto &b) {
            return a.first.size() > b.first.size();
        });
        dfhack_auxiliary_regions.push_back(*frame);
        gui_literal(static_cast<int>(title_at), title_y, title,
            static_cast<int>(title_at + title.size()), "Title", true);

        // HotkeyLabel and ButtonGroup paint keys before ': ' and separate
        // caption/value tokens. Translate those tokens without touching keys,
        // numeric controls, or the adjacent graphical button groups.
        for (int y = top; y < bottom - 1; ++y) {
            const auto &row = dfhack_context_rows[y];
            const auto fields = split_text_fields(row);
            if (std::any_of(fields.begin(), fields.end(), [&](const auto &field) {
                    return field.start >= left && field.end <= right &&
                        (field.text.starts_with("Area:") || field.text.starts_with("First Mark") ||
                         field.text.starts_with("Last Mark") || field.text.starts_with("Mouse:") ||
                         field.text.starts_with("Mirror Point:"));
                })) continue;
            for (size_t separator = row.find(": ", left);
                    separator != std::string::npos && separator + 2 < static_cast<size_t>(right);
                    separator = row.find(": ", separator + 2)) {
                size_t start = separator + 2;
                while (start < static_cast<size_t>(right) && row[start] == ' ') ++start;
                const auto text = std::string_view(row).substr(start, right - start);
                for (const auto &[source, target] : literals) {
                    if (!text.starts_with(source) ||
                            (text.size() > source.size() && text[source.size()] != ' ' &&
                             !is_cp437_box_separator(row, start + source.size()))) continue;
                    const int x = static_cast<int>(start);
                    auxiliary_literal(x, y, source, x + static_cast<int>(source.size()),
                        false, design_scope);
                    break;
                }
            }
        }

        // WrappedLabel uses the current panel width and three scrollbar
        // columns. Recover complete instructions/area/coordinate records
        // across their native rows; each coordinate retains its own value.
        for (int y = top; y < bottom - 1; ++y) {
            const auto &row = dfhack_context_rows[y];
            const auto fields = split_text_fields(row);
            for (const auto &field : fields) {
                if (field.start < left || field.end > right ||
                        !(field.text.starts_with("Click ") || field.text.starts_with("Move ") ||
                          field.text.starts_with("Place ") || field.text.starts_with("Area:") ||
                          field.text.starts_with("First Mark") || field.text.starts_with("Last Mark") ||
                          field.text.starts_with("Mouse:") || field.text.starts_with("Mirror Point:")))
                    continue;
                int clip_right = right;
                for (int x = field.end; x < right; ++x)
                    if (is_cp437_box_separator(row, static_cast<size_t>(x))) {
                        clip_right = x;
                        break;
                    }
                std::vector<Match> rows;
                std::string source;
                bool consumed = false;
                for (int last = y; last < bottom - 1 && last < y + 12; ++last) {
                    const auto band = std::string_view(dfhack_context_rows[last]).substr(
                        field.start, clip_right - field.start);
                    const auto text = trim_view(band);
                    if (text.empty() || std::any_of(text.begin(), text.end(), [](unsigned char ch) {
                            return ch >= 0xb3 && ch <= 0xda;
                        })) break;
                    const int x = field.start + static_cast<int>(text.data() - band.data());
                    if (read_row(last).compare(x, text.size(), text) != 0) break;
                    rows.push_back({x, last, static_cast<int>(text.size()), kDfhackHotkeysHintRule,
                        {}, std::string(text)});
                    if (!source.empty()) source += ' ';
                    source += text;
                    std::optional<std::string> target = source == "Area:"
                        ? std::nullopt : exact_literal_translation(std::string(design_scope) + source);
                    if (!target) {
                        for (const auto &rule : templates) {
                            std::vector<std::string> captures;
                            if (!match_dfhack_output_template(rule, source, captures)) continue;
                            std::vector<std::optional<std::string>> raw;
                            for (const auto &capture : captures) raw.emplace_back(native_text_to_utf8(capture));
                            target = fill_template(rule, captures, nullptr, nullptr, &raw);
                            break;
                        }
                    }
                    if (!target || !contains_cjk_utf8(*target)) continue;
                    append_gui_prompt(GuiPrompt{rows, *target}, field.start, clip_right);
                    // A multirow record is consumed once; the next record may
                    // follow immediately in the same WrappedLabel's text list.
                    y = last;
                    consumed = true;
                    break;
                }
                if (consumed) break;
            }
        }
    }
}
