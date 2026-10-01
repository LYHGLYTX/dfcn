// This modal owns the routine/month headings, policy buttons and a two-line
// soldier roster. English string lengths are not Chinese alignment boxes.
struct FortressScheduleEditor {
    SDL_Rect panel{};
    int left = 0, title_y = 0, controls_y = 0;
    std::array<int, 3> minimum_rows{};
};

// The soldier checkbox and optional cancel-order button replace the right
// end of the rectangle. Only the caption before those controls belongs to
// the record; status text may overwrite its lower rail, never another row.
static std::optional<int32_t> fortress_schedule_classic_record_skin(
        const graphicst &gps, int left, int top, int right) {
    if (left < 0 || right <= left + 5 || right > gps.dimx ||
        top < 0 || top + 3 > gps.dimy) return std::nullopt;
    const auto &skin = native_texture_button_rectangle(gps);
    for (int orientation = 0; orientation < 3; ++orientation) {
        const auto tile = [&](int column, int row) {
            if (orientation == 1) return skin[row][column];
            if (orientation == 2 && column > 0) column = 3 - column;
            return skin[column][row];
        };
        bool complete = true;
        for (int row = 0; row < 3 && complete; ++row)
            complete = native_ui_skin_at(gps, left, top + row, tile(0, row), true);
        for (int x = left + 1; x < right && complete; ++x)
            complete = native_ui_skin_at(gps, x, top, tile(1, 0), true) &&
                (native_ui_skin_at(gps, x, top + 2, tile(1, 2), true) ||
                 native_ui_skin_at(gps, x, top + 2, tile(1, 1), true, true));
        if (complete) return tile(1, 2);
    }
    return std::nullopt;
}

static std::optional<FortressScheduleEditor> fortress_schedule_editor(
        const graphicst &gps, const std::vector<std::string> &rows) {
    constexpr std::string_view title = "Editing routine ";
    const NativePanelBorders borders(gps);
    for (int y = 1; y < gps.dimy; ++y) {
        const auto at = rows[y].find(title);
        if (at == std::string::npos) continue;
        const int left = static_cast<int>(at);
        const auto panel = native_panel_interior(borders, gps, left,
            left + static_cast<int>(title.size()), y);
        if (!panel) continue;
        const int right = panel->x + panel->w;
        int done_y = -1, controls_y = -1;
        std::array<int, 3> minimum_rows{-1, -1, -1};
        constexpr std::array<std::string_view, 3> minimum{
            "Minimum number of", "soldiers to follow", "new order"};
        for (int row = panel->y; row < panel->y + panel->h; ++row) {
            const std::string_view line(rows[row].data() + panel->x, panel->w);
            const auto button = [&](std::string_view prefix) {
                const auto offset = line.find(prefix);
                if (offset == std::string_view::npos) return false;
                const int x = panel->x + static_cast<int>(offset);
                const auto span = native_button_text_span(gps, x,
                    x + static_cast<int>(prefix.size()), row);
                return span && span->first >= panel->x && span->second <= right;
            };
            if (row < y && button("Done editing")) done_y = row;
            if (row > y && button("Equip/") && button("Sleep/")) controls_y = row;
            for (size_t index = 0; index < minimum.size(); ++index)
                if (row > y && rows[row].compare(left, minimum[index].size(),
                        minimum[index]) == 0)
                    minimum_rows[index] = row;
        }
        if (done_y >= 0 && controls_y > y && minimum_rows[0] > controls_y &&
            minimum_rows[1] > minimum_rows[0] && minimum_rows[2] > minimum_rows[1])
            return FortressScheduleEditor{*panel, left, y, controls_y, minimum_rows};
    }
    return std::nullopt;
}

void Overlay::append_fortress_schedule_captions(std::vector<std::string> &rows,
        std::vector<Match> &matches, int only_y, bool raw_layer) const {
    auto context = rows;
    if (raw_layer)
        for (int y = 0; y < gps_->dimy; ++y)
            for (int x = 0; x < gps_->dimx; ++x) {
                const auto ch = visible_char_at(x, y);
                context[y][x] = ch ? static_cast<char>(ch) : ' ';
            }
    const auto editor = fortress_schedule_editor(*gps_, context);
    if (!editor) return;
    const auto append = [&](int x, int y, const std::string &source,
                            const std::string &target) {
        if (source.empty() || target.empty() || (only_y >= 0 && only_y != y)) return;
        const int length = static_cast<int>(source.size());
        if (rows[y].compare(x, length, source) == 0) {
            Match match{x, y, length, kFortressScheduleCaptionRule, target, source};
            match.layout_left = true;
            matches.push_back(std::move(match));
            std::fill_n(rows[y].begin() + x, length, ' ');
        } else if (raw_layer) {
            // The final composite supplies the whole overlay; each raw
            // layer suppresses only the bytes it actually owns.
            for (int offset = 0; offset < length;) {
                while (offset < length && rows[y][x + offset] != source[offset]) ++offset;
                const int start = offset;
                while (offset < length && rows[y][x + offset] == source[offset]) ++offset;
                if (offset == start) continue;
                matches.push_back({x + start, y, offset - start,
                    kFortressScheduleCaptionRule, {}, source.substr(start, offset - start)});
                std::fill_n(rows[y].begin() + x + start, offset - start, ' ');
            }
        }
    };
    constexpr std::string_view prefix = "Editing routine ";
    const int left = editor->left, y = editor->title_y;
    const int right = editor->panel.x + editor->panel.w;
    int title_end = right;
    for (int x = left + static_cast<int>(prefix.size()); x < right; ++x)
        if (is_cp437_box_separator(context[y], x) ||
            native_foreground_picture_at(*gps_, x, y)) {
            title_end = x;
            break;
        }
    const std::string source(trim_view(std::string_view(context[y]).substr(left, title_end - left)));
    if (source.starts_with(prefix)) {
        const auto label = exact_literal_translation("Editing routine");
        const std::string name(trim_view(std::string_view(source).substr(prefix.size())));
        if (label && !name.empty()) {
            auto target = exact_literal_translation(name);
            if (!target) {
                // Custom routine names retain authored text as a whole.
                std::vector<uint32_t> codepoints;
                target = decode_utf8(name, codepoints) ? name : cp437_to_utf8(name);
            }
            append(left, y, source, *label + *target);
        }
    }
    // This heading is a calendar month, even when its English name is also
    // an ore or stone. Resolve it before generic material/name matching.
    for (int row = y + 1; row < editor->controls_y; ++row) {
        const auto month_fields = split_text_fields(context[row].substr(left, right - left));
        if (month_fields.size() != 1 || month_fields.front().start != 0) continue;
        std::vector<size_t> origins;
        const auto target = RULESETS.translate_with_origins(
            month_fields.front().text, "::day::month", origins);
        if (target && !target->empty())
            append(left, row, month_fields.front().text, *target);
    }
    constexpr std::array<std::string_view, 3> minimum{
        "Minimum number of", "soldiers to follow", "new order"};
    for (size_t index = 0; index < minimum.size(); ++index)
        if (const auto target = exact_literal_translation(
                "Fortress schedule editor: " + std::string(minimum[index])))
            append(left, editor->minimum_rows[index], std::string(minimum[index]), *target);
}

bool Overlay::layout_fortress_schedule_editor(SDL_Renderer *renderer) {
    if (!gps_ || !renderer || !face_ || gps_->tile_pixel_x <= 0 || gps_->tile_pixel_y <= 0)
        return false;
    std::vector<std::string> rows(gps_->dimy, std::string(gps_->dimx, ' '));
    for (int y = 0; y < gps_->dimy; ++y)
        for (int x = 0; x < gps_->dimx; ++x) {
            const auto ch = visible_char_at(x, y);
            rows[y][x] = ch ? static_cast<char>(ch) : ' ';
        }
    const auto editor = fortress_schedule_editor(*gps_, rows);
    if (!editor) return false;
    const int right = editor->panel.x + editor->panel.w;
    const int bottom = editor->panel.y + editor->panel.h;
    const int pixels = std::clamp(static_cast<int>(gps_->tile_pixel_y * config_.font_scale),
        1, gps_->tile_pixel_y);
    std::map<int, std::vector<Match *>> headings, minimum, roster;
    for (Match &match : prepared_matches_) {
        if (match.target.empty() || match.native_split_duplicate ||
            match.x < editor->panel.x || match.x + match.length > right ||
            match.y < editor->panel.y || match.y >= bottom) continue;
        match.layout_box_pixel_x = -1;
        match.layout_box_pixel_width = 0;
        match.layout_right = false;
        if (match.y <= editor->controls_y) {
            if (const auto button = native_button_text_span(*gps_, match.x,
                    match.x + match.length, match.y)) {
                match.layout_x = button->first;
                match.layout_length = button->second - button->first;
                match.layout_clip_right = button->second;
                match.layout_left = false;
                match.layout_font_pixels = pixels;
                match.layout_lock_font_pixels = true;
                match.layout_line_height_pixels = gps_->tile_pixel_y;
            } else if (match.y < editor->title_y && match.source == "(unnamed orders)") {
                // The editable name has its own inset beside the pen icon.
                layout_fortress_text_rows(renderer, {{&match}}, match.x,
                    right, true);
            } else {
                headings[match.y].push_back(&match);
            }
        } else if (match.rule == kFortressScheduleCaptionRule) {
            minimum[match.y].push_back(&match);
        } else if (match.y > editor->minimum_rows.back()) {
            roster[match.y].push_back(&match);
        }
    }
    const auto ordered_rows = [](auto &group) {
        std::vector<std::vector<Match *>> result;
        for (auto &[y, parts] : group) {
            std::sort(parts.begin(), parts.end(), [](const Match *a, const Match *b) {
                return a->x < b->x;
            });
            result.push_back(parts);
        }
        return result;
    };
    // Squad, routine and month retain their baselines with a common inset.
    if (!headings.empty())
        layout_fortress_text_rows(renderer, ordered_rows(headings), editor->left, right, true);
    if (!minimum.empty()) {
        int label_right = right;
        for (const auto &[y, parts] : minimum) {
            int end = editor->left;
            for (const Match *part : parts) end = std::max(end, part->x + part->length);
            // The count and its +/- widgets own the neighbouring column.
            // Blank cells after an English label remain available text area.
            for (int x = end; x < label_right; ++x) {
                const unsigned char ch = visible_char_at(x, y);
                if ((ch && ch != ' ') || native_foreground_picture_at(*gps_, x, y)) {
                    label_right = x;
                    break;
                }
            }
        }
        layout_fortress_text_rows(renderer, ordered_rows(minimum), editor->left, label_right, true);
    }
    // SQUADS and EMBARK share graphical artwork, but classic SQUADS_SELECTED
    // contains green XX while both EMBARK skins are empty. Read the squad's
    // own controls so selected soldiers cannot fall outside the roster.
    int list_right = right;
    int portrait_right = -1;
    std::map<int, int> record_rights;
    struct ClassicRecord { int top, right; int32_t lower_skin; };
    std::vector<ClassicRecord> classic_records;
    const bool classic = native_ui_classic().value_or(false);
    const auto &buttons = native_texture_button_main(*gps_);
    for (int y = editor->minimum_rows.back() + 1; y + 3 <= bottom; ++y)
        for (int x = editor->left; x + 4 <= right; ++x)
            if (native_main_button_skin_at(*gps_, x, y + 1,
                    buttons[INTERFACE_BUTTON_MAIN_SQUADS_SELECTED], classic) ||
                native_main_button_skin_at(*gps_, x, y + 1,
                    buttons[INTERFACE_BUTTON_MAIN_SQUADS_NOT_SELECTED], classic)) {
                // The complete OX control immediately precedes the checkbox
                // on soldiers with orders. Neither its border nor graphical
                // artwork is available caption space or part of the portrait.
                const int record_right = x - 4 >= editor->left &&
                    native_main_button_skin_at(*gps_, x - 4, y + 1,
                        buttons[INTERFACE_BUTTON_MAIN_SQUADS_CANCEL_ORDER], classic)
                    ? x - 4 : x;
                list_right = std::min(list_right, record_right);
                for (int row = y; row < y + 3; ++row)
                    record_rights[row] = record_right;
                if (classic)
                    if (const auto skin = fortress_schedule_classic_record_skin(
                            *gps_, editor->left, y, record_right))
                        classic_records.push_back({y, record_right, *skin});
                // DF's text metadata starts inside the anchored portrait's
                // columns. The picture is drawn on top of that grid, so a
                // minimum source x alone would place Chinese over the face.
                // Read all three rows of this current soldier record; lower
                // background tiles are not foreground portrait artwork.
                for (int row = y; row < y + 3; ++row)
                    for (int column = editor->left; column < record_right; ++column)
                        if (native_foreground_picture_at(*gps_, column, row))
                            portrait_right = std::max(portrait_right, column + 1);
            }
    if (!record_rights.empty()) {
        int list_left = list_right;
        std::erase_if(roster, [&](const auto &row) {
            return !record_rights.contains(row.first);
        });
        for (auto &[y, parts] : roster) {
            std::erase_if(parts, [&](const Match *part) {
                // A longer source on a row without OX still owns its entire
                // name, even though Chinese uses the shared narrower column.
                return part->x + part->length > record_rights.at(y);
            });
            for (const Match *part : parts) list_left = std::min(list_left, part->x);
        }
        std::erase_if(roster, [](const auto &row) { return row.second.empty(); });
        // Native 53.16 (PE 0x140441345): names/orders use L+5, but vacant
        // positions use L+2, the same column as the classic unit symbol.
        // A vacancy must not pull the entire roster into that icon column.
        list_left = std::max(list_left, editor->left + 5);
        // Empty positions and order/status lines use the same portrait-free
        // column as occupied positions, with one native cell of separation.
        if (portrait_right >= 0) list_left = std::max(list_left, portrait_right + 1);
        if (!roster.empty() && list_left < list_right) {
            for (const ClassicRecord &record : classic_records) {
                const auto name = roster.find(record.top + 1);
                const auto status = roster.find(record.top + 2);
                if (name == roster.end() || status == roster.end()) continue;
                // Do not replace any untranslated status text with a rail.
                // Every non-rail/non-space source cell must be owned by an
                // existing translation or suppression span on this row.
                bool owned = true;
                for (int x = editor->left + 1; x < record.right && owned; ++x) {
                    if (native_ui_skin_at(*gps_, x, record.top + 2, record.lower_skin, true) ||
                        rows[record.top + 2][x] == ' ') continue;
                    owned = std::any_of(prepared_matches_.begin(), prepared_matches_.end(),
                        [&](const Match &part) {
                            return part.y == record.top + 2 && x >= part.x &&
                                x < part.x + part.length &&
                                part.source.size() == static_cast<size_t>(part.length) &&
                                part.source[x - part.x] == rows[record.top + 2][x];
                        });
                }
                if (!owned) continue;
                for (const auto *line : {&name->second, &status->second})
                    for (Match *part : *line) {
                        part->native_picture_caption_box = SDL_Rect{
                            list_left, record.top, record.right - list_left, 3};
                        part->layout_y = part->y - 1;
                        part->layout_pixel_y = gps_->tile_pixel_y / 2;
                        part->layout_fixed_baseline = true;
                    }
                NativeBorderRepair repair;
                repair.cells = {editor->left + 1, record.top + 2,
                    record.right - editor->left - 1, 1};
                repair.cell[0] = static_cast<unsigned char>(record.lower_skin & 0xff);
                const int foreground = ((record.lower_skin >> 8) & 7) +
                    ((record.lower_skin & 0x4000) ? 8 : 0);
                const int background = (record.lower_skin >> 11) & 7;
                std::copy_n(gps_->uccolor[foreground], 3, repair.cell.begin() + 1);
                std::copy_n(gps_->uccolor[background], 3, repair.cell.begin() + 4);
                native_border_repairs_.push_back(repair);
            }
            layout_fortress_text_rows(renderer, ordered_rows(roster), list_left, list_right, true);
        }
    }
    return true;
}
