        // Military -> Squad is a record: the squad name and its current
        // orders use native left margins, not separate centred label boxes.
        // Reuse the already identified character pane and complete-field
        // ownership so another panel's names or order captions cannot enter.
        auto layout_military_squad = [&] {
            if (!renderer || !face_ || gps_->tile_pixel_x <= 0 ||
                gps_->tile_pixel_y <= 0 ||
                !this->character_social_tab_selected(character_info_tabs_y, "Military"))
                return;
            const auto display_y = [](const Match &match) {
                return match.native_split_text ? match.native_split_top_y : match.y;
            };
            std::array<const Match *, 3> tabs{};
            for (const Match &first : prepared_matches_) {
                if (first.source != "Squad" || first.target.empty() ||
                    first.native_split_duplicate ||
                    display_y(first) <= character_info_tabs_y ||
                    first.y >= panel_bottom || first.x < panel_left) continue;
                std::array<const Match *, 3> row{{&first, nullptr, nullptr}};
                for (const Match &tab : prepared_matches_) {
                    if (tab.target.empty() || tab.native_split_duplicate ||
                        display_y(tab) != display_y(first) || tab.x <= first.x ||
                        tab.x + tab.length > panel_right) continue;
                    if (tab.source == "Uniform") row[1] = &tab;
                    else if (tab.source == "Kills") row[2] = &tab;
                }
                if (std::all_of(row.begin(), row.end(),
                        [](const Match *tab) { return tab != nullptr; }) &&
                    row[0]->x + row[0]->length < row[1]->x &&
                    row[1]->x + row[1]->length < row[2]->x) {
                    tabs = row;
                    break;
                }
            }
            if (!tabs[0]) return;

            // All three captions remain visible on Uniform/Kills. Only
            // Squad's selected foreground proves ownership of this body.
            std::array<int, 3> colors{};
            int body_y = 0;
            for (size_t i = 0; i < tabs.size(); ++i) {
                const Match &tab = *tabs[i];
                bool top = false;
                const auto *cell = cell_at(tab.x, tab.y, &top);
                if (!cell || cell[0] != tab.source.front()) return;
                colors[i] = (cell[1] << 16) | (cell[2] << 8) | cell[3];
                body_y = std::max(body_y,
                    display_y(tab) + (tab.native_split_text ? 2 : 1));
            }
            if (colors[0] == colors[1] || colors[1] != colors[2]) return;

            std::map<int, std::vector<std::vector<Match *>>> columns;
            for (Match &field : prepared_matches_) {
                if (field.target.empty() || field.native_split_duplicate ||
                    display_y(field) < body_y ||
                    display_y(field) + (field.native_split_text ? 2 : 1) > panel_bottom ||
                    !complete_character_field(field)) continue;
                // Orders here are military commands; keep the general
                // workshop/manager translation outside this page unchanged.
                if (field.source == "No orders") field.target = "无命令";
                columns[field.x].push_back({&field});
            }
            for (auto &[left, rows] : columns) {
                // Preserve the source x/y/length for suppression and native
                // hit targets. Shared fitting retains both native baselines
                // and their common left edge; the row fitter also stops at
                // any neighbouring source field before the pane's edge.
                layout_fortress_text_rows(renderer, rows, left, panel_right, true);
            }
        };
        layout_military_squad();
