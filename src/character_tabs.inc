// Claim each Skills caption before dynamic messages can treat the next tab
// as a name, such as "Combat Social". Translation still comes from the same
// generic literal rule, and native half-font layout remains shared.
void Overlay::append_character_skill_tab_matches(std::vector<std::string> &rows,
        std::vector<Match> &matches, int only_y) const {
    if (!gps_ || gps_->dimx <= 0 || gps_->dimy <= 0 ||
        rows.size() != static_cast<size_t>(gps_->dimy)) return;

    // Read current composed source for context, including raw-layer matching
    // passes. Populate rows only as needed to reach the first subtab band.
    std::vector<std::string> context(gps_->dimy);
    const auto read_row = [&](int y) -> const std::string & {
        auto &row = context[y];
        if (row.empty()) {
            row.assign(static_cast<size_t>(gps_->dimx), ' ');
            for (int x = 0; x < gps_->dimx; ++x) {
                bool top = false;
                const auto *cell = cell_at(x, y, &top);
                if (cell && cell[0]) row[x] = static_cast<char>(cell[0]);
            }
        }
        return row;
    };
    constexpr uint32_t top_half = 1u << 3;
    constexpr uint32_t bottom_half = 1u << 4;
    constexpr uint32_t half_mask = top_half | bottom_half;
    const auto band_height = [&](int y,
            const std::vector<LogicalTextField> &fields, bool ascii_tabs) {
        if (fields.empty()) return 0;
        int height = 0;
        for (const auto &field : fields) {
            // Selected and neighbouring tabs can occupy different layers.
            // Each caption proves its own layer; only their heights agree.
            bool layer = false;
            const auto *first = cell_at(field.start, y, &layer);
            const auto *flags = layer
                ? gps_->screentexpos_top_flag : gps_->screentexpos_flag;
            const uint32_t half = flags
                ? flags[static_cast<size_t>(field.start) * gps_->dimy + y]
                    & half_mask : 0;
            if (!first || (half != 0 && half != top_half)) return 0;
            const int field_height = half == top_half ? 2 : 1;
            if (field_height > gps_->dimy - y ||
                (height != 0 && height != field_height)) return 0;
            height = field_height;
            if (ascii_tabs && !is_ascii_tab_caption(
                    read_row(y), field.start, field.end)) return 0;
            for (int dy = 0; dy < height; ++dy) {
                const uint32_t expected = dy == 0 ? half : bottom_half;
                for (int x = field.start; x < field.end; ++x) {
                    bool cell_layer = false;
                    const auto *cell = cell_at(x, y + dy, &cell_layer);
                    const uint32_t current = flags
                        ? flags[static_cast<size_t>(x) * gps_->dimy + y + dy]
                            & half_mask : 0;
                    // Spaces inside "Other skills" are part of its caption
                    // and must satisfy the same strict half-font contract.
                    if (!cell || cell_layer != layer || current != expected ||
                        cell[0] != static_cast<unsigned char>(
                            field.text[static_cast<size_t>(x - field.start)]))
                        return 0;
                }
            }
        }
        return height;
    };
    const auto exact_rule = [&](std::string_view source) {
        const auto lookup = [&](const std::vector<TrieNode> &trie, bool fold) {
            if (trie.empty()) return -1;
            int node = 0;
            for (unsigned char ch : source) {
                if (fold && ch >= 'A' && ch <= 'Z')
                    ch = static_cast<unsigned char>(ch - 'A' + 'a');
                const auto next = trie[node].next.find(ch);
                if (next == trie[node].next.end()) return -1;
                node = next->second;
            }
            const int rule = trie[node].rule;
            return rule >= 0 && static_cast<size_t>(rule) < rules_.size() &&
                !rules_[rule].target.empty() && !rules_[rule].word_follows
                ? rule : -1;
        };
        const int rule = lookup(trie_, false);
        return rule >= 0 ? rule : lookup(trie_ci_, true);
    };
    const auto text_byte = [](unsigned char ch) {
        return (ch >= 'A' && ch <= 'Z') || (ch >= 'a' && ch <= 'z') ||
            (ch >= '0' && ch <= '9') || is_cp437_latin_letter_byte(ch);
    };

    for (int tabs_y = 0; tabs_y < gps_->dimy; ++tabs_y) {
        const auto main_tabs = character_information_tab_fields(read_row(tabs_y));
        if (main_tabs.size() < 4 || main_tabs[3].text != "Skills") continue;
        auto frame = find_graphical_character_panel_frame(*gps_,
            main_tabs.front().start, main_tabs.back().end, tabs_y);
        const bool ascii_tabs = !frame;
        if (!frame) frame = find_ascii_panel_frame(main_tabs.front().start,
            main_tabs.back().end, tabs_y, gps_->dimx, gps_->dimy,
            [&](int x, int y) {
                return static_cast<unsigned char>(read_row(y)[x]);
            });
        if (!frame) continue;
        const int main_height = band_height(tabs_y, main_tabs, ascii_tabs);
        if (main_height == 0) continue;

        for (int y = tabs_y + main_height; y < frame->bottom; ++y) {
            const auto &row = read_row(y);
            const auto begin = row.begin() + frame->left + 1;
            const auto end = row.begin() + frame->right;
            if (std::none_of(begin, end, text_byte)) continue;

            // Only the first text band below the main tabs can be subtabs.
            // A later prose line cannot opt into this ownership by mentioning
            // the same words. Require all five captions within this frame.
            auto fields = character_skill_tab_fields(std::string_view(row).substr(
                frame->left + 1, frame->right - frame->left - 1));
            if (fields.empty()) break;
            for (auto &field : fields) {
                field.start += frame->left + 1;
                field.end += frame->left + 1;
            }
            bool caption_only = true;
            int cursor = frame->left + 1;
            for (const auto &field : fields) {
                if (std::any_of(row.begin() + cursor,
                        row.begin() + field.start, text_byte)) caption_only = false;
                cursor = field.end;
            }
            if (std::any_of(row.begin() + cursor, end, text_byte))
                caption_only = false;
            const int height = band_height(y, fields, ascii_tabs);
            if (!caption_only || height == 0 || y + height > frame->bottom) break;

            std::vector<int> rules;
            for (const auto &field : fields) rules.push_back(exact_rule(field.text));
            if (std::any_of(rules.begin(), rules.end(),
                    [](int rule) { return rule < 0; })) break;
            for (int dy = 0; dy < height; ++dy) {
                auto &source_row = rows[y + dy];
                for (size_t index = 0; index < fields.size(); ++index) {
                    const auto &field = fields[index];
                    const int length = field.end - field.start;
                    // A different raw layer may contain unrelated text at
                    // these coordinates. Claim only its exact caption bytes.
                    if (source_row.compare(field.start, length, field.text) != 0)
                        continue;
                    if (only_y < 0 || only_y == y + dy)
                        matches.push_back({field.start, y + dy, length,
                            rules[index], rules_[rules[index]].target, field.text});
                    std::fill_n(source_row.begin() + field.start, length, ' ');
                }
            }
            return;
        }
    }
}
