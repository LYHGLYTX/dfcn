// unit-info-viewer's overlays are movable, unframed fields on a proved UNIT
// sheet. Reuse the native ordered tab/frame readers, then identify only the
// exact paired mood rows and the skill toggles' actual Ctrl-key tokens.
{
    bool unit_overview = false, unit_skills = false;
    const auto band_selected = [&](const std::vector<LogicalTextField> &fields,
            int y, std::string_view selected) {
        int active = -1, inactive = -1;
        for (const auto &field : fields) {
            bool layer = false;
            const auto *first = cell_at(field.start, y, &layer);
            if (!first || first[0] != static_cast<unsigned char>(field.text.front())) return false;
            const int rgb = (first[1] << 16) | (first[2] << 8) | first[3];
            for (int x = field.start; x < field.end; ++x) {
                bool current_layer = false;
                const auto *cell = cell_at(x, y, &current_layer);
                if (!cell || current_layer != layer || cell[0] != static_cast<unsigned char>(
                        field.text[static_cast<size_t>(x - field.start)]) ||
                        (cell[1] << 16 | cell[2] << 8 | cell[3]) != rgb) return false;
            }
            if (field.text == selected) active = rgb;
            else if (inactive < 0) inactive = rgb;
            else if (inactive != rgb) return false;
        }
        return active >= 0 && inactive >= 0 && active != inactive;
    };
    for (int y = 0; y < gps_->dimy; ++y) {
        const auto main = character_information_tab_fields(dfhack_context_rows[y]);
        if (main.empty()) continue;
        bool tab_layer = false;
        const auto *tab_cell = cell_at(main.front().start, y, &tab_layer);
        const auto *tab_flags = tab_layer ? gps_->screentexpos_top_flag : gps_->screentexpos_flag;
        const uint32_t tab_half = tab_cell && tab_flags ? tab_flags[
            static_cast<size_t>(main.front().start) * gps_->dimy + y] &
            ((1u << 3) | (1u << 4)) : 0;
        if (tab_half == (1u << 4)) continue;
        const int main_height = tab_half == (1u << 3) ? 2 : 1;
        auto frame = find_graphical_character_panel_frame(*gps_,
            main.front().start, main.back().end, y);
        if (!frame) frame = find_ascii_panel_frame(main.front().start,
            main.back().end, y, gps_->dimx, gps_->dimy,
            [&](int x, int row) { return static_cast<unsigned char>(dfhack_context_rows[row][x]); });
        if (!frame) frame = find_character_overview_frame(*gps_, main.front().start,
            main.back().end, y,
            [&](int x, int row) { return static_cast<unsigned char>(dfhack_context_rows[row][x]); });
        if (!frame) continue;
        // The exact main-tab color contract and the existing four-band
        // summary grid independently prove Overview's active content.
        unit_overview = unit_overview || band_selected(main, y, "Overview") ||
            find_character_summary_grid(*gps_, main.front().start,
                main.back().end, y + main_height).has_value();
        if (main.size() < 4 || main[3].text != "Skills") continue;
        for (int row = y + main_height; row < frame->bottom; ++row) {
            if (!character_information_tab_fields(dfhack_context_rows[row]).empty()) continue;
            const auto &raw = dfhack_context_rows[row];
            const auto text_byte = [](unsigned char ch) {
                return (ch >= 'A' && ch <= 'Z') || (ch >= 'a' && ch <= 'z') ||
                    (ch >= '0' && ch <= '9') || is_cp437_latin_letter_byte(ch);
            };
            if (std::none_of(raw.begin() + frame->left + 1,
                    raw.begin() + frame->right, text_byte)) continue;
            auto subtabs = character_skill_tab_fields(std::string_view(raw).substr(
                frame->left + 1, frame->right - frame->left - 1));
            if (subtabs.empty()) {
                // A moved overlay may precede the real native subtab band.
                // Its own exact labels cannot replace or fabricate that band.
                if (raw.find("Mood: ") != std::string::npos ||
                        raw.find("Long-term mood: ") != std::string::npos ||
                        raw.find("Progress Bar:") != std::string::npos ||
                        raw.find("Experience:") != std::string::npos) continue;
                break;
            }
            for (auto &field : subtabs) {
                field.start += frame->left + 1;
                field.end += frame->left + 1;
            }
            bool captions_only = true;
            int cursor = frame->left + 1;
            for (const auto &field : subtabs) {
                if (std::any_of(raw.begin() + cursor, raw.begin() + field.start, text_byte))
                    captions_only = false;
                cursor = field.end;
            }
            if (std::any_of(raw.begin() + cursor, raw.begin() + frame->right, text_byte))
                captions_only = false;
            // This overlay is absent on Knowledge. A unique selected
            // Knowledge caption must never authorize its control fields.
            if (captions_only && !band_selected(subtabs, row, "Knowledge")) unit_skills = true;
            break;
        }
    }
    const auto covered = dfhack_auxiliary_regions;
    const auto available = [&](int x, int y, int width, int height = 1) {
        if (x < 0 || y < 0 || width <= 0 || height <= 0 ||
                x + width > gps_->dimx || y + height > gps_->dimy) return false;
        return std::none_of(covered.begin(), covered.end(), [&](const SDL_Rect &box) {
            return x < box.x + box.w && box.x < x + width &&
                y < box.y + box.h && box.y < y + height;
        });
    };
    constexpr std::array<std::string_view, 7> moods{
        "Miserable", "Unhappy", "Displeased", "Content", "Pleased", "Happy", "Ecstatic"};
    const auto mood_at = [&](int x, int y, int right) -> std::optional<std::string_view> {
        if (x < 0 || x >= right || right > gps_->dimx) return std::nullopt;
        for (const auto mood : moods) {
            const int end = x + static_cast<int>(mood.size());
            if (end >= right || dfhack_context_rows[y].compare(x, mood.size(), mood) != 0 ||
                    dfhack_context_rows[y][end] != ' ') continue;
            return mood;
        }
        return std::nullopt;
    };
    if (unit_overview) {
        constexpr std::string_view current = "Mood:", longterm = "Long-term mood:";
        for (int y = 0; y + 1 < gps_->dimy; ++y) {
            for (size_t at = dfhack_context_rows[y].find("Mood: "); at != std::string::npos;
                    at = dfhack_context_rows[y].find("Mood: ", at + 1)) {
                const int x = static_cast<int>(at), right = x + 27;
                if (!available(x, y, 27, 2) ||
                        dfhack_context_rows[y + 1].compare(x, longterm.size() + 1,
                            "Long-term mood: ") != 0) continue;
                const int current_x = x + static_cast<int>(current.size()) + 1;
                const int longterm_x = x + static_cast<int>(longterm.size()) + 1;
                const auto current_mood = mood_at(current_x, y, right);
                const auto longterm_mood = mood_at(longterm_x, y + 1, right);
                if (!current_mood || !longterm_mood) continue;
                const int current_right = current_x + static_cast<int>(current_mood->size());
                const int longterm_right = longterm_x + static_cast<int>(longterm_mood->size());
                // This Label has a transparent background. Own its actual
                // text, never neighboring native details inside the 27-cell
                // widget's unused allocation.
                dfhack_auxiliary_regions.push_back({x, y, current_right - x, 1});
                dfhack_auxiliary_regions.push_back({x, y + 1, longterm_right - x, 1});
                gui_literal(x, y, current, current_x - 1, "Unit overlay caption");
                gui_literal(current_x, y, *current_mood, current_right, "Unit mood state");
                gui_literal(x, y + 1, longterm, longterm_x - 1, "Unit overlay caption");
                gui_literal(longterm_x, y + 1, *longterm_mood, longterm_right, "Unit mood state");
            }
        }
    }
    struct UnitSkillToggle {
        int left, caption_x, state_x, right;
        std::string_view caption, state;
    };
    const auto skill_toggle = [&](int y, int caption_x, std::string_view caption,
            char terminal, int width) -> std::optional<UnitSkillToggle> {
        if (caption_x < 2 || dfhack_context_rows[y].compare(caption_x,
                caption.size(), caption) != 0 ||
                dfhack_context_rows[y].compare(caption_x - 2, 2, ": ") != 0)
            return std::nullopt;
        const auto &raw = dfhack_context_rows[y];
        for (int begin = std::max(0, caption_x - 22); begin < caption_x - 2; ++begin) {
            const auto key = trim_view(std::string_view(raw).substr(begin, caption_x - 2 - begin));
            std::string normalized(key);
            normalized.erase(std::remove(normalized.begin(), normalized.end(), ' '), normalized.end());
            std::replace(normalized.begin(), normalized.end(), '-', '+');
            if (normalized != std::string("Ctrl+") + terminal || !is_keybinding_code(normalized))
                continue;
            const int left = static_cast<int>(key.data() - raw.data());
            const int right = left + width;
            const int state_x = caption_x + static_cast<int>(caption.size()) + 1;
            if (!available(left, y, width) || state_x >= right ||
                    raw[caption_x + caption.size()] != ' ') return std::nullopt;
            const auto state = trim_view(std::string_view(raw).substr(state_x, right - state_x));
            if (state != "Yes" && state != "No") return std::nullopt;
            return UnitSkillToggle{left, caption_x, state_x, right, caption, state};
        }
        return std::nullopt;
    };
    if (unit_skills) {
        for (int y = 0; y < gps_->dimy; ++y) {
            for (size_t at = dfhack_context_rows[y].find("Experience:"); at != std::string::npos;
                    at = dfhack_context_rows[y].find("Experience:", at + 1)) {
                const auto experience = skill_toggle(y, static_cast<int>(at), "Experience:", 'E', 23);
                if (!experience) continue;
                const auto emit = [&](const UnitSkillToggle &toggle) {
                    dfhack_auxiliary_regions.push_back({toggle.left, y, toggle.right - toggle.left, 1});
                    gui_literal(toggle.caption_x, y, toggle.caption, toggle.state_x - 1,
                        "Unit overlay caption");
                    gui_literal(toggle.state_x, y, toggle.state, toggle.right, "Unit skill state");
                };
                // BannerPanel's child controls are 28 cells apart. Adventure
                // graphics hides Progress Bar, leaving Experience on its own.
                const int progress_left = experience->left - 28;
                if (progress_left >= 0) {
                    const size_t progress_at = dfhack_context_rows[y].find("Progress Bar:", progress_left);
                    if (progress_at != std::string::npos && progress_at < at)
                        if (const auto progress = skill_toggle(y, static_cast<int>(progress_at),
                                "Progress Bar:", 'B', 25); progress && progress->left == progress_left)
                            emit(*progress);
                }
                emit(*experience);
            }
        }
    }
}
