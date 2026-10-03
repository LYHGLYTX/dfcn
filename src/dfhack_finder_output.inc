// gui/adv-finder.lua builds these two Windows from explicit Label lines.
// Only proved label slots enter translation. Names, edit fields, keys and
// numeric target identifiers remain native, including captured named places.
{
    const auto finder_field = [&](int x, int y, std::string_view source,
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
    const auto finder_message = [&](int x, int y, std::string_view source, int right) {
        if (source.empty() || x + static_cast<int>(source.size()) > right) return;
        const std::vector<Match> rows{{x, y, static_cast<int>(source.size()),
            kDfhackHotkeysHintRule, {}, std::string(source)}};
        if (const auto target = translate_dfhack_output_rows(rows, right - x))
            finder_field(x, y, source, *target, right);
    };
    const auto finder_literal = [&](int x, int y, std::string_view source,
            int right, bool centered = false) {
        auxiliary_literal(x, y, source, right, centered, "DFHack output: ");
    };
    const auto finder_named = [&](int x, int y, std::string_view source,
            std::string_view pattern, int right) {
        const auto found = dfhack_output_template_source_index_.find(std::string(pattern));
        if (found == dfhack_output_template_source_index_.end()) return;
        const auto &rule = dfhack_output_templates_[found->second];
        std::vector<std::string> captures;
        if (!match_dfhack_output_template(rule, source, captures)) return;
        // A holder, site or region is a proper name. In this particular GUI
        // it must bypass message/value recursion, even if named "You" or "On".
        std::vector<std::optional<std::string>> raw;
        raw.reserve(captures.size());
        for (const auto &capture : captures) raw.emplace_back(native_text_to_utf8(capture));
        finder_field(x, y, source,
            fill_template(rule, captures, nullptr, nullptr, &raw), right);
    };
    const auto finder_text = [&](int y, int left, int right) {
        return trim_view(std::string_view(dfhack_context_rows[y]).substr(left, right - left));
    };
    const auto finder_complete = [&](int y, int left, int right) {
        // Labels and choices clip individual strings, rather than wrap them.
        // A trailing blank proves the complete caption fits this allocation;
        // never parse a partial item or race hidden behind its native edge.
        return right > left && dfhack_context_rows[y][right - 1] == ' ';
    };
    const auto finder_location = [&](int y, int left, int right) {
        const auto text = finder_text(y, left, right);
        if (!finder_complete(y, left, right)) return;
        for (const std::string_view fixed : {"Transcendent", "Missing", "Nearby",
                "Traveling", "Underground", "Error"})
            if (text == fixed) {
                finder_literal(left, y, text, right);
                return;
            }
        if (text.starts_with("At ")) finder_named(left, y, text, "At {s}", right);
        else if (text.starts_with("Wilderness (") && text.ends_with(')'))
            finder_named(left, y, text, "Wilderness ({s})", right);
    };
    const auto finder_coordinates = [&](int y, int left, int right) {
        const auto text = finder_text(y, left, right);
        if (finder_complete(y, left, right) &&
                (text.starts_with("Global: X") || text.starts_with("Local: X")))
            finder_message(left, y, text, right);
    };
    const auto finder_panel = [&](int left, int top, int right, int bottom) {
        if (left < 0 || top < 0 || right >= gps_->dimx || bottom >= gps_->dimy ||
                right - left < 3 || bottom - top < 2) return false;
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

    constexpr std::array<std::string_view, 2> finder_tabs{
        "Historical Figures", "Artifacts"};
    for (int title_y = 0; title_y < gps_->dimy; ++title_y) {
        constexpr std::string_view title = "Find Target";
        const size_t at = dfhack_context_rows[title_y].find(title);
        if (at == std::string::npos) continue;
        const auto frame = native_dfhack_frame(dfhack_context_rows, title_y,
            static_cast<int>(at), static_cast<int>(title.size()), 39, 12);
        if (!frame) continue;
        const int edge = frame->x + frame->w - 1, bottom = frame->y + frame->h - 1;
        const int left = frame->x + 2, right = edge - 1;
        const int top = title_y + 2, footer_y = bottom - 2;
        if (dfhack_context_rows[bottom].compare(edge - 7, 6, "DFHack") != 0) continue;
        std::array<bool, finder_tabs.size()> tabs_seen{};
        for (int y = top; y < top + 2; ++y)
            for (size_t tab = 0; tab < finder_tabs.size(); ++tab) {
                const size_t x = dfhack_context_rows[y].find(finder_tabs[tab], left);
                tabs_seen[tab] = tabs_seen[tab] || (x != std::string::npos &&
                    x + finder_tabs[tab].size() <= static_cast<size_t>(right));
            }
        const auto &footer = dfhack_context_rows[footer_y];
        const size_t dead_at = footer.find("Show dead:", left);
        if (!std::all_of(tabs_seen.begin(), tabs_seen.end(), [](bool seen) { return seen; }) ||
                dead_at == std::string::npos || dead_at + 10 > static_cast<size_t>(left + 17))
            continue;
        const size_t books_at = footer.find("Show books:", right - 18);
        const bool artifacts = books_at != std::string::npos &&
            books_at + 11 <= static_cast<size_t>(right);
        dfhack_auxiliary_regions.push_back(*frame);
        finder_literal(static_cast<int>(at), title_y, title,
            static_cast<int>(at + title.size()), true);
        for (int y = top; y < top + 2; ++y)
            for (const auto tab : finder_tabs) {
                const size_t x = dfhack_context_rows[y].find(tab, left);
                if (x != std::string::npos && x + tab.size() <= static_cast<size_t>(right))
                    finder_literal(static_cast<int>(x), y, tab,
                        static_cast<int>(x + tab.size()), true);
            }
        const auto toggle = [&](size_t x, std::string_view label, int allocation_right) {
            if (x == std::string::npos) return;
            const int option_x = static_cast<int>(x + label.size()) + 1;
            finder_literal(static_cast<int>(x), footer_y, label, option_x - 1);
            const auto option = finder_text(footer_y, option_x, allocation_right);
            if (option == "On" || option == "Off")
                gui_literal(option_x, footer_y, option, allocation_right, "Finder state");
        };
        toggle(dead_at, "Show dead:", left + 17);
        if (artifacts) toggle(books_at, "Show books:", right);
        // FilteredList's edit row is top+2. The list begins two rows later;
        // its final two columns belong to the native scrollbar.
        const int list_right = right - 2;
        for (int y = top + 4; y < footer_y - 1; ++y) {
            const auto text = finder_text(y, left, list_right);
            if (text == "No results") {
                finder_literal(left, y, text, list_right);
                continue;
            }
            if (text.empty() || !finder_complete(y, left, list_right)) continue;
            bool quoted = false;
            size_t split = std::string_view::npos;
            for (size_t i = 0; i + 1 < text.size(); ++i) {
                if (text[i] == '"') quoted = !quoted;
                if (!quoted && text[i] == ',' && text[i + 1] == ' ') { split = i; break; }
            }
            if (split == std::string_view::npos || split == 0) continue;
            const auto caption = text.substr(split + 2);
            const int caption_x = left + static_cast<int>(split + 2);
            if (!artifacts && caption == "Force")
                finder_literal(caption_x, y, caption, list_right);
            else if (const auto target = translate_dfhack_caption(
                    artifacts ? "item" : "creature", caption))
                finder_field(caption_x, y, caption, *target, list_right);
        }
    }

    for (int title_y = 0; title_y < gps_->dimy; ++title_y) {
        const size_t at = dfhack_context_rows[title_y].find("Finder");
        if (at == std::string::npos) continue;
        std::string_view title = std::string_view(dfhack_context_rows[title_y]).substr(at, 6);
        const auto rest = std::string_view(dfhack_context_rows[title_y]).substr(at + 6);
        if (rest.starts_with(" (#")) {
            const size_t end = rest.find(')', 3);
            if (end == std::string_view::npos || end == 3 ||
                    !std::all_of(rest.begin() + 3, rest.begin() + end,
                        [](unsigned char ch) { return ch >= '0' && ch <= '9'; })) continue;
            title = std::string_view(dfhack_context_rows[title_y]).substr(at, 6 + end + 1);
        } else if (rest.empty() || rest.front() != ' ') continue;
        const auto frame = native_dfhack_frame(dfhack_context_rows, title_y,
            static_cast<int>(at), static_cast<int>(title.size()), 24, 17);
        if (!frame) continue;
        const int edge = frame->x + frame->w - 1, bottom = frame->y + frame->h - 1;
        const int panel_left = frame->x + 2, panel_right = edge - 2;
        const int adv_top = title_y + 3, adv_bottom = title_y + 11;
        const int target_top = title_y + 13, target_bottom = bottom - 2;
        if (dfhack_context_rows[bottom].compare(edge - 7, 6, "DFHack") != 0 ||
                !finder_panel(panel_left, adv_top, panel_right, adv_bottom) ||
                !finder_panel(panel_left, target_top, panel_right, target_bottom)) continue;
        const int left = panel_left + 1, right = panel_right;
        const int adv_y = adv_top + 1, target_y = target_top + 1;
        const auto adv = finder_text(adv_y, left, right);
        if (adv != "You" && adv != "Error") continue;
        dfhack_auxiliary_regions.push_back(*frame);
        if (title == "Finder") finder_literal(static_cast<int>(at), title_y, title,
            static_cast<int>(at + title.size()), true);
        else finder_message(static_cast<int>(at), title_y, title,
            static_cast<int>(at + title.size()));
        finder_literal(left, adv_y, adv, right);
        for (int y = adv_y + 1; y < adv_bottom; ++y) {
            finder_coordinates(y, left, right);
            const auto text = finder_text(y, left, right);
            if (text != "Target (local):" && text != "Target (global):") continue;
            finder_literal(left, y, text, right);
            if (y + 1 >= adv_bottom) continue;
            const auto direction = finder_text(y + 1, left, right);
            // compass() emits one native pointer, one blank, then an exact
            // 16-way abbreviation. Keep the pointer and its original color.
            constexpr std::array<std::string_view, 16> compass{
                "E", "ENE", "NE", "NNE", "N", "NNW", "NW", "WNW",
                "W", "WSW", "SW", "SSW", "S", "SSE", "SE", "ESE"};
            if (direction.size() >= 3 && direction[1] == ' ' &&
                    std::find(compass.begin(), compass.end(), direction.substr(2)) != compass.end())
                gui_literal(left + 2, y + 1, direction.substr(2), right, "Finder direction");
        }
        // hf_text/art_text reserve name/optional translated-name rows 0-2,
        // status/holder row 3, location row 4, then two coordinate rows.
        // Name rows never enter either the grammar or the output catalog.
        if (target_y + 3 >= target_bottom) continue;
        const auto status = finder_text(target_y + 3, left, right);
        const bool figure = status == "DEAD" || status == "ETERNAL" || status == "ALIVE";
        const bool artifact = status.empty() || status.starts_with("Held by ");
        if (!figure && !artifact) continue;
        const auto name = finder_text(target_y, left, right);
        if (name.empty()) continue;
        const auto second = finder_text(target_y + 1, left, right);
        const int caption_y = second.starts_with('"') ? target_y + 2 : target_y + 1;
        const auto caption = finder_text(caption_y, left, right);
        if (!caption.empty() && finder_complete(caption_y, left, right)) {
            if (figure && caption == "Force") finder_literal(left, caption_y, caption, right);
            else if (const auto target = translate_dfhack_caption(figure ? "creature" : "item", caption))
                finder_field(left, caption_y, caption, *target, right);
        }
        if (figure) finder_literal(left, target_y + 3, status, right);
        else if (finder_complete(target_y + 3, left, right) && status.starts_with("Held by "))
            finder_named(left, target_y + 3, status, "Held by {s}", right);
        if (target_y + 4 < target_bottom) finder_location(target_y + 4, left, right);
        for (int y = target_y + 5; y <= target_y + 6 && y < target_bottom; ++y)
            finder_coordinates(y, left, right);
    }
}
