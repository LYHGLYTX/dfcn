// Character sheets omit Military/Thoughts when they do not apply. Both the
// early source owner and final layout read the same native caption band.
bool Overlay::character_social_tab_selected(int main_tabs_y,
        std::string_view selected) const {
    for (int y = main_tabs_y - 1; y >= 0; --y) {
        std::string row(gps_->dimx, ' ');
        for (int x = 0; x < gps_->dimx; ++x) {
            bool top = false;
            const auto *cell = cell_at(x, y, &top);
            if (cell && cell[0]) row[x] = cell[0];
        }
        const auto fields = character_social_tab_fields(row);
        if (fields.empty()) continue;
        int active = -1, inactive = -1;
        for (const auto &field : fields) {
            bool top = false;
            const auto *cell = cell_at(field.start, y, &top);
            if (!cell || cell[0] != field.text.front()) return false;
            const int color = (cell[1] << 16) | (cell[2] << 8) | cell[3];
            if (field.text == selected) active = color;
            else if (inactive < 0) inactive = color;
            else if (inactive != color) return false;
        }
        return active >= 0 && inactive >= 0 && active != inactive;
    }
    return false;
}

// A relation can join a portrait directly to a text strip, or use a plain
// rectangle when no portrait is available. Living relatives replace the
// caption's right cap with the complete Recenter/View action strip. The
// second classic text row replaces part of the rectangle's lower edge.
static std::optional<SDL_Rect> character_relation_button(const graphicst &gps,
        int first, int last, int y, std::array<int32_t, 9> *skin = nullptr) {
    // Both render modes draw names at L+7, T+1. A unit's five-column picture
    // starts at L; historical figures use one plain rectangle. Only the
    // skin representation changes between CP437 cells and lower textures.
    const bool classic = native_ui_classic().value_or(false);
    if (first >= 7 && last > first &&
            last <= gps.dimx && y >= 1 && y + 1 < gps.dimy) {
        const auto *rectangle = native_texture_button_rectangle(gps);
        const auto *picture = native_texture_button_picture_box(gps);
        const int left = first - 7;
        int right = first;
        while (right < gps.dimx &&
                native_ui_skin_at(gps, right, y - 1, rectangle[1][0], classic)) ++right;
        if (right >= last && right < gps.dimx) {
            for (const bool portrait : {false, true}) {
                bool intact = true;
                for (int x = left; x <= right && intact; ++x) {
                    const bool in_picture = portrait && x < left + 5;
                    const auto *parts = in_picture ? picture : rectangle;
                    const int column = x == left ? 0 :
                        ((in_picture && x == left + 4) || x == right) ? 2 : 1;
                    for (int row = 0; row < 3; ++row) {
                        const bool caption = (row == 1 && x >= first && x < last) ||
                            (row == 2 && x >= first && x < right) ||
                            (portrait && row == 1 && x == left + 2);
                        if (!native_ui_skin_at(gps, x, y + row - 1,
                                parts[column][row], classic, false, false, in_picture) &&
                                !(caption && native_ui_skin_at(gps, x, y + row - 1,
                                    rectangle[1][1], classic, true, false, in_picture))) {
                            intact = false;
                            break;
                        }
                    }
                }
                if (!intact) continue;
                if (skin)
                    for (int row = 0; row < 3; ++row)
                        for (int column = 0; column < 3; ++column)
                            (*skin)[row * 3 + column] = rectangle[column][row];
                return SDL_Rect{first, y - 1, right - first, 3};
            }
        }
    }
    auto box = native_picture_caption_rect(gps, first, y, false, nullptr, true, skin, true);
    if (!box) box = native_button_text_rect(gps, first, last, y, true, skin);
    if (!box || y != box->y + 1 || first < box->x || last > box->x + box->w)
        return std::nullopt;
    return box;
}

void Overlay::append_character_relation_rows(std::vector<std::string> &rows,
        std::vector<Match> &matches, int only_y) const {
    const auto settings = native_ui_settings();
    const bool classic = settings && settings->classic;
    const auto kinship = captured_native_character_relations(gps_);
    std::vector<std::string> context(gps_->dimy, std::string(gps_->dimx, ' '));
    int tabs_y = -1;
    for (int y = 0; y < gps_->dimy; ++y) {
        for (int x = 0; x < gps_->dimx; ++x) {
            bool top = false;
            const auto *cell = cell_at(x, y, &top);
            if (cell && cell[0]) context[y][x] = cell[0];
        }
        if (tabs_y < 0 && !character_information_tab_fields(context[y]).empty()) tabs_y = y;
    }
    if (tabs_y < 0 || !character_social_tab_selected(tabs_y, "Relations")) return;
    // The native draw owns a kinship caption regardless of its surrounding
    // button geometry. Complete records get their one-/two-line layout first;
    // any remaining caption must still use its bound figures, not word/name
    // translation when a portrait, action or clipped edge changes the frame.
    const auto claim_kinship = [&](bool paired_halves) {
        for (const auto &caption : kinship) {
            const int x = caption.x, y = caption.y;
            const int length = static_cast<int>(caption.source.size());
            const auto claim = [&](int row) {
                if (row < 0 || row >= gps_->dimy ||
                    rows[row].compare(x, length, caption.source) != 0) return;
                if (only_y < 0 || only_y == row)
                    matches.push_back({x, row, length, -2, caption.target, caption.source});
                std::fill_n(rows[row].begin() + x, length, ' ');
            };
            claim(y);
            if (!paired_halves) continue;
            // The upper and lower native font halves share one caption.
            bool top = false;
            (void)cell_at(x, y, &top);
            const auto *flags = top ? gps_->screentexpos_top_flag : gps_->screentexpos_flag;
            const uint32_t half = flags ? flags[static_cast<size_t>(x) * gps_->dimy + y] &
                ((1u << 3) | (1u << 4)) : 0;
            const int mate = half == (1u << 3) ? y + 1 : half == (1u << 4) ? y - 1 : -1;
            if (mate < 0 || mate >= gps_->dimy) continue;
            bool mate_top = false;
            const auto *cell = cell_at(x, mate, &mate_top);
            const uint32_t mate_half = flags && cell && mate_top == top
                ? flags[static_cast<size_t>(x) * gps_->dimy + mate] & ((1u << 3) | (1u << 4)) : 0;
            if (mate_half == (half == (1u << 3) ? (1u << 4) : (1u << 3))) claim(mate);
        }
    };
    if (!settings) {
        claim_kinship(true);
        return;
    }
    // Unnamed relatives have a genuinely empty name row. The relationship
    // on the lower edge establishes the record even when no identity exists.
    // Keep source spans separate from the inset one- or two-line display.
    const auto captures = captured_clipped_captions();
    const std::array<std::vector<NativeDrawnTextRow>, 2> identity_draws{
        captured_native_drawn_text_rows(true), captured_native_drawn_text_rows(false)};
    for (int y = tabs_y + 1; y + 1 < gps_->dimy; ++y) {
        const auto identities = split_text_fields(context[y]);
        for (const auto &detail : split_text_fields(context[y + 1])) {
            LogicalTextField identity{detail.start, detail.start, {}};
            for (const auto &candidate : identities)
                if (candidate.start == detail.start) { identity = candidate; break; }
            std::array<int32_t, 9> skin{};
            const auto box = character_relation_button(*gps_, identity.start,
                std::max(identity.start + 1, identity.end), y, &skin);
            if (!box) continue;
            const int right = box->x + box->w;
            if (detail.start < box->x || detail.end > right) continue;
            // Only the two caption spans may replace skin cells. In
            // particular, a missing lower edge is not an empty text run.
            bool intact = true;
            for (int x = box->x; x < right && intact; ++x) {
                if ((x < identity.start || x >= identity.end) &&
                    (context[y][x] != ' ' ||
                     !native_ui_skin_at(*gps_, x, y, skin[4], classic, true))) intact = false;
                if ((x < detail.start || x >= detail.end) &&
                    !native_ui_skin_at(*gps_, x, y + 1, skin[7], classic)) intact = false;
            }
            if (!intact) continue;
            const std::array<LogicalTextField, 2> fields{identity, detail};
            for (size_t index = 0; index < fields.size(); ++index) {
                const auto &field = fields[index];
                if (field.text.empty()) continue;
                const int source_y = y + static_cast<int>(index);
                std::string complete = field.text;
                for (const auto &capture : captures)
                    if (capture.x == field.start && capture.y == source_y &&
                        capture.visible == field.text) { complete = capture.complete; break; }
                std::optional<std::string> target;
                if (index == 0) {
                    // This layout claims the row before the generic identity
                    // pass. Carry the formatter's bound translation through
                    // its actual draw, including a pre-clipping full source.
                    for (const auto &layer : identity_draws) {
                        for (const auto &draw : layer) {
                            if (!draw.unit_identity_target || draw.unit_identity_target->empty() ||
                                    draw.x != field.start ||
                                    draw.y != source_y || draw.source != field.text) continue;
                            target = draw.unit_identity_target;
                            if (!draw.complete_source.empty()) complete = draw.complete_source;
                            break;
                        }
                        if (target) break;
                    }
                }
                const std::string source = normalize_utterance(complete);
                if (!target)
                    target = index == 0
                        ? (source.find(',') != std::string::npos
                            ? translate_procedural_fragment(source)
                            : translate_legends_name(source, true))
                        : exact_literal_translation(source);
                if (index == 1)
                    for (const auto &caption : kinship)
                        if (caption.x == field.start && caption.y == source_y &&
                            caption.source == complete) { target = caption.target; break; }
                if (!target && index == 1) target = translate_ui_message_capture(source, false);
                // Unknown mod identities still move as a single field. Never
                // leave an untranslated surname between independently moved words.
                Match match{field.start, source_y, field.end - field.start,
                    kCharacterRelationRowRule, target ? *target : cp437_to_utf8(complete), field.text};
                match.native_hover_untranslated = !target;
                if (!target) match.native_help_review_source = complete;
                match.native_picture_caption_box = *box;
                match.layout_x = identity.start;
                match.layout_length = right - identity.start;
                match.layout_clip_right = right;
                match.layout_y = source_y - 1;
                match.layout_pixel_y = identity.text.empty() ? 0
                    : (box->h - 2) * gps_->tile_pixel_y / 2;
                match.layout_fixed_baseline = true;
                match.layout_left = true;
                bool top = false;
                const auto *cell = cell_at(field.start, source_y, &top);
                if (cell) match.layout_foreground_rgb = (cell[1] << 16) | (cell[2] << 8) | cell[3];
                match.layout_font_pixels = std::clamp(
                    static_cast<int>(gps_->tile_pixel_y * config_.font_scale), 1, gps_->tile_pixel_y);
                match.layout_lock_font_pixels = true;
                match.layout_line_height_pixels = gps_->tile_pixel_y;
                if (rows[source_y].compare(field.start, field.text.size(), field.text) != 0) continue;
                std::fill_n(rows[source_y].begin() + field.start, field.text.size(), ' ');
                if (only_y < 0 || only_y == source_y) matches.push_back(std::move(match));
            }
        }
    }
    claim_kinship(!classic);
}

void Overlay::layout_character_relation_rows(SDL_Renderer *renderer) {
    if (!renderer || !face_ || !gps_ || gps_->tile_pixel_y <= 0 || gps_->tile_pixel_x <= 0) return;
    std::vector<Match *> fields;
    int pixels = gps_->tile_pixel_y;
    const auto same_box = [](const Match &a, const Match &b) {
        if (!a.native_picture_caption_box || !b.native_picture_caption_box) return false;
        const auto &left = *a.native_picture_caption_box;
        const auto &right = *b.native_picture_caption_box;
        return left.x == right.x && left.y == right.y && left.w == right.w && left.h == right.h;
    };
    for (Match &match : prepared_matches_) {
        if (match.rule != kCharacterRelationRowRule || !match.native_picture_caption_box ||
            match.native_split_duplicate || match.target.empty()) continue;
        const auto &box = *match.native_picture_caption_box;
        const bool named = std::any_of(prepared_matches_.begin(), prepared_matches_.end(),
            [&](const Match &other) {
                return other.rule == kCharacterRelationRowRule && !other.target.empty() &&
                    !other.native_split_duplicate && other.y == box.y + 1 && same_box(match, other);
            });
        // A single relationship uses the middle row. A named relative uses
        // two inset rows as one block. Neither occupies the lower frame rail.
        match.layout_y = match.y - 1;
        match.layout_pixel_y = named ? (box.h - 2) * gps_->tile_pixel_y / 2 : 0;
        match.layout_fixed_baseline = true;
        layout_fortress_text_rows(renderer, {{&match}}, match.layout_x, match.layout_clip_right);
        pixels = std::min(pixels, match.layout_font_pixels);
        fields.push_back(&match);
    }
    for (Match *field : fields) {
        field->layout_font_pixels = pixels;
        const auto &box = *field->native_picture_caption_box;
        if (!native_ui_classic().value_or(false) || field->y != box.y + 2) continue;
        std::array<int32_t, 9> skin{};
        // An empty name row still belongs to the same proven frame and
        // needs its lower rail restored after moving the relationship.
        const auto name = std::find_if(fields.begin(), fields.end(), [&](const Match *other) {
            return other->y == field->y - 1 && other->x == field->x &&
                same_box(*field, *other);
        });
        const int name_end = name == fields.end() ? field->x + 1 : (*name)->x + (*name)->length;
        const auto current = character_relation_button(*gps_, field->x,
            name_end, field->y - 1, &skin);
        if (!current || current->x != box.x || current->y != box.y ||
                current->w != box.w || current->h != box.h) continue;
        NativeBorderRepair repair;
        repair.cells = {field->x, field->y, field->length, 1};
        repair.cell[0] = static_cast<unsigned char>(skin[7] & 0xff);
        const int foreground = ((skin[7] >> 8) & 7) + ((skin[7] & 0x4000) ? 8 : 0);
        const int background = (skin[7] >> 11) & 7;
        std::copy_n(gps_->uccolor[foreground], 3, repair.cell.begin() + 1);
        std::copy_n(gps_->uccolor[background], 3, repair.cell.begin() + 4);
        native_border_repairs_.push_back(repair);
    }
}
