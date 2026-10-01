// Included inside find_matches, after specialized document/widget capture.
// Only complete reviewed catalog messages are accepted. Native colors and
// padding do not divide a sentence; unknown text is never erased or guessed.
// Wrapped continuation requires the same connected panel and left margin.
    if (ui_message_trie_.size() > 1 || !ui_message_template_rules_.empty()) {
        const NativePanelBorders borders(*gps_);
        const auto visible_layer = [&](int x, int y) {
            if (!screen_override) return true;
            bool top = false;
            cell_at(x, y, &top);
            return screen_override == (top ? gps_->screen_top : gps_->screen);
        };
        // A screen-inferred message cannot borrow another widget's caption
        // merely because both widgets sit inside the same enclosing panel.
        // Keep spaces drawn inside the caption and changes of text color;
        // the native frame or layer/half-font boundary terminates its source.
        const auto native_caption_text_end = [&](int x, int y) -> std::optional<int> {
            if (const auto tab = native_classic_tab_text_span(*gps_, x, y))
                return tab->second;
            // Full-font graphical buttons need the same ownership boundary
            // as tabs and half-font captions. Their frame cells can be blank
            // in the text grid, so a panel-wide template must not read the
            // next button as a name slot (e.g. Combat ... Training).
            if (const auto button = native_button_text_span(*gps_, x, x + 1, y))
                return button->second;
            constexpr uint32_t top_half = 1u << 3;
            constexpr uint32_t bottom_half = 1u << 4;
            constexpr uint32_t half_mask = top_half | bottom_half;
            bool layer = false;
            const auto *first = cell_at(x, y, &layer);
            const auto *flags = layer
                ? gps_->screentexpos_top_flag : gps_->screentexpos_flag;
            if (!first || !flags) return std::nullopt;
            const uint32_t half = flags[static_cast<size_t>(x) * gps_->dimy + y]
                & half_mask;
            if (half != top_half && half != bottom_half) return std::nullopt;
            int end = x;
            for (; end < gps_->dimx; ++end) {
                bool cell_layer = false;
                const auto *cell = cell_at(end, y, &cell_layer);
                if (!cell || !cell[0] || cell_layer != layer ||
                    (flags[static_cast<size_t>(end) * gps_->dimy + y]
                        & half_mask) != half) break;
            }
            return end;
        };
        const auto message_foregrounds = [&](int x, int y, int length) {
            std::vector<int> colors;
            colors.reserve(static_cast<size_t>(std::max(0, length)));
            for (int i = 0; i < length; ++i) {
                bool top = false;
                const auto *cell = screen_override
                    ? screen_override + (static_cast<size_t>(x + i) * gps_->dimy + y) * 8
                    : cell_at(x + i, y, &top);
                colors.push_back(cell ? (cell[1] << 16) | (cell[2] << 8) | cell[3] : 0xffffff);
            }
            return colors;
        };
        // Catalog literals ignore whitespace. These necessary conditions only
        // reject impossible candidates; the original typed matcher still
        // decides every capture and its exact case/color requirements.
        const auto &message_templates = ui_message_template_probes_;
        // The chooser description is ONE framed document. Taking its first
        // sentence as a UI message but its last sentence as an ordinary label
        // bypassed the legacy multiline pass (UI messages are isolated from
        // page layout) and mixed left alignment with per-English-run centring.
        // Recover the complete visible frame before either matcher consumes
        // it. All three modes use the same catalog, font and paragraph fitter.
        int chooser_title_y = -1, chooser_footer_y = -1;
        std::array<bool, 3> chooser_modes{};
        for (int y = 0; y < gps_->dimy; ++y) {
            const auto &row = screen_rows[y];
            const auto contains = [&](std::string_view text) {
                const size_t x = row.find(text);
                if (x == std::string::npos ||
                    !has_word_boundaries(row, x, x + text.size())) return false;
                for (size_t at = x; at < x + text.size(); ++at)
                    if (!visible_layer(static_cast<int>(at), y)) return false;
                return true;
            };
            if (contains("Select a game type to begin!")) chooser_title_y = y;
            if (contains("Back to title menu")) chooser_footer_y = y;
            chooser_modes[0] = chooser_modes[0] || contains("Fortress");
            chooser_modes[1] = chooser_modes[1] || contains("Adventurer") || contains("Adventure");
            chooser_modes[2] = chooser_modes[2] || contains("Legends");
        }
        if (chooser_title_y >= 0 && chooser_footer_y > chooser_title_y &&
            std::all_of(chooser_modes.begin(), chooser_modes.end(), [](bool mode) { return mode; })) {
            bool placed = false;
            for (int y = chooser_footer_y + 1; y < gps_->dimy && !placed; ++y) {
                for (int x = 1; x < gps_->dimx - 1 && !placed; ++x) {
                    if (!ascii_word_byte(screen_rows[y][x]) || !visible_layer(x, y)) continue;
                    const auto panel = native_panel_interior(borders, *gps_, x, x + 1, y);
                    if (!panel || panel->y <= chooser_footer_y) continue;
                    const int panel_right = panel->x + panel->w;
                    const int panel_bottom = panel->y + panel->h;
                    int left = panel_right, first_y = panel_bottom;
                    bool intact = true;
                    std::vector<Match> rows;
                    std::vector<std::string> paragraphs;
                    std::vector<std::vector<int>> paragraph_colors;
                    bool new_paragraph = true;
                    for (int row_y = panel->y; row_y < panel_bottom && intact; ++row_y) {
                        const std::string_view band(screen_rows[row_y].data() + panel->x, panel->w);
                        const std::string_view text = trim_view(band);
                        if (text.empty()) { new_paragraph = true; continue; }
                        const int row_x = panel->x + static_cast<int>(text.data() - band.data());
                        for (int at = row_x; at < row_x + static_cast<int>(text.size()); ++at)
                            if (!visible_layer(at, row_y) || is_cp437_box_separator(screen_rows[row_y], at))
                                intact = false;
                        if (!intact) break;
                        left = std::min(left, row_x);
                        first_y = std::min(first_y, row_y);
                        rows.push_back({row_x, row_y, static_cast<int>(text.size()),
                            kUiMessageRule, {}, std::string(text)});
                        if (new_paragraph) {
                            paragraphs.emplace_back();
                            paragraph_colors.emplace_back();
                        } else {
                            paragraphs.back().push_back(' ');
                            paragraph_colors.back().push_back(paragraph_colors.back().back());
                        }
                        paragraphs.back().append(text);
                        const auto colors = message_foregrounds(row_x, row_y, static_cast<int>(text.size()));
                        paragraph_colors.back().insert(paragraph_colors.back().end(), colors.begin(), colors.end());
                        new_paragraph = false;
                    }
                    if (!intact || paragraphs.size() < 2) continue;
                    std::string target;
                    std::vector<int> target_colors;
                    for (size_t p = 0; p < paragraphs.size(); ++p) {
                        std::vector<int> colors;
                        const auto translated = translate_help_paragraph(
                            paragraphs[p], paragraph_colors[p], colors, true);
                        if (!translated || translated->empty() || colors.empty()) { intact = false; break; }
                        if (!target.empty()) {
                            // Keep one semantic paragraph gap, not the vacant
                            // English wrap rows left by a denser translation.
                            target += "\n\n";
                            const int gap_color = target_colors.back();
                            target_colors.insert(target_colors.end(), 2, gap_color);
                        }
                        target += *translated;
                        target_colors.insert(target_colors.end(), colors.begin(), colors.end());
                    }
                    if (!intact) continue;
                    // Side insets belong to the closed native frame, not to
                    // the chooser/screen centre or any short English sentence.
                    const int right = panel_right - (left - panel->x);
                    if (right <= left || std::any_of(rows.begin(), rows.end(),
                            [&](const Match &row) { return row.x + row.length > right; })) continue;
                    // Blank interior rows are output capacity, not suppression
                    // spans. Preserve every original nonblank row unchanged.
                    std::vector<Match> slots;
                    size_t next = 0;
                    for (int row_y = first_y; row_y < panel_bottom; ++row_y) {
                        if (next < rows.size() && rows[next].y == row_y)
                            slots.push_back(std::move(rows[next++]));
                        else slots.push_back({left, row_y, 0, kUiMessageRule, {}, {}});
                    }
                    placed = append_setup_paragraph(std::move(slots), target, right, right, target_colors);
                }
            }
        }
        const auto append_message = [&](std::vector<Match> rows, int right,
                                        std::string_view target,
                                        const std::vector<int> &target_colors,
                                        std::optional<NativeParagraphViewport> viewport = std::nullopt,
                                        std::string_view complete_source = {},
                                        int native_left = -1, bool native_centered = false,
                                        int complete_layout_rows = 0) {
            return append_ui_message_paragraph(screen_rows, result, untranslated_help_rows,
                only_y, std::move(rows), right, target, target_colors, viewport,
                complete_source, native_left, native_centered, complete_layout_rows);
        };
        append_native_message_paragraphs(screen_rows, result, untranslated_help_rows,
            only_y, screen_override, false);
        RenderTimingScope ui_detail(render_timings_, config_.trace_render_timing, RenderTimingStage::UiDynamic);
        // Reject impossible starts before reading caption skins or rebuilding
        // a panel. These short prefixes are only necessary conditions; retain
        // the original probe order and complete typed matcher below.
        std::array<bool, 256> template_first{}, template_one{};
        std::unordered_set<uint32_t> template_two, template_three;
        bool template_slot_first = false;
        for (const auto &probe : message_templates) {
            if (probe.prefix.empty()) { template_slot_first = true; continue; }
            const auto first = static_cast<unsigned char>(probe.prefix.front());
            template_first[first] = true;
            uint32_t prefix = first;
            if (probe.prefix.size() == 1) { template_one[first] = true; continue; }
            prefix = (prefix << 8) | static_cast<unsigned char>(probe.prefix[1]);
            if (probe.prefix.size() == 2) { template_two.insert(prefix); continue; }
            prefix = (prefix << 8) | static_cast<unsigned char>(probe.prefix[2]);
            template_three.insert(prefix);
        }
        const auto possible_wrap_edge = [&](int first, int last, int y) {
            for (int x = first + 1; x <= last; ++x)
                // A single-cell encoding context deliberately keeps every
                // possible CP437 edge. A real panel's narrower text context
                // must never turn this rejection filter into a false miss.
                if (borders.at(x, y, 5, std::nullopt, std::pair{x, x + 1})) return true;
            return false;
        };
        const auto possible_template_start = [&](const std::string &row, int x, int y) {
            const auto fixed_prefix = [&]() {
                const auto first = static_cast<unsigned char>(row[x]);
                if (native_prose_space(first)) return true;
                if (!template_first[fold_ascii(first)]) return false;
                uint32_t prefix = 0;
                for (int count = 0; count < 3; ++count) {
                    const int column = x + count;
                    if (column >= gps_->dimx) return true;
                    const auto ch = static_cast<unsigned char>(row[column]);
                    // Space, clipping, or a physical row edge can change the
                    // next logical byte. Leave those cases to the full reader.
                    if (native_prose_space(ch) || is_cp437_box_separator(row, column) ||
                            !visible_layer(column, y)) return true;
                    prefix = (prefix << 8) | fold_ascii(ch);
                    if ((count == 0 && template_one[fold_ascii(ch)]) ||
                            (count == 1 && template_two.contains(prefix)) ||
                            (count == 2 && template_three.contains(prefix))) return true;
                }
                return possible_wrap_edge(x, x + 2, y);
            };
            if (fixed_prefix()) return true;
            if (!template_slot_first) return false;
            if (x == 0 || is_cp437_box_separator(row, x - 1) ||
                    (x >= 2 && row[x - 1] == ' ' && row[x - 2] == ' ')) return true;
            // The existing slot-first rule also permits panel.x == x. Such
            // a panel must have its left side at x-1 on this same source row.
            // Probe that necessary cell, not an inferred text/space margin.
            return borders.at(x - 1, y, 3, std::nullopt, std::pair{x - 1, x});
        };
        const auto possible_literal_start = [&](const std::string &row, int x, int y) {
            int node = 0;
            for (int column = x; column < gps_->dimx && column - x < 8; ++column) {
                const auto ch = static_cast<unsigned char>(row[column]);
                if (native_prose_space(ch) || is_cp437_box_separator(row, column) ||
                        !visible_layer(column, y)) return true;
                const auto next = ui_message_trie_[node].next.find(ch);
                if (next == ui_message_trie_[node].next.end())
                    return possible_wrap_edge(x, column, y);
                node = next->second;
                // Even a shorter terminal may win at the actual caption end.
                // Boundary, case and wrap acceptance remain with the matcher.
                if (ui_message_trie_[node].rule >= 0) return true;
            }
            return true;
        };
        // Dynamic complete messages have the same field/panel contract as
        // literal messages. Typed terms, units, custom names and bindings
        // belong to authored slots and never enter the global templates.
        for (int start_y = 0; start_y < gps_->dimy; ++start_y) {
            for (int start_x = 0; start_x < gps_->dimx; ++start_x) {
                const auto &initial_row = screen_rows[start_y];
                // A border cannot produce even one source endpoint: the
                // inner scanner stops at the same separator immediately.
                // Reject it before panel reconstruction, color allocation
                // and the template sweep. Classic catalog buttons contain
                // thousands of these cells on every frame. Use the existing
                // UTF-8-aware predicate, not a blanket high-byte exclusion.
                if (initial_row[start_x] == ' ' ||
                    (start_x > 0 && ascii_word_byte(initial_row[start_x - 1])) ||
                    is_cp437_box_separator(initial_row, start_x) ||
                    !visible_layer(start_x, start_y)) continue;
                if (!possible_template_start(initial_row, start_x, start_y)) continue;
                const auto caption_text_end = native_caption_text_end(start_x, start_y);
                if (caption_text_end) {
                    // A native widget caption cannot wrap into another row.
                    // Its visible bytes are an upper bound on every legal
                    // source below, even when a panel ends sooner. Check the
                    // catalog's necessary literals before reconstructing a
                    // closed panel or allocating colors for each list word.
                    // This is only a rejection filter: the same full matcher
                    // still owns geometry, slots, colors and field endpoints.
                    std::string possible;
                    possible.reserve(static_cast<size_t>(*caption_text_end - start_x));
                    for (int x = start_x; x < *caption_text_end; ++x) {
                        if (!visible_layer(x, start_y) ||
                            is_cp437_box_separator(initial_row, x)) break;
                        if (!native_prose_space(static_cast<unsigned char>(initial_row[x])))
                            possible.push_back(fold_ascii(initial_row[x]));
                    }
                    const auto possible_rules = ui_message_anchors_.candidates(possible);
                    if (std::none_of(possible_rules.begin(), possible_rules.end(),
                            [&](int index) {
                                return possible.starts_with(message_templates[index].prefix);
                            })) continue;
                }
                std::vector<Match> best_rows;
                size_t best_size = 0;
                size_t best_literal_bytes = 0;
                int best_right = -1;
                std::string best_target;
                std::vector<int> best_colors;
                // Geometry, visible bytes and native colors depend on this
                // starting field, not on the template. Build the same legal
                // wrap once and retain every original field-end candidate.
                const auto panel = native_panel_interior(borders, *gps_,
                    start_x, start_x + 1, start_y);
                int wrap_x = start_x;
                if (panel) {
                    wrap_x = panel->x;
                    while (wrap_x < start_x && initial_row[wrap_x] == ' ') ++wrap_x;
                }
                const int right = std::min(panel ? panel->x + panel->w : gps_->dimx,
                    caption_text_end.value_or(gps_->dimx));
                struct MessageEndpoint {
                    size_t source_size, compact_size, prior_rows;
                    int x, y, end;
                };
                std::string source, compact;
                std::vector<int> source_colors;
                struct ColorSpan { int x, y, length; bool wrap_space = false; };
                std::vector<ColorSpan> color_spans;
                std::vector<Match> rows;
                std::vector<MessageEndpoint> endpoints;
                size_t terminal_limit = std::string::npos;
                for (int y = start_y; y < gps_->dimy; ++y) {
                    const int line_x = y == start_y ? start_x : wrap_x;
                    const auto &row = screen_rows[y];
                    const size_t source_begin = source.size();
                    int end = line_x;
                    bool intact = true;
                    for (int x = line_x; x < right; ++x) {
                        if (!visible_layer(x, y) || is_cp437_box_separator(row, x)) {
                            intact = false;
                            break;
                        }
                        // Without a panel, an empty terminal literal cannot
                        // cross the first independent double-space field.
                        // Fixed-suffix rules keep their original longer span.
                        if (!panel && terminal_limit == std::string::npos && x > line_x &&
                            row[x] == ' ' && x + 1 < right && row[x + 1] == ' ')
                            terminal_limit = source.size();
                        source.push_back(row[x]);
                        if (!native_prose_space(static_cast<unsigned char>(row[x])))
                            compact.push_back(fold_ascii(row[x]));
                        if (row[x] == ' ') continue;
                        end = x + 1;
                        const bool field_end = end == right || is_cp437_box_separator(row, end) ||
                            (row[end] == ' ' && (end + 1 == right || row[end + 1] == ' '));
                        if (field_end) endpoints.push_back({source.size(), compact.size(), rows.size(),
                            line_x, y, end});
                    }
                    color_spans.push_back({line_x, y,
                        static_cast<int>(source.size() - source_begin)});
                    // Another row cannot continue an independently framed
                    // caption or the current native half-font caption.
                    if (!intact || end <= line_x || caption_text_end || !panel || wrap_x != start_x ||
                        y + 1 >= gps_->dimy || y + 1 >= panel->y + panel->h ||
                        screen_rows[y + 1][wrap_x] == ' ') break;
                    bool aligned = true;
                    for (int x = panel->x; x < wrap_x; ++x)
                        if (screen_rows[y + 1][x] != ' ') aligned = false;
                    if (!aligned) break;
                    rows.push_back({line_x, y, end - line_x, kUiMessageRule,
                        {}, row.substr(line_x, end - line_x)});
                    source.push_back(' ');
                    color_spans.back().wrap_space = true;
                }
                // No legal complete field means no rule can claim this
                // source, regardless of its prefix/anchor. In particular,
                // occluded or clipped starts must not scan the catalog.
                if (endpoints.empty()) continue;
                // Probe only rules whose necessary literal actually occurs.
                // This is the same anchor index used by ordinary templates,
                // fed the catalog's whitespace-independent representation.
                for (int index : ui_message_anchors_.candidates(compact)) {
                    const auto &probe = message_templates[index];
                    if (!compact.starts_with(probe.prefix)) continue;
                    // A closed graphical panel establishes the first field
                    // just as an ASCII border does. Its border has no text
                    // byte, so a caption at panel->x (including x == 1)
                    // cannot satisfy the two-space inter-field guard below.
                    // Keep that guard for starts INSIDE the panel: otherwise
                    // a name-first template could consume a sentence suffix.
                    if (probe.prefix.empty() && start_x > 0 &&
                        !(panel && start_x == panel->x) &&
                        !is_cp437_box_separator(initial_row, start_x - 1) &&
                        (start_x < 2 || initial_row[start_x - 1] != ' ' ||
                         initial_row[start_x - 2] != ' ')) continue;
                    const Rule &rule = rules_[static_cast<size_t>(probe.index)];
                    for (const auto &endpoint : endpoints) {
                        if ((!panel && probe.suffix.empty() && endpoint.source_size > terminal_limit) ||
                            !std::string_view(compact).substr(0, endpoint.compact_size).ends_with(probe.suffix))
                            continue;
                        const auto candidate_source = std::string_view(source).substr(0, endpoint.source_size);
                        std::vector<std::string> captures;
                        std::vector<std::pair<size_t, size_t>> ranges;
                        // Most list fields have no matching UI-message
                        // anchor. Read native colors only for a real typed
                        // candidate, preserving every padded byte and the
                        // inherited color of each synthetic wrap space.
                        if (source_colors.empty()) {
                            source_colors.reserve(source.size());
                            for (const auto &span : color_spans) {
                                const auto colors = message_foregrounds(span.x, span.y, span.length);
                                source_colors.insert(source_colors.end(), colors.begin(), colors.end());
                                if (span.wrap_space) source_colors.push_back(source_colors.back());
                            }
                        }
                        if (!match_catalog_template(rule, candidate_source, 0, captures, ranges, &source_colors)) continue;
                        // A complete dictionary caption is more specific than
                        // an inferred action with a name slot. In particular,
                        // Leave Vacant must not become Leave {e} with Vacant
                        // phoneticized as an entity. Leave this exact span to
                        // the ordinary literal matcher, and do not extend the
                        // same inferred action into a later field or row.
                        // An authored binding-only message is not an inferred
                        // name/action. Its {k} slots own the CURRENT keys and
                        // their colors, even if an older literal happens to
                        // spell out the default bindings (for example wasd).
                        // Returning that span to ordinary labels strands the
                        // native keys when prose is repacked across rows.
                        const bool binding_message = std::all_of(
                            rule.template_kinds.begin(), rule.template_kinds.end(),
                            [](char kind) { return kind == 'k'; });
                        if (!binding_message && exact_literal_translation(candidate_source)) break;
                        std::vector<int> candidate_colors(source_colors.begin(),
                            source_colors.begin() + endpoint.source_size);
                        std::vector<int> target_colors;
                        const auto target = translate_help_paragraph(candidate_source,
                            candidate_colors, target_colors, true, probe.index);
                        // Structural wildcards alone can span neighbouring
                        // announcements. Only the same rule's fully resolved
                        // message may own these rows or compete for length.
                        if (!target) continue;
                        std::vector<Match> candidate(rows.begin(), rows.begin() + endpoint.prior_rows);
                        candidate.push_back({endpoint.x, endpoint.y, endpoint.end - endpoint.x, kUiMessageRule,
                            {}, screen_rows[endpoint.y].substr(endpoint.x, endpoint.end - endpoint.x)});
                        if (endpoint.source_size > best_size ||
                            (endpoint.source_size == best_size && probe.literal_bytes > best_literal_bytes)) {
                            best_size = endpoint.source_size;
                            best_literal_bytes = probe.literal_bytes;
                            best_rows = std::move(candidate);
                            best_right = panel ? right : endpoint.end;
                            best_target = *target;
                            best_colors = std::move(target_colors);
                        }
                        break; // Preserve the first fully resolved endpoint for this rule.
                    }
                }
                if (!best_rows.empty()) append_message(std::move(best_rows), best_right,
                    best_target, best_colors);
            }
        }
        ui_detail.checkpoint(RenderTimingStage::UiLiteral);
        for (int start_y = 0; start_y < gps_->dimy; ++start_y) {
            for (int start_x = 0; start_x < gps_->dimx; ++start_x) {
                const auto &first = screen_rows[start_y];
                const unsigned char initial = first[start_x];
                if (!ui_message_trie_[0].next.contains(initial) ||
                    (start_x > 0 && ascii_word_byte(first[start_x - 1])) ||
                    !visible_layer(start_x, start_y)) continue;
                if (!possible_literal_start(first, start_x, start_y)) continue;
                const auto caption_text_end = native_caption_text_end(start_x, start_y);
                int node = 0, x = start_x, y = start_y, end = start_x;
                int line_x = start_x, wrap_x = start_x;
                int best_rule = -1;
                int message_right = -1, best_right = -1;
                std::vector<Match> rows, best_rows;
                std::optional<SDL_Rect> panel;
                bool searched_panel = false;
                const auto find_panel = [&]() {
                    if (searched_panel) return;
                    panel = native_panel_interior(borders, *gps_, start_x, end, start_y);
                    searched_panel = true;
                    if (!panel) return;
                    // Never reflow a mid-line suffix onto the preceding
                    // sentence. Multi-sentence explanations belong in one
                    // complete catalog entry and retain their shared margin.
                    const auto original = read_row(start_y);
                    wrap_x = panel->x;
                    while (wrap_x < start_x && original[wrap_x] == ' ') ++wrap_x;
                };
                const auto bound_by_side_button = [&]() {
                    if (message_right >= 0 || end <= line_x || x <= end ||
                        x + 2 >= gps_->dimx) return false;
                    // A graphical button edge can be a space in the byte
                    // grid. Inspect its live textures as well as CP437 edges
                    // before skipping padding; never infer a column from a
                    // blank gap or an isolated border character alone.
                    const size_t at = static_cast<size_t>(x) * gps_->dimy + y;
                    bool top = false;
                    cell_at(x, y, &top);
                    const auto *primary = top ? gps_->screentexpos_top : gps_->screentexpos;
                    const auto *lower = top ? gps_->screentexpos_top_lower : gps_->screentexpos_lower;
                    if (!is_cp437_box_separator(screen_rows[y], x) &&
                        !(primary && primary[at] > 0) && !(lower && lower[at] > 0)) return false;
                    find_panel();
                    if (!panel || wrap_x != start_x) return false;
                    const auto button = native_button_text_rect(*gps_, x + 1, x + 2, y);
                    if (!button || button->x != x + 1 || x < panel->x ||
                        button->x + button->w >= panel->x + panel->w ||
                        button->y < panel->y || button->y + button->h > panel->y + panel->h)
                        return false;
                    // The complete neighbouring control owns this column.
                    // Keep every continuation and its translated layout to
                    // the left, without consuming the button or its caption.
                    message_right = x;
                    return true;
                };
                while (y < gps_->dimy) {
                    const auto &row = screen_rows[y];
                    // Whitespace can be introduced by independently colored
                    // native draws. Keep actual grid spans, not normalized
                    // string offsets, for source suppression and positioning.
                    if (end > line_x && x + 1 < gps_->dimx &&
                        row[x] == ' ' && row[x + 1] == ' ') find_panel();
                    int right = message_right >= 0 ? message_right :
                        panel ? panel->x + panel->w : gps_->dimx;
                    right = std::min(right, caption_text_end.value_or(gps_->dimx));
                    while (x < right && row[x] == ' ') {
                        if (bound_by_side_button()) { right = message_right; break; }
                        ++x;
                    }
                    if (x < right && is_cp437_box_separator(row, x) && bound_by_side_button())
                        right = message_right;
                    if (x >= right || is_cp437_box_separator(row, x)) {
                        if (end <= line_x) break;
                        if (caption_text_end) break;
                        find_panel();
                        if (!panel || wrap_x != start_x || y + 1 >= panel->y + panel->h ||
                            x < (message_right >= 0 ? message_right : panel->x + panel->w)) break;
                        // A continuation cannot jump over another column or
                        // borrow a row from an overlapping popup/table.
                        bool aligned = true;
                        for (int left = panel->x; left < wrap_x; ++left)
                            if (screen_rows[y + 1][left] != ' ') aligned = false;
                        if (!aligned || screen_rows[y + 1][wrap_x] == ' ' ||
                            !visible_layer(wrap_x, y + 1)) break;
                        rows.push_back({line_x, y, end - line_x, kUiMessageRule,
                            {}, row.substr(line_x, end - line_x)});
                        ++y;
                        x = end = line_x = wrap_x;
                        continue;
                    }
                    if (!visible_layer(x, y)) break;
                    const auto next = ui_message_trie_[node].next.find(
                        static_cast<unsigned char>(row[x]));
                    if (next == ui_message_trie_[node].next.end()) break;
                    node = next->second;
                    end = ++x;
                    const int rule = ui_message_trie_[node].rule;
                    if (rule >= 0 && (x == gps_->dimx || !ascii_word_byte(row[x]))) {
                        best_rule = rule;
                        best_right = message_right;
                        best_rows = rows;
                        best_rows.push_back({line_x, y, end - line_x, kUiMessageRule,
                            {}, row.substr(line_x, end - line_x)});
                    }
                }
                if (best_rule < 0) continue;
                const Rule &rule = rules_[static_cast<size_t>(best_rule)];
                std::vector<int> colors;
                if (!rule.help_target_palettes.empty()) {
                    bool top = false;
                    const auto *cell = cell_at(start_x, start_y, &top);
                    const int inherited = cell ? (cell[1] << 16) | (cell[2] << 8) | cell[3] : 0xffffff;
                    for (int palette : rule.help_target_palettes)
                        colors.push_back(palette < 0 ? inherited :
                            (gps_->uccolor[palette][0] << 16) |
                            (gps_->uccolor[palette][1] << 8) | gps_->uccolor[palette][2]);
                }
                // The shared fitter commits suppression only after every
                // translated glyph fits. Unused native rows remain owned,
                // without leaving English tails or deleting unknown prose.
                append_setup_paragraph(std::move(best_rows), rule.target, best_right, best_right, colors);
            }
        }
    }
