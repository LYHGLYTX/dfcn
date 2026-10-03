// A written item can be named by its work alone. Share the same title grammar
// between inventory/Stocks captions and activities, preserving item wrappers.
std::optional<std::string> Overlay::translate_written_item_caption(
        std::string_view source, bool book_context) const {
    if (!config_.compositional_rules) return std::nullopt;
    const auto written = [&](auto &&self, std::string_view value,
                             unsigned depth, bool book_context)
            -> std::optional<std::string> {
        value = trim_view(value);
        if (value.empty() || value.ends_with("...") || depth >= 8)
            return std::nullopt;
        if (const auto suffix = item_number_suffix(value); !suffix.empty()) {
            const auto title = self(self, value.substr(0,
                value.size() - suffix.size()), depth + 1, book_context);
            return title ? std::optional<std::string>(*title + std::string(suffix))
                         : std::nullopt;
        }
        const auto designation = split_item_designation(value);
        if (!designation.prefix.empty()) {
            const auto title = self(self, designation.item, depth + 1, book_context);
            return title ? std::optional<std::string>(designation.prefix +
                *title + designation.suffix) : std::nullopt;
        }
        // The copy annotation establishes a written work even when its title
        // is just a generated name. Its wording stays in the shared item TSV.
        for (int index : item_description_term_rules_) {
            const Rule &rule = rules_[static_cast<size_t>(index)];
            if (rule.source != "{s} (copy)") continue;
            if (auto title = translate_complete_item_description_rule(rule, value,
                    [&](char kind, std::string_view part) {
                        return kind == 's' && part.size() < value.size()
                            ? self(self, part, depth + 1, true) : std::nullopt;
                    })) return title;
        }
        // Read/copy supplies the book type. An ordinary item field instead
        // needs a complete book-title production before accepting a name.
        if (!book_context) {
            for (int index : legends_book_rules_) {
                const auto title = translate_legends_nested(
                    rules_[static_cast<size_t>(index)], value, depth);
                if (item_description_translation_complete(title)) return title;
            }
            return std::nullopt;
        }
        const auto title = translate_legends_book(value);
        return item_description_translation_complete(title) ? title : std::nullopt;
    };
    return written(written, source, 0, book_context);
}

// A fully consumed typed item production can contain an authored cage name
// or a personal nickname. Its grammar proves those fields; Latin characters
// in them do not make the rest of the item an untranslated fragment.
std::optional<std::string> Overlay::translate_item_caption_grammar(
        std::string_view source) const {
    if (!config_.compositional_rules) return std::nullopt;
    std::vector<size_t> origins;
    auto target = RULESETS.translate_with_origins(native_text_to_utf8(source),
        "::items", origins);
    if (!target || target->empty() || target->find("[C:") != std::string::npos ||
        target->find_first_of("\r\n") != std::string::npos) return std::nullopt;
    return target;
}

// Display and Stocks filtering resolve the same unabridged caption. Context
// is part of the cache key: bare building ash must not reuse the ordinary noun.
std::optional<std::string> Overlay::translate_fortress_item_caption(
        std::string_view source, bool relationship, bool building_material) const {
    TranslationStateScope translation_scope;
    if (source.empty()) return std::nullopt;
    // The picture/action-strip reader can recover an Owner row without a
    // rectangular detail panel. It is still a relationship with a unit, not
    // an item name; classify its complete source before caching or parsing.
    relationship = relationship || source.starts_with("Owner: ");
    std::string key;
    key.push_back(relationship ? 'R' : 'I');
    key.push_back(building_material ? 'M' : 'N');
    key.append(source);
    if (const auto found = fortress_item_caption_cache_.find(key);
        found != fortress_item_caption_cache_.end()) return found->second;

    TranslationWorkScope work;
    std::optional<std::string> target;
    bool typed_description_complete = false;
    try {
        TranslationWorkFrame work_frame("complete item caption", source);
        if (building_material && config_.compositional_rules)
            target = translate_material_name(source, true);
        // Bulk resources already are complete material nouns. Resolve their
        // species/state together before the more general item grammar can
        // reinterpret a species word as an independent material.
        if (!target && !relationship && config_.compositional_rules)
            target = translate_material_name(source);
        // This field already proves an item. Its scoped production must win
        // over homonyms in the general dictionary (a casket is a coffin here,
        // and generated sword/knife types are objects rather than skills).
        // Decode native designation glyphs at the grammar boundary as well;
        // a knapped rock can mark only "sharp", inside the complete caption.
        if (!target && !relationship) {
            target = translate_item_caption_grammar(source);
            typed_description_complete = target.has_value();
        }
        if (!target) target = exact_literal_translation(source);
        if (!target && config_.compositional_rules && !source.ends_with("...")) {
            if (relationship && (source.starts_with("In ") ||
                source.starts_with("On ") || source.starts_with("With ") ||
                source.starts_with("Owner: ")))
                target = translate_item_description_source(source, true);
            if (!target) target = translate_item_description_term(source);
            // Typed item descriptions resolve personal names and preserve
            // authored nicknames. Keep their completeness proof at the caption
            // boundary; literal and generic fallbacks retain the strict check.
            typed_description_complete =
                translation_complete_with_native_nicknames(target, source);
            if (!target) {
                target = translate_item_caption_grammar(source);
                typed_description_complete = target.has_value();
            }
            if (!target) target = translate_coin_item_name(source);
            if (!target) target = translate_arena_equipment_source_phrase(source);
            if (!target) target = translate_embark_equipment_item(source, -1, -1, source);
            if (!target) target = translate_written_item_caption(source);
            // Detail headings and item records can contain only an artifact's
            // native name. Share inventory's same-language root validation for
            // its compound/title groups before generic item composition.
            if (!target) target = translate_procedural_fragment(std::string(source),
                false, false, {}, ProceduralFragmentContext::native_item_name);
            if (!target) target = translate_compositional(std::string(source));
        }
        if ((!typed_description_complete && !item_description_translation_complete(target)) ||
            target->find("[C:") != std::string::npos ||
            target->find_first_of("\r\n") != std::string::npos) target.reset();
    } catch (const TranslationWorkLimit &limit) {
        // Only the complete caller may retain an interrupted result. Nested
        // item/grammar parsers must unwind without memoizing partial misses.
        if (!work.owns_budget()) throw;
        target.reset();
        log_line("WARN", "Item caption translation work limit; keeping native text: " +
            std::string(source.substr(0, 256)) + "; stage=" + limit.stage);
    }

    // Search visits offscreen groups too; retain misses and bound both count
    // and text storage. Query edits never flush the full-name cache.
    constexpr size_t max_records = 8192, max_bytes = 8 * 1024 * 1024;
    const size_t bytes = key.size() * 2 + (target ? target->size() : 0);
    if (bytes <= max_bytes) {
        while (!fortress_item_caption_order_.empty() &&
                (fortress_item_caption_cache_.size() >= max_records ||
                 fortress_item_caption_bytes_ + bytes > max_bytes)) {
            const auto found = fortress_item_caption_cache_.find(
                fortress_item_caption_order_.front());
            fortress_item_caption_bytes_ -= found->first.size() * 2 +
                (found->second ? found->second->size() : 0);
            fortress_item_caption_cache_.erase(found);
            fortress_item_caption_order_.pop_front();
        }
        fortress_item_caption_cache_.emplace(key, target);
        fortress_item_caption_order_.push_back(std::move(key));
        fortress_item_caption_bytes_ += bytes;
    }
    return target;
}

// The native title draw establishes the field's type before any word/column
// matching. Buildings and terrain must not go through a material/person
// fallback that can absorb their state, direction or engraving prefix.
std::optional<std::string> Overlay::translate_info_panel_title(
        NativeInfoTitleKind kind, std::string_view source) const {
    if (kind == NativeInfoTitleKind::None || source.empty()) return std::nullopt;
    if (kind == NativeInfoTitleKind::Item)
        return translate_fortress_item_caption(source);
    if (kind == NativeInfoTitleKind::DisplayStatus) {
        std::vector<int> colors;
        return translate_help_paragraph(std::string(source),
            std::vector<int>(source.size(), 0xffffff), colors, true);
    }
    const std::string key = "\x01title:" + std::to_string(static_cast<int>(kind)) +
        ":" + std::string(source);
    if (const auto found = compositional_cache_.find(key);
            found != compositional_cache_.end()) return found->second;
    TranslationStateScope state;
    TranslationWorkScope work;
    std::optional<std::string> target;
    try {
        TranslationWorkFrame frame("information panel title", source);
        const std::string utf8 = native_text_to_utf8(source);
        if (kind == NativeInfoTitleKind::Engraving) {
            target = exact_literal_translation(source);
            if (!target && config_.compositional_rules)
                target = translate_procedural_fragment(std::string(source), false, false,
                    {}, ProceduralFragmentContext::generated_name);
        } else if (config_.compositional_rules) {
            if (kind == NativeInfoTitleKind::Building) {
                std::vector<size_t> origins;
                target = RULESETS.translate_with_origins(utf8, "::map_hover::building", origins);
                if (!target && source.find("Stockpile #") != std::string_view::npos) {
                    for (int index : candidate_template_rules(source)) {
                        const Rule &rule = rules_[static_cast<size_t>(index)];
                        if (rule.source != "Stockpile #{d}" &&
                                rule.source != "{s} Stockpile #{d}") continue;
                        size_t end = 0;
                        std::vector<std::string> captures;
                        if (!match_template(rule, source, 0, &end, &captures) ||
                                end != source.size()) continue;
                        bool complete = false;
                        auto stockpile = translate_template_captures(rule, captures, &complete);
                        if (complete && !stockpile.empty()) {
                            target = std::move(stockpile);
                            break;
                        }
                    }
                }
                if (!target) {
                    // Weapon furniture describes its single installed item
                    // after the native state. The item may own a complete
                    // art subject or artifact name outside ::items' grammar.
                    for (const std::string_view state : {"Upright ", "Retracted "}) {
                        if (!template_literal_at(source, 0, state, true)) continue;
                        const auto item = translate_fortress_item_caption(source.substr(state.size()));
                        const auto status = RULESETS.compose_bound_rule(
                            "::map_hover::building::weapon_state", std::string(state), {});
                        if (item && status)
                            target = RULESETS.compose_bound_rule("::map_hover::building",
                                "{weapon_state}{weapon_contents}",
                                {{"weapon_state", *status}, {"weapon_contents", *item}});
                        break;
                    }
                }
                // Offering places, displays, instruments and tool workshops
                // delegate their native heading to getDescription. Keep the
                // ordinary building grammar first so material + building
                // labels cannot become generated names again.
                if (!target) target = translate_fortress_item_caption(source);
            } else if (kind == NativeInfoTitleKind::Terrain) {
                target = RULESETS.translate_tile_description(utf8);
            } else if (kind == NativeInfoTitleKind::PlannedEngraving &&
                    utf8.starts_with("Engraving ")) {
                if (auto terrain = RULESETS.translate_tile_description(utf8.substr(10)))
                    target = RULESETS.compose_bound_rule("::", "Engraving {tiles}",
                        {{"tiles", *terrain}});
            }
        }
        std::vector<uint32_t> codepoints;
        if (target && (target->empty() || target->find("[C:") != std::string::npos ||
                target->find_first_of("\r\n") != std::string::npos ||
                !decode_utf8(*target, codepoints))) target.reset();
    } catch (const TranslationWorkLimit &) {
        if (!work.owns_budget()) throw;
        target.reset();
    }
    constexpr size_t capacity = 4096;
    if (compositional_cache_.size() >= capacity && !compositional_cache_order_.empty()) {
        compositional_cache_.erase(compositional_cache_order_.front());
        compositional_cache_order_.pop_front();
    }
    compositional_cache_order_.push_back(key);
    compositional_cache_.emplace(key, target);
    return target;
}

// Native information-sheet titles and display furniture records own their
// complete fields before location, stockpile and item-row readers see them.
void Overlay::append_native_info_panel_titles(std::vector<std::string> &rows,
        std::vector<Match> &matches, int only_y) const {
    const auto drawn = captured_native_drawn_text_rows();
    const auto top_drawn = captured_native_drawn_text_rows(true);
    // These fields are proven by their actual native draw callers, including
    // headings without Weight or an item-action strip. Match every displayed
    // byte and the current layer; a retained draw cannot own a newer popup.
    // Spaces and CJK inside authored fields never become column separators.
    const auto titles = [&](const auto &draws, bool top_layer) {
        for (const auto &draw : draws) {
            if (draw.info_title_kind == NativeInfoTitleKind::None || draw.source.empty() ||
                    draw.x < 0 || draw.x >= gps_->dimx || draw.y < 0 || draw.y >= gps_->dimy ||
                    (only_y >= 0 && draw.y != only_y) ||
                    draw.source.size() > static_cast<size_t>(gps_->dimx - draw.x)) continue;
            int end = draw.x + static_cast<int>(draw.source.size());
            bool button_clipped = false;
            if (rows[draw.y].compare(draw.x, draw.source.size(), draw.source) != 0) {
                size_t matching = 0;
                while (matching < draw.source.size() &&
                        rows[draw.y][draw.x + matching] == draw.source[matching]) ++matching;
                int edge = -1;
                // Buttons are drawn after the title. Only a complete native
                // button skin proves an overwritten suffix; an arbitrary
                // mismatch or foreground popup never grants text ownership.
                for (int at = draw.x + 1; at <= draw.x + static_cast<int>(matching) && edge < 0; ++at)
                    if (native_info_title_action_button_at(*gps_, at, draw.y)) edge = at;
                if (edge < 0) continue;
                end = edge;
                button_clipped = true;
            }
            bool current = true;
            for (int x = draw.x; current && x < end; ++x) {
                bool top = false;
                const auto *cell = cell_at(x, draw.y, &top);
                current = top == top_layer && cell &&
                    cell[0] == static_cast<unsigned char>(draw.source[x - draw.x]);
            }
            if (!current) continue;
            const auto &complete = draw.complete_source.empty() ? draw.source : draw.complete_source;
            auto target = draw.info_title_authored ?
                std::optional<std::string>(native_text_to_utf8(complete)) :
                translate_info_panel_title(draw.info_title_kind, complete);
            const bool translated = target.has_value();
            if (!target) target = native_text_to_utf8(complete);
            if (target->empty() || target->find_first_of("\r\n") != std::string::npos) continue;
            // Expand only over the title's actual empty strip. The first
            // current glyph, control or border bounds its available width.
            const bool native_bounds = button_clipped || draw.info_title_right >= end;
            const int clip_right = !button_clipped && draw.info_title_right >= end ?
                std::min(gps_->dimx, draw.info_title_right) : end;
            int right = end;
            for (; right < clip_right; ++right) {
                bool top = false;
                const auto *cell = cell_at(right, draw.y, &top);
                if (!cell || top != top_layer || (cell[0] && cell[0] != ' ')) break;
                const auto *tiles = top ? gps_->screentexpos_top : gps_->screentexpos;
                if (tiles && tiles[static_cast<size_t>(right) * gps_->dimy + draw.y] > 0) break;
            }
            bool caption_top = false;
            const auto *cell = cell_at(draw.x, draw.y, &caption_top);
            Match caption{draw.x, draw.y, end - draw.x, kFortressItemCaptionRule,
                std::move(*target), draw.source.substr(0, static_cast<size_t>(end - draw.x))};
            caption.native_hover_untranslated = !translated;
            caption.layout_foreground_rgb = cell ?
                (cell[1] << 16) | (cell[2] << 8) | cell[3] : 0xffffff;
            caption.layout_x = draw.x;
            caption.layout_y = draw.y;
            caption.layout_length = native_bounds ? right - draw.x : 0;
            caption.layout_left = true;
            caption.layout_clip_right = native_bounds ? right : -1;
            caption.layout_font_pixels = std::clamp(
                static_cast<int>(gps_->tile_pixel_y * config_.font_scale), 1, gps_->tile_pixel_y);
            caption.layout_lock_font_pixels = true;
            caption.layout_line_height_pixels = gps_->tile_pixel_y;
            matches.push_back(std::move(caption));
            std::fill(rows[draw.y].begin() + draw.x, rows[draw.y].begin() + end, ' ');
        }
    };
    titles(drawn, false);
    titles(top_drawn, true);
}

// Item records own their complete names, including a native clipped source.
// Detail headings use the picture/Weight band; their contents use adjoining
// picture buttons, while building rows use the item action strip. Stocks
// groups have a text rectangle and state actions without a picture. None is
// hover prose or the Stocks category pane.
void Overlay::append_fortress_item_captions(std::vector<std::string> &rows,
        std::vector<Match> &matches, int only_y) const {
    const auto drawn = captured_native_drawn_text_rows();
    const auto top_drawn = captured_native_drawn_text_rows(true);
    if (!native_item_anchors_in(*gps_, {0, 0, gps_->dimx, gps_->dimy})) return;
    const auto captures = captured_clipped_captions();
    const NativePanelBorders borders(*gps_);
    const auto settings = native_ui_settings();
    const bool classic = settings && settings->classic;
    const size_t first_match = matches.size();
    // Uniform requirements have a picture and Mat/Color controls, but no
    // item-state action strip. Their names still own a complete left-aligned
    // column; generic word matching would centre each translated name in its
    // different English ink width. Establish this editor from its own save
    // button and both footer controls before interpreting any item rows.
    const auto caption_button = [&](std::string_view source, int y,
                                    int left, int right) -> std::optional<SDL_Rect> {
        for (size_t at = rows[y].find(source, left); at != std::string::npos &&
                at + source.size() <= static_cast<size_t>(right);
                at = rows[y].find(source, at + 1)) {
            bool current = true;
            for (size_t i = 0; i < source.size() && current; ++i)
                current = visible_char_at(static_cast<int>(at + i), y) == source[i];
            if (!current) continue;
            const auto button = native_button_text_rect(*gps_, static_cast<int>(at),
                static_cast<int>(at + source.size()), y);
            if (button && button->x >= left && button->x + button->w <= right)
                return button;
        }
        return std::nullopt;
    };
    std::optional<SDL_Rect> uniform_panel;
    int uniform_top = -1, uniform_bottom = -1;
    for (int y = 1; y + 1 < gps_->dimy && !uniform_panel; ++y) {
        const auto save = caption_button("Confirm and save uniform", y, 0, gps_->dimx);
        if (!save) continue;
        const auto panel = native_panel_interior(borders, *gps_, *save);
        if (!panel) continue;
        const int right = panel->x + panel->w;
        for (int footer_y = y + 1; footer_y + 1 < panel->y + panel->h; ++footer_y) {
            auto clothing = caption_button("Uniform worn over clothing", footer_y, panel->x, right);
            if (!clothing)
                clothing = caption_button("Uniform replaces clothing", footer_y, panel->x, right);
            if (!clothing) continue;
            auto matching = caption_button("Partial matches okay", footer_y, clothing->x + clothing->w, right);
            if (!matching)
                matching = caption_button("Exact matches only", footer_y, clothing->x + clothing->w, right);
            if (!matching) continue;
            uniform_panel = panel;
            uniform_top = save->y + save->h;
            uniform_bottom = clothing->y;
            break;
        }
    }
    const auto append_caption = [&](int left, int end, int right, int y,
                                    bool bounded_button = false,
                                    bool building_material = false,
                                    bool display_status = false,
                                    std::optional<SDL_Rect> caption_box = std::nullopt,
                                    int layout_left = -1) {
        if (end <= left || right <= left) return;
        const std::string visible = rows[y].substr(left, end - left);
        bool top_layer = false;
        const auto *first_cell = cell_at(left, y, &top_layer);
        const int foreground = first_cell ?
            (first_cell[1] << 16) | (first_cell[2] << 8) | first_cell[3] : 0xffffff;
        for (int x = left; x < end; ++x) {
            const auto ch = visible_char_at(x, y);
            // Classic category and picture frames share a skin. A category
            // can therefore lead the picture walk across a filtered scrollbar
            // to another pane's item actions. Its intervening frame is never
            // part of an item name; leave that field for its own typed reader.
            // Bound UTF-8 recognition to this name, not the preceding grid.
            if ((ch ? ch : ' ') != static_cast<unsigned char>(rows[y][x]) ||
                is_cp437_box_separator(visible, static_cast<size_t>(x - left))) return;
        }
        std::string complete = visible;
        // Retained frames keep the original name with its native draw even
        // after the per-frame clipping registry advances. Position, layer
        // and the complete visible bytes must all agree before restoring it.
        for (const auto &draw : top_layer ? top_drawn : drawn)
            if (draw.x == left && draw.y == y && draw.source == visible &&
                !draw.complete_source.empty()) {
                complete = draw.complete_source;
                break;
            }
        if (complete == visible)
            for (const auto &capture : captures)
                if (capture.x == left && capture.y == y && capture.visible == visible) {
                    complete = capture.complete;
                    break;
                }
        // Building components can omit the item noun entirely (ash, not ash
        // logs). Their native incorporated marker establishes the material
        // role before an ordinary dictionary/noun sense can claim the field.
        // Loose products and task inputs have different markers and retain
        // the ordinary item grammar, including actual furnace ash.
        std::vector<int> target_colors;
        // Statuses belong to the complete UI-message catalog (hP), not
        // item-name phonetics or ordinary exact literals. Their native row
        // stays independent of the title even when the message is unknown.
        auto target = display_status
            ? translate_help_paragraph(complete,
                std::vector<int>(complete.size(), foreground), target_colors, true)
            : translate_fortress_item_caption(complete, bounded_button, building_material);
        const bool translated = target.has_value();
        // Unknown names still own one field, so isolated material/creature
        // words cannot replace fragments of an untranslated clipped heading.
        if (!translated) target = native_text_to_utf8(complete);
        if (target->empty() || target->find("[C:") != std::string::npos ||
            target->find_first_of("\r\n") != std::string::npos) return;
        // A proved picture button owns its full text strip. Its background
        // may be on either native texture layer and is not a text obstacle.
        for (int x = end; !bounded_button && x < right; ++x) {
            bool top = false;
            cell_at(x, y, &top);
            const auto *tiles = top ? gps_->screentexpos_top : gps_->screentexpos;
            if (tiles && tiles[static_cast<size_t>(x) * gps_->dimy + y] > 0) {
                right = x;
                break;
            }
        }
        Match caption{left, y, end - left, kFortressItemCaptionRule, *target, visible};
        caption.native_hover_untranslated = !translated;
        caption.native_picture_caption_box = caption_box;
        caption.layout_foreground_rgb = foreground;
        caption.layout_glyph_foreground_rgb = std::move(target_colors);
        caption.layout_x = layout_left >= 0 ? layout_left : left;
        caption.layout_y = y;
        caption.layout_length = right - caption.layout_x;
        caption.layout_left = true;
        caption.layout_clip_right = right;
        caption.layout_font_pixels = std::clamp(
            static_cast<int>(gps_->tile_pixel_y * config_.font_scale), 1, gps_->tile_pixel_y);
        caption.layout_lock_font_pixels = true;
        caption.layout_line_height_pixels = gps_->tile_pixel_y;
        matches.push_back(std::move(caption));
        std::fill(rows[y].begin() + left, rows[y].begin() + end, ' ');
    };
    std::vector<NativeItemRowClip> scroll_clips;
    // First prove complete item records and their enclosing scroll control.
    // Then read only the exposed middle rows at its two clipping boundaries.
    // Discover siblings even for a single-row suppression query, so a row has
    // identical ownership during native glyph suppression and final layout.
    for (int pass = 0; pass < 2; ++pass) {
        if (pass == 1 && scroll_clips.empty()) break;
        for (int y = 0; y < gps_->dimy; ++y) {
            // An owned item's title is on the picture's top row; an unowned
            // item's title is on its middle row. Include both in single-row scans.
            if (pass == 1 && only_y >= 0 && y != only_y) continue;
            for (int picture = 0; picture < gps_->dimx; ++picture) {
                const NativeItemRowClip *row_clip = nullptr;
                if (pass == 1) {
                    for (const auto &clip : scroll_clips)
                        if (picture == clip.bounds.x &&
                            (y == clip.bounds.y || y == clip.bounds.y + clip.bounds.h - 1)) {
                            row_clip = &clip;
                            break;
                        }
                    if (!row_clip) continue;
                }
                const int picture_right = native_picture_box_right(*gps_, picture, y, row_clip);
                if (picture_right < 0) continue;
                if (pass == 0 && uniform_panel && picture >= uniform_panel->x &&
                    picture_right == picture + 5 && y - 1 >= uniform_top &&
                    y + 1 < uniform_bottom) {
                    const int panel_right = uniform_panel->x + uniform_panel->w;
                    const auto material = caption_button("Mat", y, picture_right, panel_right);
                    const auto color = material ? caption_button("Color", y,
                        material->x + material->w, panel_right) : std::nullopt;
                    if (material && color && material->w == 3 && color->w == 5 &&
                        material->h == 3 && color->h == 3 &&
                        color->x == material->x + 6 && color->y == material->y) {
                        // Native uniform renderer (53.16 PE 0x140451b99):
                        // Mat's interior starts at R-16; split=(R+2*L)/3.
                        // The name is [L+6, split-2), while assigned-item
                        // status starts at split+6. Use the current controls,
                        // including the scrollbar's inset, to recover R.
                        const int row_right = material->x + 16;
                        const int left = picture_right + 1;
                        const int right = (row_right + 2 * picture) / 3 - 2;
                        const bool top = native_ui_top_layer_at(*gps_,
                            static_cast<size_t>(picture) * gps_->dimy + y);
                        bool current = row_right < panel_right && right > left &&
                            right < material->x;
                        for (int x = picture; current && x <= color->x + color->w; ++x)
                            for (int row = y - 1; row <= y + 1; ++row)
                                if (native_ui_top_layer_at(*gps_,
                                        static_cast<size_t>(x) * gps_->dimy + row) != top)
                                    current = false;
                        if (current) {
                            // Keep the original source span for suppression.
                            // Both native half-font rows, when present, use
                            // this same column and the existing normalization.
                            for (const int row : {y, y + 1}) {
                                if (only_y >= 0 && row != only_y) continue;
                                int first = left, end = right;
                                while (first < end && rows[row][first] == ' ') ++first;
                                while (end > first && rows[row][end - 1] == ' ') --end;
                                append_caption(first, end, right, row, true,
                                    false, false, std::nullopt, left);
                            }
                            picture = color->x + color->w;
                            continue;
                        }
                    }
                }
                // Display records identify themselves by their adjoining
                // picture, caption, on/off control and complete status field.
                // The footer and outer bottom border may be outside the
                // visible sheet; neither bounds this record's text fields.
                if (pass == 0 && y + 1 < gps_->dimy &&
                    (only_y < 0 || y == only_y || y + 1 == only_y)) {
                    const int panel_right = gps_->dimx;
                    int left = picture_right;
                    while (left < panel_right &&
                        (!visible_char_at(left, y) || visible_char_at(left, y) == ' ')) ++left;
                    bool display_caption = false;
                    // 53.16 BUILDING_SHEET_DISPLAY_FURNITURE_ITEM_ON/OFF:
                    // the RAW parser assigns 506/507 (PE 0x10fecb8/0x10fecd3).
                    // The four-column control overwrites the caption's cap;
                    // the title is on its middle row and the status below it.
                    for (const int state : {506, 507}) {
                        const auto caption = native_picture_caption_rect(*gps_, left, y,
                            false, nullptr, true, nullptr, false, false, state);
                        if (!caption || caption->x < picture_right ||
                            caption->x + caption->w + 4 > panel_right ||
                            !native_main_button_at(*gps_, caption->x + caption->w, y, state))
                            continue;
                        const int right = caption->x + caption->w;
                        if (right <= left) continue;
                        std::array<int, 2> field_ends{};
                        // Read both fields before taking ownership, including
                        // in a one-row suppression pass.
                        for (const int row : {y, y + 1}) {
                            int end = right;
                            // The status replaces part of the lower rail in
                            // classic mode. Only its actual text belongs to
                            // suppression; the remaining rail is still skin.
                            const std::string_view field(rows[row].data() + left, right - left);
                            for (int x = left; x < end; ++x)
                                if (is_cp437_box_separator(field, x - left)) { end = x; break; }
                            while (end > left && rows[row][end - 1] == ' ') --end;
                            bool top = false;
                            cell_at(left, row, &top);
                            for (const auto &draw : top ? top_drawn : drawn) {
                                if (draw.x != left || draw.y != row || draw.source.empty() ||
                                    draw.source.size() > static_cast<size_t>(right - left) ||
                                    rows[row].compare(left, draw.source.size(), draw.source) != 0)
                                    continue;
                                end = left + static_cast<int>(draw.source.size());
                                break;
                            }
                            field_ends[row - y] = end;
                        }
                        // The native on/off artwork is shared with unit and
                        // farm selectors. Only a complete display status may
                        // give this picture row item-caption ownership.
                        const auto status = trim_view(std::string_view(
                            rows[y + 1].data() + left, field_ends[1] - left));
                        if (status != "On display" && status != "Assigned") continue;
                        for (const int row : {y, y + 1}) {
                            if (only_y >= 0 && row != only_y) continue;
                            append_caption(left, field_ends[row - y], right, row, true, false,
                                row != y, caption);
                        }
                        picture = right + 3;
                        display_caption = true;
                        break;
                    }
                    if (display_caption) continue;
                }
                if (const auto panel = pass == 0 ? native_item_detail_panel(
                        borders, *gps_, picture, picture_right, y,
                        [this](int x, int row) { return visible_char_at(x, row); }) : std::nullopt) {
                    const auto heading = native_item_detail_heading(*gps_, *panel,
                        [this](int x, int row) { return visible_char_at(x, row); });
                    if (heading) {
                        if ((heading->y == y || heading->y + 1 == y) &&
                            heading->x >= picture_right) {
                            if (only_y < 0 || heading->y == only_y) {
                                const int right = heading->x + heading->w;
                                int left = heading->x, end = right;
                                while (left < end && rows[heading->y][left] == ' ') ++left;
                                while (end > left && rows[heading->y][end - 1] == ' ') --end;
                                append_caption(left, end, right, heading->y);
                            }
                            continue;
                        }
                        // Adventure containers list their contents as complete
                        // picture buttons with no forbid/dump/inspect strip.
                        // Prove both the enclosing item sheet and this adjoining
                        // button before reserving its entire name. A unit portrait
                        // or an unrelated picture list cannot establish this path.
                        if (y >= heading->y + heading->h &&
                            (only_y < 0 || y == only_y)) {
                            const int right = panel->x + panel->w;
                            int left = picture_right, end = right;
                            while (left < end && rows[y][left] == ' ') ++left;
                            while (end > left && rows[y][end - 1] == ' ') --end;
                            const auto button = native_button_text_span(*gps_, left, end, y);
                            if (button && button->first >= picture_right &&
                                button->first <= picture_right + 1 &&
                                button->second <= right) {
                                append_caption(left, end, button->second, y, true);
                                picture = button->second;
                                continue;
                            }
                        }
                    }
                }
                int controls = -1;
                std::optional<std::pair<int, int>> caption_button;
                for (int x = picture_right; x < gps_->dimx; ++x) {
                    if (native_item_action_at(*gps_, x, y, row_clip)) { controls = x - 1; break; }
                    const int edge = native_picture_box_right(*gps_, x, y, row_clip);
                    if (edge <= x) continue;
                    // The neutral role uses the same frame as a picture.
                    // This scan reaches its left cap before its centre, so
                    // prove the action before treating it as another picture
                    // or a caption rectangle. Item-only strip proof follows.
                    if (edge == x + 3 && native_item_action_at(*gps_, x + 1, y, row_clip)) {
                        controls = x;
                        break;
                    }
                    // Classic picture and caption boxes share their frame skin.
                    // The adjoining rectangle is the NAME field, not another
                    // portrait terminating this record. Retain its inner bounds
                    // so neither cap becomes part of the source/translation.
                    if (!classic || caption_button) break;
                    bool adjoining = true;
                    for (int gap = picture_right; gap < x; ++gap)
                        if (rows[y][gap] != ' ') adjoining = false;
                    if (!adjoining) break;
                    caption_button = {{x + 1, edge - 1}};
                    x = edge - 1;
                }
                if (controls < 0) {
                    // Loose-item selectors show a container and its contents
                    // as picture/caption buttons, without Weight or an item
                    // action strip. A paired designation plus the native
                    // stack/container annotation proves the item role. Bulk
                    // material choices instead prove it through the complete
                    // material grammar; a portrait's bare species cannot.
                    // Own the whole label, including sex, count and enclosing
                    // designation, before generic word/field matching splits it.
                    if (pass != 0 || (only_y >= 0 && y != only_y)) continue;
                    std::optional<SDL_Rect> box;
                    for (int x = picture_right; x <= picture_right + 1 && !box; ++x)
                        box = native_picture_caption_rect(*gps_, x, y);
                    if (!box || box->x < picture_right || box->x > picture_right + 1)
                        continue;
                    const int right = box->x + box->w;
                    int left = box->x, end = right;
                    while (left < end && rows[y][left] == ' ') ++left;
                    while (end > left && rows[y][end - 1] == ' ') --end;
                    if (left == end) continue;
                    std::string_view item(rows[y].data() + left, end - left);
                    bool numbered = false, designated = false;
                    for (;;) {
                        const size_t previous = item.size();
                        if (const auto suffix = item_number_suffix(item); !suffix.empty()) {
                            numbered = true;
                            item.remove_suffix(suffix.size());
                        }
                        const auto designation = split_item_designation(item);
                        designated = designated || !designation.prefix.empty();
                        item = designation.item;
                        if (item.size() == previous) break;
                    }
                    if (item.empty()) continue;
                    const bool raw_material = config_.compositional_rules &&
                        translate_material_name(normalize_utterance(item)).has_value();
                    if ((!numbered || !designated) && !raw_material) continue;
                    // The popup's close button makes its outer frame stepped.
                    // The complete adjoining three-row button is the boundary,
                    // independent of that nonrectangular enclosing frame.
                    // Native English labels have different centering offsets.
                    // Use this button's icon-relative inset for every complete
                    // translated row, while suppression keeps the original span.
                    append_caption(left, end, right, y, true, false, false,
                        box, std::min(box->x + 1, right - 1));
                    picture = right;
                    continue;
                }
                // Creature rosters use the same portrait frame, recenter and
                // inspect buttons. Those controls alone must not reserve the name
                // as untranslated item text before the personal-name/profession
                // grammar runs. Require an item-only state action or incorporated
                // role in this SAME contiguous strip, not elsewhere on the row.
                bool item_controls = false;
                bool building_material = false;
                int strip_right = controls + 3;
                for (int x = controls + 1;
                     x < gps_->dimx && x <= strip_right + 3; ++x) {
                    if (!native_item_action_at(*gps_, x, y, row_clip)) continue;
                    item_controls = item_controls || native_item_state_action_at(*gps_, x, y, row_clip);
                    building_material = building_material || native_building_material_at(*gps_, x, y, row_clip);
                    strip_right = x + 2;
                }
                if (!item_controls && !building_material) continue;
                if (pass == 0 && std::none_of(scroll_clips.begin(), scroll_clips.end(),
                        [&](const NativeItemRowClip &clip) {
                            return clip.bounds.x == picture && y > clip.bounds.y &&
                                y < clip.bounds.y + clip.bounds.h - 1;
                        })) {
                    if (const auto clip = native_item_list_clip(*gps_, borders, picture, strip_right, y))
                        scroll_clips.push_back(*clip);
                }
                if (only_y >= 0 && y != only_y) continue;
                const int right = caption_button ? caption_button->second : controls;
                int left = caption_button ? caption_button->first : picture_right;
                while (left < right && rows[y][left] == ' ') ++left;
                int end = right;
                while (end > left && rows[y][end - 1] == ' ') --end;
                if (row_clip) {
                    bool same_layer = true;
                    for (int x = picture; x < strip_right && same_layer; ++x)
                        for (int band = std::max(y - 1, row_clip->bounds.y);
                             band <= std::min(y + 1, row_clip->bounds.y + row_clip->bounds.h - 1); ++band)
                            if (!native_item_row_layer_at(*gps_, x, band, row_clip->top_layer))
                                same_layer = false;
                    if (!same_layer) continue;
                }
                append_caption(left, end, right, y, caption_button.has_value(), building_material);
                picture = controls;
            }
        }
    }
    // Group headings have no picture box, so the item-record walk above
    // cannot own them. Prove their native frame and adjoining item-only state
    // action before handing the entire name/count to the same parser.
    // Start at the actual cap: classic headings can overwrite it with either
    // their first letter or a leading space. The shared rectangle reader only
    // permits that exception for a caller that identifies this exact cap.
    const int32_t (*group_skins[])[3] = {
        native_texture_button_rectangle(*gps_),
        native_texture_button_rectangle_selected(*gps_),
        native_texture_button_rectangle_light(*gps_),
        native_texture_button_rectangle_dark(*gps_),
    };
    for (int y = 1; y + 1 < gps_->dimy; ++y) {
        if (only_y >= 0 && y != only_y) continue;
        if (rows[y].find_first_not_of(' ') == std::string::npos) continue;
        int after_action = 0;
        for (int action = 1; action + 1 < gps_->dimx; ++action) {
            if (!native_item_state_action_at(*gps_, action, y)) continue;
            const int controls = action - 1;
            const int first_cap = after_action;
            after_action = action + 2;
            for (int cap = first_cap; cap + 2 < controls; ++cap) {
                // All supported nine-slice orientations share the upper-left
                // corner. Reject ordinary text/blank cells before the full reader.
                bool corner = false;
                for (const auto *skin : group_skins)
                    corner = corner || native_ui_skin_at(
                        *gps_, cap, y - 1, skin[0][0], classic);
                if (!corner) continue;
                const auto button = native_button_text_rect(
                    *gps_, cap, cap + 1, y, false, nullptr, false, true);
                int right = -1;
                if (button && button->x == cap + 1 && button->y + 1 == y &&
                        button->x + button->w < controls) {
                    right = button->x + button->w;
                    for (int x = right + 1; x < controls; ++x) {
                        const auto ch = visible_char_at(x, y);
                        if (ch && ch != ' ') { right = -1; break; }
                    }
                }
                // Stocks draws the state buttons over the end of its long row
                // rectangle. There is no separate right cap before F/D/M/H.
                // Prove both horizontal edges and the caption strip up to the
                // complete state button instead of requiring a nonexistent cap.
                for (const auto *skin : group_skins) {
                    for (int orientation = 0; right < 0 && orientation < 3; ++orientation) {
                        const auto tile = [&](int column, int row) {
                            if (orientation == 1) return skin[row][column];
                            if (orientation == 2 && column > 0) column = 3 - column;
                            return skin[column][row];
                        };
                        if (!native_ui_skin_at(*gps_, cap, y - 1, tile(0, 0), classic) ||
                            !native_ui_skin_at(*gps_, cap, y + 1, tile(0, 2), classic) ||
                            (!native_ui_skin_at(*gps_, cap, y, tile(0, 1), classic) &&
                             !native_ui_skin_at(*gps_, cap, y, tile(1, 1), classic, true))) continue;
                        bool complete = true;
                        for (int x = cap + 1; x < controls && complete; ++x)
                            for (int row = 0; row < 3; ++row)
                                if (!native_ui_skin_at(*gps_, x, y + row - 1,
                                        tile(1, row), classic, row == 1)) {
                                    complete = false;
                                    break;
                                }
                        if (complete) right = controls;
                    }
                }
                if (right < 0) continue;
                int left = cap;
                if (is_cp437_box_separator(rows[y], left)) ++left;
                while (left < right && rows[y][left] == ' ') ++left;
                int end = right;
                while (end > left && rows[y][end - 1] == ' ') --end;
                append_caption(left, end, right, y, true);
                cap = right;
            }
        }
    }
    std::stable_sort(matches.begin() + first_match, matches.end(),
        [](const Match &a, const Match &b) { return a.y != b.y ? a.y < b.y : a.x < b.x; });
}

void Overlay::layout_fortress_item_captions(SDL_Renderer *renderer) {
    if (!gps_ || !face_ || !renderer || gps_->tile_pixel_y <= 0) return;
    // Names and visible row counts do not participate in font selection.
    // Each row retains its native icon inset and action-strip boundary.
    for (auto &match : prepared_matches_) {
        if ((match.rule != kFortressItemCaptionRule && match.rule != kFortressItemUseRule) ||
            match.target.empty() || match.native_split_duplicate) continue;
        const int right = match.layout_clip_right;
        const int left = match.layout_x >= 0 ? match.layout_x : match.x;
        if (right > left)
            layout_fortress_text_rows(renderer, {{&match}}, left, right);
    }
}
