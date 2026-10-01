// Overview rows belong to the live two-column summary grid. Capture each
// physical cell before generic matching so an English name, an age/sex pair
// and independently positioned badges can share one compact translated row.
std::vector<NativeTextCard> Overlay::capture_character_overview_rows() const {
    if (!gps_ || gps_->dimx <= 0 || gps_->dimy <= 0) return {};

    const auto settings = native_ui_settings();
    const bool classic = settings && settings->classic;

    const auto texture_at = [&](int x, int y) -> long {
        bool top = false;
        (void)cell_at(x, y, &top);
        const size_t tile = static_cast<size_t>(x) * gps_->dimy + y;
        const auto *primary = top ? gps_->screentexpos_top : gps_->screentexpos;
        const auto *lower = top ? gps_->screentexpos_top_lower : gps_->screentexpos_lower;
        if (primary && primary[tile]) return primary[tile];
        return lower ? lower[tile] : 0;
    };
    const auto is_age_row = [](std::string_view source) {
        const std::string text = lower(normalize_utterance(source));
        size_t end = 0;
        while (end < text.size() && text[end] >= '0' && text[end] <= '9') ++end;
        if (end == 0) return false;
        const std::string_view rest(text.data() + end, text.size() - end);
        for (std::string_view suffix : {" year old", " years old"}) {
            if (rest.starts_with(suffix) &&
                (rest.size() == suffix.size() || rest[suffix.size()] == ' ' ||
                 rest[suffix.size()] == ',')) return true;
        }
        return false;
    };

    for (int tabs_y = 0; tabs_y < gps_->dimy; ++tabs_y) {
        // A per-layer suppression scan must see the same current tab band as
        // final composition, even when captions and content use different
        // logical layers. Do not borrow a preceding frame's occlusion state.
        std::string tabs(static_cast<size_t>(gps_->dimx), ' ');
        for (int x = 0; x < gps_->dimx; ++x) {
            bool top = false;
            const auto *cell = cell_at(x, tabs_y, &top);
            if (cell && cell[0]) tabs[static_cast<size_t>(x)] = cell[0];
        }
        const auto fields = character_information_tab_fields(tabs);
        if (fields.empty()) continue;
        int content_top = tabs_y + 1;
        for (const auto &field : fields) {
            bool top = false;
            (void)cell_at(field.start, tabs_y, &top);
            const auto *flags = top ? gps_->screentexpos_top_flag : gps_->screentexpos_flag;
            const size_t tile = static_cast<size_t>(field.start) * gps_->dimy + tabs_y;
            // TOP_OF_TEXT has a second native half immediately below it.
            if (flags && (flags[tile] & (1u << 3)))
                content_top = std::max(content_top, tabs_y + 2);
        }
        const auto grid = find_character_summary_grid(*gps_,
            fields.front().start, fields.back().end, content_top);
        if (!grid) continue;

        const long crossing = native_texture_interior_border_n_s_w_e(*gps_);
        const long footer = native_texture_interior_border_n_w_e(*gps_);
        const auto separator_at = [&](int y) {
            if (classic)
                return native_ui_skin_at(*gps_, grid->divider, y, crossing, true) ||
                    native_ui_skin_at(*gps_, grid->divider, y, footer, true);
            const long tile = texture_at(grid->divider, y);
            return (crossing > 0 && tile == crossing) || (footer > 0 && tile == footer);
        };
        std::vector<NativeTextCard> cards;
        bool age_present = false;
        for (int y = grid->top; y < grid->bottom; ++y) {
            // The verified grid's crossing rows are separators, never text.
            // A text-covered divider is still a content row. Source spans
            // may cross it, but both translated cards retain their own cell.
            if (separator_at(y)) continue;
            for (int column = 0; column < 2; ++column) {
                const int left = column == 0 ? grid->left : grid->divider + 1;
                const int right = column == 0 ? grid->divider : grid->right;
                auto card = capture_panel_text_card(SDL_Rect{left, y, right - left, 1});
                // The shared capture rejects nested frame edges, portraits
                // and controls, so a hover card cannot become summary text.
                if (!card) continue;
                card->interior = SDL_Rect{left, y, right - left, 1};
                if (column == 0 &&
                    std::any_of(card->rows.begin(), card->rows.end(),
                        [&](const NativeTextCardRow &row) { return is_age_row(row.source); }))
                    age_present = true;
                cards.push_back(std::move(*card));
            }
        }
        if (age_present) return cards;
    }
    return {};
}

void Overlay::append_character_overview_identities(
        const std::vector<NativeTextCard> &cards,
        std::vector<std::string> &screen_rows, std::vector<Match> &matches,
        int only_y) const {
#include "character_overview_draw_rows.inc"
    for (const auto &card : cards) {
        for (const auto &row : card.rows) {
            if (recovered_rows.contains(row.y)) continue;
            if (row.y < 0 || static_cast<size_t>(row.y) >= screen_rows.size()) continue;
            std::string &screen = screen_rows[static_cast<size_t>(row.y)];
            const int end = row.x + static_cast<int>(row.source.size());
            if (row.x < 0 || end > static_cast<int>(screen.size())) continue;

            // Graphical borders have no CP437 byte in the native text layer.
            // Give the matching COPY explicit boundaries at those verified
            // cell edges; no original screen byte or rendered border changes.
            // Otherwise a left-side identity and a right-side Brawler badge
            // can be proposed as one procedural name before row composition.
            for (int boundary : {card.interior.x - 1,
                                 card.interior.x + card.interior.w}) {
                if (boundary >= 0 && boundary < static_cast<int>(screen.size()))
                    screen[static_cast<size_t>(boundary)] = static_cast<char>(0xb3);
            }

            const std::string source = normalize_utterance(row.source);
            if (source.empty()) continue;
            auto target = exact_literal_translation("Character overview: " + source);
            if (!target) target = exact_literal_translation(source);
            if (!target) {
                target = translate_procedural_fragment(source);
                if (!target) target = translate_fortress_activity(source);
                if (!target) target = translate_ui_message_capture(source, true);
            }
            if (!target || target->empty()) continue;
            std::fill_n(screen.begin() + row.x, row.source.size(), ' ');
            if (only_y >= 0 && only_y != row.y) continue;
            Match match{row.x, row.y, static_cast<int>(row.source.size()),
                kCharacterOverviewRowRule, std::move(*target), row.source};
            if (translate_rated_skill_phrase(row.source)) match.rule = kRatedSkillRule;
            if (!row.foregrounds.empty())
                match.layout_foreground_rgb = row.foregrounds.front();
            matches.push_back(std::move(match));
        }
    }

    // A long native identity/activity can overwrite the divider and continue behind
    // the independently drawn right-hand field. Reading the final grid then
    // yields a broken item prefix + squad caption + item suffix. Recover the
    // actual draw, not a guessed completion of that prefix. The cards still
    // own layout; each surviving physical span separately owns suppression.
    if (cards.empty()) return;
    const auto draws = captured_native_drawn_text_rows();
    const auto settings = native_ui_settings();
    const bool classic = settings && settings->classic;
    const long vertical = native_texture_interior_border_n_s(*gps_);
    for (const auto &left_card : cards) {
        if (left_card.rows.size() != 1) continue;
        const auto &row = left_card.rows.front();
        if (recovered_rows.contains(row.y)) continue;
        const int divider = left_card.interior.x + left_card.interior.w;
        if (row.source.empty() || row.foregrounds.empty() ||
            row.x + static_cast<int>(row.source.size()) > divider)
            continue; // An already recovered identity has its own source span.
        const auto right_card = std::find_if(cards.begin(), cards.end(),
            [&](const NativeTextCard &card) {
                return card.interior.x == divider + 1 && card.interior.y == row.y &&
                    card.interior.h == 1;
            });
        const bool intact_divider = classic
            ? native_ui_skin_at(*gps_, divider, row.y, vertical, true)
            : native_ui_texture_at(*gps_, divider, row.y, vertical);
        if (!intact_divider && right_card == cards.end()) continue;
        // A surviving divider proves the native string stopped at that cell.
        // Its captured complete source can still supply the identity's meaning,
        // but it never owns the divider or the neighbouring summary field.
        const int right = intact_divider ? divider
            : right_card->interior.x + right_card->interior.w;
        for (size_t index = 0; index < draws.size(); ++index) {
            const auto &draw = draws[index];
            if (!draw.caption_source || draw.x != row.x || draw.y != row.y ||
                draw.source.size() <= static_cast<size_t>(divider - row.x) ||
                trim_view(std::string_view(draw.source).substr(0, divider - row.x)) !=
                    row.source) continue;
            const int end = std::min(right, draw.x + static_cast<int>(draw.source.size()));
            std::string visible;
            std::vector<int> colors;
            for (int x = draw.x; x < right; ++x) {
                bool top = false;
                const auto *cell = cell_at(x, row.y, &top);
                visible.push_back(cell && cell[0] ? cell[0] : ' ');
                colors.push_back(cell ? (cell[1] << 16) | (cell[2] << 8) | cell[3] : -1);
            }
            std::vector<bool> owned(static_cast<size_t>(end - draw.x), true);
            for (size_t later = index + 1; later < draws.size(); ++later) {
                const auto &other = draws[later];
                if (other.y != row.y || other.x <= divider || other.x >= end ||
                    other.source.empty()) continue;
                const int other_end = std::min(right,
                    other.x + static_cast<int>(other.source.size()));
                // Later right-cell labels may be one draw or several colored
                // label/value draws. Only their exact surviving bytes prove
                // which parts of the earlier activity they replaced.
                if (visible.compare(other.x - draw.x, other_end - other.x,
                        other.source, 0, other_end - other.x) != 0) continue;
                std::fill(owned.begin() + other.x - draw.x,
                    owned.begin() + std::min(end, other_end) - draw.x, false);
            }
            bool intact = true;
            for (int x = draw.x; x < end; ++x) {
                const size_t at = static_cast<size_t>(x - draw.x);
                if (!owned[at]) continue;
                if (visible[at] != draw.source[at] ||
                    (visible[at] != ' ' && colors[at] != row.foregrounds.front())) {
                    intact = false;
                    break;
                }
            }
            if (!intact) continue;
            // Named animals share this cell with ordinary activities. Their
            // state often crosses the divider, so parsing only the surviving
            // prefix leaves Kitten/(Tame) and the name as separate fragments.
            // Translate only a complete captured name plus a known creature
            // label; never complete a truncated caste or nickname by guessing.
            std::optional<std::string> target;
            const size_t comma = draw.source.find(',');
            if (comma != std::string::npos) {
                const auto creature = translate_creature_label(
                    std::string_view(draw.source).substr(comma + 1));
                if (creature) {
                    const auto name = translate_unit_identity(
                        std::string_view(draw.source).substr(0, comma), true);
                    if (name) target = *name + "，" + *creature;
                }
            }
            // Reuse the complete activity/item entry used by the task list
            // and character header, including material, quality and counts.
            if (!target) target = translate_fortress_activity(draw.source);
            if (!target || target->empty()) continue;

            bool first = true;
            for (int x = draw.x; x < end;) {
                if (!owned[static_cast<size_t>(x - draw.x)]) { ++x; continue; }
                const int begin = x++;
                // Never let a suppression-only tail become part of the
                // neighbouring caption's translation or cross a card edge.
                const int boundary = begin < divider ? divider
                    : begin == divider ? divider + 1 : end;
                while (x < boundary && owned[static_cast<size_t>(x - draw.x)]) ++x;
                Match span{begin, row.y, x - begin, kCharacterOverviewRowRule,
                    first ? *target : std::string{}, visible.substr(begin - draw.x, x - begin)};
                span.layout_foreground_rgb = row.foregrounds.front();
                if (first) {
                    span.layout_x = left_card.interior.x;
                    span.layout_length = left_card.interior.w;
                    span.layout_clip_right = divider;
                    span.layout_left = true;
                }
                // Only the matching copy is changed. The native glyph mask
                // byte-checks these original spans on both logical layers;
                // the grid texture and right-hand field remain untouched.
                std::fill_n(screen_rows[row.y].begin() + begin, x - begin, ' ');
                std::erase_if(matches, [&](const Match &match) {
                    return match.y == row.y && match.x < x && begin < match.x + match.length;
                });
                if (only_y < 0 || only_y == row.y) matches.push_back(std::move(span));
                first = false;
            }
            break;
        }
    }
}
