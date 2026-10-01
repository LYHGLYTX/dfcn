// The native name, its English gloss, profession and current activity form
// one header. Preserve each physical source row (including both native text
// halves); normalization owns duplicate display rows, not source capture.
void Overlay::append_character_header(
        const std::vector<std::string> &header_rows,
        std::vector<std::string> &screen_rows, std::vector<Match> &result,
        int header_tabs_y, int only_y) const {
    if (!gps_) return;
    const auto clipped_captions = captured_clipped_captions();
    const auto base_draws = captured_native_drawn_text_rows();
    const auto top_draws = captured_native_drawn_text_rows(true);
    const std::array<const std::vector<NativeDrawnTextRow> *, 2> header_draws{
        &base_draws, &top_draws};
    const auto read_header_char = [&](int x, int y) {
        return static_cast<unsigned char>(header_rows[y][x]);
    };
    const auto source_row_matches = [&](int x, int source_y, bool top_layer, int y) {
        if (x < 0 || x >= gps_->dimx || source_y < 0 ||
                source_y >= gps_->dimy || y < 0 || y >= gps_->dimy ||
                !native_item_row_layer_at(*gps_, x, source_y, top_layer) ||
                !native_item_row_layer_at(*gps_, x, y, top_layer)) return false;
        if (source_y == y) return true;
        const auto *flags = top_layer ? gps_->screentexpos_top_flag : gps_->screentexpos_flag;
        if (!flags) return false;
        const auto half_at = [&](int row) {
            return flags[static_cast<size_t>(x) * gps_->dimy + row] &
                ((1u << 3) | (1u << 4));
        };
        const auto half = half_at(source_y);
        const int mate = half == (1u << 3) ? source_y + 1
            : half == (1u << 4) ? source_y - 1 : -1;
        return y == mate && half_at(y) ==
            (half == (1u << 3) ? (1u << 4) : (1u << 3));
    };
    const auto claim_field = [&](const LogicalTextField &field, int y,
                                 const std::string &target, int clip_right) {
        if (target.empty() || y < 0 || y >= static_cast<int>(screen_rows.size()) ||
                field.start < 0 || field.end <= field.start ||
                field.end > static_cast<int>(screen_rows[y].size())) return;
        // The complete owner replaces earlier fragments on every source row;
        // only emission is restricted during an individual-row scan.
        std::erase_if(result, [&](const Match &match) {
            return match.y == y && match.x < field.end &&
                field.start < match.x + match.length;
        });
        std::fill(screen_rows[y].begin() + field.start,
            screen_rows[y].begin() + field.end, ' ');
        if (only_y >= 0 && only_y != y) return;
        Match match{field.start, y, field.end - field.start,
            kCharacterHeaderRule, target, field.text};
        match.layout_x = field.start;
        match.layout_length = field.end - field.start;
        match.layout_clip_right = clip_right;
        match.layout_left = true;
        result.push_back(std::move(match));
    };
    const auto activity_field = [&](const NativeDrawnTextRow &draw,
            bool top_layer, int y, std::string &complete)
            -> std::optional<LogicalTextField> {
        if (!draw.caption_source || draw.unit_identity_target || draw.source.empty() ||
                !source_row_matches(draw.x, draw.y, top_layer, y)) return std::nullopt;
        std::string_view visible = draw.source;
        complete = draw.complete_source.empty() ? draw.source : draw.complete_source;
        for (const auto &caption : clipped_captions) {
            if (caption.x != draw.x || caption.y != draw.y) continue;
            if (caption.visible == visible) complete = caption.complete;
            else if (caption.complete == complete) visible = caption.visible;
        }
        if (visible.empty() || visible.size() > static_cast<size_t>(gps_->dimx - draw.x))
            return std::nullopt;
        const int end = draw.x + static_cast<int>(visible.size());
        if (native_button_text_rect(*gps_, draw.x, end, y)) return std::nullopt;
        for (int x = draw.x; x < end; ++x) {
            if (!native_item_row_layer_at(*gps_, x, y, top_layer) ||
                    read_header_char(x, y) !=
                        static_cast<unsigned char>(visible[x - draw.x])) return std::nullopt;
        }
        return LogicalTextField{draw.x, end, std::string(visible)};
    };
    // The sheet formatter already proves the quoted name's role. Its current
    // source column and a complete activity production establish the activity
    // slot even when an identity title leaves no blank before it. A blank still
    // licenses the usual fallback for the next caption, including simple jobs.
    for (size_t name_layer = 0; name_layer < header_draws.size(); ++name_layer) {
        for (const auto &gloss : *header_draws[name_layer]) {
            if (!gloss.unit_identity_header || !gloss.unit_identity_english) continue;
            const auto quoted = character_header_bound_identity_field(*gps_, gloss,
                name_layer != 0, gloss.y, clipped_captions, read_header_char, true);
            if (!quoted || native_button_text_rect(*gps_, quoted->start, quoted->end, gloss.y))
                continue;
            // A formatter-owned quote already proves this field without an
            // enclosing header frame. Use the current source composite here,
            // as classic text need not survive the graphical-occlusion reader
            // used by the earlier generic identity pass. The binding still
            // requires this draw's visible bytes, layer and native quotes.
            const std::string quoted_target = "“" + *gloss.unit_identity_target + "”";
            claim_field(*quoted, gloss.y, quoted_target, quoted->end);
            int name_bottom = gloss.y;
            if (gloss.y + 1 < gps_->dimy) {
                const auto mate = character_header_bound_identity_field(*gps_, gloss,
                    name_layer != 0, gloss.y + 1, clipped_captions, read_header_char, true);
                if (mate) {
                    claim_field(*mate, gloss.y + 1, quoted_target, mate->end);
                    ++name_bottom;
                }
            }
            bool spacer = false;
            for (int y = name_bottom + 1; y < static_cast<int>(header_rows.size()); ++y) {
                if (!character_social_tab_fields(header_rows[y]).empty() ||
                        !character_information_tab_fields(header_rows[y]).empty()) break;
                const auto fields = split_text_fields(header_rows[y]);
                const auto aligned = std::find_if(fields.begin(), fields.end(),
                    [&](const LogicalTextField &field) {
                        return field.start >= quoted->start - 2 &&
                            field.start <= quoted->start + 2;
                    });
                if (aligned == fields.end()) {
                    // Alignment tolerates a small native indent; the spacer
                    // belongs to the name column itself. Sampling to its left
                    // would include the portrait's right border on this row.
                    const int left = quoted->start;
                    const int right = std::min(gps_->dimx, gloss.x + 1);
                    if (std::string_view(header_rows[y]).substr(left, right - left)
                            .find_first_not_of(' ') != std::string_view::npos) break;
                    spacer = true;
                    continue;
                }
                bool claimed = false;
                for (size_t layer = 0; layer < header_draws.size() && !claimed; ++layer) {
                    for (const auto &draw : *header_draws[layer]) {
                        if (draw.x != aligned->start) continue;
                        std::string source;
                        const auto field = activity_field(draw, layer != 0, y, source);
                        if (!field) continue;
                        const auto target = translate_fortress_activity(source, !spacer);
                        if (!target || target->empty()) continue;
                        const auto claim_activity = [&](int row) {
                            std::string physical_source;
                            const auto physical = activity_field(draw, layer != 0, row, physical_source);
                            if (!physical || physical_source != source) return;
                            claim_field(*physical, row, *target, physical->end);
                        };
                        claim_activity(y);
                        if (y + 1 < static_cast<int>(header_rows.size()) &&
                                character_social_tab_fields(header_rows[y + 1]).empty() &&
                                character_information_tab_fields(header_rows[y + 1]).empty())
                            claim_activity(y + 1);
                        claimed = true;
                        break;
                    }
                }
                // Before a separator, an identity title can precede the
                // activity. After it, the first caption still owns the slot.
                if (claimed || spacer) break;
            }
        }
    }

    if (header_tabs_y < 0 ||
        header_tabs_y >= static_cast<int>(header_rows.size())) return;
    const auto tabs = character_information_tab_fields(header_rows[header_tabs_y]);
    if (tabs.empty()) return;
    const auto frame = find_character_header_frame(*gps_,
        tabs.front().start, tabs.back().end, header_tabs_y,
        [&](int x, int y) {
            return static_cast<unsigned char>(header_rows[y][x]);
        });
    if (!frame) return;

    const auto claim = [&](const LogicalTextField &field, int y,
                           const std::string &target) {
        claim_field(field, y, target, frame->right);
    };

    std::vector<std::vector<LogicalTextField>> fields(header_rows.size());
    std::vector<bool> tab_rows(header_rows.size(), false);
    for (int y = frame->top + 1; y < header_tabs_y; ++y) {
        fields[y] = split_text_fields(header_rows[y]);
        tab_rows[y] = !character_social_tab_fields(header_rows[y]).empty() ||
            !character_information_tab_fields(header_rows[y]).empty();
    }
    const auto eligible = [&](const LogicalTextField &field, int y,
                              bool header_overflow = false) {
        if (tab_rows[y] || field.start <= frame->left || field.start >= frame->right ||
            (!header_overflow && field.end > frame->right) ||
            native_button_text_rect(*gps_, field.start, field.end, y)) return false;
        // A partially obscured social band is still a set of controls, not a
        // profession row licensed by a neighbouring identity.
        for (std::string_view caption : {"Relations", "Groups", "Military",
                 "Thoughts", "Personality", "Overview", "Items", "Health",
                 "Skills", "Knowledge", "Rooms", "Labor"})
            if (field.text == caption) return false;
        return true;
    };

    std::vector<std::array<int, 3>> activity_spans;
    const auto activity_claim = [&](const LogicalTextField &field, int y,
                                    const std::string &target) {
        claim(field, y, target);
        activity_spans.push_back({y, field.start, field.end});
    };
    const auto is_activity = [&](const LogicalTextField &field, int y) {
        return std::any_of(activity_spans.begin(), activity_spans.end(),
            [&](const auto &span) {
                return span[0] == y && field.start < span[2] && span[1] < field.end;
            });
    };
    const auto same_source_row = [&](int x, int y, int source_y) {
        bool top = false;
        return cell_at(x, y, &top) && source_row_matches(x, source_y, top, y);
    };
    const auto drawn_source = [&](const LogicalTextField &field, int y)
            -> const NativeDrawnTextRow * {
        bool top = false;
        if (!cell_at(field.start, y, &top)) return nullptr;
        const auto &draws = top ? top_draws : base_draws;
        for (const auto &draw : draws) {
            if (!draw.caption_source || draw.x != field.start || draw.source.empty() ||
                !same_source_row(field.start, y, draw.y) ||
                !field.text.starts_with(draw.source)) continue;
            // The retained draw may survive a frame without addst calls.
            // Require its complete physical source on its actual layer now;
            // identical text in a foreground control is a different owner.
            bool current = true;
            for (size_t offset = 0; offset < draw.source.size(); ++offset) {
                bool cell_top = false;
                const auto *cell = cell_at(field.start + static_cast<int>(offset), y, &cell_top);
                if (!cell || cell_top != top ||
                    cell[0] != static_cast<unsigned char>(draw.source[offset])) {
                    current = false;
                    break;
                }
            }
            if (current) return &draw;
        }
        return nullptr;
    };
    const auto complete_source = [&](const LogicalTextField &field, int y) {
        for (const auto &caption : clipped_captions) {
            if (caption.x != field.start || caption.visible != field.text ||
                !same_source_row(field.start, y, caption.y)) continue;
            return caption.complete;
        }
        if (const auto *draw = drawn_source(field, y);
                draw && draw->source == field.text && !draw->complete_source.empty())
            return draw->complete_source;
        return field.text;
    };
    if (config_.compositional_rules) {
        // A complete activity production proves its own role independently of
        // the name, including a gloss positioned in a different native column.
        for (int y = frame->top + 1; y < header_tabs_y; ++y) {
            for (const auto &field : fields[y]) {
                if (!eligible(field, y)) continue;
                if (const auto *draw = drawn_source(field, y);
                        draw && draw->unit_identity_target) continue;
                const std::string source = complete_source(field, y);
                // Read/Copy and their complete decorated items are resolved
                // by the shared activity entry, outside the TOML callbacks.
                // Require that typed action here, not a generic noun match.
                const auto activity = translate_fortress_activity(source, true);
                if (activity && !activity->empty()) activity_claim(field, y, *activity);
            }
        }
    }

    for (int y = frame->top + 1; y < header_tabs_y; ++y) {
        if (tab_rows[y]) continue;
        const auto &row = header_rows[y];
        LogicalTextField quoted{};
        std::optional<LogicalTextField> native_identity;
        std::optional<std::string> native_target;
        std::optional<std::string> translated;
        uintptr_t bound_owner = 0;
        bool bound_header = false;
        int native_y = -1;
        const auto read_header_char = [&](int x, int row_y) {
            return static_cast<unsigned char>(header_rows[row_y][x]);
        };
        const std::array<const std::vector<NativeDrawnTextRow> *, 2> identity_draws{
            &base_draws, &top_draws};
        for (size_t layer = 0;
                layer < identity_draws.size() && !bound_owner && !bound_header; ++layer) {
            for (const auto &gloss : *identity_draws[layer]) {
                if (!gloss.unit_identity_english) continue;
                const auto gloss_field = character_header_bound_identity_field(*gps_,
                    gloss, layer != 0, y, clipped_captions, read_header_char, true);
                if (!gloss_field || !eligible(*gloss_field, y, true)) continue;
                if (gloss.unit_identity_header) {
                    quoted = *gloss_field;
                    translated = "“" + *gloss.unit_identity_target + "”";
                    bound_header = true;
                }
                for (int above = y - 1; above > frame->top && !bound_owner; --above) {
                    if (tab_rows[above]) continue;
                    for (size_t native_layer = 0;
                            native_layer < identity_draws.size() && !bound_owner; ++native_layer) {
                        for (const auto &native : *identity_draws[native_layer]) {
                            if (native.unit_identity_english ||
                                    native.unit_identity_owner != gloss.unit_identity_owner) continue;
                            const auto field = character_header_bound_identity_field(*gps_,
                                native, native_layer != 0, above, clipped_captions,
                                read_header_char, false);
                            if (!field || !eligible(*field, above, true) ||
                                    is_activity(*field, above)) continue;
                            quoted = *gloss_field;
                            native_identity = *field;
                            native_target = *native.unit_identity_target;
                            translated = "“" + *gloss.unit_identity_target + "”";
                            bound_owner = gloss.unit_identity_owner;
                            native_y = above;
                            break;
                        }
                    }
                }
                if (bound_owner || bound_header) break;
            }
        }
        if (bound_header && !native_identity) {
            // The sheet's semantic name capture is independently sufficient.
            // Retain other existing name/role/activity matches when a clipped
            // or covered companion line cannot currently be paired.
            claim(quoted, y, *translated);
            continue;
        }
        if (!bound_owner) {
            const size_t opening = row.find('"', frame->left + 1);
            if (opening == std::string::npos || opening >= static_cast<size_t>(frame->right))
                continue;
            const size_t closing = row.find('"', opening + 1);
            if (closing == std::string::npos) continue;
            quoted = {static_cast<int>(opening), static_cast<int>(closing + 1),
                row.substr(opening, closing - opening + 1)};
            if (!eligible(quoted, y, true)) continue;
            const std::string body = trim(row.substr(opening + 1, closing - opening - 1));
            const auto prefix = character_header_name_prefix(body);
            if (!prefix) continue;
            for (int above = y - 1; above > frame->top && !native_identity; --above) {
                for (const auto &field : fields[above]) {
                    if (!eligible(field, above) || is_activity(field, above) ||
                        !field.text.starts_with(*prefix)) continue;
                    const auto source = complete_source(field, above);
                    auto target = translate_unit_identity(source, true);
                    if (!target) target = translate_procedural_fragment(source);
                    if (!target) target = translate_legends_name(source, true);
                    native_identity = field;
                    native_target = std::move(target);
                    native_y = above;
                    break;
                }
            }
            if (!native_identity) continue;
            const std::string quoted_source = "\"" + body + "\"";
            translated = memoize_identity_translation('Q', quoted_source, [&] {
                return translate_procedural_fragment(quoted_source, false, true);
            });
        }
        if (translated && !translated->empty()) claim(quoted, y, *translated);
        if (native_target && !native_target->empty())
            claim(*native_identity, native_y, *native_target);
        // The nearest row above the quote can be the bottom half of the name.
        // Preserve its matching top half as another source owner as well.
        for (int above = native_y - 1; above > frame->top; --above) {
            bool repeated = false;
            if (bound_owner) {
                for (size_t layer = 0; layer < identity_draws.size(); ++layer) {
                    for (const auto &native : *identity_draws[layer]) {
                        if (native.unit_identity_english || native.unit_identity_owner != bound_owner)
                            continue;
                        const auto field = character_header_bound_identity_field(*gps_, native,
                            layer != 0, above, clipped_captions, read_header_char, false);
                        if (!field || !eligible(*field, above, true)) continue;
                        claim(*field, above, *native.unit_identity_target);
                        repeated = true;
                    }
                }
                if (!repeated) break;
                continue;
            }
            for (const auto &field : fields[above]) {
                if (field.start != native_identity->start ||
                    field.text != native_identity->text || !eligible(field, above)) continue;
                if (native_target && !native_target->empty()) claim(field, above, *native_target);
                repeated = true;
            }
            if (!repeated) break;
        }

        // Offices and professions belong to the name's column, regardless of
        // the native gloss's alignment. Stop after the first blank below the
        // gloss: that separator starts the activity slot instead.
        for (int detail_y = native_y + 1; detail_y < header_tabs_y; ++detail_y) {
            if (tab_rows[detail_y]) break;
            const auto &detail_row = header_rows[detail_y];
            if (detail_y > y) {
                const auto name_span = std::string_view(detail_row).substr(
                    native_identity->start, native_identity->end - native_identity->start);
                if (name_span.find_first_not_of(' ') == std::string_view::npos) break;
            }
            for (const auto &field : fields[detail_y]) {
                if (field.start < native_identity->start - 2 ||
                    field.start > native_identity->start + 2 || !eligible(field, detail_y) ||
                    is_activity(field, detail_y) || field.text.find('"') != std::string::npos ||
                    field.text == native_identity->text) continue;
                std::optional<std::string> target;
                if (const auto *draw = drawn_source(field, detail_y);
                        draw && draw->unit_identity_target)
                    target = draw->unit_identity_target;
                if (!target)
                    target = translate_unit_profession(complete_source(field, detail_y), true);
                if (!target) target = exact_literal_translation(field.text);
                if (!target) target = translate_creature_label(field.text);
                if (target && !target->empty()) claim(field, detail_y, *target);
            }
        }

        // Simple jobs and !status! wrappers use the existing activity parser.
        // A blank separator or complete typed action at the NAME's position
        // establishes this slot. Both physical halves retain their spans.
        bool activity_spacer = false;
        std::optional<LogicalTextField> captured_activity;
        std::optional<std::string> captured_activity_target;
        for (int activity_y = y + 1; activity_y < header_tabs_y; ++activity_y) {
            if (tab_rows[activity_y]) break;
            const auto &activity_row = header_rows[activity_y];
            std::optional<LogicalTextField> activity_field;
            for (const auto &field : fields[activity_y]) {
                if (field.start < native_identity->start - 2 ||
                    field.start > native_identity->start + 2)
                    continue;
                if (activity_field) { activity_field.reset(); break; }
                activity_field = field;
                // In classic mode a long activity can run directly into map
                // glyphs such as '*' and shaded terrain. Spaces and CP437
                // boxes do not delimit that boundary. The native string draw
                // does: retain exactly its matching source, never the map tail.
                if (const auto *draw = drawn_source(field, activity_y);
                        draw && field.end > frame->right &&
                        draw->source.size() > static_cast<size_t>(frame->right - field.start)) {
                    activity_field->text = draw->source;
                    activity_field->end = field.start + static_cast<int>(draw->source.size());
                }
            }
            if (!activity_field) {
                if (captured_activity) break;
                const auto span = std::string_view(activity_row).substr(
                    native_identity->start, native_identity->end - native_identity->start);
                if (span.find_first_not_of(' ') != std::string_view::npos) break;
                activity_spacer = true;
                continue;
            }
            const auto &field = *activity_field;
            // Keep the complete native activity, just like the quoted name.
            // Its source can cross the frame while claim() clips the Chinese
            // display to the header. A panel-width slice loses book suffixes
            // and leaves generic word translations on top of English glyphs.
            if (!eligible(field, activity_y, true)) {
                if (activity_spacer) break;
                continue;
            }
            if (captured_activity) {
                if (field.start != captured_activity->start || field.text != captured_activity->text)
                    break;
                activity_claim(field, activity_y, *captured_activity_target);
                continue;
            }
            const auto activity = translate_fortress_activity(
                complete_source(field, activity_y), !activity_spacer);
            if (!activity || activity->empty()) {
                if (activity_spacer) break;
                continue;
            }
            activity_claim(field, activity_y, *activity);
            captured_activity = field;
            captured_activity_target = activity;
        }
    }
}
