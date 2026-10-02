// Unit assignment uses the common Name/Cat/Prof sort band, a search field
// and portrait records, without the fortress Labor page's tabs or toggles.
// A caption belongs to a visible portrait only inside that record's bounds.
// Captions surviving below those bounds must not be adopted by a nearby unit.
struct FortressUnitChooser {
    SDL_Rect panel{}, viewport{};
    int header_y = -1, name_x = -1, search_y = -1;
    std::vector<SDL_Rect> native_records;
};

static std::optional<FortressUnitChooser> fortress_unit_chooser(
        const graphicst &gps, const std::vector<std::string> &rows) {
    const auto settings = native_ui_settings();
    if (!settings) return std::nullopt;
    if (settings->classic) {
        const auto captures = captured_native_unit_chooser_records();
        const auto same_rect = [](const SDL_Rect &a, const SDL_Rect &b) {
            return a.x == b.x && a.y == b.y && a.w == b.w && a.h == b.h;
        };
        for (const auto &capture : captures) {
            const auto &panel = capture.panel, &viewport = capture.viewport;
            if (panel.x < 0 || panel.y < 0 || panel.w <= 0 || panel.h <= 0 ||
                    panel.x + panel.w > gps.dimx || panel.y + panel.h > gps.dimy ||
                    viewport.x < panel.x || viewport.y < panel.y ||
                    viewport.w <= 0 || viewport.h <= 0 ||
                    viewport.x + viewport.w > panel.x + panel.w ||
                    viewport.y + viewport.h > panel.y + panel.h) continue;
            std::vector<SDL_Rect> records;
            int text_right = panel.x + panel.w;
            for (const auto &row : captures) {
                if (!same_rect(row.panel, panel) || !same_rect(row.viewport, viewport) ||
                        row.box.x < viewport.x || row.box.y < viewport.y ||
                        row.box.w <= 0 || row.box.h != 3 ||
                        row.box.x + row.box.w > panel.x + panel.w ||
                        row.box.y + row.box.h > viewport.y + viewport.h) continue;
                if (std::any_of(records.begin(), records.end(), [&](const SDL_Rect &box) {
                        return same_rect(box, row.box);
                    })) continue;
                records.push_back(row.box);
                text_right = std::min(text_right, row.box.x + row.box.w);
            }
            if (records.empty() || text_right <= panel.x) continue;
            std::sort(records.begin(), records.end(), [](const SDL_Rect &a, const SDL_Rect &b) {
                return a.y < b.y;
            });
            int search_y = capture.search_y >= viewport.y + viewport.h &&
                    capture.search_y < panel.y + panel.h
                ? capture.search_y : panel.y + panel.h;
            for (int top = panel.y + panel.h - 3;
                    search_y == panel.y + panel.h && top >= viewport.y + viewport.h; --top) {
                bool found = false;
                for (int x = panel.x; x < panel.x + panel.w; ++x) {
                    const auto search = native_widget_textbox_rect_at(gps, x, top, *settings);
                    if (search && search->x + search->w <= panel.x + panel.w) {
                        search_y = search->y;
                        found = true;
                        break;
                    }
                }
                if (found) break;
            }
            // These are the current text widgets' proven unit_list/SKILLS
            // parents, copied while native render still owns the objects.
            // They survive masking of the sort captions and do not depend
            // on classic blank cells retaining graphical metadata.
            // scroll_rows bounds visibility vertically; the native row
            // renderer stretches its caption to unit_list's wider right
            // edge, independently of the row's measured text width.
            return FortressUnitChooser{panel,
                {panel.x, viewport.y, text_right - panel.x, viewport.h},
                -1, records.front().x, search_y, std::move(records)};
        }
    }
    const NativePanelBorders borders(gps);
    for (int y = 1; y + 3 < gps.dimy; ++y) {
        const auto arrows = native_sort_columns(gps, y, *settings);
        if (arrows.size() < 3) continue;
        size_t name = rows[y].find("Name");
        if (name == std::string::npos) continue;
        const size_t cat = rows[y].find("Cat", name + 4);
        const size_t prof = cat == std::string::npos ? cat : rows[y].find("Prof", cat + 3);
        if (cat == std::string::npos || prof == std::string::npos) continue;
        bool sorted = true;
        for (const auto [x, length] : {std::pair{static_cast<int>(name), 4},
                std::pair{static_cast<int>(cat), 3}, std::pair{static_cast<int>(prof), 4}})
            sorted &= native_sort_caption_span(gps, x, x + length, y, *settings).has_value();
        if (!sorted) continue;
        const auto panel = native_panel_interior(borders, gps,
            static_cast<int>(name), static_cast<int>(prof + 4), y);
        if (!panel) continue;
        const int right = panel->x + panel->w, bottom = panel->y + panel->h;
        std::optional<SDL_Rect> search;
        for (int top = bottom - 3; top > y + 3 && !search; --top)
            for (int x = panel->x; x < right; ++x) {
                const auto box = native_widget_textbox_rect_at(gps, x, top, *settings);
                if (box && box->x + box->w <= right) { search = box; break; }
            }
        if (!search) continue;
        const auto rails = native_vertical_scrollbar_spans(gps, *panel);
        int first = y + 1, last = search->y, text_right = right;
        if (!rails.empty()) {
            first = gps.dimy;
            last = 0;
            for (const auto &rail : rails) {
                // Scroll caps are inset one row from scroll_rows' bounds.
                first = std::min(first, rail.y - 1);
                last = std::max(last, rail.y + rail.h + 1);
                text_right = std::min(text_right, rail.x);
            }
            first = std::max(first, y + 1);
            last = std::min(last, search->y);
        }
        if (last <= first || text_right <= panel->x) continue;
        return FortressUnitChooser{*panel,
            {panel->x, first, text_right - panel->x, last - first},
            y, static_cast<int>(name), search->y, {}};
    }
    return std::nullopt;
}

void Overlay::append_fortress_unit_chooser_rows(std::vector<std::string> &rows,
        std::vector<Match> &matches, int only_y, bool raw_layer) const {
    if (!gps_ || rows.size() != static_cast<size_t>(gps_->dimy)) return;
    auto context = rows;
    if (raw_layer)
        for (int y = 0; y < gps_->dimy; ++y)
            for (int x = 0; x < gps_->dimx; ++x) {
                const auto ch = visible_char_at(x, y);
                context[y][x] = ch ? static_cast<char>(ch) : ' ';
            }
    const auto chooser = fortress_unit_chooser(*gps_, context);
    if (!chooser) return;
    struct Field {
        int x, y;
        std::string source, complete, target;
        bool skill = false, duplicate = false;
    };
    struct Record { SDL_Rect box; std::vector<Field> fields; };
    std::vector<Record> records;
    const int viewport_bottom = chooser->viewport.y + chooser->viewport.h;
    for (const auto &box : chooser->native_records) records.push_back({box, {}});
    for (int y = chooser->viewport.y; chooser->native_records.empty() && y < viewport_bottom; ++y) {
        const auto box = native_picture_caption_rect(*gps_, chooser->name_x, y,
            false, nullptr, true);
        if (!box || box->y < chooser->viewport.y ||
                box->y + box->h > viewport_bottom ||
                box->x < chooser->panel.x ||
                box->x + box->w > chooser->viewport.x + chooser->viewport.w) continue;
        if (records.empty() || records.back().box.y != box->y) records.push_back({*box, {}});
    }
    if (records.empty()) return;
    auto draws = captured_native_drawn_text_rows();
    const auto top_draws = captured_native_drawn_text_rows(true);
    draws.insert(draws.end(), top_draws.begin(), top_draws.end());
    const auto clipped = captured_clipped_captions();
    const auto half_at = [&](int x, int y) {
        bool top = false;
        (void)cell_at(x, y, &top);
        const auto *flags = top ? gps_->screentexpos_top_flag : gps_->screentexpos_flag;
        return flags ? flags[static_cast<size_t>(x) * gps_->dimy + y] &
            ((1u << 3) | (1u << 4)) : 0u;
    };
    int skill_left = gps_->dimx;
    for (size_t index = 0; index < records.size(); ++index) {
        auto &record = records[index];
        const int right = record.box.x + record.box.w;
        const int bottom = record.box.y + record.box.h;
        const auto add_field = [&](int x, int y, const std::string &visible,
                std::string complete, const std::optional<std::string> &identity) {
            if (trim_view(visible).empty() || x < record.box.x || x + static_cast<int>(visible.size()) > right ||
                    context[y].compare(x, visible.size(), visible) != 0) return;
            const std::string_view slot(context[y].data() + x, visible.size());
            for (size_t offset = 0; offset < slot.size(); ++offset)
                if (is_cp437_box_separator(slot, offset) ||
                        (static_cast<unsigned char>(slot[offset]) < ' ' &&
                         slot[offset] != '\x0b' && slot[offset] != '\x0c')) return;
            for (const auto &capture : clipped)
                if (capture.x == x && capture.y == y && capture.visible == visible &&
                        !capture.complete.empty()) { complete = capture.complete; break; }
            const auto skills = identity ? std::nullopt
                : translate_rated_skill_list(normalize_utterance(complete));
            const bool skill = skills && skills->size() == 1;
            const bool empty_skills = !identity && complete == "No relevant skills";
            if ((skill || empty_skills) && y <= record.box.y) return;
            std::string source = visible;
            // The widget's saved clip can be narrower than its surviving
            // native text. Own the full skill only when every source byte
            // is still visible at this origin inside the same record.
            if ((skill || empty_skills) && complete.starts_with(visible) &&
                    x + static_cast<int>(complete.size()) <= right &&
                    context[y].compare(x, complete.size(), complete) == 0)
                source = complete;
            for (const auto &field : record.fields)
                if (field.y == y && field.x < x + static_cast<int>(source.size()) &&
                        x < field.x + static_cast<int>(field.source.size())) return;
            std::string target = skill ? skills->front().target : identity.value_or("");
            if (empty_skills) target = exact_literal_translation(complete).value_or(complete);
            record.fields.push_back({x, y, std::move(source), std::move(complete), std::move(target),
                skill || empty_skills});
            if (skill || empty_skills) skill_left = std::min(skill_left, x);
        };
        for (const auto &draw : draws) {
            if (draw.y < record.box.y || draw.y >= bottom || draw.x >= right ||
                    draw.source.empty()) continue;
            int first = std::max(record.box.x, draw.x);
            int last = std::min(right, draw.x + static_cast<int>(draw.source.size()));
            if (draw.draw_clip) {
                const auto &clip = *draw.draw_clip;
                if (draw.y < clip.y || draw.y >= clip.y + clip.h) continue;
                first = std::max(first, clip.x);
                last = std::min(last, clip.x + clip.w);
            }
            if (first >= last) continue;
            std::string visible = draw.source.substr(first - draw.x, last - first);
            // Later native columns may replace a caption's suffix. Retain
            // the formatter-owned full identity behind its surviving prefix.
            size_t length = 0;
            while (length < visible.size() && context[draw.y][first + length] == visible[length]) ++length;
            visible.resize(length);
            bool visible_layer = true;
            for (int x = first; x < first + static_cast<int>(length); ++x)
                if (native_ui_top_layer_at(*gps_, static_cast<size_t>(x) * gps_->dimy + draw.y)
                        != draw.top_layer) { visible_layer = false; break; }
            if (!visible_layer) continue;
            add_field(first, draw.y, visible,
                draw.complete_source.empty() ? draw.source : draw.complete_source,
                draw.unit_identity_target);
        }
        for (int y = record.box.y; y < bottom; ++y) {
            std::string slot = context[y].substr(record.box.x, record.box.w);
            // Border cells are outside the text fields, including an edge
            // partly overwritten by a native name or skill continuation.
            for (size_t offset = 0; offset < slot.size(); ++offset)
                if (is_cp437_box_separator(slot, offset)) slot[offset] = ' ';
            for (const auto &field : split_text_fields(slot))
                add_field(record.box.x + field.start, y, field.text, field.text, {});
        }
        std::sort(record.fields.begin(), record.fields.end(), [](const Field &a, const Field &b) {
            return a.y != b.y ? a.y < b.y : a.x < b.x;
        });
        for (auto &field : record.fields)
            field.duplicate = half_at(field.x, field.y) == (1u << 4) &&
                std::any_of(record.fields.begin(), record.fields.end(), [&](const Field &other) {
                    return other.x == field.x && other.y + 1 == field.y &&
                        other.source == field.source && half_at(other.x, other.y) == (1u << 3);
                });
    }
    // Relevant skills establish the independent right-hand column. A plain
    // unit roster without this column keeps its existing reader and layout.
    if (skill_left == gps_->dimx) return;
    const auto suppress_outside_record = [&](int x, int y, const std::string &source,
            const std::string &complete) {
        if (x < skill_left || y < chooser->viewport.y || y >= chooser->search_y ||
                x + static_cast<int>(source.size()) > chooser->viewport.x + chooser->viewport.w ||
                source.empty() || context[y].compare(x, source.size(), source) != 0) return;
        for (const auto &record : records)
            if (y > record.box.y && y < record.box.y + record.box.h) return;
        const auto skills = translate_rated_skill_list(normalize_utterance(complete));
        if ((!skills || skills->size() != 1) && complete != "No relevant skills") return;
        const int length = static_cast<int>(source.size());
        const auto append = [&](int offset, int count) {
            if (only_y >= 0 && y != only_y) return;
            matches.push_back(Match{x + offset, y, count, kFortressUnitChooserRule,
                {}, source.substr(offset, count)});
        };
        if (rows[y].compare(x, length, source) == 0) {
            append(0, length);
            std::fill_n(rows[y].begin() + x, length, ' ');
        } else if (raw_layer) {
            for (int offset = 0; offset < length;) {
                while (offset < length && rows[y][x + offset] != source[offset]) ++offset;
                const int first = offset;
                while (offset < length && rows[y][x + offset] == source[offset]) ++offset;
                if (offset == first) continue;
                append(first, offset - first);
                std::fill_n(rows[y].begin() + x + first, offset - first, ' ');
            }
        }
    };
    for (const auto &draw : draws) {
        if (draw.unit_identity_target || draw.y < chooser->viewport.y ||
                draw.y >= chooser->search_y || draw.source.empty()) continue;
        int first = std::max(skill_left, draw.x);
        int last = std::min(chooser->viewport.x + chooser->viewport.w,
            draw.x + static_cast<int>(draw.source.size()));
        if (draw.draw_clip) {
            const auto &clip = *draw.draw_clip;
            if (draw.y < clip.y || draw.y >= clip.y + clip.h) continue;
            first = std::max(first, clip.x);
            last = std::min(last, clip.x + clip.w);
        }
        if (first >= last) continue;
        std::string source = draw.source.substr(first - draw.x, last - first);
        size_t length = 0;
        while (length < source.size() && context[draw.y][first + length] == source[length]) ++length;
        source.resize(length);
        bool visible_layer = true;
        for (int x = first; x < first + static_cast<int>(length); ++x)
            if (native_ui_top_layer_at(*gps_, static_cast<size_t>(x) * gps_->dimy + draw.y)
                    != draw.top_layer) { visible_layer = false; break; }
        if (!visible_layer) continue;
        suppress_outside_record(first, draw.y, source,
            draw.complete_source.empty() ? draw.source : draw.complete_source);
    }
    for (int y = chooser->viewport.y; y < chooser->search_y; ++y) {
        std::string slot = context[y].substr(skill_left,
            chooser->viewport.x + chooser->viewport.w - skill_left);
        for (size_t offset = 0; offset < slot.size(); ++offset)
            if (is_cp437_box_separator(slot, offset)) slot[offset] = ' ';
        for (const auto &field : split_text_fields(slot))
            suppress_outside_record(skill_left + field.start, y, field.text, field.text);
    }
    for (auto &record : records) {
        std::string identity_source;
        std::vector<const Field *> identities;
        for (const auto &field : record.fields) {
            if (field.skill || field.duplicate || field.x >= skill_left) continue;
            if (std::any_of(identities.begin(), identities.end(), [&](const Field *other) {
                    return other->complete == field.complete;
                })) continue;
            identities.push_back(&field);
            if (!identity_source.empty()) identity_source += ' ';
            identity_source += normalize_utterance(field.complete);
        }
        std::optional<std::string> identity;
        if (!identities.empty() && !identities.front()->target.empty()) {
            if (identities.size() == 1) identity = identities.front()->target;
            else {
                std::string profession;
                for (size_t index = 1; index < identities.size(); ++index) {
                    if (!profession.empty()) profession += ' ';
                    profession += normalize_utterance(identities[index]->complete);
                }
                const auto role = translate_unit_profession(profession, true);
                if (role) identity = identities.front()->target + "，" + *role;
            }
        }
        if (!identity && identities.size() > 1 &&
                identities.front()->complete.find(',') == std::string::npos) {
            // Native narrow rows draw profession on a separate line. Supply
            // its separator to the common identity parser before joining it.
            std::string separated = identity_source;
            separated.insert(normalize_utterance(identities.front()->complete).size(), ",");
            identity = translate_unit_identity(separated, true);
        }
        if (!identity) identity = translate_unit_identity(identity_source, true);
        if (!identity || identity->empty()) identity = translate_procedural_fragment(identity_source);
        if (!identity || identity->empty()) identity = native_text_to_utf8(identity_source);
        bool first_identity = true;
        for (const auto &field : record.fields) {
            if (!field.skill && field.x >= skill_left) continue;
            const int length = static_cast<int>(field.source.size());
            const auto append = [&](int offset, int count, const std::string &target) {
                if (only_y >= 0 && field.y != only_y) return;
                Match match{field.x + offset, field.y, count, kFortressUnitChooserRule,
                    target, field.source.substr(offset, count)};
                match.native_picture_caption_box = record.box;
                match.layout_x = field.skill ? skill_left : record.box.x + 1;
                match.layout_y = record.box.y + 1;
                match.layout_clip_right = field.skill ? record.box.x + record.box.w : skill_left - 1;
                match.layout_length = match.layout_clip_right - match.layout_x;
                match.layout_fixed_baseline = true;
                match.layout_left = true;
                match.layout_font_pixels = unified_font_pixels();
                match.layout_lock_font_pixels = true;
                bool top = false;
                const auto *cell = cell_at(field.x, field.y, &top);
                if (cell) match.layout_foreground_rgb = (cell[1] << 16) | (cell[2] << 8) | cell[3];
                matches.push_back(std::move(match));
            };
            if (rows[field.y].compare(field.x, length, field.source) == 0) {
                std::string target;
                if (!field.duplicate) {
                    if (field.skill) target = field.target;
                    else if (first_identity) { target = *identity; first_identity = false; }
                }
                append(0, length, target);
                std::fill_n(rows[field.y].begin() + field.x, length, ' ');
            } else if (raw_layer) {
                for (int offset = 0; offset < length;) {
                    while (offset < length && rows[field.y][field.x + offset] != field.source[offset]) ++offset;
                    const int first = offset;
                    while (offset < length && rows[field.y][field.x + offset] == field.source[offset]) ++offset;
                    if (offset == first) continue;
                    append(first, offset - first, {});
                    std::fill_n(rows[field.y].begin() + field.x + first, offset - first, ' ');
                }
            }
        }
    }
}

void Overlay::layout_fortress_unit_chooser(SDL_Renderer *renderer) {
    if (!gps_ || !renderer || !face_ || gps_->tile_pixel_x <= 0 || gps_->tile_pixel_y <= 0) return;
    std::map<std::array<int, 4>, std::vector<Match *>> records;
    for (auto &match : prepared_matches_)
        if (match.rule == kFortressUnitChooserRule && match.native_picture_caption_box) {
            const auto &box = *match.native_picture_caption_box;
            records[{box.x, box.y, box.w, box.h}].push_back(&match);
        }
    const int tile_w = gps_->tile_pixel_x, tile_h = gps_->tile_pixel_y;
    const int origin_x = (gps_->screen_pixel_x - gps_->dimx * tile_w) / 2;
    const int origin_y = (gps_->screen_pixel_y - gps_->dimy * tile_h) / 2;
    std::vector<Match> professions;
    for (auto &[key, fields] : records) {
        const SDL_Rect box{key[0], key[1], key[2], key[3]};
        std::sort(fields.begin(), fields.end(), [](const Match *a, const Match *b) {
            return a->y != b->y ? a->y < b->y : a->x < b->x;
        });
        for (auto *field : fields) {
            if (field->target.empty() || field->native_split_duplicate) continue;
            const bool skill = field->layout_x != box.x + 1;
            const int left = field->layout_x, right = field->layout_clip_right;
            if (left >= right) continue;
            field->layout_box_pixel_x = -1;
            field->layout_box_pixel_width = 0;
            field->layout_y = skill ? field->y : box.y + 1;
            field->layout_pixel_y = 0;
            field->layout_fixed_baseline = true;
            field->layout_right = false;
            field->layout_ellipsize = true;
            field->layout_left = true;
            field->layout_font_pixels = unified_font_pixels();
            field->layout_lock_font_pixels = true;
            field->layout_visual_height_pixels = 0;
            field->layout_line_height_pixels = tile_h;
            field->layout_native_clip = SDL_Rect{origin_x + left * tile_w,
                origin_y + box.y * tile_h, (right - left) * tile_w, box.h * tile_h};
            if (!skill) {
                const auto fitted = ellipsize_text(field->target,
                    (right - left) * tile_w - 2 * config_.horizontal_padding);
                const size_t comma = field->target.find("，");
                if (fitted && fitted->shortened && comma != std::string::npos &&
                        comma > 0 && comma + 3 < field->target.size()) {
                    // Use the existing row's two interior baselines when a
                    // long name would otherwise hide its profession suffix.
                    Match profession = *field;
                    profession.source.clear();
                    profession.length = 0;
                    profession.target = field->target.substr(comma + 3);
                    profession.layout_y = box.y + 1;
                    profession.layout_pixel_y = tile_h / 2;
                    professions.push_back(std::move(profession));
                    field->target.resize(comma);
                    field->layout_y = box.y;
                    field->layout_pixel_y = tile_h / 2;
                }
            }
        }
    }
    prepared_matches_.insert(prepared_matches_.end(),
        std::make_move_iterator(professions.begin()), std::make_move_iterator(professions.end()));
}
