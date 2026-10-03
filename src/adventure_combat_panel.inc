// The native combat renderer builds fields from unit, anatomy, equipment,
// skill and status formatters. Translate those complete fields in this scope;
// a generic word's grammatical sense must not choose a combat rating.
void Overlay::load_adventure_target_translations() {
    adventure_target_literals_.clear();
    adventure_target_templates_.clear();
    const fs::path path = fs::u8path(config_.mapping_path).parent_path() /
        "adventure-target-translations.tsv";
    std::ifstream input(path, std::ios::binary);
    std::string line;
    size_t line_number = 0;
    while (std::getline(input, line)) {
        ++line_number;
        if (!line.empty() && line.back() == '\r') line.pop_back();
        if (line.empty() || line.front() == '#') continue;
        const size_t tab = line.find('\t');
        if (tab == std::string::npos) continue;
        Rule entry;
        entry.source = normalize_utterance(line.substr(0, tab));
        entry.target = trim(line.substr(tab + 1));
        entry.line = line_number;
        if (entry.source.empty() || entry.target.empty()) continue;
        split_template(entry.source, &entry.template_literals, &entry.template_kinds, true, true);
        if (entry.template_kinds.empty()) {
            adventure_target_literals_[entry.source] = std::move(entry.target);
            continue;
        }
        entry.numeric_template = std::find(entry.template_kinds.begin(),
            entry.template_kinds.end(), 'd') != entry.template_kinds.end();
        entry.string_template = std::any_of(entry.template_kinds.begin(),
            entry.template_kinds.end(), [](char kind) { return kind != 'd'; });
        if (!compile_template_target(entry)) {
            log_line("WARN", "Invalid adventure combat template at " +
                path.string() + ":" + std::to_string(line_number));
            continue;
        }
        adventure_target_templates_.push_back(std::move(entry));
    }
    std::stable_sort(adventure_target_templates_.begin(), adventure_target_templates_.end(),
        [](const Rule &a, const Rule &b) {
            const auto weight = [](const Rule &entry) {
                size_t length = 0;
                for (const auto &literal : entry.template_literals) length += literal.size();
                return length;
            };
            return weight(a) > weight(b);
        });
    std::error_code ec;
    adventure_target_mtime_ = fs::last_write_time(path, ec);
    if (ec) log_line("WARN", "Cannot load adventure combat translations: " + path.string());
}

std::optional<std::string> Overlay::translate_adventure_target_text(
        std::string_view raw_source, char initial_kind) const {
    using Result = std::optional<std::string>;
    std::unordered_map<std::string, Result> memo;
    std::unordered_set<std::string> active;
    std::function<Result(std::string_view, char)> resolve;
    resolve = [&](std::string_view original, char kind) -> Result {
        const std::string source = normalize_utterance(original);
        if (source.empty()) return std::nullopt;
        const std::string key = std::string(1, kind) + '\x1f' + source;
        if (const auto found = memo.find(key); found != memo.end()) return found->second;
        if (!active.insert(key).second) return std::nullopt;
        const auto finish = [&](Result target) -> Result {
            active.erase(key);
            if (target && target->empty()) target.reset();
            memo.emplace(key, target);
            return target;
        };
        if (kind == 'd') {
            size_t at = source.front() == '-' || source.front() == '+' ? 1 : 0;
            if (at == source.size() || !std::all_of(source.begin() + at, source.end(),
                    [](unsigned char ch) { return ch >= '0' && ch <= '9'; }))
                return finish(std::nullopt);
            return finish(source);
        }
        // A formatter-owned unit/item/anatomy capture is resolved by that
        // type before a same-spelled status or ordinary dictionary word.
        if (kind == 'n') {
            // Target records draw the conflict label and its punctuation
            // before the unit formatter advances the same native cursor.
            // Own them as one caption so the colon cannot leave the name
            // centered independently in its original English span.
            for (const std::string_view level : {"Encounter", "Horseplay", "Training",
                    "Brawl", "Non-lethal", "Lethal", "No Quarter"}) {
                if (!source.starts_with(level) ||
                        !std::string_view(source).substr(level.size()).starts_with(": "))
                    continue;
                const auto conflict = exact_literal_translation(level);
                const auto identity = resolve(std::string_view(source).substr(level.size() + 2), 'n');
                const auto colon = adventure_target_literals_.find(":");
                return finish(conflict && identity && colon != adventure_target_literals_.end()
                    ? Result(*conflict + colon->second + *identity) : std::nullopt);
            }
            if (source == "you" || source == "You") {
                const auto found = adventure_target_literals_.find(source);
                if (found != adventure_target_literals_.end()) return finish(found->second);
            }
            return finish(translate_ui_message_capture(trim_view(original), true));
        }
        if (kind == 'i') {
            if (source.ends_with(" (copy)")) {
                const auto item = resolve(std::string_view(source).substr(0, source.size() - 7), 'i');
                const auto suffix = adventure_target_literals_.find("(copy)");
                if (item && suffix != adventure_target_literals_.end())
                    return finish(*item + suffix->second);
                return finish(std::nullopt);
            }
            if (const auto item = translate_item_caption_grammar(trim_view(original)))
                return finish(item);
            return finish(translate_legends_item(trim_view(original)));
        }
        if (kind == 't') {
            if (const auto anatomy = translate_legends_anatomy(source)) return finish(anatomy);
        } else {
            if (const auto found = adventure_target_literals_.find(source);
                    found != adventure_target_literals_.end()) return finish(found->second);
            if (const auto rating = translate_skill_rating(source)) return finish(rating);
            // Complete anatomy and item nouns outrank status templates that
            // join an item and an ordinary word. Otherwise a weapon noun
            // such as short sword can be split into an appearance adjective
            // and a standalone sword before the item grammar sees it.
            if (const auto anatomy = translate_legends_anatomy(source)) return finish(anatomy);
            if (const auto item = translate_item_caption_grammar(trim_view(original)))
                return finish(item);
        }
        for (const Rule &entry : adventure_target_templates_) {
            // A typed body-part capture may add an ordinal to another body
            // part, but cannot become an item/status union after anatomy
            // fails. Keep Grab's body-part and item alternatives distinct.
            if (kind == 't') {
                const auto &prefix = entry.template_literals.front();
                const bool word_ordinal = entry.template_kinds.size() == 1 &&
                    entry.template_kinds.front() == 't' && !prefix.empty() &&
                    prefix.find(' ') == prefix.size() - 1;
                const bool numeric_ordinal = entry.template_kinds.size() == 2 &&
                    entry.template_kinds[0] == 'd' && entry.template_kinds[1] == 't' &&
                    prefix.empty() && (entry.template_literals[1] == "st " ||
                        entry.template_literals[1] == "nd " ||
                        entry.template_literals[1] == "rd " ||
                        entry.template_literals[1] == "th ");
                if (!entry.template_literals.back().empty() ||
                        (!word_ordinal && !numeric_ordinal)) continue;
            }
            if (!source.starts_with(entry.template_literals.front()) ||
                    !source.ends_with(entry.template_literals.back())) continue;
            std::vector<std::string> captures;
            const auto capture = [&](auto &&self, size_t index, size_t at) -> bool {
                if (index == entry.template_kinds.size()) return at == source.size();
                const auto &suffix = entry.template_literals[index + 1];
                size_t end = suffix.empty() ? source.size() : source.find(suffix, at + 1);
                while (end != std::string::npos && end > at) {
                    // Backtrack at actual native literal boundaries. A body
                    // or item name may itself contain " with " or commas.
                    const auto value = resolve(std::string_view(source).substr(at, end - at),
                        entry.template_kinds[index]);
                    if (value) {
                        captures.push_back(*value);
                        if (self(self, index + 1, end + suffix.size())) return true;
                        captures.pop_back();
                    }
                    if (suffix.empty()) break;
                    end = source.find(suffix, end + 1);
                }
                return false;
            };
            if (!capture(capture, 0, entry.template_literals.front().size())) continue;
            std::string target = entry.target_template_literals.front();
            for (size_t index = 0; index < entry.target_capture_order.size(); ++index) {
                target += captures[entry.target_capture_order[index]];
                target += entry.target_template_literals[index + 1];
            }
            return finish(std::move(target));
        }
        if (kind == 't') return finish(std::nullopt);
        // Separators and damage/accuracy marks are original renderer fields.
        // Each adjoining term must resolve completely before composing them.
        for (const std::string_view separator : {", ", " / ", "/"}) {
            const size_t at = source.find(separator);
            if (at == std::string::npos || at == 0 || at + separator.size() == source.size()) continue;
            const auto left = resolve(std::string_view(source).substr(0, at), 's');
            const auto right = resolve(std::string_view(source).substr(at + separator.size()), 's');
            if (!left || !right) continue;
            const auto translated_separator = adventure_target_literals_.find(std::string(trim_view(separator)));
            return finish(*left + (translated_separator == adventure_target_literals_.end()
                ? std::string(separator) : translated_separator->second) + *right);
        }
        const size_t marks = source.find_last_not_of("+-!");
        if (marks != std::string::npos && marks + 1 < source.size()) {
            if (const auto target = resolve(std::string_view(source).substr(0, marks + 1), 's'))
                return finish(*target + source.substr(marks + 1));
        }
        // Item captions outside the TOML grammar retain the shared complete
        // item fallback after typed nouns and native action templates.
        if (const auto item = resolve(source, 'i')) return finish(item);
        if (const auto term = translate_ui_message_capture(source, false)) return finish(term);
        return finish(std::nullopt);
    };
    return resolve(raw_source, initial_kind);
}

void Overlay::append_adventure_combat_fields(std::vector<std::string> &screen_rows,
        std::vector<Match> &matches, int only_y, const unsigned char *raw) const {
    if (!gps_ || !native_gameplay_map_screen() || adventure_target_literals_.empty()) return;
    const bool classic = native_ui_classic().value_or(false);
    std::vector<NativeAdventureCombatPanel> panels;
    std::vector<SDL_Rect> prompt_panels;
    std::map<std::pair<int, int>, int> prompt_stages;
    std::set<std::pair<int, int>> confirmation_panels;
    const auto retain_prompt = [&](const SDL_Rect &bounds) {
        if (std::none_of(prompt_panels.begin(), prompt_panels.end(),
                [&](const SDL_Rect &existing) {
                    return existing.x == bounds.x && existing.y == bounds.y;
                })) prompt_panels.push_back(bounds);
    };
    for (int y = 0; y < gps_->dimy; ++y) {
        std::string row(gps_->dimx, ' ');
        for (int x = 0; x < gps_->dimx; ++x) {
            const auto ch = visible_char_at(x, y);
            row[x] = ch ? static_cast<char>(ch) : ' ';
        }
        for (size_t at = row.find("Done"); at != std::string::npos; at = row.find("Done", at + 4)) {
            if (!has_word_boundaries(row, at, at + 4)) continue;
            const auto panel = capture_adventure_combat_panel(*gps_, static_cast<int>(at),
                static_cast<int>(at + 4), y);
            if (!panel) {
                // The target, confirmation, aiming and wrestling stages
                // replace the summary with a prompt. Their native Done
                // control and complete combat prompt establish this scope.
                const auto bounds = adventure_combat_closed_panel_at(*gps_,
                    static_cast<int>(at), static_cast<int>(at + 4), y, classic);
                // Empty target lists have six outer rows; empty wrestling
                // lists have seven. Both still draw their prompt and Done.
                if (!bounds || bounds->w <= 30 || bounds->h < 4) continue;
                const int right = bounds->x + bounds->w;
                if (!adventure_combat_done_box_at(*gps_, *bounds, classic)) continue;
                bool combat_prompt = false;
                for (int py = bounds->y; py < bounds->y + 3 && !combat_prompt; ++py) {
                    std::string prompt;
                    for (int x = bounds->x + 1; x < right - 8; ++x) {
                        const auto ch = visible_char_at(x, py);
                        prompt += ch ? static_cast<char>(ch) : ' ';
                    }
                    const auto text = trim_view(prompt);
                    for (const std::string_view prefix : {"Who will you attack?", "Who will you wrestle?",
                            "What do you want to aim for?", "Really start a conflict with ",
                            "Really attack ", "Attack ", "Wrestle "})
                        if (text.starts_with(prefix)) {
                            combat_prompt = true;
                            prompt_stages[{bounds->x, bounds->y}] =
                                prefix == "What do you want to aim for?" ? 3 :
                                prefix == "Attack " ? 4 : prefix == "Wrestle " ? 8 : 0;
                            break;
                        }
                    if (!combat_prompt && text.ends_with("has yielded.  Attack anyway?")) combat_prompt = true;
                }
                if (combat_prompt) retain_prompt(*bounds);
                continue;
            }
            if (std::any_of(panels.begin(), panels.end(), [&](const auto &existing) {
                    return existing.panel.x == panel->panel.x && existing.panel.y == panel->panel.y;
                })) continue;
            panels.push_back(*panel);
        }
        // Stage one deliberately has no Done button. Its confirmation
        // heading stays at outer L+2/T+2, in the same hover-skinned frame.
        // Route this native stage from its complete prompt and controls
        // instead of waiting for a control that its renderer never draws.
        for (const std::string_view cue : {"Really start a conflict with ",
                "Really attack ", " has yielded.  Attack anyway?"}) {
            const auto at = row.find(cue);
            if (at == std::string::npos) continue;
            const auto bounds = adventure_combat_closed_panel_at(*gps_,
                static_cast<int>(at), static_cast<int>(at + cue.size()), y, classic);
            // The stage-one bounds helper allocates seven outer rows, hence
            // exactly five interior rows. Its compact confirmation is valid.
            if (!bounds || bounds->h < 5 || y < bounds->y || y >= bounds->y + 3)
                continue;
            const std::string_view prompt = trim_view(std::string_view(row).substr(
                bounds->x + 1, bounds->w - 1));
            if (!((prompt.starts_with("Really start a conflict with ") ||
                        prompt.starts_with("Really attack ")) && prompt.ends_with("?")) &&
                    !prompt.ends_with(" has yielded.  Attack anyway?")) continue;
            if (!adventure_combat_confirmation_boxes_at(*gps_, *bounds, classic)) continue;
            retain_prompt(*bounds);
            confirmation_panels.emplace(bounds->x, bounds->y);
            break;
        }
    }
    if (panels.empty() && prompt_panels.empty()) return;
    const auto draws = captured_native_drawn_text_rows();
    const auto top_draws = captured_native_drawn_text_rows(true);
    const int tile_w = gps_->tile_pixel_x, tile_h = gps_->tile_pixel_y;
    const int origin_x = (gps_->screen_pixel_x - gps_->dimx * tile_w) / 2;
    const int origin_y = (gps_->screen_pixel_y - gps_->dimy * tile_h) / 2;
    const auto append = [&](const SDL_Rect &box, int display_left, char kind,
                            bool centered = false, bool combat_quality = false) {
        for (int y = box.y; y < box.y + box.h && y < gps_->dimy; ++y) {
            int first = box.x, end = box.x + box.w;
            std::string native_row(gps_->dimx, ' ');
            for (int x = 0; x < gps_->dimx; ++x) {
                const auto ch = visible_char_at(x, y);
                native_row[x] = ch ? static_cast<char>(ch) : ' ';
            }
            const auto blank = [&](int x) {
                const auto ch = visible_char_at(x, y);
                return ch == 0 || ch == ' ' || is_cp437_box_separator(native_row, x);
            };
            while (first < end && blank(first)) ++first;
            while (end > first && blank(end - 1)) --end;
            if (first >= end) continue;
            std::string source;
            bool layer = false;
            const auto *first_cell = cell_at(first, y, &layer);
            if (!first_cell || (raw && raw != (layer ? gps_->screen_top : gps_->screen))) continue;
            bool current = true;
            for (int x = first; x < end; ++x) {
                bool cell_layer = false;
                const auto *cell = cell_at(x, y, &cell_layer);
                const bool whitespace = cell && (cell[0] == 0 || cell[0] == ' ');
                // Transparent top-layer spaces expose the base background.
                // Only actual source glyphs need the field's text layer.
                // UTF-8 continuation bytes are not CP437 frame separators.
                if (!cell || (!whitespace && cell_layer != layer) ||
                        is_cp437_box_separator(native_row, x)) {
                    current = false;
                    break;
                }
                source += cell[0] ? static_cast<char>(cell[0]) : ' ';
            }
            if (!current) continue;
            // The renderer first paints CP437 0xFA dots, then overwrites only the
            // name's prefix. Own the whole native field (including its dots)
            // while translating the formatter's complete anatomy/attack.
            std::string lookup_source = source;
            if (kind == 't' || kind == 'a') {
                const auto tail = lookup_source.find_last_not_of("\xfa. ");
                if (tail == std::string::npos) continue;
                lookup_source.resize(tail + 1);
            }
            std::optional<std::string> target;
            std::vector<int> target_colors;
            // Use the exact native formatter's identity before a lexical
            // fallback. A shortened name retains its complete translation.
            const auto &layer_draws = layer ? top_draws : draws;
            for (auto draw = layer_draws.rbegin(); draw != layer_draws.rend(); ++draw) {
                if (draw->x != first || draw->y != y ||
                        !std::string_view(draw->source).starts_with(lookup_source)) continue;
                if ((kind == 'n' || kind == 's') && draw->unit_identity_target)
                    target = draw->unit_identity_target;
                if (!target && !draw->complete_source.empty())
                    target = translate_adventure_target_text(draw->complete_source, kind);
                break;
            }
            if (!target && kind == 's') {
                // All three native confirmation branches split the person
                // from their prose. Match the complete authored template to
                // THIS formatter-owned draw, including name-first yielded
                // prompts, before any lexical resolver can reinterpret it.
                const std::string complete = normalize_utterance(lookup_source);
                for (auto draw = layer_draws.rbegin(); draw != layer_draws.rend() && !target; ++draw) {
                    if (!draw->unit_identity_target || draw->unit_identity_target->empty() ||
                            draw->y != y || draw->x < first || draw->x >= end ||
                            draw->source.empty() ||
                            draw->source.size() > static_cast<size_t>(end - draw->x) ||
                            source.compare(draw->x - first, draw->source.size(), draw->source) != 0)
                        continue;
                    for (const Rule &entry : adventure_target_templates_) {
                        if (entry.template_kinds.size() != 1 || entry.template_kinds.front() != 'n' ||
                                entry.template_literals.size() != 2 ||
                                entry.target_template_literals.size() != 2 ||
                                entry.target_capture_order.size() != 1 ||
                                entry.target_capture_order.front() != 0 ||
                                normalize_utterance(entry.template_literals.front() + draw->source +
                                    entry.template_literals.back()) != complete) continue;
                        const std::vector<std::optional<std::string>> resolved{draw->unit_identity_target};
                        target = fill_template(entry, {draw->source}, nullptr, nullptr, &resolved);
                        const auto color_text = [&](std::string_view text, int x) {
                            bool color_layer = false;
                            const auto *cell = cell_at(x, y, &color_layer);
                            const int rgb = cell ? (cell[1] << 16) | (cell[2] << 8) | cell[3] : 0xffffff;
                            std::vector<uint32_t> codepoints;
                            if (decode_utf8(std::string(text), codepoints))
                                target_colors.insert(target_colors.end(), codepoints.size(), rgb);
                        };
                        color_text(entry.target_template_literals.front(), first);
                        color_text(*draw->unit_identity_target, draw->x);
                        color_text(entry.target_template_literals.back(), end - 1);
                        break;
                    }
                }
            }
            if (!target) target = translate_adventure_target_text(lookup_source, kind);
            // The native renderer positions several independently formatted
            // values on one record. Double-space gaps are field boundaries;
            // translation still requires every nonblank field to resolve.
            if (!target && kind == 's') {
                const auto fields = split_text_fields(source);
                std::string complete;
                for (const auto &field : fields) {
                    const auto part = translate_adventure_target_text(field.text);
                    if (!part) { complete.clear(); break; }
                    if (!complete.empty()) complete += "  ";
                    complete += *part;
                }
                if (!complete.empty()) target = std::move(complete);
            }
            if (!target || target->empty()) continue;
            // Ownership and drawing remain separate: current original
            // bytes alone supply suppression, while the proven control
            // supplies the translation's width and shared text column.
            std::fill_n(screen_rows[y].begin() + first, end - first, ' ');
            if (only_y >= 0 && only_y != y) continue;
            std::erase_if(matches, [&](const Match &match) {
                return match.y == y && match.x < end && match.x + match.length > first;
            });
            Match match{first, y, end - first, kAdventureCombatFieldRule, *target, source};
            match.native_adventure_target_row = true;
            match.native_picture_caption_box = SDL_Rect{display_left, box.y,
                box.x + box.w - display_left, box.h};
            // AttackCreature and its status/identity helpers call ordinary
            // addst. That writer leaves old half-font flags untouched.
            match.layout_fixed_baseline = true;
            match.layout_reflowed_control = true;
            match.layout_x = display_left;
            match.layout_length = box.x + box.w - display_left;
            match.layout_clip_right = box.x + box.w;
            match.layout_left = !centered;
            match.layout_native_clip = SDL_Rect{origin_x + display_left * tile_w,
                origin_y + match.native_picture_caption_box->y * tile_h,
                match.layout_length * tile_w, match.native_picture_caption_box->h * tile_h};
            match.layout_foreground_rgb =
                (first_cell[1] << 16) | (first_cell[2] << 8) | first_cell[3];
            match.layout_glyph_foreground_rgb = std::move(target_colors);
            if (combat_quality) {
                // Difficulty and contact quality are separate native color
                // runs. Compose their complete Chinese fields as one line
                // so punctuation and color changes cannot shift baselines.
                const size_t comma = lookup_source.find(", ");
                if (comma != std::string::npos) {
                    const auto difficulty = translate_adventure_target_text(
                        std::string_view(lookup_source).substr(0, comma));
                    const auto contact = translate_adventure_target_text(
                        std::string_view(lookup_source).substr(comma + 2));
                    const auto punctuation = adventure_target_literals_.find(",");
                    if (difficulty && contact && punctuation != adventure_target_literals_.end()) {
                        match.target = *difficulty + punctuation->second + *contact;
                        const auto color_at = [&](int x) {
                            bool color_layer = false;
                            const auto *cell = cell_at(x, y, &color_layer);
                            return cell ? (cell[1] << 16) | (cell[2] << 8) | cell[3]
                                : match.layout_foreground_rgb;
                        };
                        const auto color = [&](std::string_view text, int rgb) {
                            std::vector<uint32_t> codepoints;
                            if (decode_utf8(text, codepoints))
                                match.layout_glyph_foreground_rgb.insert(
                                    match.layout_glyph_foreground_rgb.end(), codepoints.size(), rgb);
                        };
                        color(*difficulty, match.layout_foreground_rgb);
                        // Stage four switches to white for " strike, ".
                        // Stage three draws its entire difficulty caption
                        // with one color. The current source preserves both.
                        if (difficulty->ends_with("攻击") && comma > 0 &&
                                match.layout_glyph_foreground_rgb.size() >= 2) {
                            std::fill(match.layout_glyph_foreground_rgb.end() - 2,
                                match.layout_glyph_foreground_rgb.end(),
                                color_at(first + static_cast<int>(comma) - 1));
                        }
                        color(punctuation->second, color_at(first + static_cast<int>(comma)));
                        color(*contact, color_at(first + static_cast<int>(comma) + 2));
                    }
                }
            }
            matches.push_back(std::move(match));
        }
    };
    for (const auto &panel : panels) {
        append(panel.name, panel.name.x, 'n');
        append(panel.status, panel.name.x, 's');
        append(panel.done, panel.done.x, 's', true);
        for (size_t index = 0; index < panel.rows.size(); ++index) {
            const auto &box = panel.rows[index];
            int left = box.x;
            for (const auto &selector : panel.selectors) {
                if (selector.row != index) continue;
                // Labels are fitted only before the left arrow. A rating
                // uses the selector's own allocated text strip and keeps
                // both arrow controls in their native locations.
                if (selector.left_arrow.x > left)
                    append({left, box.y, selector.left_arrow.x - left, box.h}, left, 's');
                append(selector.text, selector.text.x, 's', true);
                left = selector.right_arrow.x + selector.right_arrow.w;
            }
            if (left < box.x + box.w)
                append({left, box.y, box.x + box.w - left, box.h}, left, 's');
        }
    }
    for (const auto &panel : prompt_panels) {
        const int right = panel.x + panel.w;
        const bool confirmation = confirmation_panels.contains({panel.x, panel.y});
        append({panel.x + 1, panel.y, panel.w - (confirmation ? 1 : 9), 3},
            panel.x + 1, 's');
        if (confirmation) {
            const auto buttons = adventure_combat_confirmation_boxes_at(*gps_, panel, classic);
            if (buttons) {
                for (const auto &button : {buttons->first, buttons->second})
                    append({button.x, button.y + 1, button.w, 1}, button.x, 's', true);
            }
            continue;
        }
        append({right - 7, panel.y, 6, 3}, right - 7, 's', true);
        const int stage = prompt_stages[{panel.x, panel.y}];
        int picture_end = panel.y + 3;
        if (stage == 3 || stage == 4) {
            const int list_end = panel.y + panel.h - (stage == 4 ? 18 : 0);
            for (int top = panel.y + 3; top + 3 <= list_end; top += 3) {
                const auto box = adventure_combat_action_box_at(*gps_, panel, top, classic, true);
                if (!box) break;
                // Native L+7 has a 36-byte name cap and a dotted tail; L+45
                // begins the quality field. E-2/E-1 hold independent marks.
                const int summary_left = panel.x + 44;
                const int summary_right = box->x + box->w - 2;
                if (summary_right <= summary_left) break;
                append({box->x, top + 1, summary_left - box->x, 1},
                    box->x, stage == 3 ? 't' : 'a');
                append({summary_left, top + 1, summary_right - summary_left, 1},
                    summary_left, 's', false, true);
                picture_end = top + 3;
            }
            if (stage == 3) continue;
            picture_end = list_end;
        }
        for (int y = picture_end; y < panel.y + panel.h; ++y) {
            if (stage == 8) {
                // Wrestling actions place two or three four-column icons
                // over the row's left edge. Own the caption after those
                // icons as one field, before generic word translation.
                if (const auto box = adventure_combat_wrestling_box_at(
                        *gps_, panel, y, classic)) {
                    append(*box, box->x, 's');
                    y += box->h - 1;
                    continue;
                }
            }
            if (stage == 4 && (y - picture_end) % 3 == 1) {
                // Six three-row style controls remain below the attack
                // list. Their full explanations are one addst, after the
                // artwork/status strip and optional native shortcut.
                std::string row(gps_->dimx, ' ');
                for (int x = panel.x + 8; x < right - 1; ++x) {
                    const auto ch = visible_char_at(x, y);
                    row[x] = ch ? static_cast<char>(ch) : ' ';
                }
                bool explanation = false;
                for (const std::string_view prefix : {"Quick attack:", "Heavy attack:",
                        "Wild attack:", "Precise attack:", "No quick attack:",
                        "No heavy attack:", "Forced wild attack:", "No precise attack:",
                        "No charge attack:", "Charge attack:", "Multi-attack:"}) {
                    const auto at = row.find(prefix, panel.x + 8);
                    if (at == std::string::npos) continue;
                    append({static_cast<int>(at), y, right - 1 - static_cast<int>(at), 1},
                        static_cast<int>(at), 's');
                    explanation = true;
                    break;
                }
                if (explanation) continue;
            }
            // Stage zero's eight-row portrait record owns a name and status
            // column. It is not a three-row caption despite its large skin.
            bool target_record = false;
            for (int key_x = panel.x + 13; key_x + 2 < right; ++key_x) {
                const auto key = visible_char_at(key_x, y);
                if (!((key >= 'a' && key <= 'z') || (key >= 'A' && key <= 'Z') ||
                        (key >= '0' && key <= '9'))) continue;
                const auto record = adventure_target_record(*gps_, panel, key_x, y);
                if (!record) continue;
                append({record->x, y, record->w, 1}, record->x, 'n');
                append({record->x, y + 1, record->w, record->y + record->h - y - 1}, record->x, 's');
                target_record = true;
                y = record->y + record->h - 1;
                break;
            }
            if (target_record) continue;
            std::string row(gps_->dimx, ' ');
            for (int x = panel.x; x < right; ++x) {
                const auto ch = visible_char_at(x, y);
                row[x] = ch ? static_cast<char>(ch) : ' ';
            }
            const auto fields = split_text_fields(row);
            for (size_t index = 0; index < fields.size(); ++index) {
                const auto &field = fields[index];
                if (field.start < panel.x || field.end > right || is_keybinding_code(field.text)) continue;
                int first = field.start;
                bool layer = false;
                const auto *cell = cell_at(first, y, &layer);
                // Native records draw their shortcut as the first green
                // character, separately from the complete caption source.
                if (cell && field.text.size() > 2 && field.text[1] == ' ' &&
                        (std::equal(cell + 1, cell + 4, gps_->uccolor[2]) ||
                         std::equal(cell + 1, cell + 4, gps_->uccolor[10]))) first += 2;
                if (first >= field.end) continue;
                int end = index + 1 < fields.size() ? fields[index + 1].start - 1 : right;
                if (const auto button = native_button_text_rect(*gps_, first, field.end, y,
                        false, nullptr, false, true)) end = std::min(end, button->x + button->w);
                if (end > first) append({first, y, end - first, 1}, first, 's');
            }
        }
    }
}

void Overlay::layout_adventure_combat_fields(SDL_Renderer *renderer) {
    if (!gps_ || !renderer || !face_) return;
    if (std::none_of(prepared_matches_.begin(), prepared_matches_.end(),
            [](const Match &match) { return match.rule == kAdventureCombatFieldRule; })) return;
    normalize_native_split_text();
    for (auto &match : prepared_matches_) {
        if (match.rule != kAdventureCombatFieldRule || match.target.empty() ||
                match.native_split_duplicate || !match.native_picture_caption_box) continue;
        const auto &box = *match.native_picture_caption_box;
        const bool left = match.layout_left;
        layout_fortress_text_rows(renderer, {{&match}}, box.x, box.x + box.w, true, true);
        match.layout_left = left;
        match.layout_ellipsize = true;
    }
}
