// Included in find_matches after the shared bounded paragraph fitter.
// World-generation controls belong to both the terrain-progress and chronicle
// phases. Native event snapshots own their actual drawn tokens and select
// grammar by event fields. Missing captures and unsupported semantics retain
// native text; this panel never infers event semantics from English prose.
    // Raw-layer recovery also visits grids retained beneath a later page.
    // Require the native world-generation screen before its old heading can
    // claim rows, suppress glyphs or report missing event captures.
    if (native_history_worldgen_page()) {
        std::vector<std::string> context = screen_rows;
        if (screen_override) {
            for (int y = 0; y < gps_->dimy; ++y)
                for (int x = 0; x < gps_->dimx; ++x) {
                    bool top = false;
                    const auto *cell = cell_at(x, y, &top);
                    context[y][x] = cell && cell[0] ? static_cast<char>(cell[0]) : ' ';
                }
        }
        int heading_y = -1, heading_x = -1;
        int progress_y = -1, progress_x = -1;
        for (int y = 0; y < gps_->dimy; ++y) {
            if (progress_y < 0) {
                const size_t creating = context[y].find("Creating ");
                if (creating != std::string::npos) {
                    progress_y = y;
                    progress_x = static_cast<int>(creating);
                }
            }
            const size_t at = context[y].find("An abridged chronicle (");
            if (at == std::string::npos) continue;
            heading_y = y;
            heading_x = static_cast<int>(at);
            break;
        }
        // Terrain generation has the Creating title but no chronicle yet.
        // Resolve its panel as well, before generic proper-name matching can
        // transliterate a control such as Pause. Prefer the chronicle's own
        // panel once present, so prose retains its original bounded scope.
        const int panel_y = heading_y >= 0 ? heading_y : progress_y;
        const int panel_x = heading_y >= 0 ? heading_x : progress_x;
        if (panel_y >= 0) {
            const NativePanelBorders borders(*gps_);
            const auto panel = native_panel_interior(borders, *gps_,
                panel_x, panel_x + 1, panel_y);
            if (panel) {
                const int left = panel->x, right = panel->x + panel->w;
                int bottom = panel->y + panel->h;
                // Button geometry, not a list of English captions, identifies
                // controls in either phase and bounds the narrative, if any.
                // Pause also names a keyboard key: its UI
                // translation lives in the shared table but is deliberately
                // absent from the global trie. Claim complete native controls
                // here so neither known nor unknown buttons become names.
                const auto settings = native_ui_settings();
                std::set<std::tuple<int, int, int, std::string>> control_drawn;
                for (int y = panel_y + 1; settings && y < panel->y + panel->h; ++y) {
                    int claimed_right = left;
                    for (const auto &field : split_text_fields(screen_rows[y].substr(left, right - left))) {
                        const int x = left + field.start;
                        if (x < claimed_right) continue;
                        const auto button = native_intro_button_text_rect(*gps_, x,
                            left + field.end, y, *settings);
                        if (!button || button->x < left || button->x + button->w > right ||
                            button->y < panel->y || button->y + button->h > panel->y + panel->h)
                            continue;
                        claimed_right = button->x + button->w;
                        bottom = std::min(bottom, button->y);
                        int first = button->x, end = claimed_right;
                        const auto &raw = screen_rows[y];
                        while (first < end && raw[first] == ' ') ++first;
                        while (end > first && raw[end - 1] == ' ') --end;
                        if (first == end || context[y].compare(first, end - first,
                                raw, first, end - first) != 0) continue;
                        const std::string source = raw.substr(first, end - first);
                        const auto target = exact_literal_translation(normalize_utterance(source));
                        Match control{first, y, end - first, kWorldgenControlRule,
                            target.value_or(std::string{}), source};
                        std::fill_n(screen_rows[y].begin() + first, end - first, ' ');
                        if (!target) {
                            control.native_help_source_only = true;
                            control.native_help_review_source = source;
                            untranslated_help_rows.push_back(std::move(control));
                            continue;
                        }
                        control.layout_x = button->x;
                        control.layout_y = button->y + 1;
                        control.layout_length = button->w;
                        control.layout_clip_right = claimed_right;
                        control.layout_left = false;
                        // A split-height native caption may occur on both
                        // rows of the same button. Suppress both source spans
                        // but paint its Chinese caption only once.
                        control.native_split_duplicate = !control_drawn.emplace(
                            button->x, button->y, button->w, normalize_utterance(source)).second;
                        if (only_y < 0 || y == only_y) result.push_back(std::move(control));
                    }
                }
                // The title, stages and summary are rows of this same panel.
                // Compose their existing translations after generic matching
                // so counters and punctuation move with their labels. A single
                // remaining stage must keep the same margin as a longer list.
                const int summary_bottom = heading_y >= 0 ? heading_y + 1 : bottom;
                if (summary_bottom > panel->y)
                    worldgen_summary = capture_panel_text_card(
                        {left, panel->y, right - left, summary_bottom - panel->y});
                // These are complete fields of the live worldgen panel,
                // not arbitrary word runs. Reserve the world identity and
                // age/year before generic literals/templates can translate
                // only their easy words or select an old sample-world gloss.
                // The existing shared parser owns native-name phonetics,
                // English name grammar, dates and rejection counters; layout
                // spaces must not split that semantic record. Keep physical
                // bytes for suppression and for the common row compositor.
                if (worldgen_summary) for (const auto &row : worldgen_summary->rows) {
                    const std::string source = normalize_utterance(row.source);
                    if (!source.starts_with("Creating ") &&
                        source.find(", year ") == std::string::npos) continue;
                    // A complete authored stage such as Creating the world
                    // is an interface literal, never a phonetic world name.
                    auto target = source == "Creating the world"
                        ? exact_literal_translation(source)
                        : translate_procedural_fragment(source);
                    if (!target || target->empty()) continue;
                    // A raw-layer scan may see a different page beneath this
                    // panel. Only claim the current summary's actual bytes.
                    if (screen_rows[row.y].compare(row.x, row.source.size(), row.source) != 0)
                        continue;
                    std::fill_n(screen_rows[row.y].begin() + row.x, row.source.size(), ' ');
                    if (only_y < 0 || row.y == only_y)
                        result.push_back({row.x, row.y, static_cast<int>(row.source.size()),
                            kWorldgenSummaryRule, std::move(*target), row.source});
                }
                // Finalization replaces the historical-figure counters with
                // progress stages, but keeps the same chronicle and controls.
                // Its own heading and panel bounds identify the prose in both
                // phases; transient summary rows must not gate translation.
                if (heading_y >= 0) {
                    // The native draw loop clips independently of the panel
                    // and leaves a blank row below its heading. That blank
                    // row is outside the chronicle viewport: a scrolled-away
                    // prefix may map there without being a missing token.
                    const auto native_rows = native_history_chronicle_row_bounds();
                    const int prose_top = std::max(heading_y + 1,
                        native_rows ? native_rows->first : heading_y + 1);
                    const int prose_bottom = std::min(bottom,
                        native_rows ? native_rows->second : bottom);
                    const auto history = capture_history_viewport(
                        context, left, right, prose_top, prose_bottom, screen_override);
                    const auto &history_rows = history.rows;
                    const auto &history_visible_tokens = history.visible_tokens;
                    const auto &history_viewports = history.viewports;
                    const auto &history_row_gaps = history.gaps;
                    std::vector<Match> paragraph;
                    std::shared_ptr<const NativeHistoryDocument> history_document;
                    std::string source;
                    int next_y = -1;
                    auto finish = [&]() {
                        if (paragraph.empty()) return;
                        if (next_y < 0) next_y = paragraph.front().y;
                        std::optional<std::vector<LegendsTextPiece>> pieces;
                        std::string gap = "event-capture-missing";
                        size_t visible_begin = 0, visible_end = 0;
                        std::optional<NativeParagraphViewport> viewport;
                        if (history_document) {
                            viewport = history_viewports.at(history_document->sequence);
                            if (viewport->first_line > 0) {
                                // The user wants a scrolled-away event's tail
                                // hidden. Its native record and token ownership
                                // identify every remaining row without reading
                                // the English fragment as an event sentence.
                                for (Match &row : paragraph) {
                                    std::fill_n(screen_rows[row.y].begin() + row.x, row.length, ' ');
                                    row.target.clear();
                                    if (only_y < 0 || row.y == only_y)
                                        result.push_back(std::move(row));
                                }
                                paragraph.clear();
                                source.clear();
                                history_document.reset();
                                return;
                            }
                            pieces = translate_history_event(*history_document);
                            gap = "event-semantics-unsupported";
                            std::tie(visible_begin, visible_end) =
                                history_visible_tokens.at(history_document->sequence);
                            // The complete semantic record is laid out once
                            // as a document. The native box's row coordinates
                            // select its visible range, without matching any
                            // English words or guessing clause boundaries.
                        } else for (const auto &row : paragraph) {
                            const auto found = history_row_gaps.find(row.y);
                            if (found != history_row_gaps.end()) { gap = found->second; break; }
                        }
                        std::string target;
                        std::vector<int> colors;
                        if (pieces) {
                            gap = "translated-event-does-not-fit";
                            for (const auto &piece : *pieces) {
                                std::vector<uint32_t> cps;
                                if (!decode_utf8(piece.target, cps)) {
                                    target.clear();
                                    gap = "invalid-translated-event-encoding";
                                    break;
                                }
                                target += piece.target;
                                colors.insert(colors.end(), cps.size(), piece.foreground_rgb);
                            }
                            if (target.empty() && gap == "translated-event-does-not-fit")
                                gap = "visible-event-translation-empty";
                        }
                        // Own and suppress EVERY source row only after the
                        // complete record translates and fits. Unknown events
                        // remain intact and enter the existing review queue.
                        std::vector<Match> fitted;
                        if (target.empty() || !append_bounded_paragraph(
                                paragraph, target, screen_rows, fitted, -1,
                                right, right, colors, false, left, viewport)) {
                            // Unknown records retain native glyphs and their
                            // original rows. Do not move later Chinese text
                            // into that occupied region.
                            next_y = paragraph.back().y + 1;
                            paragraph.front().native_help_review_source = source;
                            std::string diagnostic = "Native chronicle retained original: " + gap;
                            if (history_document)
                                diagnostic += "; id=" + std::to_string(history_document->event.id) +
                                    "; native_type=" + std::to_string(history_document->event.native_type) +
                                    "; kind=" + std::to_string(static_cast<int>(history_document->event.kind)) +
                                    "; visible_tokens=" + std::to_string(visible_begin) +
                                    ".." + std::to_string(visible_end);
                            else diagnostic += "; native_draws=" + std::to_string(history.draw_count) +
                                "; matched_records=" + std::to_string(history.record_count) + "; source=" + source;
                            static std::mutex history_gap_mutex;
                            static std::unordered_set<std::string> history_reported_gaps;
                            {
                                std::lock_guard<std::mutex> lock(history_gap_mutex);
                                if (history_reported_gaps.size() >= 512) history_reported_gaps.clear();
                                if (history_reported_gaps.insert(diagnostic).second) log_line("INFO", diagnostic);
                            }
                            for (Match &row : paragraph) {
                                row.native_help_source_only = true;
                                std::fill_n(screen_rows[row.y].begin() + row.x, row.length, ' ');
                                untranslated_help_rows.push_back(std::move(row));
                            }
                        } else {
                            // The fitter has measured ALL rows even during a
                            // one-row suppression scan. Only display positions
                            // move: every native English wrap remains owned by
                            // its original x/y/length, including empty tails.
                            for (Match &row : fitted) {
                                if (!row.target.empty()) {
                                    row.layout_y = next_y;
                                    row.layout_pixel_y = 0;
                                    next_y += (std::max(gps_->tile_pixel_y,
                                        row.layout_line_height_pixels) + gps_->tile_pixel_y - 1) /
                                        gps_->tile_pixel_y;
                                    row.layout_fixed_baseline = true;
                                }
                                if (only_y < 0 || row.y == only_y)
                                    result.push_back(std::move(row));
                            }
                        }
                        paragraph.clear();
                        source.clear();
                        history_document.reset();
                    };
                    for (int y = prose_top; y < prose_bottom; ++y) {
                        const auto &row = screen_rows[y];
                        const auto native_row = history_rows.find(y);
                        const std::shared_ptr<const NativeHistoryDocument> native_document =
                            native_row == history_rows.end() ? nullptr : native_row->second;
                        int first = left, end = right;
                        while (first < end && row[first] == ' ') ++first;
                        while (end > first && row[end - 1] == ' ') --end;
                        if (first == end && !native_document) {
                            finish();
                            if (next_y >= 0) ++next_y;
                            continue;
                        }
                        if (first == end) { first = left; end = right; }
                        const std::string part = row.substr(first, end - first);
                        if (!paragraph.empty() && history_document != native_document &&
                            (history_document || native_document)) finish();
                        if (part == "Events:") {
                            finish();
                            next_y = y + 1;
                            continue;
                        }
                        if (paragraph.empty()) {
                            // Record boundaries come from token ownership.
                            // Uncaptured consecutive rows stay one untouched
                            // native block, including a clipped first record.
                            history_document = native_document;
                        }
                        // An event may have several sentences. A period at a
                        // line break is not its end; all its owned rows stay
                        // together without interpreting English boundaries.
                        paragraph.push_back({first, y, end - first,
                            kWorldgenChronicleRule, {}, part});
                        if (!source.empty()) source += ' ';
                        source += part;
                    }
                    finish();
                }
            }
        }
    }
