// Workshop previews contain whole recipe fields followed by optional RAW
// description paragraphs. Recover the native field boundary before translating
// it; neither the English wrap width nor a short translated prefix defines it.
void Overlay::append_workshop_recipe_card(const NativeTextCard &card,
        std::vector<std::string> &rows, std::vector<Match> &matches, int only_y) const {
    if (card.rows.empty()) return;
    const int right = card.interior.x + card.interior.w;
    const auto identity = [](std::string_view text) {
        std::string result;
        for (unsigned char ch : text) {
            if (ch == ' ' || ch == '\t' || ch == '\r' || ch == '\n') continue;
            result += static_cast<char>(ch >= 'A' && ch <= 'Z' ? ch - 'A' + 'a' : ch);
        }
        return result;
    };
    const auto heading = [](std::string_view text) {
        return text == "Produces:" || text == "Requires:";
    };
    const auto counted = [](std::string_view text) {
        return !text.empty() && text.front() >= '0' && text.front() <= '9';
    };
    constexpr uint32_t upper = 1u << 3, lower_half = 1u << 4;
    const auto half = [&](const NativeTextCardRow &row, uint32_t expected) {
        for (size_t i = 0; i < row.source.size(); ++i) {
            if (row.source[i] == ' ') continue;
            bool top = false;
            const auto *cell = cell_at(row.x + static_cast<int>(i), row.y, &top);
            const auto *flags = top ? gps_->screentexpos_top_flag : gps_->screentexpos_flag;
            const size_t tile = static_cast<size_t>(row.x + static_cast<int>(i)) * gps_->dimy + row.y;
            if (!cell || !flags || cell[0] != static_cast<unsigned char>(row.source[i]) ||
                (flags[tile] & (upper | lower_half)) != expected) return false;
        }
        return true;
    };
    struct Line { size_t first, last; };
    std::vector<Line> logical;
    for (size_t i = 0; i < card.rows.size(); ++i) {
        const size_t first = i;
        const auto &row = card.rows[i];
        if (i + 1 < card.rows.size() && card.rows[i + 1].x == row.x &&
            card.rows[i + 1].y == row.y + 1 && card.rows[i + 1].source == row.source &&
            half(row, upper) && half(card.rows[i + 1], lower_half)) ++i;
        logical.push_back({first, i});
    }
    auto captures = captured_native_workshop_requirements();
    const auto paragraphs = captured_native_paragraphs();
    captures.insert(captures.end(), paragraphs.begin(), paragraphs.end());
    const int native_width = native_workshop_recipe_paragraph_width();
    const auto match_capture = [&](const NativeParagraphCapture &capture, size_t begin) {
        if (capture.wrapped_lines.empty() || capture.paragraph_width > card.interior.w ||
            (native_width > 0 && capture.paragraph_width != native_width)) return SIZE_MAX;
        size_t next = begin;
        std::string reconstructed;
        for (const auto &wrapped : capture.wrapped_lines) {
            if (trim_view(wrapped).empty()) continue;
            if (next >= logical.size()) return SIZE_MAX;
            const auto &row = card.rows[logical[next].first];
            if (heading(row.source) || identity(row.source) != identity(wrapped) ||
                (next > begin && row.y != card.rows[logical[next - 1].last].y + 1)) return SIZE_MAX;
            reconstructed += row.source;
            ++next;
        }
        return next > begin && identity(reconstructed) == identity(capture.source) ? next : SIZE_MAX;
    };
    // A generated type can be absent from every native language dictionary.
    // Learn its name only from a fully parsed description actually displayed
    // in this card, before translating its product and requirement fields.
    for (const auto &capture : captures) {
        if (capture.source.find("instrument") == std::string::npos) continue;
        for (size_t begin = 0; begin < logical.size(); ++begin) {
            if (match_capture(capture, begin) == SIZE_MAX) continue;
            (void)translate_instrument_description(capture.source, true);
            break;
        }
    }
    const auto translate = [&](std::string_view source) -> std::optional<std::string> {
        // Recipe constraints must pass through the typed noun grammar before
        // the tooltip catalog's legacy literal fallback. Historical complete
        // phrases can omit a capability or keep a redundant body-part noun.
        if (auto recipe = translate_workshop_recipe_source(source)) return recipe;
        if (auto prose = translate_toolbar_tooltip(source, true); !prose.empty()) return prose;
        return std::nullopt;
    };
    for (size_t begin = 0; begin < logical.size();) {
        const auto &first = card.rows[logical[begin].first];
        size_t end = begin + 1;
        std::string source = first.source;
        std::optional<std::string> target;
        bool native_boundary = false;
        if (heading(source)) {
            target = exact_literal_translation(source);
        } else {
            // A capture is accepted only when every native wrap row is still
            // visible in this closed card, including the end of the field.
            // A previous hover with a common first line supplies no evidence.
            for (auto capture = captures.rbegin(); capture != captures.rend(); ++capture) {
                const size_t next = match_capture(*capture, begin);
                if (next == SIZE_MAX || (native_boundary && next <= end)) continue;
                end = next;
                source = capture->source;
                target = translate(source);
                native_boundary = true;
            }
            if (!native_boundary) {
                // Already-open cards can predate capture (e.g. after core
                // reload). Reconstruct complete adjacent fields using the
                // shared grammar only at a field boundary: a new count,
                // heading or blank row. A translatable prefix alone does
                // not prove that an unknown continuation is another field.
                std::string candidate;
                size_t next = begin;
                for (; next < logical.size(); ++next) {
                    const auto &row = card.rows[logical[next].first];
                    if (heading(row.source) || (next > begin &&
                        (counted(row.source) || row.y != card.rows[logical[next - 1].last].y + 1))) break;
                    if (!candidate.empty()) candidate += ' ';
                    candidate += row.source;
                }
                source = std::move(candidate);
                end = next;
                target = translate(source);
            }
        }
        std::vector<Match> spans;
        for (size_t line = begin; line < end; ++line) {
            const auto &row = card.rows[logical[line].first];
            Match span{row.x, row.y, static_cast<int>(row.source.size()),
                kWorkshopRecipeRowRule, {}, row.source};
            span.layout_foreground_rgb = row.foregrounds.front();
            spans.push_back(std::move(span));
        }
        const size_t output_begin = matches.size();
        const int left = card.interior.x + (heading(first.source) ? 0 : 1);
        const bool rendered = target && !target->empty() && append_bounded_paragraph(
            spans, *target, rows, matches, only_y, right, right, {}, false, left);
        if (!rendered) {
            // Keep the whole original field together if a new mod introduces
            // unknown prose. Its complete source enters the review queue;
            // generic word substitution must not make a mixed-language card.
            for (auto &span : spans) {
                span.target = native_text_to_utf8(span.source);
                span.native_hover_untranslated = true;
                span.native_help_review_source = source;
                span.layout_x = left;
                span.layout_length = right - left;
                span.layout_clip_right = right;
                span.layout_left = true;
                if (only_y < 0 || only_y == span.y) matches.push_back(std::move(span));
            }
        }
        for (size_t index = output_begin; index < matches.size(); ++index) {
            auto &match = matches[index];
            // Expanded Chinese rows keep their measured pixel baselines.
            // Their native source anchor is only for suppression and color.
            if (rendered) continue;
            const auto line = std::find_if(logical.begin() + begin, logical.begin() + end,
                [&](const Line &entry) { return card.rows[entry.first].y == match.y; });
            if (line == logical.begin() + end) continue;
            match.layout_y = match.y;
            match.layout_fixed_baseline = true;
            if (line->first != line->last) {
                match.layout_pixel_y = gps_->tile_pixel_y / 2;
                match.native_split_text = true;
                match.native_split_top_y = match.y;
            }
        }
        for (size_t line = begin; line < end; ++line) {
            for (size_t physical = logical[line].first; physical <= logical[line].last; ++physical) {
                const auto &row = card.rows[physical];
                std::fill_n(rows[row.y].begin() + row.x, row.source.size(), ' ');
                if (physical == logical[line].first) continue;
                Match duplicate{row.x, row.y, static_cast<int>(row.source.size()),
                    kWorkshopRecipeRowRule, {}, row.source};
                duplicate.native_split_duplicate = true;
                if (only_y < 0 || only_y == row.y) matches.push_back(std::move(duplicate));
            }
        }
        begin = end;
    }
}
