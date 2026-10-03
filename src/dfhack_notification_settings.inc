// gui/notify's settings IDs and descriptions are authored GUI fields, not
// generated names. The fixed ID/value columns establish each complete row.
{
    constexpr std::string_view notify_scope = "DFHack GUI Notification settings: ";
    const auto notify_catalog = g_dfhack_output_snapshot.load(std::memory_order_acquire);
    for (int title_y = 0; notify_catalog && title_y < gps_->dimy; ++title_y) {
        constexpr std::string_view title = "Notification settings";
        const size_t title_at = dfhack_context_rows[title_y].find(title);
        if (title_at == std::string::npos) continue;
        const auto frame = native_dfhack_frame(dfhack_context_rows, title_y,
            static_cast<int>(title_at), static_cast<int>(title.size()), 40, 22);
        if (!frame) continue;
        const int edge = frame->x + frame->w - 1, bottom = frame->y + frame->h - 1;
        const int left = frame->x + 2, right = edge - 1, footer_y = bottom - 2;
        const int list_left = left + 1, list_right = edge - 4;
        if (dfhack_context_rows[bottom].compare(edge - 7, 6, "DFHack") != 0 ||
                list_right <= list_left + 22) continue;
        const auto footer_caption = [&](int x, int last, std::string_view expected)
                -> std::optional<int> {
            const auto band = std::string_view(dfhack_context_rows[footer_y]).substr(x, last - x);
            const auto text = trim_view(band);
            const auto separator = text.find(": ");
            if (separator == std::string_view::npos) return std::nullopt;
            const auto caption = trim_view(text.substr(separator + 2));
            if (caption != expected) return std::nullopt;
            return x + static_cast<int>(caption.data() - band.data());
        };
        const auto toggle_x = footer_caption(left, left + 15, "Toggle");
        const auto all_x = footer_caption(left + 15, right, "Toggle all");
        if (!toggle_x || !all_x) continue;
        struct NotifyRow { int x, y; std::string id, state; };
        std::vector<NotifyRow> settings;
        for (int y = frame->y + 3; y <= bottom - 10; ++y) {
            const auto &row = dfhack_context_rows[y];
            if (row.compare(list_left + 20, 2, ": ") != 0) continue;
            const auto field = std::string_view(row).substr(list_left, 20);
            const auto id = trim_view(field);
            const auto state = trim_view(std::string_view(row).substr(
                list_left + 22, list_right - list_left - 22));
            if (id.empty() || (state != "Enabled" && state != "Disabled") ||
                    !exact_literal_translation(std::string(notify_scope) + std::string(id)))
                continue;
            settings.push_back({list_left + static_cast<int>(id.data() - field.data()),
                y, std::string(id), std::string(state)});
        }
        if (settings.empty()) continue;
        dfhack_auxiliary_regions.push_back(*frame);
        gui_literal(static_cast<int>(title_at), title_y, title,
            static_cast<int>(title_at + title.size()), "Title", true);
        auxiliary_literal(*toggle_x, footer_y, "Toggle", left + 14, false, notify_scope);
        auxiliary_literal(*all_x, footer_y, "Toggle all", right, false, notify_scope);
        for (const auto &setting : settings) {
            const auto target = exact_literal_translation(std::string(notify_scope) + setting.id);
            if (target && (only_y < 0 || only_y == setting.y) &&
                    read_row(setting.y).compare(setting.x, setting.id.size(), setting.id) == 0) {
                Match match{setting.x, setting.y, static_cast<int>(setting.id.size()),
                    kDfhackHotkeysHintRule, *target, setting.id};
                match.layout_x = list_left;
                match.layout_length = 20;
                match.layout_clip_right = list_left + 20;
                match.layout_left = true;
                match.layout_font_pixels = unified_font_pixels();
                match.layout_lock_font_pixels = true;
                dfhack_auxiliary_matches.push_back(std::move(match));
            }
            auxiliary_literal(list_left + 22, setting.y, setting.state,
                list_right, false, notify_scope);
        }

        const int desc_left = list_left, desc_right = edge - 2;
        const int desc_text_right = desc_right - 3;
        const int desc_top = bottom - 7, desc_bottom = bottom - 5;
        const int wrap_width = desc_right - desc_left - 3;
        std::vector<Match> description_rows;
        std::string visible;
        for (int y = desc_top; y <= desc_bottom; ++y) {
            const auto band = std::string_view(dfhack_context_rows[y]).substr(desc_left, wrap_width);
            const auto text = trim_view(band);
            if (text.empty()) break;
            const int x = desc_left + static_cast<int>(text.data() - band.data());
            if (read_row(y).compare(x, text.size(), text) != 0) break;
            description_rows.push_back({x, y, static_cast<int>(text.size()),
                kDfhackHotkeysHintRule, {}, std::string(text)});
            if (!visible.empty()) visible += ' ';
            visible += text;
        }
        if (description_rows.empty()) continue;
        std::optional<std::string> target = exact_literal_translation(std::string(notify_scope) + visible);
        std::optional<NativeParagraphViewport> viewport;
        // The three-row description box can show a scrolling slice. Compare
        // every visible row with the complete source's actual native wrap.
        if (!target) for (const auto &[key, value] : notify_catalog->gui_fields) {
            if (!key.starts_with(notify_scope)) continue;
            const auto source = std::string_view(key).substr(notify_scope.size());
            if (!(source.starts_with("Reports ") || source.starts_with("Notifies ") ||
                  source.starts_with("Describes ") || source.starts_with("Gives ") ||
                  source.starts_with("Shows ") || source.starts_with("Warns ")) ||
                    source.find('{') != std::string_view::npos) continue;
            const auto wrapped = dfhack_help_native_wrap(source, wrap_width);
            for (size_t first = 0; first + description_rows.size() <= wrapped.size(); ++first) {
                bool same = true;
                for (size_t line = 0; same && line < description_rows.size(); ++line)
                    same = trim_view(wrapped[first + line]) == description_rows[line].source;
                if (!same) continue;
                // A short complete label must account for all source rows;
                // only a full viewport permits a clipped/scrolling slice.
                if (wrapped.size() != description_rows.size() &&
                        description_rows.size() != static_cast<size_t>(desc_bottom - desc_top + 1))
                    continue;
                target = value;
                if (wrapped.size() > description_rows.size()) viewport = NativeParagraphViewport{
                    static_cast<int>(first), static_cast<int>(wrapped.size())};
                break;
            }
            if (target) break;
        }
        constexpr std::string_view reminder_prefix =
            "Shows a reminder if it has been more than ";
        if (!target && visible.starts_with(reminder_prefix)) {
            for (const auto suffix : {std::string_view(" minute since your last save."),
                    std::string_view(" minutes since your last save.")}) {
                if (!visible.ends_with(suffix) ||
                        visible.size() <= reminder_prefix.size() + suffix.size()) continue;
                const auto count = std::string_view(visible).substr(reminder_prefix.size(),
                    visible.size() - reminder_prefix.size() - suffix.size());
                if (!std::all_of(count.begin(), count.end(), [](unsigned char ch) {
                        return ch >= '0' && ch <= '9';
                    })) continue;
                target = exact_literal_translation(std::string(notify_scope) +
                    std::string(reminder_prefix) + "{d}" + std::string(suffix));
                if (!target) continue;
                const auto at = target->find("{d}");
                if (at == std::string::npos) target.reset();
                else target->replace(at, 3, count);
                break;
            }
        }
        if (!target) continue;
        description_rows.front().layout_native_clip = auxiliary_pixels(
            {desc_left, desc_top, desc_text_right - desc_left, desc_bottom - desc_top + 1});
        append_bounded_paragraph(std::move(description_rows), *target, screen_rows,
            dfhack_auxiliary_matches, only_y, desc_text_right, desc_text_right, {}, false,
            desc_left, viewport);
    }
}
