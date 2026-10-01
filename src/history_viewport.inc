// Project native event tokens into the current viewport. Glyph comparisons
// only verify ownership; event identity and meaning come from the snapshot.
NativeHistoryViewport Overlay::capture_history_viewport(
        const std::vector<std::string> &context, int left, int right,
        int top, int bottom, const unsigned char *screen_override) const {
    NativeHistoryViewport result;
    if (!gps_ || left < 0 || right > gps_->dimx || left >= right ||
            top < 0 || bottom > gps_->dimy || top >= bottom ||
            context.size() != static_cast<size_t>(gps_->dimy)) return result;
    const auto history_draws = captured_native_history_draws();
    const auto history_unbound = captured_native_history_unbound_draws();
    const uintptr_t legends_owner = native_history_legends_owner();
    std::map<uint64_t, std::shared_ptr<NativeHistoryDocument>> history_copies;
    std::map<uint64_t, std::set<size_t>> history_confirmed;
    std::map<uint64_t, std::set<size_t>> history_hidden;
    std::map<uint64_t, std::set<int>> history_owned_rows;
    std::map<uint64_t, std::pair<int64_t, int64_t>> history_offsets;
    std::map<int, uint64_t> history_row_sequences;
    std::map<std::pair<int, int>, uint64_t> history_cell_sequences;
    std::set<uint64_t> history_conflicts;
    std::map<int, std::string> history_row_gaps;
    size_t visible_draw_count = 0;
    // The native producer/parser can confirm an event region even when its
    // semantic snapshot is missing. Its actual token draws still reserve
    // those rows; absence from the document registry is not permission to
    // send a historical event through the English paragraph grammar.
    for (const auto &draw : history_unbound) {
        const int64_t ink_left = std::max({draw.x, draw.clip_left, left});
        const int64_t ink_right = std::min<int64_t>(
            int64_t(draw.x) + int64_t(draw.source.size()), std::min(draw.clip_right, right));
        if ((legends_owner && draw.owner != legends_owner) || draw.source.empty() ||
                draw.y < top || draw.y >= bottom || ink_left >= ink_right ||
                ink_left >= right || ink_right <= left) continue;
        history_row_gaps[draw.y] = "event-snapshot-unavailable";
    }
    for (const auto &draw : history_draws) {
        if (!draw.document || draw.token_index >= draw.document->tokens.size() ||
            (legends_owner && draw.document->owner != legends_owner) ||
            draw.y < top || draw.y >= bottom)
            continue;
        const auto &token = draw.document->tokens[draw.token_index];
        if (token.source.empty()) continue;
        // The caller supplies the current text viewport, excluding native
        // controls painted over text after addst (notably the scrollbar).
        // Intersect it with addst's own clip; neither hidden region owns ink.
        const int ink_left = std::max({draw.x, draw.clip_left, left});
        const int ink_right = static_cast<int>(std::min<int64_t>(
            int64_t(draw.x) + int64_t(token.source.size()), std::min(draw.clip_right, right)));
        if (ink_left < ink_right && ink_left < right && ink_right > left)
            ++visible_draw_count;
        const uint64_t sequence = draw.document->sequence;
        const std::pair<int64_t, int64_t> offset{
            int64_t(draw.x) - token.x, int64_t(draw.y) - token.y};
        const auto [transform, transformed] = history_offsets.emplace(sequence, offset);
        if (!transformed && transform->second != offset)
            history_conflicts.insert(sequence);
        if (ink_left >= ink_right) {
            history_hidden[sequence].insert(draw.token_index);
            continue;
        }
        // The native source identity is already complete. Verify every byte
        // still visible inside the captured clip/text viewport, never guess a missing
        // suffix from screen text or accept an arbitrary partial-word match.
        if (context[draw.y].compare(ink_left, ink_right - ink_left, token.source,
                    ink_left - draw.x, ink_right - ink_left) != 0) {
            if (ink_left < right && ink_right > left) {
                history_row_gaps[draw.y] = "event-draw-unconfirmed";
                history_conflicts.insert(sequence);
            }
            continue;
        }
        auto &copy = history_copies[sequence];
        if (!copy) copy = std::make_shared<NativeHistoryDocument>(*draw.document);
        auto &owned = copy->tokens[draw.token_index];
        bool upper_layer = false;
        const auto *cell = screen_override
            ? screen_override + (static_cast<size_t>(ink_left) * gps_->dimy + draw.y) * 8
            : cell_at(ink_left, draw.y, &upper_layer);
        if (cell) owned.color = (cell[1] << 16) | (cell[2] << 8) | cell[3];
        owned.x = ink_left;
        owned.y = draw.y;
        if (!history_confirmed[sequence].insert(draw.token_index).second)
            history_conflicts.insert(sequence);
        history_owned_rows[sequence].insert(draw.y);
        const auto [row, inserted] = history_row_sequences.emplace(draw.y, sequence);
        if (!inserted && row->second != sequence) {
            history_conflicts.insert(sequence);
            history_conflicts.insert(row->second);
        }
        for (int x = ink_left; x < ink_right; ++x) {
            const auto [cell_owner, claimed] = history_cell_sequences.emplace(
                std::make_pair(x, draw.y), sequence);
            if (!claimed) {
                history_conflicts.insert(sequence);
                history_conflicts.insert(cell_owner->second);
            }
        }
    }
    std::map<int, std::shared_ptr<const NativeHistoryDocument>> history_rows;
    std::map<uint64_t, std::pair<size_t, size_t>> history_visible_tokens;
    std::map<uint64_t, NativeParagraphViewport> history_viewports;
    for (const auto &[sequence, document] : history_copies) {
        const auto &confirmed = history_confirmed.at(sequence);
        const auto [dx, dy] = history_offsets.at(sequence);
        size_t begin = *confirmed.begin(), end = *confirmed.rbegin() + 1;
        while (begin && trim_view(document->tokens[begin - 1].source).empty()) --begin;
        while (end < document->tokens.size() &&
                trim_view(document->tokens[end].source).empty()) ++end;
        const int first_row = *history_owned_rows[sequence].begin();
        const int last_row = *history_owned_rows[sequence].rbegin();
        bool complete = !history_conflicts.contains(sequence);
        // Unconfirmed tokens still carry box-local positions.
        // Only a true prefix/suffix outside the viewport may be
        // absent. A token observed wholly outside the native text viewport has no
        // glyphs to verify; other missing tokens and interior holes conflict.
        for (size_t index = 0; complete && index < document->tokens.size(); ++index) {
            const auto &token = document->tokens[index];
            if (trim_view(token.source).empty() || confirmed.contains(index) ||
                    history_hidden[sequence].contains(index)) continue;
            const int64_t x = int64_t(token.x) + dx, y = int64_t(token.y) + dy;
            if ((index >= begin && index < end) ||
                (index < begin && y >= top) ||
                (index >= end && y < bottom) ||
                (y >= top && y < bottom &&
                    x < right && x + int64_t(token.source.size()) > left))
                complete = false;
        }
        // A supported token cannot claim an entire row that
        // also contains an uncaptured event or stale glyphs.
        for (int y = first_row; y <= last_row; ++y) {
            if (history_row_gaps.contains(y)) complete = false;
            for (int x = left; complete && x < right; ++x) {
                if (context[y][x] == ' ') continue;
                const auto owner = history_cell_sequences.find({x, y});
                if (owner == history_cell_sequences.end() || owner->second != sequence)
                    complete = false;
            }
        }
        if (!complete) {
            for (int y : history_owned_rows[sequence])
                history_row_gaps[y] = "token-ownership-conflict";
            // A failed line may have no confirmed token of its own. The
            // other draws still establish this record's viewport transform.
            for (size_t index = 0; index < document->tokens.size(); ++index) {
                const auto &token = document->tokens[index];
                if (trim_view(token.source).empty()) continue;
                const int64_t x = token.x + (confirmed.contains(index) ? 0 : dx);
                const int64_t y = token.y + (confirmed.contains(index) ? 0 : dy);
                if (y >= top && y < bottom && x < right &&
                        x + int64_t(token.source.size()) > left)
                    history_row_gaps[static_cast<int>(y)] = "token-ownership-conflict";
            }
            continue;
        }
        history_visible_tokens[sequence] = {begin, end};
        int64_t complete_first = INT64_MAX, complete_last = INT64_MIN;
        for (size_t index = 0; index < document->tokens.size(); ++index) {
            const auto &token = document->tokens[index];
            if (trim_view(token.source).empty()) continue;
            const int64_t y = token.y + (confirmed.contains(index) ? 0 : dy);
            complete_first = std::min(complete_first, y);
            complete_last = std::max(complete_last, y);
        }
        if (complete_first > first_row || complete_last < last_row ||
                complete_last - complete_first >= 16384) {
            for (int y : history_owned_rows[sequence])
                history_row_gaps[y] = "event-viewport-unconfirmed";
            continue;
        }
        history_viewports[sequence] = {
            static_cast<int>(first_row - complete_first),
            static_cast<int>(complete_last - complete_first + 1)};
        // Keep every token in the same coordinate space. Hidden tokens used
        // to retain box-local y values, which could look like visible link
        // positions once a clipped event was allowed to translate in full.
        for (size_t index = 0; index < document->tokens.size(); ++index) {
            if (confirmed.contains(index)) continue;
            auto &token = document->tokens[index];
            // A completely clipped link has no live mouse target, even
            // though its full identity participates in semantic translation.
            token.x = history_hidden[sequence].contains(index) ? -1 :
                static_cast<int>(int64_t(token.x) + dx);
            token.y = static_cast<int>(int64_t(token.y) + dy);
        }
        for (int y = first_row; y <= last_row; ++y) history_rows[y] = document;
    }
    std::set<uint64_t> rejected_sequences;
    for (const auto &[y, document] : history_rows)
        if (history_row_gaps.contains(y)) rejected_sequences.insert(document->sequence);
    for (auto it = history_rows.begin(); it != history_rows.end();) {
        if (!rejected_sequences.contains(it->second->sequence)) { ++it; continue; }
        history_row_gaps[it->first] = "token-ownership-conflict";
        it = history_rows.erase(it);
    }
    result.rows = std::move(history_rows);
    result.visible_tokens = std::move(history_visible_tokens);
    result.viewports = std::move(history_viewports);
    result.gaps = std::move(history_row_gaps);
    // Retained draws from another tab are not observations of this page.
    result.draw_count = visible_draw_count;
    result.record_count = history_copies.size();
    return result;
}

std::shared_ptr<LegendsTextFlow> Overlay::translate_history_flow(
        const NativeHistoryDocument &document, const std::vector<int> &rows,
        const std::vector<std::string> &context, int left, int right,
        const NativeParagraphViewport &viewport) const {
    if (rows.empty() || viewport.first_line < 0 || viewport.total_lines <= 0 ||
            int64_t(viewport.first_line) + int64_t(rows.size()) > viewport.total_lines) return {};
    const auto translated = translate_history_event(document);
    if (!translated || translated->empty()) return {};
    auto flow = std::make_shared<LegendsTextFlow>();
    flow->native_first_line = viewport.first_line;
    flow->native_total_lines = viewport.total_lines;
    for (int y : rows) flow->source_rows.emplace_back(y, context[y]);
    const NativeHistoryToken *neutral = nullptr;
    const NativeHistoryToken *neutral_color = nullptr;
    for (const auto &token : document.tokens)
        if (token.link_type < 0 && !trim_view(token.source).empty()) {
            if (!neutral_color) neutral_color = &token;
            if (token.x >= left && token.x < right &&
                    std::binary_search(rows.begin(), rows.end(), token.y)) {
                neutral = &token;
                break;
            }
        }
    flow->pieces = *translated;
    for (auto &piece : flow->pieces) {
        const NativeHistoryToken *anchor = neutral;
        const NativeHistoryToken *color = neutral ? neutral : neutral_color;
        if (piece.native_link_type >= 0) {
            anchor = nullptr;
            color = nullptr;
            for (const auto &token : document.tokens) {
                if (token.link_type != piece.native_link_type ||
                        token.link_id != piece.native_link_id ||
                        (piece.native_link_subid >= 0 && token.link_subid != piece.native_link_subid) ||
                        trim_view(token.source).empty()) continue;
                if (!color) color = &token;
                if (token.x < left || token.x >= right ||
                        !std::binary_search(rows.begin(), rows.end(), token.y)) continue;
                anchor = &token;
                color = &token;
                break;
            }
        }
        // A hidden native link cannot supply a live click position. Its
        // structured text and color still participate in complete layout;
        // the selected Chinese window may display it without a link.
        piece.native_x = anchor ? anchor->x : -1;
        piece.native_y = anchor ? anchor->y : -1;
        if (color) piece.foreground_rgb = color->color;
    }
    return flow;
}
