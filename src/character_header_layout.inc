// The character widget owns header layout regardless of which translator
// produced a field. Generic names, quoted glosses, literal professions and
// typed activities must all participate in the same native text column.
void Overlay::layout_character_header(SDL_Renderer *renderer) {
    if (!gps_ || !renderer || !face_ || gps_->tile_pixel_x <= 0 ||
        gps_->tile_pixel_y <= 0) return;

    const auto settings = native_ui_settings();
    const auto read_char = [&](int x, int y) -> unsigned char {
        if (!settings || !settings->classic) return visible_char_at(x, y);
        bool top = false;
        const auto *cell = cell_at(x, y, &top);
        return cell && cell[0] ? cell[0] : ' ';
    };
    const auto read_row = [&](int y) {
        std::string row(static_cast<size_t>(gps_->dimx), ' ');
        for (int x = 0; x < gps_->dimx; ++x) {
            const auto ch = read_char(x, y);
            row[static_cast<size_t>(x)] = ch ? ch : ' ';
        }
        return row;
    };
    std::optional<AsciiPanelFrame> header;
    for (int y = 0; y < gps_->dimy && !header; ++y) {
        const auto tabs = character_information_tab_fields(read_row(y));
        if (tabs.empty()) continue;
        header = find_character_header_frame(*gps_, tabs.front().start,
            tabs.back().end, y, read_char);
    }
    int first_y = header ? header->top + 1 : -1;
    int bottom = header ? header->bottom : -1;
    std::vector<std::vector<LogicalTextField>> owned_fields;
    if (header) {
        for (int y = first_y; y < bottom; ++y) {
            const auto social = character_social_tab_fields(read_row(y));
            if (!social.empty() && social.front().start > header->left &&
                social.back().end <= header->right) {
                bottom = y;
                break;
            }
        }
    } else {
        // Portraits and action buttons can interrupt the outer frame. The
        // sheet formatter and its matching unit still own the text column;
        // bind their current source bytes instead of requiring that frame.
        const std::array draws{captured_native_drawn_text_rows(false),
            captured_native_drawn_text_rows(true)};
        const auto clipped = captured_clipped_captions();
        for (size_t layer = 0; layer < draws.size() && first_y < 0; ++layer) {
            for (const auto &gloss : draws[layer]) {
                if (!gloss.unit_identity_header || !gloss.unit_identity_english)
                    continue;
                std::vector<std::pair<int, LogicalTextField>> identity_fields;
                int quote_top = gps_->dimy, quote_bottom = -1;
                int column = gps_->dimx;
                for (int y = std::max(0, gloss.y - 1);
                        y <= std::min(gps_->dimy - 1, gloss.y + 1); ++y) {
                    const auto field = character_header_bound_identity_field(*gps_,
                        gloss, layer != 0, y, clipped, read_char, true);
                    if (!field || native_button_text_rect(*gps_,
                            field->start, field->end, y)) continue;
                    identity_fields.emplace_back(y, *field);
                    quote_top = std::min(quote_top, y);
                    quote_bottom = std::max(quote_bottom, y);
                    column = std::min(column, field->start);
                }
                if (identity_fields.empty()) continue;

                int name_top = -1, name_bottom = -1, name_left = column;
                std::vector<std::pair<int, LogicalTextField>> name_fields;
                for (size_t native_layer = 0; native_layer < draws.size(); ++native_layer) {
                    for (const auto &native : draws[native_layer]) {
                        if (native.unit_identity_english ||
                                native.unit_identity_owner != gloss.unit_identity_owner)
                            continue;
                        std::vector<std::pair<int, LogicalTextField>> candidate;
                        int candidate_top = gps_->dimy, candidate_bottom = -1;
                        int candidate_left = column;
                        for (int y = std::max(0, native.y - 1);
                                y <= std::min(quote_top - 1, native.y + 1); ++y) {
                            const auto field = character_header_bound_identity_field(*gps_,
                                native, native_layer != 0, y, clipped, read_char, false);
                            if (!field || field->start < column - 2 ||
                                    field->start > column + 2 || native_button_text_rect(
                                        *gps_, field->start, field->end, y)) continue;
                            candidate.emplace_back(y, *field);
                            candidate_top = std::min(candidate_top, y);
                            candidate_bottom = std::max(candidate_bottom, y);
                            candidate_left = std::min(candidate_left, field->start);
                        }
                        if (candidate_bottom <= name_bottom) continue;
                        name_top = candidate_top;
                        name_bottom = candidate_bottom;
                        name_left = candidate_left;
                        name_fields = std::move(candidate);
                    }
                }
                if (name_top < 0) continue;
                int tabs_y = -1;
                for (int y = quote_bottom + 1; y < gps_->dimy; ++y) {
                    const auto row = read_row(y);
                    auto tabs = character_social_tab_fields(row);
                    if (tabs.empty()) tabs = character_information_tab_fields(row);
                    if (!tabs.empty() && tabs.front().start <= name_left &&
                            tabs.back().end > column) {
                        tabs_y = y;
                        break;
                    }
                }
                if (tabs_y < 0) continue;
                first_y = name_top;
                bottom = tabs_y;
                column = std::min(column, name_left);
                owned_fields.resize(static_cast<size_t>(gps_->dimy));
                for (auto &[y, field] : identity_fields)
                    owned_fields[y].push_back(std::move(field));
                for (auto &[y, field] : name_fields)
                    owned_fields[y].push_back(std::move(field));
                for (int y = first_y; y < bottom; ++y) {
                    for (const auto &field : split_text_fields(read_row(y))) {
                        if (field.start >= column - 2 && field.start <= column + 2 &&
                                !native_button_text_rect(*gps_, field.start, field.end, y))
                            owned_fields[y].push_back(field);
                    }
                }
                break;
            }
        }
    }
    if (first_y < 0 || bottom <= first_y) return;

    const auto row_y = [](const Match *match) {
        return match->native_split_text ? match->native_split_top_y : match->y;
    };
    std::vector<Match *> fields;
    int left = gps_->dimx, right = 0;
    for (Match &match : prepared_matches_) {
        const int top_y = row_y(&match);
        const int next_y = top_y + (match.native_split_text ? 2 : 1);
        if (match.target.empty() || match.native_split_duplicate ||
            top_y < first_y || next_y > bottom || match.length <= 0 ||
            native_button_text_rect(*gps_, match.x, match.x + match.length, match.y))
            continue;
        if (header) {
            if (match.x <= header->left || match.x >= header->right ||
                    (match.x + match.length > header->right &&
                        match.rule != kCharacterHeaderRule)) continue;
        } else if (match.y < first_y || match.y >= bottom ||
                !std::any_of(owned_fields[match.y].begin(), owned_fields[match.y].end(),
                    [&](const LogicalTextField &field) {
                        return match.x >= field.start &&
                            match.x + match.length <= field.end;
                    })) continue;
        // Hover documents and other independently owned foreground cards can
        // overlap the header. Ordinary translated fields have no negative
        // semantic rule beyond the name/creature/direct-UTF8 paths below.
        if (match.rule < 0 && match.rule != kCharacterHeaderRule &&
            match.rule != -1 && match.rule != -2 && match.rule != -8 &&
            match.rule != kCreatureNameRule) continue;
        fields.push_back(&match);
        left = std::min(left, match.x);
        // The owned source may cross the border; its translated display may
        // not. In particular, never use the long English gloss as box width.
        right = std::max(right, std::min(header ? header->right : gps_->dimx,
            match.x + match.length));
    }
    if (fields.empty()) return;
    for (Match *field : fields) {
        // The native text column, not a previous per-caption pixel box,
        // owns the translated horizontal position.
        field->layout_box_pixel_x = -1;
        field->layout_box_pixel_width = 0;
        field->layout_right = false;
        field->layout_clip_right = header ? header->right : right;
    }
    std::sort(fields.begin(), fields.end(), [&](const Match *a, const Match *b) {
        return row_y(a) != row_y(b) ? row_y(a) < row_y(b) : a->x < b->x;
    });
    std::vector<std::vector<Match *>> rows;
    for (Match *field : fields) {
        if (rows.empty() || row_y(rows.back().front()) != row_y(field))
            rows.emplace_back();
        rows.back().push_back(field);
    }
    layout_fortress_text_rows(renderer, rows, left, right, true);
}
