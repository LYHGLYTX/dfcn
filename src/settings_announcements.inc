// Announcement settings names own one table cell before ordinary words or
// names can consume fragments. Read the logical ink, since graphical copies
// can hide part of an otherwise complete caption from visible_char_at().
void Overlay::append_settings_announcement_names(std::vector<std::string> &rows,
        std::vector<Match> &matches, int only_y) const {
    if (!gps_ || rows.size() != static_cast<size_t>(gps_->dimy)) return;
    std::vector<std::string> logical(rows.size(), std::string(gps_->dimx, ' '));
    for (int y = 0; y < gps_->dimy; ++y) {
        for (int x = 0; x < gps_->dimx; ++x) {
            bool top = false;
            const auto *cell = cell_at(x, y, &top);
            if (cell && cell[0]) logical[y][x] = static_cast<char>(cell[0]);
        }
    }
    const auto standalone_positions = [](const std::string &row,
            std::string_view text, int left) {
        std::vector<int> positions;
        for (size_t at = row.find(text, static_cast<size_t>(std::max(0, left)));
                at != std::string::npos; at = row.find(text, at + text.size())) {
            const size_t end = at + text.size();
            if ((at == 0 || row[at - 1] == ' ') &&
                    (end == row.size() || row[end] == ' '))
                positions.push_back(static_cast<int>(at));
        }
        return positions;
    };
    int name_left = -1, matrix_left = -1, header_y = -1;
    for (int y = 0; y < gps_->dimy && header_y < 0; ++y) {
        for (int name_x : standalone_positions(logical[y], "Name", 0)) {
            int control_count = 0, first_control = INT32_MAX;
            for (std::string_view heading : {"Popup", "Pause", "Recenter",
                    "Adventure", "Fortress", "Report", "Alert"}) {
                const auto positions = standalone_positions(logical[y], heading, name_x + 4);
                control_count += static_cast<int>(positions.size());
                if (!positions.empty() && (heading == "Popup" || heading == "Pause" ||
                        heading == "Recenter"))
                    first_control = std::min(first_control, positions.front());
            }
            if (control_count >= 5 && first_control != INT32_MAX) {
                name_left = name_x;
                matrix_left = first_control;
                header_y = y;
                break;
            }
        }
    }
    if (header_y < 0 && settings_active_page_ == 4 &&
            settings_announcement_geometry_valid_) {
        name_left = settings_announcement_name_x_;
        matrix_left = settings_announcement_toggle_x_;
    }
    if (name_left < 0 || matrix_left <= name_left || matrix_left >= gps_->dimx) return;
    if (header_y < 0) {
        // With the header scrolled away, prove the current table from a
        // visible toggle band. Its captions do not share the event name's
        // logical y: DF puts names at the row top and values in button centres.
        const bool matrix_visible = std::any_of(logical.begin(), logical.end(),
            [&](const std::string &row) {
                return standalone_positions(row, "Yes", matrix_left).size() +
                    standalone_positions(row, "No", matrix_left).size() >= 4;
            });
        if (!matrix_visible) return;
    }
    for (int y = header_y + 1; y < gps_->dimy; ++y) {
        if (only_y >= 0 && y != only_y) continue;
        // The header owns the horizontal cell boundaries for every name
        // row, including both halves of native text. Requiring Yes/No on this
        // same row skipped the name and later found only an empty button row.
        int first = name_left, end = matrix_left;
        while (first < end && logical[y][first] == ' ') ++first;
        while (end > first && logical[y][end - 1] == ' ') --end;
        if (first == end) continue;
        const std::string source = logical[y].substr(first, end - first);
        std::string key;
        bool pending_space = false;
        for (unsigned char ch : source) {
            if (std::isspace(ch)) {
                pending_space = !key.empty();
            } else {
                if (pending_space) key.push_back(' ');
                key.push_back(static_cast<char>(ch));
                pending_space = false;
            }
        }
        const auto target = exact_literal_translation(key);
        if (!target || target->empty()) continue;
        Match match{first, y, end - first, kSettingsAnnouncementNameRule, *target, source};
        match.layout_x = name_left;
        match.layout_length = std::max(1, matrix_left - name_left - 3);
        match.layout_left = true;
        match.layout_clip_right = matrix_left - 3;
        std::fill(rows[y].begin() + first, rows[y].begin() + end, ' ');
        matches.push_back(std::move(match));
    }
}
