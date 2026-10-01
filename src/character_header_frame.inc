// Header ownership ends at the character tabs. A long summary entry below
// them can overwrite an outer edge without changing the intact header frame.
// Normally prove its two sides and complete top without borrowing a bottom
// frame or making the header depend on the currently selected content page.
static std::optional<std::string> character_header_name_prefix(std::string_view body) {
    body = trim_view(body);
    size_t space = body.find(' ');
    const size_t nickname = body.find('`');
    if (nickname != std::string_view::npos &&
        (space == std::string_view::npos || nickname <= space + 1)) {
        const size_t nickname_end = body.find('\'', nickname + 1);
        if (nickname_end == std::string_view::npos) return std::nullopt;
        space = body.find(' ', nickname_end + 1);
    }
    if (space == std::string_view::npos || space == 0 || space + 1 >= body.size())
        return std::nullopt;
    return std::string(body.substr(0, space + 1));
}

// The formatter owns the name's meaning; this adapter only binds its actual
// source bytes to the current row and the native quote decorations. A player's
// nickname may itself contain quotes, spaces or non-Latin text.
template <typename ReadChar>
static std::optional<LogicalTextField> character_header_bound_identity_field(
        const graphicst &gps, const NativeDrawnTextRow &draw, bool top_layer,
        int y, const std::vector<NativeClippedCaption> &clipped, ReadChar read_char,
        bool quoted) {
    if (!draw.unit_identity_owner || !draw.unit_identity_target || draw.source.empty() ||
            draw.x <= 0 || draw.x >= gps.dimx || y < 0 || y >= gps.dimy ||
            draw.y < 0 || draw.y >= gps.dimy) return std::nullopt;
    const auto layer_matches = [&](int x, int row) {
        // Transparent top spaces are still part of this captured name when
        // the underlying cell is equally empty, as for other native fields.
        return native_item_row_layer_at(gps, x, row, top_layer);
    };
    if (!layer_matches(draw.x, y) || !layer_matches(draw.x, draw.y))
        return std::nullopt;
    if (draw.y != y) {
        const auto *flags = top_layer ? gps.screentexpos_top_flag : gps.screentexpos_flag;
        if (!flags) return std::nullopt;
        const auto half_at = [&](int row) {
            return flags[static_cast<size_t>(draw.x) * gps.dimy + row] &
                ((1u << 3) | (1u << 4));
        };
        const auto half = half_at(draw.y);
        const int mate = half == (1u << 3) ? draw.y + 1
            : half == (1u << 4) ? draw.y - 1 : -1;
        if (y != mate || half_at(y) !=
                (half == (1u << 3) ? (1u << 4) : (1u << 3))) return std::nullopt;
    }
    std::string_view source = draw.source;
    const std::string_view complete = draw.complete_source.empty()
        ? std::string_view(draw.source) : std::string_view(draw.complete_source);
    for (const auto &caption : clipped) {
        if (caption.x == draw.x && caption.y == draw.y && caption.complete == complete) {
            source = caption.visible;
            break;
        }
    }
    if (source.empty()) return std::nullopt;
    const size_t available = std::min(source.size(), static_cast<size_t>(gps.dimx - draw.x));
    size_t length = 0;
    // A later widget can cover the tail of this memory-bound header field.
    // Its surviving source prefix still owns the complete translated name.
    for (; length < available; ++length) {
        const int x = draw.x + static_cast<int>(length);
        const auto visible = read_char(x, y);
        if (!layer_matches(x, y) ||
                (visible ? visible : ' ') != static_cast<unsigned char>(source[length]))
            break;
    }
    if (!length) return std::nullopt;
    const bool shortened = source != complete || length != source.size();
    source = source.substr(0, length);
    int first = draw.x, last = draw.x + static_cast<int>(length);
    std::string physical(source);
    if (quoted) {
        if (!layer_matches(first - 1, y) || read_char(first - 1, y) != '"')
            return std::nullopt;
        --first;
        physical.insert(physical.begin(), '"');
        // addchar draws the closing quote after the entire captured body.
        // Use that boundary, never the first quote inside authored text.
        const bool closing = last < gps.dimx && layer_matches(last, y) &&
            read_char(last, y) == '"';
        if (!closing && !shortened) return std::nullopt;
        if (closing) { ++last; physical += '"'; }
    }
    return LogicalTextField{first, last, std::move(physical)};
}

template <typename ReadChar>
static std::optional<AsciiPanelFrame> find_character_header_frame(
        const graphicst &gps, int first_x, int last_x, int tab_y,
        ReadChar read_char) {
    if (first_x <= 0 || last_x >= gps.dimx || first_x >= last_x ||
        tab_y <= 0 || tab_y >= gps.dimy) return std::nullopt;

    const NativePanelBorders borders(gps);
    std::vector<std::string> rows(static_cast<size_t>(tab_y + 1));
    const auto row_at = [&](int y) -> const std::string & {
        auto &row = rows[static_cast<size_t>(y)];
        if (row.empty()) {
            row.assign(static_cast<size_t>(gps.dimx), ' ');
            for (int x = 0; x < gps.dimx; ++x) {
                const auto ch = read_char(x, y);
                row[static_cast<size_t>(x)] = ch ? static_cast<char>(ch) : ' ';
            }
        }
        return row;
    };
    const auto edge = [&](int x, int y, int part, int left, int right) {
        const auto &row = row_at(y);
        if (borders.at(x, y, part, std::string_view(row),
                std::pair{left, right + 1})) return true;
        // Match the mixed single/double-line corners and side junctions
        // already accepted by the character ASCII frame readers. Preserve
        // the shared UTF-8/CP437 boundary proof before treating any byte as
        // artwork; a generated or authored name cannot supply a frame edge.
        const std::string_view span(row.data() + left,
            static_cast<size_t>(right - left + 1));
        if (!is_cp437_box_separator(span, static_cast<size_t>(x - left)))
            return false;
        const auto ch = static_cast<unsigned char>(row[static_cast<size_t>(x)]);
        switch (part) {
        case 0: return ch == 0xd5 || ch == 0xd6;
        case 2: return ch == 0xb7 || ch == 0xb8;
        case 3: return ch == 0xc3 || ch == 0xcc;
        case 5: return ch == 0xb4 || ch == 0xb9;
        default: return false;
        }
    };

    const std::array identity_draws{captured_native_drawn_text_rows(false),
        captured_native_drawn_text_rows(true)};
    const auto clipped_captions = captured_clipped_captions();
    // The quoted gloss and matching native name establish the header's text
    // column even when the gloss or a later activity overwrites the frame.
    const auto identity_field = [&](int left, int right, int y,
            bool crosses_right) -> std::optional<LogicalTextField> {
        for (size_t layer = 0; layer < identity_draws.size(); ++layer) {
            for (const auto &gloss : identity_draws[layer]) {
                if (!gloss.unit_identity_english) continue;
                const auto quoted = character_header_bound_identity_field(
                    gps, gloss, layer != 0, y, clipped_captions, read_char, true);
                if (!quoted || quoted->start <= left || quoted->start >= right) continue;
                if (gloss.unit_identity_header) {
                    // This exact sheet call owns the English header line.
                    // A covered tail or missing companion draw cannot revoke
                    // its identity or the full source's border-overflow proof.
                    const auto &complete = gloss.complete_source.empty()
                        ? gloss.source : gloss.complete_source;
                    const size_t complete_end = static_cast<size_t>(gloss.x) + complete.size() + 1;
                    if (!crosses_right || complete_end > static_cast<size_t>(right))
                        return quoted;
                    continue;
                }
                if (crosses_right && quoted->end <= right) continue;
                for (int above = y - 1; above >= 0; --above) {
                    if (edge(left, above, 0, left, right)) break;
                    for (size_t native_layer = 0; native_layer < identity_draws.size(); ++native_layer) {
                        for (const auto &native : identity_draws[native_layer]) {
                            if (native.unit_identity_english ||
                                    native.unit_identity_owner != gloss.unit_identity_owner) continue;
                            const auto field = character_header_bound_identity_field(gps,
                                native, native_layer != 0, above, clipped_captions, read_char, false);
                            if (field && field->start > left && field->end <= right) return field;
                        }
                    }
                }
            }
        }
        const auto &row = row_at(y);
        const size_t opening = row.find('"', left + 1);
        if (opening == std::string::npos || opening >= static_cast<size_t>(right))
            return std::nullopt;
        const size_t closing = row.find('"', opening + 1);
        if (closing == std::string::npos ||
            (crosses_right && closing < static_cast<size_t>(right)))
            return std::nullopt;
        const auto body = trim_view(std::string_view(row).substr(
            opening + 1, closing - opening - 1));
        const auto prefix = character_header_name_prefix(body);
        if (!prefix || !generated_title_shape(body)) return std::nullopt;
        for (int above = y - 1; above >= 0; --above) {
            if (edge(left, above, 0, left, right)) break;
            for (const auto &field : split_text_fields(row_at(above))) {
                if (field.start > left && field.end <= right &&
                    field.text.size() > prefix->size() && field.text.starts_with(*prefix))
                    return field;
            }
        }
        return std::nullopt;
    };
    const auto activity_covers_right_edge = [&](int left, int right, int y) {
        for (const auto &field : split_text_fields(row_at(y))) {
            if (field.start <= left || field.start >= right || field.end <= right)
                continue;
            for (int above = y - 1; above >= 0; --above) {
                if (edge(left, above, 0, left, right)) break;
                const auto identity = identity_field(left, right, above, false);
                if (!identity || field.start < identity->start - 2 ||
                    field.start > identity->start + 2)
                    continue;
                // DF separates the current activity from the identity at
                // their text column. A captured gloss can extend across the
                // right frame into the map; its full source width is not the
                // width of that separator. Nearby header buttons also remain
                // present on this row. Require the gap at both aligned text
                // origins without borrowing the gloss's overflowing tail.
                const int column_first = std::min(identity->start, field.start);
                const int column_end = std::max(identity->start, field.start) + 1;
                for (int spacer = above + 1; spacer < y; ++spacer) {
                    const auto span = std::string_view(row_at(spacer)).substr(
                        column_first, column_end - column_first);
                    if (span.find_first_not_of(' ') == std::string_view::npos)
                        return true;
                }
            }
        }
        return false;
    };

    // A nearby tab shoulder or portrait cannot enclose the entire band.
    // Keep continuous sides except for proven identity/activity text, all the
    // way to matching top corners and a complete horizontal edge between them.
    for (int left = first_x - 1; left >= 0; --left) {
        if (!edge(left, tab_y, 3, left, gps.dimx - 1)) continue;
        for (int right = last_x; right < gps.dimx; ++right) {
            if (!edge(right, tab_y, 5, left, right)) continue;
            for (int top = tab_y - 1; top >= 0; --top) {
                if (edge(left, top, 0, left, right) &&
                    edge(right, top, 2, left, right)) {
                    bool complete = true;
                    for (int x = left + 1; x < right; ++x) {
                        if (!edge(x, top, 1, left, right)) {
                            complete = false;
                            break;
                        }
                    }
                    if (complete) return AsciiPanelFrame{left, top, right, tab_y};
                    break;
                }
                if (!edge(left, top, 3, left, right) ||
                    (!edge(right, top, 5, left, right) &&
                     !identity_field(left, right, top, true) &&
                     !activity_covers_right_edge(left, right, top))) break;
            }
        }
    }

    // A widened header can leave the viewport through a rightward shoulder:
    // the content's right side turns into a top-left corner whose horizontal
    // edge continues off-screen, and the higher header top does the same.
    // Only this clipped shape borrows the fully closed content frame below
    // the tabs. Keep its narrower right edge as the safe text/layout limit.
    const auto content = find_graphical_character_panel_frame(
        gps, first_x, last_x, tab_y);
    if (!content) return std::nullopt;
    const int left = content->left, right = content->right;
    const auto horizontal_to_screen_edge = [&](int start, int y) {
        for (int x = start; x < gps.dimx; ++x)
            if (!edge(x, y, 1, left, gps.dimx - 1)) return false;
        return start < gps.dimx;
    };
    bool right_clipped = false;
    for (int top = tab_y - 1; top >= 0; --top) {
        if (right_clipped && edge(left, top, 0, left, gps.dimx - 1)) {
            if (horizontal_to_screen_edge(left + 1, top))
                return AsciiPanelFrame{left, top, right, tab_y};
            return std::nullopt;
        }
        if (!edge(left, top, 3, left, gps.dimx - 1)) return std::nullopt;
        if (right_clipped) continue;
        // A top-left corner joins a downward side to a rightward top edge;
        // a top-right corner would point back into the content instead. At
        // the final screen column that outward corner itself proves clipping.
        if (edge(right, top, 0, left, gps.dimx - 1) &&
                (right == gps.dimx - 1 || horizontal_to_screen_edge(right + 1, top))) {
            right_clipped = true;
            continue;
        }
        if (!edge(right, top, 5, left, right) &&
                !identity_field(left, right, top, true) &&
                !activity_covers_right_edge(left, right, top)) return std::nullopt;
    }
    return std::nullopt;
}
