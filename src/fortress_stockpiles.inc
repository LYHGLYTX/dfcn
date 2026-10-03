// Complete captions have one translation path for both rendering and search.
// Colors, tree names and bare item types must retain their field meanings.
std::optional<std::string> Overlay::translate_stockpile_setting(
        std::string_view caption, StockpileCaptionKind kind) const {
    TranslationStateScope translation_scope;
    const std::string source = normalize_utterance(caption);
    // Own complete captions, not native record addresses: category changes
    // recycle those records. Field meaning and original spelling are part of
    // the key, so wood/color/material homonyms and names cannot alias.
    const std::string key = std::to_string(static_cast<int>(kind)) + ":" + source;
    if (const auto found = stockpile_setting_translation_cache_.find(key);
        found != stockpile_setting_translation_cache_.end()) return found->second;
    const std::string folded = lower(source);
    const bool candidate = kind != StockpileCaptionKind::Label;
    std::optional<std::string> target;
    if (kind == StockpileCaptionKind::Color) target = RULESETS.translate_color(folded);
    if (!target && kind == StockpileCaptionKind::Wood) {
        std::vector<size_t> origins;
        target = RULESETS.translate_with_origins(folded, "::plants::name", origins);
    }
    if (!target) target = exact_literal_translation("Stockpile setting: " + folded);
    if (!target && kind == StockpileCaptionKind::ItemType && config_.compositional_rules)
        target = translate_arena_equipment_source_phrase(source);
    if (!target && candidate && config_.compositional_rules)
        target = RULESETS.translate_material_state(folded);
    if (!target) target = exact_literal_translation(source);
    if (!item_description_translation_complete(target) && config_.compositional_rules) {
        target = RULESETS.translate_material_state(folded);
        if (!item_description_translation_complete(target))
            target = translate_item_description_term(source);
        if (!item_description_translation_complete(target))
            target = translate_compositional(source);
    }
    if (!item_description_translation_complete(target)) target.reset();

    // A meat catalog contains every species/organ combination, not only the
    // visible rows. Share successful AND unresolved captions between search
    // and drawing, across query edits and tab switches. Evict incrementally:
    // clearing a small cache wholesale makes a full traversal reparse itself.
    constexpr size_t maximum_records = 65536;
    constexpr size_t maximum_bytes = 16 * 1024 * 1024;
    const size_t bytes = 2 * key.size() + (target ? target->size() : 0);
    if (bytes <= maximum_bytes) {
        while (!stockpile_setting_translation_order_.empty() &&
                (stockpile_setting_translation_cache_.size() >= maximum_records ||
                 stockpile_setting_translation_bytes_ + bytes > maximum_bytes)) {
            const auto oldest = stockpile_setting_translation_cache_.find(
                stockpile_setting_translation_order_.front());
            stockpile_setting_translation_bytes_ -= 2 * oldest->first.size() +
                (oldest->second ? oldest->second->size() : 0);
            stockpile_setting_translation_cache_.erase(oldest);
            stockpile_setting_translation_order_.pop_front();
        }
        const auto [entry, inserted] = stockpile_setting_translation_cache_.emplace(key, target);
        if (inserted) {
            try {
                stockpile_setting_translation_order_.push_back(key);
            } catch (...) {
                stockpile_setting_translation_cache_.erase(entry);
                throw;
            }
            stockpile_setting_translation_bytes_ += bytes;
        }
    }
    return target;
}

bool Overlay::translated_stockpile_search_matches(std::string_view source,
        std::string_view query, StockpileCaptionKind kind) const {
    TranslationStateScope translation_scope;
    if (!config_.enabled) return false;
    if (source.empty() || compact_translated_search_text(query).empty()) return false;
    const auto target = translate_stockpile_setting(source, kind);
    return target && translated_search_text_matches(*target, query);
}

// Custom settings are three independent category-button columns. Categories
// and filters have their own stockpile status controls; value rows do not.
// Ordinary on/off skins also appear in unrelated preference buttons.
// Read every caption before the task chooser can claim the icon column and
// search results while leaving the middle filters to English-span centring.
void Overlay::append_fortress_stockpile_settings(std::vector<std::string> &rows,
        std::vector<Match> &matches, int only_y) const {
    const NativePanelBorders borders(*gps_);
    const auto settings = native_ui_settings();
    const bool classic = settings && settings->classic;
    struct Caption {
        NativeCategoryButton button;
        SDL_Rect panel;
        NativeTextCard card;
        bool category;
        int status_left;
    };
    std::vector<Caption> captions;
    for (int y = 0; y < gps_->dimy; ++y) {
        for (const auto &field : split_text_fields(rows[y])) {
            const auto setting = native_stockpile_setting_button_frame(
                *gps_, field.start, field.end, y);
            if (!setting) continue;
            const auto *button = &setting->button;
            if (std::any_of(captions.begin(), captions.end(), [&](const Caption &seen) {
                    return seen.button.interior.x == button->interior.x &&
                        seen.button.interior.y == button->interior.y;
                })) continue;
            const auto &box = button->interior;
            // The complete three-row control must fit inside its owner. A
            // caption-only query can mistake the button's own ASCII border
            // for the outer settings panel and then reject the whole row.
            const auto panel = native_panel_interior(borders, *gps_, box);
            if (!panel || box.y < panel->y || box.y + box.h > panel->y + panel->h) continue;
            const auto icon = native_category_button_text_rect(*gps_, field.start, field.end, y);
            const int source_left = !classic && icon ? icon->x : box.x;
            const int text_left = source_left + 1;
            int right = setting->status_left >= 0 ? setting->status_left - 1 : box.x + box.w;
            // The right-hand check/cross is artwork, not spare caption width.
            // Reserve its actual live cells, including at non-square UI scales.
            // Classic drawing overwrites icons with the category skin but
            // can retain their anchored metadata. Only visible artwork in
            // graphical mode further limits this proven caption interval.
            for (int x = text_left; !classic && x < right; ++x) {
                for (int row = box.y; row < box.y + box.h; ++row) {
                    if (native_foreground_picture_at(*gps_, x, row)) {
                        right = x - 1;
                        break;
                    }
                }
            }
            if (right <= text_left) continue;
            // ASCII rails occupy the upper/lower rows of the button. Capture
            // only its middle caption, but centre it in the full control.
            // The display gap must not discard the last native source byte.
            const int source_right = classic && setting->status_left >= 0
                ? setting->status_left : right;
            auto card = capture_panel_text_card({source_left, box.y + (classic ? 1 : 0),
                source_right - source_left, classic ? 1 : box.h}, true);
            if (!card || std::any_of(card->rows.begin(), card->rows.end(), [&](const NativeTextCardRow &row) {
                    return rows[row.y].compare(row.x, row.source.size(), row.source) != 0;
                })) continue;
            card->interior = {text_left, box.y, right - text_left, box.h};
            captions.push_back({*button, *panel, std::move(*card),
                icon.has_value(), setting->status_left});
        }
    }
    const auto same_panel = [](const SDL_Rect &a, const SDL_Rect &b) {
        return a.x == b.x && a.y == b.y && a.w == b.w && a.h == b.h;
    };
    std::vector<SDL_Rect> settings_panels;
    // Classic categories need no visible picture. Two separate columns of
    // complete stockpile status controls plus the search field prove the
    // page even when the query has no value rows. Derive the category from
    // the leftmost status column, not the current English caption lengths.
    for (const auto &category : captions) {
        if (category.status_left < 0 ||
            std::any_of(settings_panels.begin(), settings_panels.end(),
                [&](const SDL_Rect &panel) { return same_panel(panel, category.panel); })) continue;
        bool found = false;
        for (const auto &filter : captions) {
            if (filter.status_left < 0 || !same_panel(category.panel, filter.panel) ||
                filter.button.interior.x < category.button.interior.x + category.button.interior.w)
                continue;
            const int top_limit = std::min(category.button.interior.y, filter.button.interior.y);
            const int panel_right = category.panel.x + category.panel.w;
            for (int top = category.panel.y; top + 3 <= top_limit && !found; ++top)
                for (int x = filter.button.interior.x + filter.button.interior.w;
                        x + 4 < panel_right; ++x) {
                    const auto search = native_textbox_rect_at(*gps_, x, top);
                    if (search && search->x + search->w <= panel_right) {
                        found = true;
                        break;
                    }
                }
            if (found) break;
        }
        if (found) settings_panels.push_back(category.panel);
    }
    for (const auto &panel : settings_panels) {
        int category_left = gps_->dimx;
        for (const auto &caption : captions)
            if (caption.status_left >= 0 && same_panel(panel, caption.panel))
                category_left = std::min(category_left, caption.button.interior.x);
        for (auto &caption : captions)
            if (same_panel(panel, caption.panel))
                caption.category = caption.status_left >= 0 &&
                    caption.button.interior.x == category_left;
    }
    // Keep the graphical icon/category proof when the status controls are
    // covered. A shared on/off skin alone is also used by other preferences.
    for (const auto &category : captions) {
        if (!category.category || std::any_of(settings_panels.begin(), settings_panels.end(),
                [&](const SDL_Rect &panel) { return same_panel(panel, category.panel); })) continue;
        if (std::any_of(captions.begin(), captions.end(), [&](const Caption &other) {
                return !other.category && other.button.toggle &&
                    other.button.interior.x >= category.button.interior.x + category.button.interior.w &&
                    same_panel(category.panel, other.panel);
            })) settings_panels.push_back(category.panel);
    }
    const auto clipped = captured_clipped_captions();
    for (const auto &caption : captions) {
        if (std::none_of(settings_panels.begin(), settings_panels.end(), [&](const SDL_Rect &panel) {
                return same_panel(caption.panel, panel);
            })) continue;
        int last_column = caption.button.interior.x;
        std::string category, filter;
        for (const auto &other : captions) {
            if (!same_panel(caption.panel, other.panel)) continue;
            last_column = std::max(last_column, other.button.interior.x);
        }
        for (const auto &other : captions) {
            if (!same_panel(caption.panel, other.panel)) continue;
            if (!other.button.selected || other.card.rows.empty()) continue;
            const auto source = lower(normalize_utterance(other.card.rows.front().source));
            if (other.category) category = source;
            else if (other.status_left >= 0 || other.button.interior.x < last_column) filter = source;
        }
        const bool candidate = !caption.category && caption.status_left < 0 &&
            caption.button.interior.x == last_column;
        auto kind = candidate ? StockpileCaptionKind::Value : StockpileCaptionKind::Label;
        if (candidate) {
            if (filter == "color") kind = StockpileCaptionKind::Color;
            else if (category == "wood") kind = StockpileCaptionKind::Wood;
            else if (filter == "type" || filter == "item types" || filter == "weapons" ||
                     filter == "trap components" || filter == "body" || filter == "head" ||
                     filter == "feet" || filter == "hands" || filter == "legs" || filter == "shield")
                kind = StockpileCaptionKind::ItemType;
        }
        std::vector<Match> labels;
        for (const auto &row : caption.card.rows) {
            std::string source = row.source;
            for (const auto &capture : clipped)
                if (capture.x == row.x && capture.y == row.y && capture.visible == source) {
                    source = capture.complete;
                    break;
                }
            source = normalize_utterance(source);
            const auto target = translate_stockpile_setting(source, kind);
            // An unresolved word inside a nominally successful result is not
            // a translated caption. Keep it in the review queue, rather than
            // counting a half-English value as covered or transliterating it.
            Match label{row.x, row.y, static_cast<int>(row.source.size()),
                kFortressStockpileSettingRule, target ? *target : native_text_to_utf8(source), row.source};
            label.native_hover_untranslated = !target;
            if (!target) label.native_help_review_source = source;
            labels.push_back(std::move(label));
            // Keep the original spans for glyph suppression. Only the display
            // box moves, never the native hitboxes, icons or selected colors.
            std::fill_n(rows[row.y].begin() + row.x, row.source.size(), ' ');
        }
        compose_native_text_rows(caption.card, labels, only_y,
            kFortressStockpileSettingRule, false, true);
        for (auto &label : labels)
            if (only_y < 0 || only_y == label.y) matches.push_back(std::move(label));
    }
}

void Overlay::layout_fortress_stockpile_settings(SDL_Renderer *renderer) {
    if (!gps_ || !face_ || !renderer ||
        gps_->tile_pixel_x <= 0 || gps_->tile_pixel_y <= 0) return;
    for (auto &match : prepared_matches_) {
        if (match.rule != kFortressStockpileSettingRule || match.target.empty() ||
            match.native_split_duplicate) continue;
        layout_fortress_text_rows(renderer, {{&match}}, match.layout_x, match.layout_clip_right);
    }
}

// Stockpile types use standalone 4x3 main[122/123] controls, with captions
// five cells from the picture's left edge in a fourteen-cell column. These
// skins, not a stockpile's editable name or translated words, own the field.
// DF 53.16's native draw (ELF 0x169a79a..0x169a88d) uses the same caption
// slot in both states. Bars and / Blocks and Finished / Goods are two native
// rows (0x169adeb..0x169aefe), but each is ONE category, not two name tokens.
void Overlay::append_fortress_stockpile_types(std::vector<std::string> &rows,
        std::vector<Match> &matches, int only_y, bool raw_layer) const {
    if (!gps_ || rows.size() != static_cast<size_t>(gps_->dimy) ||
        gps_->tile_pixel_x <= 0 || gps_->tile_pixel_y <= 0) return;
    auto context = rows;
    if (raw_layer) {
        // Recognition and layout use the current composite in both passes.
        // Only matching physical bytes are projected back to a raw layer.
        for (int y = 0; y < gps_->dimy; ++y)
            for (int x = 0; x < gps_->dimx; ++x) {
                const auto ch = visible_char_at(x, y);
                context[y][x] = ch ? static_cast<char>(ch) : ' ';
            }
    }
    static constexpr std::string_view captions[] = {
        "all", "ammo", "animals", "armor", "bars and blocks", "cloth",
        "coins", "corpses", "finished goods", "food", "furniture", "gem",
        "leather", "refuse", "sheets", "stone", "weapons", "wood", "none", "custom",
    };
    const int pixels = std::clamp(static_cast<int>(
        gps_->tile_pixel_y * config_.font_scale), 1, gps_->tile_pixel_y);
    const int tile_w = gps_->tile_pixel_x, tile_h = gps_->tile_pixel_y;
    const int origin_x = (gps_->screen_pixel_x - tile_w * gps_->dimx) / 2;
    const int origin_y = (gps_->screen_pixel_y - tile_h * gps_->dimy) / 2;
    for (int y = 1; y + 1 < gps_->dimy; ++y) {
        if (only_y >= 0 && (only_y < y - 1 || only_y > y + 1)) continue;
        for (int x = 0; x + 14 <= gps_->dimx; ++x) {
            // Native stockpile icons draw anchored artwork before this
            // frame (53.16 PE: 0x1403e679b). Classic add_lower_tile writes
            // the frame's glyphs/colors but leaves that artwork allocated.
            // Accept the icon's own picture while still matching all twelve
            // live frame cells; it is not an unrelated covering widget.
            if (!native_main_button_at(*gps_, x, y, 122, true) &&
                !native_main_button_at(*gps_, x, y, 123, true)) continue;
            const int left = x + 5, right = x + 14;
            struct SourceRow { int x, y; std::string text; };
            std::vector<SourceRow> sources;
            std::string complete;
            for (int row_y = y - 1; row_y <= y + 1; ++row_y) {
                const std::string_view slot(context[row_y].data() + left, right - left);
                const auto text = trim_view(slot);
                if (text.empty()) continue;
                const int source_x = left + static_cast<int>(text.data() - slot.data());
                // Two native half-font rows are one line only when the live
                // flags prove their relationship; identical text alone is
                // not evidence of duplication. Both spans still own masks.
                bool lower_half = false;
                if (!sources.empty() && sources.back().x == source_x &&
                    sources.back().y + 1 == row_y && sources.back().text == text) {
                    bool top = false, previous_top = false;
                    const auto *cell = cell_at(source_x, row_y, &top);
                    const auto *previous = cell_at(source_x, row_y - 1, &previous_top);
                    const auto *flags = top ? gps_->screentexpos_top_flag : gps_->screentexpos_flag;
                    const size_t at = static_cast<size_t>(source_x) * gps_->dimy + row_y;
                    constexpr uint32_t halves = (1u << 3) | (1u << 4);
                    lower_half = cell && previous && top == previous_top && flags &&
                        (flags[at - 1] & halves) == (1u << 3) &&
                        (flags[at] & halves) == (1u << 4);
                }
                if (!lower_half) {
                    if (!complete.empty()) complete += ' ';
                    complete += text;
                }
                sources.push_back({source_x, row_y, std::string(text)});
            }
            const auto folded = lower(complete);
            if (std::find(std::begin(captions), std::end(captions), folded) ==
                std::end(captions)) continue;
            // All Chinese lives in the existing dictionary. Never send a UI
            // category through personal/procedural-name transliteration.
            const auto target = exact_literal_translation(complete);
            if (!target || target->empty()) continue;
            for (size_t index = 0; index < sources.size(); ++index) {
                const auto &source = sources[index];
                const int length = static_cast<int>(source.text.size());
                if (only_y >= 0 && only_y != source.y) continue;
                if (rows[source.y].compare(source.x, length, source.text) == 0) {
                    Match match{source.x, source.y, length, kFortressStockpileTypeRule,
                        index == 0 ? *target : std::string{}, source.text};
                    // Preserve every original source row for suppression,
                    // but draw one complete label at the icon's midpoint.
                    match.layout_x = left;
                    match.layout_y = y;
                    match.layout_length = right - left;
                    match.layout_left = true;
                    match.layout_clip_right = right;
                    // The whole three-row category owns the translated label.
                    // Its first native line can be above the icon midpoint;
                    // inferring a one-row clip from that line's lower texture
                    // would discard the complete label after centring it.
                    match.layout_native_clip = SDL_Rect{
                        origin_x + left * tile_w, origin_y + (y - 1) * tile_h,
                        (right - left) * tile_w, 3 * tile_h};
                    match.layout_fixed_baseline = true;
                    match.layout_font_pixels = pixels;
                    match.layout_lock_font_pixels = true;
                    match.layout_line_height_pixels = gps_->tile_pixel_y;
                    matches.push_back(std::move(match));
                    std::fill_n(rows[source.y].begin() + source.x, length, ' ');
                } else if (raw_layer) {
                    // A caption may cross native layers. These partial raw
                    // spans suppress only current bytes, not hidden text;
                    // the composite pass alone draws the complete caption.
                    for (int offset = 0; offset < length;) {
                        while (offset < length &&
                            rows[source.y][source.x + offset] != source.text[offset]) ++offset;
                        const int start = offset;
                        while (offset < length &&
                            rows[source.y][source.x + offset] == source.text[offset]) ++offset;
                        if (offset == start) continue;
                        matches.push_back({source.x + start, source.y, offset - start,
                            kFortressStockpileTypeRule, {}, source.text.substr(start, offset - start)});
                        std::fill_n(rows[source.y].begin() + source.x + start, offset - start, ' ');
                    }
                }
            }
            x += 3;
        }
    }
}
