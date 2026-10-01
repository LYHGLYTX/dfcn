// Complete item designations are shared by inventory rows and their actions.
// Counts, quality/ownership marks, creature materials and minted identities
// retain the same grammar when embedded inside an action sentence.
std::optional<std::string> Overlay::translate_inventory_item_name(
        std::string_view source, int y, int x) const {
    source = trim_view(source);
    if (source.empty()) return std::nullopt;
    // The native item describer chooses an article for ordinary items and
    // omits it for named objects. It belongs to the surrounding grammar.
    for (std::string_view article : {"the ", "an ", "a "}) {
        if (!source.starts_with(article)) continue;
        source = trim_view(source.substr(article.size()));
        break;
    }
    if (source.empty()) return std::nullopt;
    auto complete = [](const std::optional<std::string> &target) {
        return target && !target->empty() &&
            target->find("[C:") == std::string::npos &&
            std::none_of(target->begin(), target->end(), [](unsigned char ch) {
                return (ch >= 'a' && ch <= 'z') ||
                    (ch >= 'A' && ch <= 'Z') || ch == '\n' || ch == '\r';
            });
    };
    if (auto target = translate_coin_item_name(source); complete(target)) return target;
    if (const auto suffix = item_number_suffix(source); !suffix.empty()) {
        const auto target = translate_inventory_item_name(
            source.substr(0, source.size() - suffix.size()), y, x);
        if (target) return *target + std::string(suffix);
        return std::nullopt;
    }
    const ItemDesignationText designation = split_item_designation(source);
    if (!designation.prefix.empty() || !designation.suffix.empty()) {
        const auto target = translate_inventory_item_name(designation.item, y, x);
        if (target) return designation.prefix + *target + designation.suffix;
        return std::nullopt;
    }
    if (auto target = translate_item_caption_grammar(source)) return target;
    if (auto target = translate_arena_equipment_source_phrase(source); complete(target))
        return target;
    if (auto target = translate_embark_equipment_item(source, y, x, source); complete(target))
        return target;
    if (auto target = exact_literal_translation(source); complete(target)) return target;
    // A typed depicted subject can retain an authored nickname. Preserve its
    // complete-name proof here without admitting English in generic fallbacks.
    if (auto target = translate_item_description_term(source);
            translation_complete_with_native_nicknames(target, source) &&
            target->find("[C:") == std::string::npos &&
            target->find_first_of("\r\n") == std::string::npos) return target;
    if (auto target = translate_written_item_caption(source); complete(target)) return target;
    if (auto target = translate_procedural_fragment(std::string(source), false, false, {},
            ProceduralFragmentContext::native_item_name); complete(target)) return target;
    if (auto target = translate_compositional(std::string(source)); complete(target)) return target;
    return std::nullopt;
}

// Location labels can wrap a body part, or name a containing item. Resolve
// the complete body part through the shared anatomy grammar before composing
// the wrapper; its Chinese wording belongs to the existing translation table.
std::optional<std::string> Overlay::translate_inventory_location(
        std::string_view source, int y, int x) const {
    source = trim_view(source);
    const std::string folded = lower(std::string(source));
    constexpr std::pair<std::string_view, std::string_view> anatomy_wrappers[] = {
        {"strapped to ", "Inventory location: Strapped to"},
        {"sewn into ", "Inventory location: Sewn into"},
    };
    for (const auto &[wrapper, key] : anatomy_wrappers) {
        if (!folded.starts_with(wrapper)) continue;
        const auto part = translate_legends_anatomy(source.substr(wrapper.size()));
        const auto prefix = exact_literal_translation(key);
        if (!part || !prefix) return std::nullopt;
        return *prefix + *part;
    }
    constexpr std::string_view inside = "in ";
    if (folded.starts_with(inside)) {
        // Piercings use a complete location such as `In Left ear`. Only
        // accept a known body part here; containers keep the item-name path.
        if (const auto part = translate_legends_anatomy(source.substr(inside.size()))) {
            // Preserve established complete labels, including `In Mouth`.
            if (auto target = exact_literal_translation(source)) return target;
            auto target = exact_literal_translation("Inventory location: In {s}");
            if (!target) return std::nullopt;
            const size_t at = target->find("{s}");
            if (at == std::string::npos) return std::nullopt;
            target->replace(at, 3, *part);
            return target;
        }
    }
    // Bare wearer/contaminant locations have the same anatomical meaning as
    // `In ...`, `Strapped to ...` and `Sewn into ...`. Do not send `right eye`
    // through the item segmenter, where a procedural name sense of `right`
    // can win instead.
    if (const auto part = translate_legends_anatomy(source)) return part;
    return translate_inventory_item_name(source, y, x);
}

// Both the item modal and the map context chooser use these complete action
// constructors. Keep item designations and directions typed in both places,
// including native search candidates that have no screen coordinates.
std::optional<std::string> Overlay::translate_adventure_item_action(
        const std::string &source, int y, int x) const {
    for (const Rule &rule : adventure_item_action_rules_) {
        if (rule.template_kinds.empty()) {
            if (rule.source == source) return rule.target;
            continue;
        }
        if (!source.starts_with(rule.template_literals.front())) continue;
        std::vector<std::string> captures;
        std::vector<std::optional<std::string>> resolved;
        // Typed, complete captures disambiguate separators inside an
        // item's own name. For example, Fill has two full item/material
        // fields, while Eat's parenthesis is an item, not a direction.
        auto parse = [&](auto &&self, size_t slot, size_t at) -> bool {
            if (slot == rule.template_kinds.size()) return at == source.size();
            const auto &literal = rule.template_literals[slot + 1];
            size_t end = literal.empty() ? source.size() : source.find(literal, at + 1);
            for (; end != std::string::npos; end = literal.empty()
                     ? std::string::npos : source.find(literal, end + 1)) {
                if (end <= at) continue;
                const std::string value = source.substr(at, end - at);
                std::optional<std::string> target;
                const char kind = rule.template_kinds[slot];
                if (kind == 'n') target = translate_ui_message_capture(value, true);
                else if (kind == 'p') {
                    const size_t slash = value.find('/');
                    const auto horizontal = std::string_view(value).substr(0, slash);
                    constexpr std::string_view directions[] = {"Here", "Above", "Below",
                        "North", "South", "East", "West", "NW", "NE", "SW", "SE"};
                    const bool direction = std::find(std::begin(directions), std::end(directions),
                        horizontal) != std::end(directions);
                    if (direction && (slash == std::string::npos ||
                        value.substr(slash + 1) == "Above" || value.substr(slash + 1) == "Below"))
                        target = translate_ui_message_capture(value, false);
                } else if (kind == 's') {
                    target = translate_inventory_item_name(value, y, x);
                    if (!target) target = translate_ui_message_capture(value, false);
                }
                if (!target || target->empty()) continue;
                captures.push_back(value);
                resolved.push_back(std::move(target));
                if (self(self, slot + 1, end + literal.size())) return true;
                captures.pop_back();
                resolved.pop_back();
            }
            return false;
        };
        if (parse(parse, 0, rule.template_literals.front().size()))
            return fill_template(rule, captures, &capture_translations_, nullptr, &resolved);
    }
    return std::nullopt;
}

// Item selection and action modals share colored keyboard fields and omit
// the inventory's right-hand view buttons. Their titles establish whether
// each complete caption is an item designation or an action sentence, before
// dictionary matching can split its material and noun into unrelated labels.
std::vector<Match> Overlay::capture_adventure_item_modal(
        const std::vector<std::string> &rows) const {
    std::vector<Match> matches;
    constexpr std::string_view action_heading = "What will you do with ";
    constexpr std::string_view item_headings[] = {
        "What do you want to place?", "What do you want to remove?",
        "What do you want to throw?", "What do you want to eat or drink?",
        "What do you want to wear?", "What do you want to drop?",
        "With what do you want to interact?",
    };
    std::string_view heading;
    bool item_choices = false;
    auto collapse = [](std::string_view source) {
        std::string result;
        bool gap = false;
        for (char ch : source) {
            if (ch == ' ') { gap = !result.empty(); continue; }
            if (gap) result.push_back(' ');
            result.push_back(ch);
            gap = false;
        }
        return result;
    };
    int title_y = -1, title_x = -1;
    std::optional<AsciiPanelFrame> frame;
    const NativePanelBorders borders(*gps_, true);
    for (int y = 0; y < gps_->dimy && !frame; ++y) {
        heading = action_heading;
        size_t at = rows[y].find(heading);
        item_choices = false;
        if (at == std::string::npos) {
            for (const auto candidate : item_headings) {
                at = rows[y].find(candidate);
                if (at == std::string::npos) continue;
                heading = candidate;
                item_choices = true;
                break;
            }
        }
        if (at == std::string::npos) continue;
        const int x = static_cast<int>(at);
        // Done has its own vertical sides on the title row. Only a complete
        // enclosing panel can establish the modal's bounds; the nearest
        // side may belong to that button instead of the outer frame.
        if (const auto panel = native_panel_interior(
                borders, *gps_, x, x + static_cast<int>(heading.size()), y))
            frame = AsciiPanelFrame{panel->x - 1, panel->y - 1,
                panel->x + panel->w, panel->y + panel->h};
        if (!frame) frame = find_graphical_character_panel_frame(
            *gps_, x, x + static_cast<int>(heading.size()), y);
        if (!frame) frame = find_ascii_panel_frame(
            x, x + static_cast<int>(heading.size()), y, gps_->dimx, gps_->dimy,
            [&](int cx, int cy) { return static_cast<unsigned char>(rows[cy][cx]); });
        if (frame) { title_y = y; title_x = x; }
    }
    if (!frame) return matches;
    const auto captures = captured_clipped_captions();
    auto paired_row = [&](int left, int end, int y) {
        constexpr uint32_t top_half = 1u << 3, bottom_half = 1u << 4;
        auto half_at = [&](int x, int cy) {
            bool top = false;
            const auto *cell = cell_at(x, cy, &top);
            const auto *flags = top ? gps_->screentexpos_top_flag : gps_->screentexpos_flag;
            if (!cell || !flags || cell[0] != static_cast<unsigned char>(rows[cy][x]))
                return uint32_t{0};
            return flags[static_cast<size_t>(x) * gps_->dimy + cy] & (top_half | bottom_half);
        };
        const auto half = half_at(left, y);
        if (half != top_half && half != bottom_half) return -1;
        const int other = y + (half == top_half ? 1 : -1);
        if (other < title_y || other >= frame->bottom ||
            rows[y].compare(left, end - left, rows[other], left, end - left) != 0) return -1;
        for (int x = left; x < end; ++x) {
            if (rows[y][x] == ' ') continue;
            if (half_at(x, y) != half || half_at(x, other) !=
                    (half == top_half ? bottom_half : top_half)) return -1;
        }
        return other;
    };
    auto recover = [&](int left, int end, int y, int minimum_x) {
        const std::string visible = rows[y].substr(left, end - left);
        std::string result = visible;
        const int other = paired_row(left, end, y);
        // A native clipping capture can cover the full action or only its
        // item field. Restore exact, current visible substrings from right to
        // left; never infer a missing suffix from the visible prefix alone.
        std::vector<NativeClippedCaption> fields;
        for (const auto &captured : captures) {
            if ((captured.y != y && captured.y != other) ||
                captured.x < minimum_x || captured.x >= end ||
                captured.visible.empty() ||
                captured.visible.size() > static_cast<size_t>(end - captured.x) ||
                rows[y].compare(captured.x,
                    captured.visible.size(), captured.visible) != 0) continue;
            auto capture = captured;
            if (capture.x < left) {
                // Some widgets capture the shortcut and name together.
                // Strip only the byte-matched prefix before the proven name
                // field; an a/an inside that field remains item grammar.
                const size_t prefix = static_cast<size_t>(left - capture.x);
                if (capture.visible.size() <= prefix || capture.complete.size() <= prefix ||
                    capture.complete.compare(0, prefix, capture.visible, 0, prefix) != 0)
                    continue;
                capture.visible.erase(0, prefix);
                capture.complete.erase(0, prefix);
                capture.x = left;
            }
            fields.push_back(std::move(capture));
        }
        // A complete sentence capture also knows punctuation or suffixes
        // clipped after the item. Prefer it to an overlapping item-only
        // capture so recovering the shorter field cannot lose that tail.
        std::optional<std::string> whole;
        bool ambiguous_whole = false;
        for (const auto &field : fields) {
            if (field.x != left || field.visible.size() != visible.size()) continue;
            if (whole && *whole != field.complete) ambiguous_whole = true;
            whole = field.complete;
        }
        if (whole && !ambiguous_whole) return collapse(*whole);
        std::sort(fields.begin(), fields.end(), [](const auto &a, const auto &b) {
            return a.x > b.x;
        });
        int boundary = end;
        for (const auto &field : fields) {
            if (field.x + static_cast<int>(field.visible.size()) > boundary) continue;
            const bool ambiguous = std::any_of(fields.begin(), fields.end(), [&](const auto &other) {
                return other.x == field.x && other.visible == field.visible &&
                    other.complete != field.complete;
            });
            if (ambiguous) continue;
            result.replace(field.x - left, field.visible.size(), field.complete);
            boundary = field.x;
        }
        return collapse(result);
    };
    auto append = [&](int left, int end, int right, int y, int minimum_x) {
        const auto complete = recover(left, end, y, minimum_x);
        auto target = item_choices
            ? translate_inventory_item_name(complete, y, left)
            : translate_adventure_item_action(complete, y, left);
        const bool translated = target.has_value();
        if (!target) {
            if (!item_choices) return;
            // The proven item field still owns an unknown designation. Keep
            // it whole, as inventory rows do, instead of partially replacing
            // its creature/material words at their separate English positions.
            target = native_text_to_utf8(complete);
        }
        Match match{left, y, end - left,
            item_choices ? kCharacterInventoryItemRule : kAdventureItemActionRule,
            *target, rows[y].substr(left, end - left)};
        match.native_hover_untranslated = !translated;
        match.layout_x = left;
        match.layout_length = right - left;
        match.layout_clip_right = right;
        match.layout_left = true;
        matches.push_back(std::move(match));
    };
    for (int y = title_y; y < frame->bottom; ++y) {
        const auto &row = rows[y];
        if (row.compare(title_x, heading.size(), heading) == 0) {
            // Selection prompts already have complete UI-message rules.
            if (item_choices) continue;
            int right = frame->right;
            // A named item can itself contain Done. Only its independently
            // framed native button owns the title's right-hand boundary.
            for (size_t done = row.find("Done", title_x + heading.size());
                 done != std::string::npos && static_cast<int>(done) < right;
                 done = row.find("Done", done + 4)) {
                const auto button = native_button_text_span(*gps_,
                    static_cast<int>(done), static_cast<int>(done) + 4, y);
                if (button) right = std::max(title_x, button->first - 1);
            }
            int end = right;
            while (end > title_x && row[end - 1] == ' ') --end;
            if (end > title_x) append(title_x, end, right, y, title_x);
            continue;
        }
        // Bind to the native shortcut's color and position. A material word
        // or article can never be discarded as if it were the shortcut.
        for (int key = frame->left + 1; key + 2 < frame->right; ++key) {
            const unsigned char ch = row[key];
            if (!((ch >= 'a' && ch <= 'z') || (ch >= 'A' && ch <= 'Z')) ||
                row[key + 1] != ' ' || (key > frame->left + 1 && row[key - 1] != ' ')) continue;
            int left = key + 2;
            while (left < frame->right && row[left] == ' ') ++left;
            if (left >= frame->right) continue;
            bool key_top = false, text_top = false;
            const auto *key_cell = cell_at(key, y, &key_top);
            const auto *text_cell = cell_at(left, y, &text_top);
            if (!key_cell || !text_cell || key_cell[0] != ch ||
                text_cell[0] != static_cast<unsigned char>(row[left]) ||
                (key_cell[1] == text_cell[1] && key_cell[2] == text_cell[2] &&
                 key_cell[3] == text_cell[3])) continue;
            // Picture-backed actions have a separate caption rectangle.
            // Its classic right cap is a real grid byte, so reading to the
            // outer modal edge would append a border to the item name and
            // reject the complete action grammar.
            int right = frame->right;
            auto caption = native_button_text_span(*gps_, key, left + 1, y);
            if (!caption) {
                if (const auto picture = native_picture_caption_rect(*gps_, key, y);
                        picture && picture->x <= key &&
                        picture->x + picture->w > left)
                    caption = {{picture->x, picture->x + picture->w}};
            }
            const bool bounded_caption = caption &&
                caption->first > frame->left && caption->first <= key &&
                caption->second > left && caption->second <= frame->right;
            // A selection name belongs to its native button, not to every
            // single-letter token below a prompt or to the enclosing panel.
            if (item_choices && !bounded_caption) continue;
            if (bounded_caption)
                right = caption->second;
            int end = right;
            while (end > left && row[end - 1] == ' ') --end;
            if (end > left) append(left, end, right, y, item_choices ? key : left);
            break;
        }
    }
    return matches;
}

// Character and adventure inventories share picture/action-bounded records.
// The second line can name a body part or a containing item; adventure rows
// also have a separately colored keyboard shortcut before the complete name.
std::vector<Match> Overlay::capture_inventory_rows(
        const std::vector<std::string> &rows,
        const std::vector<std::string> &context_rows, int tabs_y) const {
    std::vector<Match> matches;
    std::optional<AsciiPanelFrame> frame;
    bool shortcuts = false;
    bool uniform = false;
    // The classic scrollbar is flush with the right panel edge. Its final
    // CP437 block (0xdb) and the vertical edge (0xb3) form valid UTF-8 bytes,
    // so the generic text-boundary reader rejects this otherwise closed
    // window. This typed inventory uses the current border skin and palette,
    // as the shared item-list viewport does, without reinterpreting artwork.
    const NativePanelBorders borders(*gps_, true);
    const auto inventory_frame = [&](int first, int last, int y)
            -> std::optional<AsciiPanelFrame> {
        // Header action buttons also have vertical edges in classic mode.
        // Try complete enclosing frames, rather than allowing the nearest
        // toolbar button to reject the whole inventory panel.
        if (const auto panel = native_panel_interior(borders, *gps_, first, last, y))
            return AsciiPanelFrame{panel->x - 1, panel->y - 1,
                panel->x + panel->w, panel->y + panel->h};
        return std::nullopt;
    };
    // This modal has no character tabs. Require both native header fields
    // and their enclosing frame before sharing the item-record compositor.
    for (int y = 0; y < gps_->dimy && !frame; ++y) {
        const auto &row = context_rows[y];
        const size_t title = row.find("Your inventory");
        if (title == std::string::npos) continue;
        const size_t burden = row.find("Burden:", title + 14);
        if (burden == std::string::npos) continue;
        const int first = static_cast<int>(title);
        const int last = static_cast<int>(burden) + 7;
        frame = inventory_frame(first, last, y);
        if (!frame) frame = find_ascii_panel_frame(first, last, y,
            gps_->dimx, gps_->dimy, [&](int x, int row_y) {
                return static_cast<unsigned char>(context_rows[row_y][x]);
            });
        if (frame) {
            tabs_y = y;
            shortcuts = true;
        }
    }
    if (!frame) {
        if (tabs_y < 0 || tabs_y >= gps_->dimy) return matches;
        const auto tabs = character_information_tab_fields(context_rows[tabs_y]);
        if (tabs.empty()) return matches;

        // Items and Military -> Uniform share complete item/location records.
        // Uniform has no Inspect action; its selected subtab and closed
        // picture/caption frame must establish ownership instead.
        uniform = character_social_tab_selected(tabs_y, "Military");
        if (!uniform) {
            std::optional<uint32_t> selected, inactive;
            for (const auto &tab : tabs) {
                bool top = false;
                const auto *cell = cell_at(tab.start, tabs_y, &top);
                if (!cell || cell[0] != static_cast<unsigned char>(tab.text.front()))
                    return matches;
                const uint32_t color = (uint32_t(cell[1]) << 16) |
                    (uint32_t(cell[2]) << 8) | cell[3];
                if (tab.text == "Items") selected = color;
                else if (!inactive) inactive = color;
                else if (*inactive != color) return matches;
            }
            if (!selected || !inactive || *selected == *inactive) return matches;
        }
        frame = inventory_frame(tabs.front().start, tabs.back().end, tabs_y);
        // A long quoted identity can overwrite the outer edge ABOVE the
        // tabs. The list still has two continuous sides and a complete bottom;
        // read that content frame with the same classic skin/scrollbar policy.
        if (!frame) frame = find_graphical_character_panel_frame(
            *gps_, tabs.front().start, tabs.back().end, tabs_y, true);
        if (!frame) frame = find_ascii_panel_frame(
            tabs.front().start, tabs.back().end, tabs_y, gps_->dimx, gps_->dimy,
            [&](int x, int y) {
                return static_cast<unsigned char>(context_rows[y][x]);
            });
    }
    if (!frame) return matches;

    if (uniform) {
        const auto half_at = [&](int x, int y) {
            bool top = false;
            (void)cell_at(x, y, &top);
            const auto *flags = top ? gps_->screentexpos_top_flag : gps_->screentexpos_flag;
            return flags ? flags[static_cast<size_t>(x) * gps_->dimy + y]
                & ((1u << 3) | (1u << 4)) : 0u;
        };
        int content_top = tabs_y + 1;
        for (const auto &tab : character_information_tab_fields(context_rows[tabs_y]))
            if (half_at(tab.start, tabs_y) == (1u << 3)) content_top = tabs_y + 2;
        int body_top = -1;
        for (int y = content_top; y < frame->bottom; ++y) {
            const auto &row = context_rows[y];
            const auto body = std::string_view(row).substr(
                frame->left + 1, frame->right - frame->left - 1);
            if (std::none_of(body.begin(), body.end(), [](unsigned char ch) {
                    return (ch >= 'A' && ch <= 'Z') || (ch >= 'a' && ch <= 'z');
                })) continue;
            std::array<int, 3> colors{};
            size_t cursor = frame->left + 1, index = 0;
            int next_y = y + 1;
            bool valid = true;
            for (std::string_view caption : {"Squad", "Uniform", "Kills"}) {
                const size_t at = row.find(caption, cursor);
                if (at == std::string::npos || at + caption.size() >
                        static_cast<size_t>(frame->right) ||
                    !(has_word_boundaries(row, at, at + caption.size()) ||
                      is_ascii_tab_caption(row, at, at + caption.size()))) {
                    valid = false;
                    break;
                }
                bool top = false;
                const auto *cell = cell_at(static_cast<int>(at), y, &top);
                if (!cell || cell[0] != caption.front() ||
                    half_at(static_cast<int>(at), y) == (1u << 4)) {
                    valid = false;
                    break;
                }
                colors[index++] = (cell[1] << 16) | (cell[2] << 8) | cell[3];
                if (half_at(static_cast<int>(at), y) == (1u << 3)) next_y = y + 2;
                cursor = at + caption.size();
            }
            // The first text band is the subtab row, including in half-font
            // mode. Merely finding these words later in the body is insufficient.
            if (valid && colors[0] == colors[2] && colors[1] != colors[0])
                body_top = next_y;
            break;
        }
        if (body_top < 0) return matches;
        tabs_y = body_top - 1;
    }

    const auto settings = native_ui_settings();
    const bool classic = settings && settings->classic;
    const auto captures = captured_clipped_captions();
    auto collapse_spaces = [](std::string_view text) {
        std::string result;
        bool space = false;
        for (char ch : text) {
            if (ch == ' ') { space = !result.empty(); continue; }
            if (space) result.push_back(' ');
            result.push_back(ch);
            space = false;
        }
        return result;
    };
    auto paired_text_row = [&](int left, int end, int row_y) {
        constexpr uint32_t top_half = 1u << 3;
        constexpr uint32_t bottom_half = 1u << 4;
        constexpr uint32_t half_mask = top_half | bottom_half;
        auto half_at = [&](int x, int y) {
            bool top = false;
            const auto *cell = cell_at(x, y, &top);
            const auto *flags = top ? gps_->screentexpos_top_flag : gps_->screentexpos_flag;
            if (!cell || !flags || cell[0] !=
                    static_cast<unsigned char>(context_rows[y][x])) return uint32_t{0};
            return flags[static_cast<size_t>(x) * gps_->dimy + y] & half_mask;
        };
        const uint32_t half = half_at(left, row_y);
        if (half != top_half && half != bottom_half) return -1;
        const int other = row_y + (half == top_half ? 1 : -1);
        if (other <= tabs_y || other >= frame->bottom ||
            context_rows[row_y].compare(left, end - left,
                context_rows[other], left, end - left) != 0) return -1;
        const uint32_t opposite = half == top_half ? bottom_half : top_half;
        for (int x = left; x < end; ++x) {
            if (context_rows[row_y][x] == ' ') continue;
            if (half_at(x, row_y) != half || half_at(x, other) != opposite) return -1;
        }
        return other;
    };
    auto recover_caption = [&](int left, int end, int row_y, int minimum_x) {
        const std::string joined = collapse_spaces(
            std::string_view(rows[row_y]).substr(left, end - left));
        const int paired = paired_text_row(left, end, row_y);
        std::optional<std::string> captured;
        for (const auto &capture : captures) {
            // Both verified halves own the same complete caption. Only
            // current, byte-matched captures may restore a clipped tail.
            if ((capture.y != row_y && capture.y != paired) ||
                capture.x < minimum_x || capture.x > left ||
                collapse_spaces(capture.visible) != joined) continue;
            if (captured && *captured != capture.complete) return joined;
            captured = capture.complete;
        }
        return captured ? *captured : joined;
    };
    auto action_at = [&](int x, int y) {
        // Unit sheets place assignment markers before Inspect. Their C/S/
        // tool/symbol cells are controls, never part of the item designation.
        // Read the whole current skin in both display modes, not its letter.
        return shortcuts ? native_item_action_at(*gps_, x, y)
            : native_inventory_action_at(*gps_, x, y);
    };
    for (int y = tabs_y + 1; y < frame->bottom; ++y) {
        for (int picture = frame->left + 1; picture < frame->right; ++picture) {
            const int picture_right = native_picture_box_right(*gps_, picture, y);
            if (picture_right <= picture || picture_right >= frame->right) continue;
            int controls = -1;
            std::optional<std::pair<int, int>> caption_button;
            // Joined picture/text buttons have no separate left cap. A
            // location can also replace part of their lower edge, making
            // the ordinary closed picture-box reader unsuitable for text.
            std::optional<SDL_Rect> caption_box;
            for (int x = picture_right; x <= picture_right + 1 && !caption_box; ++x) {
                const auto box = native_picture_caption_rect(
                    *gps_, x, y, false, nullptr, true, nullptr, true,
                    false, -1, !shortcuts);
                if (box && box->x >= picture_right && box->x + box->w < frame->right)
                    caption_box = box;
            }
            if (caption_box)
                caption_button = {{caption_box->x, caption_box->x + caption_box->w}};
            if (uniform) {
                if (!caption_box) continue;
                controls = caption_box->x + caption_box->w;
            }
            for (int x = picture_right; controls < 0 && x < frame->right; ++x) {
                // Inspect can be drawn on the primary layer OVER the end of
                // the lower caption rectangle. Read actions before skipping
                // caption cells, and visit each cell in that rectangle so
                // its background cannot hide the record's own action strip.
                if (action_at(x, y)) {
                    controls = x - 1;
                    break;
                }
                if (caption_button && x >= caption_button->first &&
                    x < caption_button->second) continue;
                const int edge = native_picture_box_right(*gps_, x, y);
                if (edge <= x) continue;
                // A compact action can share a picture's frame. Recognize
                // its centre before treating the left cap as another item.
                if (edge == x + 3 && action_at(x + 1, y)) {
                    controls = x;
                    break;
                }
                // Classic picture and caption rectangles use the same skin.
                // Only the adjoining text box belongs to this picture band.
                if (!classic || caption_button || edge > frame->right) break;
                bool adjoining = true;
                for (int gap = picture_right; gap < x; ++gap)
                    if (rows[y][gap] != ' ') adjoining = false;
                if (!adjoining) break;
                caption_button = {{x + 1, edge - 1}};
            }
            if (controls <= picture_right) continue;
            const size_t record_begin = matches.size();
            // Read the whole picture band. Native full-height captions may
            // occupy two rows; source bytes stay intact for half-text merging.
            for (int row_y = std::max(tabs_y + 1, y - 1);
                 row_y <= std::min(frame->bottom - 1, y + 1); ++row_y) {
                const std::string &row = rows[row_y];
                const int field_left = caption_button ? caption_button->first : picture_right;
                const int field_right = caption_button
                    ? std::min(caption_button->second, controls) : controls;
                if (field_right <= field_left) continue;
                const std::string_view field = std::string_view(row).substr(
                    field_left, field_right - field_left);
                auto border_or_space = [&](int x) {
                    return row[x] == ' ' || (classic &&
                        is_cp437_box_separator(field, static_cast<size_t>(x - field_left)));
                };
                int left = field_left, end = field_right;
                // Location captions overwrite the lower horizontal edge.
                // Keep only its text opening; a pure border row owns no text.
                while (end > left && border_or_space(end - 1)) --end;
                while (left < end) {
                    if (border_or_space(left)) { ++left; continue; }
                    // A lower-edge location can start immediately after a
                    // horizontal CP437 border. C4 AE (or CD AE) looks like
                    // UTF-8 to the generic boundary reader, but AE ... AF
                    // is the item's paired ownership decoration here.
                    // Resolve this only on the record's lower edge and with
                    // a complete decorated designation, preserving the marks
                    // and keeping the border outside the translated span.
                    const unsigned char edge = row[left];
                    const std::string_view tail = std::string_view(row).substr(
                        left + 1, end - left - 1);
                    if (classic && row_y == y + 1 &&
                        (edge == 0xc4 || edge == 0xcd) &&
                        tail.starts_with("\xAE") && tail.ends_with("\xAF") &&
                        !split_item_designation(tail).prefix.empty()) {
                        ++left;
                        continue;
                    }
                    break;
                }
                if (end <= left) continue;
                bool crosses_frame = false;
                for (int x = left; classic && x < end; ++x)
                    if (is_cp437_box_separator(field, static_cast<size_t>(x - field_left))) {
                        crosses_frame = true;
                        break;
                    }
                if (crosses_frame) continue;
                const int paired = paired_text_row(left, end, row_y);
                bool item_line = row_y <= y || (paired >= 0 && paired <= y);
                if (shortcuts) {
                    // The key is an independent native field, not an article
                    // or the first word of a generated creature/material.
                    // Its native position expresses the item's nesting depth.
                    // Leave it outside both translation and glyph suppression.
                    const unsigned char key = row[left];
                    const bool key_shape = ((key >= 'a' && key <= 'z') ||
                        (key >= 'A' && key <= 'Z')) &&
                        left + 2 < end && row[left + 1] == ' ';
                    item_line = false;
                    if (key_shape) {
                        int name = left + 2;
                        while (name < end && row[name] == ' ') ++name;
                        if (name >= end) continue;
                        bool key_top = false, name_top = false;
                        const auto *key_cell = cell_at(left, row_y, &key_top);
                        const auto *name_cell = cell_at(name, row_y, &name_top);
                        if (!key_cell || !name_cell ||
                            key_cell[0] != key || name_cell[0] !=
                                static_cast<unsigned char>(row[name])) continue;
                        // An article on a container label has the label's
                        // color. A native shortcut is its own colored field.
                        item_line = key_cell[1] != name_cell[1] ||
                            key_cell[2] != name_cell[2] || key_cell[3] != name_cell[3];
                        // A same-color single-letter prefix is ambiguous.
                        // Preserve its native field, including a possible key.
                        if (!item_line) continue;
                        left = name;
                    }
                }
                const int text_left = left;
                const std::string visible = row.substr(left, end - left);
                // A raw-layer scan can see an older background widget. Only
                // the current composed record establishes source ownership.
                if (context_rows[row_y].substr(left, end - left) != visible) continue;
                const std::string complete = recover_caption(
                    left, end, row_y, picture_right);
                const ItemDesignationText designation = split_item_designation(complete);
                std::string item(designation.item);
                // Indefinite articles on a containing-item label are grammar,
                // not a separate item name or a keyboard binding in this box.
                if (item.starts_with("a ")) item.erase(0, 2);
                else if (item.starts_with("an ")) item.erase(0, 3);
                auto target = item_line
                    ? translate_inventory_item_name(item, row_y, left)
                    : translate_inventory_location(item, row_y, left);
                // Named weapons use the same complete generated-name parser
                // as the ordinary matching path. Keep that fallback inside
                // the proven Uniform item field, never on a body-part label.
                if (!target && uniform && item_line)
                    target = translate_procedural_fragment(item);
                const bool translated = target.has_value();
                if (translated) *target = designation.prefix + *target + designation.suffix;
                else {
                    std::vector<uint32_t> codepoints;
                    target = decode_utf8(complete, codepoints)
                        ? complete : cp437_to_utf8(complete);
                }
                Match caption{left, row_y, end - left,
                    item_line ? kCharacterInventoryItemRule : kCharacterInventoryLocationRule,
                    std::move(*target), visible};
                caption.native_hover_untranslated = !translated;
                caption.layout_x = text_left;
                caption.layout_length = field_right - text_left;
                caption.layout_clip_right = field_right;
                caption.layout_left = true;
                matches.push_back(std::move(caption));
            }
            auto name = std::find_if(matches.begin() + record_begin, matches.end(),
                [](const Match &match) { return match.rule == kCharacterInventoryItemRule; });
            if (name != matches.end()) {
                const int text_left = name->x;
                const bool two_lines = classic && caption_box &&
                    std::any_of(matches.begin() + record_begin, matches.end(),
                        [&](const Match &match) {
                            return match.rule == kCharacterInventoryLocationRule &&
                                match.y == caption_box->y + caption_box->h - 1;
                        });
                for (size_t index = record_begin; index < matches.size(); ++index) {
                    Match &caption = matches[index];
                    // Nesting remains tied to this record's untouched key;
                    // its location shares the item name's text-column origin.
                    caption.layout_x = text_left;
                    caption.layout_length = caption.layout_clip_right - text_left;
                    if (caption_box) caption.native_picture_caption_box = *caption_box;
                    if (!two_lines) continue;
                    // Fit two baselines inside the native three-row frame.
                    // Source ownership stays on the original rows so the
                    // lower-edge repair can restore the complete border.
                    caption.layout_y = caption.y - 1;
                    caption.layout_pixel_y = (caption_box->h - 2) * gps_->tile_pixel_y / 2;
                    caption.layout_fixed_baseline = true;
                }
            }
            picture = controls;
        }
    }

    if (!shortcuts) {
        // Character captions can be centred independently. Their English
        // ink origin is not the record's nesting depth: the picture/text box
        // carries that indent. Share one inset relative to each record's box
        // for both names and locations, including containing-item labels.
        int inset = gps_->dimx;
        for (const Match &match : matches)
            if (match.rule == kCharacterInventoryItemRule && match.native_picture_caption_box)
                inset = std::min(inset, match.x - match.native_picture_caption_box->x);
        if (inset < gps_->dimx)
            for (Match &match : matches) {
                if (!match.native_picture_caption_box) continue;
                match.layout_x = match.native_picture_caption_box->x + inset;
                match.layout_length = match.layout_clip_right - match.layout_x;
            }
        if (uniform) return matches;
    }

    // Body deposits have a complete rectangle but no picture or action.
    // Its lower edge carries the body part in classic mode. Read that
    // rectangle before the panel-wide fallback: the scrollbar's shading and
    // block glyphs are not box separators and must never enter the grammar.
    const size_t deposits_begin = matches.size();
    std::vector<Match> untranslated_deposits;
    for (int y = tabs_y + 1; y < frame->bottom; ++y) {
        if (std::any_of(matches.begin(), matches.end(), [y](const Match &match) {
                return match.y == y;
            })) continue;
        const auto &row = context_rows[y];
        int left = frame->left + 1, end = frame->right;
        std::optional<SDL_Rect> deposit_box;
        if (!shortcuts) {
            for (const auto &field : split_text_fields(row)) {
                if (field.start < left || field.end > end) continue;
                const auto box = native_button_text_rect(
                    *gps_, field.start, field.end, y, true);
                if (!box || box->h != 3 || box->y <= tabs_y ||
                    box->y + box->h > frame->bottom || box->x < left ||
                    box->x + box->w > end || y <= box->y) continue;
                deposit_box = box;
                left = box->x;
                end = box->x + box->w;
                break;
            }
        }
        auto border_or_space = [&](int x) {
            return row[x] == ' ' || is_cp437_box_separator(row, x);
        };
        while (left < end && border_or_space(left)) ++left;
        while (end > left && border_or_space(end - 1)) --end;
        if (left == end) continue;
        if (rows[y].compare(left, end - left, row, left, end - left) != 0) continue;
        int shortcut = -1;
        if (shortcuts && left + 2 < end && row[left + 1] == ' ' &&
            ((row[left] >= 'a' && row[left] <= 'z') ||
             (row[left] >= 'A' && row[left] <= 'Z'))) {
            // Deposits have no picture/action controls. Their selected row
            // gives the key and caption the same color, so require the full
            // contaminant grammar below instead of a key/name color change.
            shortcut = left;
            left += 2;
            while (left < end && row[left] == ' ') ++left;
            if (left == end) continue;
        }
        std::string complete = recover_caption(left, end, y, frame->left + 1);
        if (shortcut >= 0) {
            // Clipping can capture either just the caption or the key and
            // caption together. Restore the latter before removing its key;
            // the original key remains outside the translated source span.
            const std::string whole = collapse_spaces(
                recover_caption(shortcut, end, y, frame->left + 1));
            const std::string visible = collapse_spaces(
                std::string_view(row).substr(shortcut, end - shortcut));
            if (whole != visible && whole.size() > 2 &&
                whole[0] == row[shortcut] && whole[1] == ' ')
                complete = whole.substr(2);
        }
        std::vector<size_t> origins;
        auto target = RULESETS.translate_with_origins(native_text_to_utf8(complete),
            "::health::contaminant::inventory", origins);
        const bool heading = target.has_value();
        // The selected inventory and complete anatomy establish a location
        // even when scrolling has moved its deposit heading off screen.
        if (!heading && shortcut < 0) target = translate_legends_anatomy(complete);
        const bool translated = target && !target->empty();
        if (!translated && !deposit_box) continue;
        Match caption{left, y, end - left,
            (heading || (!translated && y == deposit_box->y + 1))
                ? kCharacterInventoryItemRule : kCharacterInventoryLocationRule,
            translated ? std::move(*target) : native_text_to_utf8(complete),
            rows[y].substr(left, end - left)};
        caption.native_hover_untranslated = !translated;
        caption.layout_x = left;
        caption.layout_clip_right = deposit_box
            ? deposit_box->x + deposit_box->w : frame->right - 1;
        caption.layout_length = caption.layout_clip_right - left;
        caption.layout_left = true;
        if (deposit_box) caption.native_picture_caption_box = deposit_box;
        if (translated) matches.push_back(std::move(caption));
        else untranslated_deposits.push_back(std::move(caption));
    }
    const auto same_box = [](const SDL_Rect &a, const SDL_Rect &b) {
        return a.x == b.x && a.y == b.y && a.w == b.w && a.h == b.h;
    };
    // An unknown material/anatomy remains one native field when its companion
    // proves the deposit record. Generic word/prose matching cannot split it.
    for (Match &caption : untranslated_deposits) {
        if (std::any_of(matches.begin() + deposits_begin, matches.end(),
                [&](const Match &other) {
                    return other.native_picture_caption_box &&
                        same_box(*other.native_picture_caption_box,
                            *caption.native_picture_caption_box);
                })) matches.push_back(std::move(caption));
    }
    int deposit_inset = gps_->dimx;
    for (size_t index = deposits_begin; index < matches.size(); ++index) {
        const Match &caption = matches[index];
        if (caption.rule == kCharacterInventoryItemRule &&
                caption.native_picture_caption_box)
            deposit_inset = std::min(deposit_inset,
                caption.x - caption.native_picture_caption_box->x);
    }
    for (size_t index = deposits_begin; index < matches.size(); ++index) {
        Match &caption = matches[index];
        if (!caption.native_picture_caption_box) continue;
        const auto &box = *caption.native_picture_caption_box;
        caption.layout_x = box.x + (deposit_inset < gps_->dimx ? deposit_inset : 0);
        caption.layout_length = caption.layout_clip_right - caption.layout_x;
        const bool two_lines = std::any_of(matches.begin() + deposits_begin, matches.end(),
            [&](const Match &other) {
                return other.native_picture_caption_box &&
                    same_box(*other.native_picture_caption_box, box) &&
                    other.y == box.y + box.h - 1;
            });
        if (!two_lines) continue;
        caption.layout_y = caption.y - 1;
        caption.layout_pixel_y = (box.h - 2) * gps_->tile_pixel_y / 2;
        caption.layout_fixed_baseline = true;
    }
    return matches;
}

void Overlay::layout_inventory(SDL_Renderer *renderer) {
    if (!gps_ || !renderer || gps_->tile_pixel_x <= 0 || gps_->tile_pixel_y <= 0) return;
    int pixels = gps_->tile_pixel_y;
    std::vector<Match *> rows;
    for (Match &match : prepared_matches_) {
        if ((match.rule != kCharacterInventoryItemRule &&
             match.rule != kCharacterInventoryLocationRule &&
             match.rule != kAdventureItemActionRule) ||
            match.target.empty() || match.native_split_duplicate) continue;
        // Each item keeps its native nesting indent after the untouched key.
        // Body-part/container labels share that item's bounded text column.
        // Use the shared configured font for every bounded field, including
        // longer names; their individual English widths never choose size.
        const int left = match.layout_x >= 0 ? match.layout_x : match.x;
        const int right = match.layout_clip_right >= 0 ? match.layout_clip_right : gps_->dimx;
        if (right <= left) continue;
        if (match.native_picture_caption_box && match.layout_fixed_baseline) {
            // Reapply the two-line inset after generic page layout. Original
            // source coordinates still own suppression and lower-edge repair.
            match.layout_y = match.y - 1;
            match.layout_pixel_y = (match.native_picture_caption_box->h - 2)
                * gps_->tile_pixel_y / 2;
        }
        layout_fortress_text_rows(renderer, {{&match}}, left, right);
        if (match.layout_font_pixels <= 0) continue;
        pixels = std::min(pixels, match.layout_font_pixels);
        rows.push_back(&match);
    }
    if (rows.empty()) return;
    for (Match *match : rows) match->layout_font_pixels = pixels;
    const auto settings = native_ui_settings();
    for (Match *match : rows) {
        if (!settings || !settings->classic || !match->native_picture_caption_box ||
            !match->layout_fixed_baseline || match->rule != kCharacterInventoryLocationRule)
            continue;
        const auto &box = *match->native_picture_caption_box;
        if (match->y != box.y + box.h - 1) continue;
        std::array<int32_t, 9> skin{};
        auto current = native_picture_caption_rect(
            *gps_, box.x, box.y + 1, false, nullptr, true, &skin, true,
            false, -1, true);
        if (!current) current = native_button_text_rect(
            *gps_, box.x, box.x + box.w, box.y + 1, true, &skin);
        if (!current || current->x != box.x || current->y != box.y ||
            current->w != box.w || current->h != box.h) continue;
        NativeBorderRepair repair;
        repair.cells = {match->x, match->y, match->length, 1};
        repair.cell[0] = static_cast<unsigned char>(skin[7] & 0xff);
        const int foreground = ((skin[7] >> 8) & 7) + ((skin[7] & 0x4000) ? 8 : 0);
        const int background = (skin[7] >> 11) & 7;
        std::copy_n(gps_->uccolor[foreground], 3, repair.cell.begin() + 1);
        std::copy_n(gps_->uccolor[background], 3, repair.cell.begin() + 4);
        native_border_repairs_.push_back(repair);
    }
    const int tile_h = gps_->tile_pixel_y;
    const int tile_w = gps_->tile_pixel_x;
    const int origin_x = (gps_->screen_pixel_x - gps_->dimx * tile_w) / 2;
    for (Match &match : prepared_matches_) {
        if (match.target.empty() || match.native_split_duplicate) continue;
        if (match.source == "Burden:") {
            // Keep weight digits and their CP437 unit on the native path.
            // Place the translated label next to that value by measured width,
            // instead of retaining the English label's now-empty character box.
            int value_x = match.x + match.length;
            while (value_x < gps_->dimx) {
                const unsigned char ch = visible_char_at(value_x, match.y);
                if (ch && ch != ' ') break;
                ++value_x;
            }
            if (value_x >= gps_->dimx) continue;
            const unsigned char digit = visible_char_at(value_x, match.y);
            if (digit < '0' || digit > '9') continue;
            const int padding = config_.horizontal_padding;
            const auto *glyph = get_glyph_texture(renderer, match.target,
                std::max(1, (value_x - match.x) * tile_w), tile_h, pixels, 0, true);
            if (!glyph || !glyph->texture) continue;
            const int gap = std::max(1, tile_w / 2);
            match.layout_box_pixel_x = origin_x + value_x * tile_w - gap - glyph->width - padding;
            match.layout_box_pixel_width = glyph->width + 2 * padding;
            match.layout_font_pixels = pixels;
            match.layout_lock_font_pixels = true;
            match.layout_line_height_pixels = tile_h;
            match.layout_fixed_baseline = true;
            match.layout_left = true;
        }
    }
}
