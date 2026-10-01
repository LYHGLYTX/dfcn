// The fortress help index draws two hover-frame panels containing three-row
// rectangle buttons. Native captions start at the button's left edge; their
// English lengths are NOT centered layout boxes. Status text occupies the
// following row of that same button. Only layout changes here: translations,
// colors, source suppression, scrolling and native click targets stay intact.
void Overlay::layout_fortress_help(SDL_Renderer *renderer) {
    if (!gps_ || !face_ || !renderer ||
        gps_->tile_pixel_x <= 0 || gps_->tile_pixel_y <= 0) return;
    std::array<Match *, 2> headings{};
    for (Match &match : prepared_matches_) {
        if (match.target.empty() || match.native_split_text ||
            match.native_split_duplicate) continue;
        if (match.source == "Interactive tutorial") headings[0] = &match;
        if (match.source == "Information and guides") headings[1] = &match;
    }
    if (!headings[0] || !headings[1] || headings[0]->y != headings[1]->y ||
        headings[0]->x >= headings[1]->x) return;

    // Use current lower-layer skin handles, not sampled screenshot pixels,
    // fixed grid coordinates or texture IDs remembered from a previous frame.
    auto has_skin = [&](int x, int y, int32_t skin) {
        bool top = false;
        if (skin <= 0 || !cell_at(x, y, &top)) return false;
        const long *tiles = top ? gps_->screentexpos_top_lower : gps_->screentexpos_lower;
        return tiles && tiles[static_cast<size_t>(x) * gps_->dimy + y] == skin;
    };
    struct Panel { int left, right, bottom; };
    auto panel_for = [&](const Match &heading) -> std::optional<Panel> {
        const auto &skin = native_texture_hover_rectangle(*gps_);
        int left = heading.x - 1, right = heading.x + heading.length;
        while (left >= 0 && !has_skin(left, heading.y, skin[0][1])) --left;
        while (right < gps_->dimx && !has_skin(right, heading.y, skin[2][1])) ++right;
        if (left < 0 || right >= gps_->dimx) return std::nullopt;
        // Connected sides and a complete lower border prevent a different
        // popup or the minimap from supplying one side of a guessed panel.
        for (int y = heading.y + 1; y < gps_->dimy; ++y) {
            if (has_skin(left, y, skin[0][2]) && has_skin(right, y, skin[2][2])) {
                for (int x = left + 1; x < right; ++x)
                    if (!has_skin(x, y, skin[1][2])) return std::nullopt;
                return Panel{left, right, y};
            }
            if (!has_skin(left, y, skin[0][1]) ||
                !has_skin(right, y, skin[2][1])) return std::nullopt;
        }
        return std::nullopt;
    };
    struct Slot {
        std::vector<Match *> parts;
        int left, right;
        bool centered;
    };
    std::vector<Slot> slots;
    const int32_t (*button_skins[])[3] = {
        native_texture_button_rectangle(*gps_),
        native_texture_button_rectangle_selected(*gps_),
        native_texture_button_rectangle_light(*gps_),
        native_texture_button_rectangle_dark(*gps_),
    };
    for (Match *heading : headings) {
        const auto panel = panel_for(*heading);
        if (!panel) continue;
        slots.push_back({{heading}, panel->left + 1, panel->right, true});
        for (int y = heading->y + 1; y < panel->bottom; ++y) {
            for (int left = panel->left + 1; left + 2 < panel->right; ++left) {
                for (const auto *skin : button_skins) {
                    if (!has_skin(left, y, skin[0][1])) continue;
                    int right = left + 1;
                    while (right < panel->right && has_skin(right, y, skin[1][1])) ++right;
                    if (right <= left + 1 || right >= panel->right ||
                        !has_skin(right, y, skin[2][1])) continue;
                    auto parts = fortress_text_row(left, y);
                    if (!parts.empty() && parts.back()->x + parts.back()->length <= right)
                        slots.push_back({std::move(parts), left + 1, right, false});
                    // Viewed/completed is a separate, green native row, not
                    // a continuation of the title. Keep its vertical slot and
                    // give it the same text origin and font as the title.
                    if (y + 1 < panel->bottom) {
                        for (Match &status : prepared_matches_) {
                            if (status.y != y + 1 || status.x < left ||
                                status.x + status.length > right || status.target.empty() ||
                                (status.source != "[Viewed]" && status.source != "[Completed]"))
                                continue;
                            slots.push_back({{&status}, left + 1, right, false});
                        }
                    }
                    left = right;
                    break;
                }
            }
        }
    }
    if (slots.empty()) return;
    for (Slot &slot : slots) {
        layout_fortress_text_rows(renderer, {slot.parts}, slot.left, slot.right);
        for (Match *part : slot.parts) part->layout_left = !slot.centered;
    }
}

// Choose catalog fragments only when the rest of the paragraph is covered.
// Native assembly can put a short entry before one with the same longer prefix.
std::optional<std::string> Overlay::translate_help_paragraph(
        std::string_view raw_source, const std::vector<int> &raw_foregrounds,
        std::vector<int> &target_foregrounds, bool ui_message, int required_rule,
        bool literal_only) const {
    target_foregrounds.clear();
    const auto &catalog = ui_message ? ui_message_trie_ : help_trie_;
    const auto &templates = ui_message ? ui_message_template_rules_ : help_template_rules_;
    if ((catalog.size() <= 1 && templates.empty()) ||
        raw_foregrounds.size() != raw_source.size()) return std::nullopt;
    // Native color boundaries and line wraps introduce repeated spaces. Keep
    // their color positions aligned while canonicalizing for typed templates.
    std::string source;
    std::vector<int> source_foregrounds;
    std::vector<size_t> source_origins;
    for (size_t at = 0; at < raw_source.size(); ++at) {
        const unsigned char ch = raw_source[at];
        if (native_prose_space(ch)) {
            if (source.empty() || source.back() == ' ') continue;
            source.push_back(' ');
        } else source.push_back(static_cast<char>(ch));
        source_foregrounds.push_back(raw_foregrounds[at]);
        source_origins.push_back(at);
    }
    while (!source.empty() && source.back() == ' ') {
        source.pop_back();
        source_foregrounds.pop_back();
        source_origins.pop_back();
    }
    if (source.empty()) return std::nullopt;
    const auto palette_rgb = [&](int palette) {
        return (gps_->uccolor[palette][0] << 16) |
            (gps_->uccolor[palette][1] << 8) | gps_->uccolor[palette][2];
    };
    const auto span_rgb = [&](size_t begin, size_t end,
            const std::vector<std::pair<size_t, size_t>> &captures = {}) {
        int base = -1;
        size_t capture = 0;
        for (size_t at = begin; at < end; ++at) {
            while (capture < captures.size() && captures[capture].second <= at)
                ++capture;
            if ((capture < captures.size() && captures[capture].first <= at) ||
                source[at] == ' ') continue;
            if (base < 0) base = source_foregrounds[at];
            else if (source_foregrounds[at] != base) return palette_rgb(7);
        }
        return base < 0 ? source_foregrounds[begin] : base;
    };
    const auto word_byte = [](unsigned char ch) {
        return ascii_word_byte(ch) || is_cp437_latin_letter_byte(ch);
    };
    const auto boundary = [&](size_t end) {
        return end == source.size() || !word_byte(source[end - 1]) ||
            !word_byte(source[end]);
    };
    struct Step {
        size_t end = SIZE_MAX;
        int rule = -1;
        bool raw = false;
        std::vector<std::string> captures;
        std::vector<std::string> resolved;
        std::vector<std::vector<size_t>> key_origins;
        std::vector<std::pair<size_t, size_t>> ranges;
        size_t literal_bytes = 0;
    };
    std::vector<Step> path(source.size() + 1);
    path.back().end = source.size();
    // A complete literal always wins the existing longest-span / most-
    // literal-bytes ordering. Resolve it before the suffix DP: fixed help
    // and mode descriptions must not scan every dynamic message template
    // at every character on each native layer and frame. Keep the shared
    // output pass below so palette tags and native foregrounds still apply.
    int literal_node = 0;
    for (unsigned char ch : source) {
        if (ch == ' ') continue;
        const auto found = catalog[literal_node].next.find(ch);
        if (found == catalog[literal_node].next.end()) {
            literal_node = -1;
            break;
        }
        literal_node = found->second;
    }
    if (literal_node >= 0 && catalog[literal_node].rule >= 0 &&
        (required_rule < 0 || catalog[literal_node].rule == required_rule)) {
        path.front().end = source.size();
        path.front().rule = catalog[literal_node].rule;
        path.front().literal_bytes = source.size();
    }
    // Announcement dispatch probes reviewed whole messages before recursive
    // grammars. Reuse this lookup and the color-aware output pass, but do not
    // let a template or several shorter catalog entries satisfy that probe.
    if (literal_only && path.front().end == SIZE_MAX) return std::nullopt;
    // The paragraph DP visits every possible suffix. Select its templates
    // once: a rule whose mandatory literal is absent from the whole source
    // cannot match any of those suffixes. Notification lists otherwise scan
    // the entire message catalogue for every character of every record.
    // Probe indices retain catalogue order, including unanchored rules; the
    // original typed matcher below still resolves every field and color.
    std::vector<int> candidate_templates;
    if (path.front().end == SIZE_MAX) {
        if (required_rule >= 0) {
            if (std::find(templates.begin(), templates.end(), required_rule) != templates.end())
                candidate_templates.push_back(required_rule);
        } else if (ui_message) {
            for (int index : ui_message_anchors_.candidates(compact_ui_message_literal(source)))
                candidate_templates.push_back(ui_message_template_probes_[index].index);
        }
    }
    const auto &paragraph_templates = ui_message || required_rule >= 0
        ? candidate_templates : templates;
    // Before filling suffixes, try the complete source through this SAME
    // matcher. Only path[source.size()] is reachable yet, so this first pass
    // cannot admit a shorter span. A complete match wins the existing longest
    // span ordering; all candidates still compete by literal bytes and their
    // original order, with unchanged typed captures and foreground handling.
    for (size_t scan = path.front().end == SIZE_MAX ? source.size() + 1 : 0; scan-- > 0;) {
        const bool whole_source = scan == source.size();
        const size_t at = whole_source ? 0 : scan;
        // A UI candidate owns exactly one reviewed message, including its
        // typed captures. Do not validate an overlong candidate by covering
        // it with several unrelated catalog entries: those may be separate
        // announcements whose native line boundaries must remain intact.
        if (required_rule >= 0 && at != 0) continue;
        if (source[at] == ' ') {
            if (path[at + 1].end != SIZE_MAX) path[at].end = at + 1;
            continue;
        }
        int node = 0;
        for (size_t end = at; end < source.size(); ++end) {
            const unsigned char ch = source[end];
            if (ch == ' ') continue;
            const auto found = catalog[node].next.find(ch);
            if (found == catalog[node].next.end()) break;
            node = found->second;
            if (catalog[node].rule >= 0 &&
                (required_rule < 0 || catalog[node].rule == required_rule) && boundary(end + 1) &&
                path[end + 1].end != SIZE_MAX) {
                path[at].end = end + 1;
                path[at].rule = catalog[node].rule;
                path[at].literal_bytes = end + 1 - at;
            }
        }
        // The same typed name and sphere engines are shared with ordinary
        // world/character pages. Wildcards cannot swallow arbitrary prose.
        for (int index : paragraph_templates) {
            const Rule &rule = rules_[static_cast<size_t>(index)];
            const auto prefix = catalog_literal_end(source, at, rule.template_literals.front(),
                rule.case_insensitive);
            if (!prefix) continue;
            size_t literal_bytes = 0;
            for (const auto &literal : rule.template_literals)
                literal_bytes += std::count_if(literal.begin(), literal.end(),
                    [](unsigned char ch) { return !native_prose_space(ch); });
            for (size_t end = source.size(); end > *prefix; --end) {
                if (!boundary(end) || path[end].end == SIZE_MAX ||
                    (path[at].end != SIZE_MAX && (path[at].end > end ||
                        (path[at].end == end && path[at].literal_bytes >= literal_bytes)))) continue;
                std::vector<std::string> captures;
                std::vector<std::pair<size_t, size_t>> ranges;
                if (!match_catalog_template(rule, std::string_view(source).substr(0, end),
                        at, captures, ranges, &source_foregrounds)) continue;
                std::vector<std::string> resolved;
                std::vector<std::vector<size_t>> key_origins(captures.size());
                bool complete = true;
                for (size_t i = 0; i < captures.size(); ++i) {
                    std::optional<std::string> translated;
                    switch (rule.template_kinds[i]) {
                    case 'p': translated = translate_legends_name(captures[i], true); break;
                    case 'e': translated = translate_legends_name(captures[i], false); break;
                    case 'r': translated = translate_deity_spheres(captures[i]); break;
                    case 'q':
                        if (ui_message) translated = translate_legends_text(captures[i], false, false);
                        break;
                    case 'v':
                        if (ui_message) {
                            translated = translate_legends_event(captures[i]);
                            if (!translated) translated = translate_legends_text(captures[i], false, false);
                        }
                        break;
                    case 'm':
                        if (ui_message) translated = translate_announcement_music_passages(captures[i]);
                        break;
                    case 'u':
                        if (ui_message) translated = translate_announcement_number(captures[i]);
                        break;
                    case 'f':
                        if (ui_message) translated = translate_announcement_date(captures[i]);
                        break;
                    case 'i':
                        if (ui_message) translated = translate_announcement_items(captures[i]);
                        break;
                    case 't':
                        if (ui_message) translated = translate_legends_anatomy(captures[i]);
                        break;
                    case 'b':
                        if (ui_message) {
                            translated = translate_legends_artifact_identity(captures[i]);
                            if (!translated) translated = translate_legends_book(captures[i]);
                        }
                        break;
                    case 'd': translated = captures[i]; break;
                    case 's':
                    case 'n':
                        if (ui_message) {
                            // Tracking prose shares the compact spoor noun
                            // grammar. The first slot is footwear or anatomy;
                            // its surrounding depth/clarity belongs to the
                            // authored sentence, never the voice vocabulary.
                            const bool track_noun = i == 0 &&
                                rule.source.starts_with("There is a ") &&
                                rule.source.ends_with("{s} imprint in the {s}.");
                            translated = track_noun ? translate_map_track_noun(captures[i])
                                : translate_ui_catalog_capture(rule, i, captures[i]);
                        }
                        break;
                    case 'c':
                        if (!ui_message) break;
                        [[fallthrough]];
                    case 'k': {
                        const size_t first = source_origins[ranges[i].first];
                        const size_t last = source_origins[ranges[i].second - 1] + 1;
                        const std::string_view native = raw_source.substr(first, last - first);
                        translated = rule.template_kinds[i] == 'k'
                            ? display_keybinding_sequence(native, key_origins[i])
                            : cp437_to_utf8(native);
                        break;
                    }
                    default: break;
                    }
                    if (!translated || translated->empty()) { complete = false; break; }
                    resolved.push_back(std::move(*translated));
                }
                if (!complete || rule.target_capture_order.size() != captures.size()) continue;
                path[at].end = end;
                path[at].rule = index;
                path[at].captures = std::move(captures);
                path[at].resolved = std::move(resolved);
                path[at].key_origins = std::move(key_origins);
                path[at].ranges = std::move(ranges);
                path[at].literal_bytes = literal_bytes;
                break;
            }
        }
        if (whole_source) {
            if (path.front().end == source.size()) break;
            // No complete template resolved. Leave the path untouched and
            // resume the original suffix DP, including its raw delimiters.
            continue;
        }
        if (path[at].end != SIZE_MAX) continue;
        // Quotes around divine speech and brackets around keys remain native.
        // A delimiter never makes an uncovered remainder successful.
        if ((source[at] == '[' || source[at] == ']' || source[at] == '"') &&
            path[at + 1].end != SIZE_MAX) {
            path[at].end = at + 1;
            path[at].raw = true;
            continue;
        }
    }
    if (path.front().end == SIZE_MAX) return std::nullopt;
    if (required_rule >= 0 && (path.front().rule != required_rule ||
            path.front().end != source.size())) return std::nullopt;
    std::string target;
    for (size_t at = 0; at < source.size();) {
        const Step &step = path[at];
        if (step.raw) {
            if (!target.empty() && ascii_word_byte(static_cast<unsigned char>(target.back())) &&
                word_byte(source[at])) {
                target.push_back(' ');
                target_foregrounds.push_back(source_foregrounds[at]);
            }
            target += cp437_to_utf8(std::string_view(source).substr(at, step.end - at));
            target_foregrounds.insert(target_foregrounds.end(),
                source_foregrounds.begin() + at, source_foregrounds.begin() + step.end);
        } else if (step.rule >= 0) {
            const Rule &rule = rules_[static_cast<size_t>(step.rule)];
            // A named speech can embed yellow trade goods and a red agreement
            // notice. The speaker's native foreground still owns its prose;
            // mixed field colors must not turn the entire speech white.
            // Item/number captures and explicit catalog palettes keep their
            // own colors below. This is shared by every named UI speech.
            const bool named_speech = ui_message && !step.ranges.empty() &&
                rule.template_kinds.front() == 'p' &&
                rule.template_literals.front().empty() &&
                rule.template_literals[1].starts_with(": ");
            // Typed fields own their colors separately. Infer prose
            // ONLY from its literal source glyphs: a green key inside
            // white instructions must not force the prose to gray.
            // Source ranges remain ordered even if Chinese reorders
            // the captures; explicit target palettes still win below.
            const int base_rgb = named_speech
                ? span_rgb(step.ranges.front().first, step.ranges.front().second)
                : span_rgb(at, step.end, step.ranges);
            std::vector<int> capture_colors;
            for (const auto &[begin, end] : step.ranges)
                capture_colors.push_back(span_rgb(begin, end));
            size_t cp = 0, output_capture = 0;
            for (size_t byte = 0; byte < rule.target.size();) {
                const int palette = rule.help_target_palettes.empty()
                    ? -1 : rule.help_target_palettes[cp];
                if (!step.resolved.empty() && rule.target[byte] == '{') {
                    const size_t close = rule.target.find('}', byte);
                    if (close == std::string::npos ||
                        output_capture >= rule.target_capture_order.size()) return std::nullopt;
                    const size_t capture = rule.target_capture_order[output_capture++];
                    const std::string &value = step.resolved[capture];
                    target += value;
                    if (rule.template_kinds[capture] == 'k' ||
                        (ui_message && rule.template_kinds[capture] == 'c')) {
                        // Keycap symbols inherit the replaced key name's
                        // color; spacing/modifiers and custom names retain
                        // their native colors, independent of prose tags.
                        const auto [begin, end] = step.ranges[capture];
                        const size_t first = source_origins[begin];
                        const size_t last = source_origins[end - 1] + 1;
                        if (rule.template_kinds[capture] == 'k') {
                            for (size_t origin : step.key_origins[capture])
                                target_foregrounds.push_back(raw_foregrounds[first + origin]);
                        } else {
                            target_foregrounds.insert(target_foregrounds.end(),
                                raw_foregrounds.begin() + first, raw_foregrounds.begin() + last);
                        }
                    } else {
                        const int rgb = palette < 0 ? capture_colors[capture] : palette_rgb(palette);
                        for (unsigned char ch : value)
                            if ((ch & 0xc0) != 0x80) target_foregrounds.push_back(rgb);
                    }
                    cp += close + 1 - byte;
                    byte = close + 1;
                    continue;
                }
                target_foregrounds.push_back(palette < 0 ? base_rgb : palette_rgb(palette));
                target.push_back(rule.target[byte++]);
                while (byte < rule.target.size() &&
                    (static_cast<unsigned char>(rule.target[byte]) & 0xc0) == 0x80)
                    target.push_back(rule.target[byte++]);
                ++cp;
            }
        }
        at = step.end;
    }
    return target.empty() ? std::nullopt : std::optional<std::string>(std::move(target));
}
