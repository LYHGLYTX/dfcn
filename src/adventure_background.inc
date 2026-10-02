// A hometown/deity card and the character-name field contain two distinct
// lines in one control. Their native first line occupies the single-caption
// row, so preserving both source y positions puts the second line at the
// bottom border. Lay out the complete block inside its current widget.
void Overlay::layout_adventure_background_cards(SDL_Renderer *renderer) {
    if (!gps_ || !face_ || !renderer ||
        gps_->tile_pixel_x <= 0 || gps_->tile_pixel_y <= 0) return;
    const Match *home = nullptr, *occupation = nullptr, *beliefs = nullptr;
    const Match *randomize = nullptr, *accept = nullptr, *name = nullptr;
    for (const Match &match : prepared_matches_) {
        if (match.target.empty() || match.native_split_duplicate) continue;
        if (match.source == "Home") home = &match;
        if (match.source == "Occupation") occupation = &match;
        if (match.source == "Beliefs") beliefs = &match;
        if (match.source == "Randomize background") randomize = &match;
        if (match.source == "Accept background") accept = &match;
        if (match.source == "Name") name = &match;
    }
    if (!home || !occupation || !beliefs || !randomize || !accept ||
        home->y != occupation->y || home->y != beliefs->y ||
        home->x >= occupation->x || occupation->x >= beliefs->x ||
        randomize->y >= home->y || accept->y <= home->y) return;

    const int tile_w = gps_->tile_pixel_x, tile_h = gps_->tile_pixel_y;
    const int origin_x = (gps_->screen_pixel_x - gps_->dimx * tile_w) / 2;
    const int origin_y = (gps_->screen_pixel_y - gps_->dimy * tile_h) / 2;
    struct Card {
        SDL_Rect box;
        bool list;
        int left;
        std::vector<std::vector<Match *>> rows;
        std::optional<int32_t> bottom_skin;
    };
    std::vector<Card> cards;
    const NativePanelBorders borders(*gps_);
    const auto settings = native_ui_settings();
    for (const Match &match : prepared_matches_) {
        if (match.target.empty() || match.native_split_text ||
            match.native_split_duplicate || match.legends_flow ||
            match.length <= 0 || match.x < 0 || match.y < 0 ||
            match.y >= gps_->dimy || match.x + match.length > gps_->dimx ||
            match.source.size() != static_cast<size_t>(match.length)) continue;
        const bool list = match.y > home->y && match.y < accept->y &&
            match.x < beliefs->x;
        const bool name_field = name && name->y < randomize->y &&
            match.y >= name->y - 1 && match.y <= name->y + 1 &&
            match.x > name->x + name->length && match.x < randomize->x;
        if (!list && !name_field) continue;

        std::array<int32_t, 9> skin{};
        auto box = native_button_text_rect(*gps_, match.x,
            match.x + match.length, match.y, true, &skin);
        const std::optional<int32_t> bottom_skin = box && settings && settings->classic
            ? std::optional<int32_t>{skin[7]} : std::nullopt;
        if (!box) {
            const auto interior = native_panel_interior(borders, *gps_,
                match.x, match.x + match.length, match.y);
            if (interior && interior->h <= 4)
                box = SDL_Rect{interior->x, interior->y - 1,
                    interior->w, interior->h + 2};
        }
        if (!box) {
            const auto frame = find_ascii_panel_frame(match.x,
                match.x + match.length, match.y, gps_->dimx, gps_->dimy,
                [this](int x, int y) { return visible_char_at(x, y); });
            if (frame && frame->bottom - frame->top <= 5)
                box = SDL_Rect{frame->left + 1, frame->top,
                    frame->right - frame->left - 1, frame->bottom - frame->top + 1};
        }
        if (!box && graphical_rect_epoch_ == composite_read_epoch_) {
            const auto pixels = graphical_button_rect(graphical_rects_,
                origin_x + (match.x * 2 + match.length) * tile_w / 2,
                origin_y + match.y * tile_h + tile_h / 2,
                (match.length + 2) * tile_w, tile_h, gps_->screen_pixel_x);
            // Only grid-aligned whole controls can supply source rows.
            if (pixels && (pixels->x - origin_x) % tile_w == 0 &&
                (pixels->y - origin_y) % tile_h == 0 &&
                pixels->w % tile_w == 0 && pixels->h % tile_h == 0)
                box = SDL_Rect{(pixels->x - origin_x) / tile_w + 1,
                    (pixels->y - origin_y) / tile_h,
                    pixels->w / tile_w - 2, pixels->h / tile_h};
        }
        if (!box || box->w <= 0 || box->h < 3 || box->h > 6 ||
            box->x < 0 || box->y < 0 || box->x + box->w > gps_->dimx ||
            box->y + box->h > gps_->dimy || match.x < box->x ||
            match.x + match.length > box->x + box->w ||
            (list && (box->y <= home->y || box->y + box->h > accept->y)) ||
            (name_field && box->y + box->h > randomize->y)) continue;
        if (std::any_of(cards.begin(), cards.end(), [&](const Card &card) {
                return card.box.x == box->x && card.box.y == box->y &&
                    card.box.w == box->w && card.box.h == box->h;
            })) continue;
        cards.push_back({*box, list, box->x + box->w, {}, bottom_skin});
    }

    // Require complete current rows before moving any text. Unknown text,
    // an overlaid tooltip, half-font captions or uncovered fragments leave
    // the control under the normal renderer's ownership.
    for (Card &card : cards) {
        bool complete = true;
        int previous_y = -1;
        for (int y = card.box.y; complete && y < card.box.y + card.box.h; ++y) {
            int first = card.box.x;
            const int right = card.box.x + card.box.w;
            // Classic two-line cards overwrite only part of the lower edge.
            // Its remaining cells belong to this exact skin, not the caption.
            const auto padding_at = [&](int x) {
                const unsigned char ch = visible_char_at(x, y);
                return !ch || ch == ' ' || (card.bottom_skin &&
                    y == card.box.y + card.box.h - 1 &&
                    native_ui_skin_at(*gps_, x, y, *card.bottom_skin, true));
            };
            if ((y == card.box.y || y == card.box.y + card.box.h - 1) &&
                [&] {
                    for (int x = first; x < right; ++x)
                        if (!is_cp437_box_drawing_byte(visible_char_at(x, y))) return false;
                    return true;
                }()) continue;
            while (first < right && padding_at(first)) ++first;
            if (first == right) continue;
            std::vector<Match *> row;
            for (Match &part : prepared_matches_) {
                if (part.y != y || part.x >= right || part.x + part.length <= first) continue;
                if (part.x < first || part.x + part.length > right ||
                    part.target.empty() || part.native_split_text ||
                    part.native_split_duplicate || part.legends_flow) {
                    complete = false;
                    break;
                }
                row.push_back(&part);
            }
            std::sort(row.begin(), row.end(), [](const Match *a, const Match *b) {
                return a->x < b->x;
            });
            if (!complete || row.empty() || (previous_y >= 0 && y != previous_y + 1)) {
                complete = false;
                break;
            }
            int cursor = first;
            for (const Match *part : row) {
                if (part->x < cursor) complete = false;
                for (; cursor < part->x; ++cursor) {
                    if (!padding_at(cursor)) complete = false;
                }
                std::string native;
                for (int x = part->x; x < part->x + part->length; ++x)
                    native.push_back(visible_char_at(x, y));
                const bool fold_case = part->rule >= 0 &&
                    static_cast<size_t>(part->rule) < rules_.size() &&
                    rules_[static_cast<size_t>(part->rule)].case_insensitive;
                if (part->source.size() != static_cast<size_t>(part->length) ||
                    !template_literal_at(native, 0, part->source, fold_case))
                    complete = false;
                cursor = part->x + part->length;
            }
            for (; cursor < right; ++cursor) {
                if (!padding_at(cursor)) complete = false;
            }
            card.left = std::min(card.left, first);
            card.rows.push_back(std::move(row));
            previous_y = y;
        }
        const bool none_card = card.list && card.rows.size() == 1 &&
            card.rows.front().size() == 1 &&
            card.rows.front().front()->rule == kAdventureBeliefLabelRule &&
            card.rows.front().front()->source == "None";
        if (!complete || (card.rows.size() != 2 && !none_card)) card.rows.clear();
    }
    std::erase_if(cards, [](const Card &card) { return card.rows.empty(); });
    for (Card &card : cards)
        for (auto &row : card.rows)
            for (Match *part : row) part->native_picture_caption_box = card.box;

    for (size_t index = 0; index < cards.size(); ++index) {
        Card &card = cards[index];
        int left = card.left;
        std::vector<std::vector<Match *>> rows = card.rows;
        // All records in this list use the same inset and measured font.
        // The name field is a separate control, with its own text column.
        if (card.list) {
            if (std::any_of(cards.begin(), cards.begin() + index, [&](const Card &earlier) {
                    return earlier.list && earlier.box.x == card.box.x &&
                        earlier.box.w == card.box.w;
                })) continue;
            rows.clear();
            for (const Card &other : cards) {
                if (!other.list || other.box.x != card.box.x ||
                    other.box.w != card.box.w) continue;
                left = std::min(left, other.left);
                rows.insert(rows.end(), other.rows.begin(), other.rows.end());
            }
        }
        // Reserve the widest native inset while fitting the common font, then
        // restore each row's own column. Deity/Religion stay indented beneath
        // their names, while None shares the title column.
        int inset = 0;
        for (const auto &row : rows) inset = std::max(inset, row.front()->x - left);
        layout_fortress_text_rows(renderer, rows, left + inset, card.box.x + card.box.w, true);
        for (auto &row : rows) {
            const int shift = left + inset - row.front()->x;
            for (Match *part : row) {
                part->layout_x -= shift;
                part->layout_length += shift;
                if (part->layout_box_pixel_x >= 0)
                    part->layout_box_pixel_x -= shift * tile_w;
            }
        }
        for (Card &member : cards) {
            if (&member != &card && (!card.list || !member.list ||
                    member.box.x != card.box.x || member.box.w != card.box.w)) continue;
            const int offset = (member.box.h - static_cast<int>(member.rows.size())) * tile_h / 2;
            for (size_t row = 0; row < member.rows.size(); ++row) {
                for (Match *part : member.rows[row]) {
                    part->layout_y = member.box.y + static_cast<int>(row);
                    part->layout_pixel_y = offset;
                    part->layout_fixed_baseline = true;
                    // The row fitter ran before this block was centered.
                    // Replace its old one-row clip with the proven control;
                    // source writer rows own suppression, not these new Y's.
                    part->layout_native_clip = SDL_Rect{
                        origin_x + member.box.x * tile_w,
                        origin_y + member.box.y * tile_h,
                        member.box.w * tile_w, member.box.h * tile_h};
                    part->layout_reflowed_control = true;
                }
            }
            if (member.bottom_skin && member.rows.size() == 2) {
                NativeBorderRepair repair;
                repair.cells = {member.box.x, member.box.y + member.box.h - 1,
                    member.box.w, 1};
                repair.cell[0] = static_cast<unsigned char>(*member.bottom_skin & 0xff);
                const int foreground = ((*member.bottom_skin >> 8) & 7) +
                    ((*member.bottom_skin & 0x4000) ? 8 : 0);
                const int background = (*member.bottom_skin >> 11) & 7;
                std::copy_n(gps_->uccolor[foreground], 3, repair.cell.begin() + 1);
                std::copy_n(gps_->uccolor[background], 3, repair.cell.begin() + 4);
                native_border_repairs_.push_back(repair);
            }
        }
    }
}
