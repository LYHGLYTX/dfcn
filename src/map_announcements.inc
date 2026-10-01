// Included in find_matches after the current closed map card is captured.
// Adventure speech shares that frame with map hover prose, but its native
// text margin also reserves a portrait. Resolve records before row-level
// composition, keeping original physical spans for glyph suppression.
    if (map_hover) {
        auto &card = *map_hover;
        const int right = card.interior.x + card.interior.w;
        const auto announcements = native_announcement_sources();
        const auto &originals = announcements->sorted_originals;
        const auto record_prefix = [&](std::string_view source) {
            const auto found = originals.lower_bound(source);
            return found != originals.end() && found->starts_with(source);
        };
        bool dialogue_card = false;
        for (size_t begin = 0; begin < card.rows.size(); ++begin) {
            const auto &first = card.rows[begin];
            std::vector<Match> spans;
            std::vector<int> colors;
            std::string source;
            bool submitted = false;
            bool changed_margin = false;
            bool centered = true;
            bool centering_observed = false;
            size_t end = begin;
            for (; end < card.rows.size(); ++end) {
                const auto &row = card.rows[end];
                if (row.y != first.y + static_cast<int>(end - begin) ||
                    row.x + static_cast<int>(row.source.size()) > right ||
                    (!row.complete_source.empty() && row.complete_source != row.source) ||
                    screen_rows[row.y].compare(row.x, row.source.size(), row.source) != 0)
                    break;
                bool visible = true;
                for (size_t i = 0; i < row.source.size(); ++i) {
                    // Transparent spaces have no glyph to suppress and may
                    // belong to the base layer between top-layer words.
                    if (std::isspace(static_cast<unsigned char>(row.source[i]))) continue;
                    bool top = false;
                    cell_at(row.x + static_cast<int>(i), row.y, &top);
                    if (screen_override &&
                        screen_override != (top ? gps_->screen_top : gps_->screen))
                        visible = false;
                }
                if (!visible) break;
                const std::string joined = source.empty() ? row.source : source + ' ' + row.source;
                const auto normalized = native_announcement_display_source(joined);
                if (end > begin && !record_prefix(normalized)) {
                    // Native notifications center each wrapped line, so a
                    // recorded continuation need not share the first x.
                    // Without that source proof, retain the speech margin,
                    // color and speaker boundaries.
                    const auto colon = row.source.find(": ");
                    const bool speaker_caption = colon != std::string::npos &&
                        row.source.substr(0, colon).find_first_of(".!?") == std::string::npos;
                    if (row.x != first.x || speaker_caption ||
                        row.foregrounds.front() != colors.front()) break;
                }
                if (!source.empty()) colors.push_back(colors.back());
                source = joined;
                colors.insert(colors.end(), row.foregrounds.begin(), row.foregrounds.end());
                spans.push_back({row.x, row.y, static_cast<int>(row.source.size()),
                    kUiMessageRule, {}, row.source});
                changed_margin = changed_margin || row.x != first.x;
                centered = centered && std::abs(2 * (row.x - card.interior.x) +
                    static_cast<int>(row.source.size()) - card.interior.w) <= 1;
                centering_observed = centering_observed || row.centered;
                submitted = announcements->originals.contains(normalized);
                if (submitted) { ++end; break; }
            }
            // Submitted combat, status and dialogue records share one full
            // parser. Only the uncaptured speech fallback needs a caption.
            if (spans.empty() || (!submitted &&
                    (changed_margin || source.find(": ") == std::string::npos))) continue;
            std::vector<int> target_colors;
            std::optional<std::string> target;
            bool dialogue = false;
            if (submitted) {
                target = translate_complete_announcement(source, colors, target_colors);
                dialogue = source.find(": ") != std::string::npos;
            } else {
                // A core reload can precede the next submission. The current
                // complete ACTOR: BODY grammar still proves a speech record;
                // a colon or a successfully translated tail alone does not.
                bool uniform = true;
                for (size_t at = 0; at < source.size(); ++at)
                    if (!std::isspace(static_cast<unsigned char>(source[at])) &&
                        colors[at] != colors.front()) uniform = false;
                if (uniform) target = translate_announcement_dialogue(source);
                dialogue = target.has_value();
                if (target)
                    for (unsigned char ch : *target)
                        if ((ch & 0xc0) != 0x80) target_colors.push_back(colors.front());
            }
            if (!submitted && !target) continue;
            dialogue_card = dialogue_card || dialogue;
            centered = centered && centering_observed && !dialogue;
            const size_t first_match = result.size();
            if (!target || !append_bounded_paragraph(spans, *target, screen_rows,
                    result, only_y, right, right, target_colors, false,
                    centered ? card.interior.x : first.x)) {
                // An unknown record remains whole and visible. Do not allow
                // generic UI words to consume just its easiest sentence.
                spans.front().native_help_review_source = source;
                for (auto &span : spans) {
                    span.native_help_source_only = true;
                    std::fill_n(screen_rows[span.y].begin() + span.x, span.length, ' ');
                    untranslated_help_rows.push_back(std::move(span));
                }
            } else if (centered) {
                // Reflow within the native frame and center the translated
                // lines there; each original row still owns its exact glyphs.
                for (size_t at = first_match; at < result.size(); ++at)
                    result[at].layout_left = false;
            }
            begin = end - 1;
        }
        if (dialogue_card) {
            // The portrait is asymmetric: reserve the observed text inset,
            // but keep the full right interior edge. Unhandled rows use this
            // same margin, and accidental equal whitespace is not centering.
            int left = right;
            for (auto &row : card.rows) {
                left = std::min(left, row.x);
                row.centered = false;
            }
            card.interior.x = left;
            card.interior.w = right - left;
        }
    }
