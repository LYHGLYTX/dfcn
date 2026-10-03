// Included after dfhack_launcher_help.inc inside find_matches. These readers
// share its complete-document catalog and visible-slice recovery. DFHack's
// graphical frames are read from the captured pens, not native DF skins.
std::vector<SDL_Rect> dfhack_auxiliary_regions;
std::vector<Match> dfhack_auxiliary_matches;
{
    const auto auxiliary_pixels = [&](const SDL_Rect &box) {
        const int tw = gps_->tile_pixel_x, th = gps_->tile_pixel_y;
        return SDL_Rect{(gps_->screen_pixel_x - gps_->dimx * tw) / 2 + box.x * tw,
            (gps_->screen_pixel_y - gps_->dimy * th) / 2 + box.y * th,
            box.w * tw, box.h * th};
    };
    const auto auxiliary_literal = [&](int x, int y, std::string_view source, int right) {
        if (x < 0 || y < 0 || y >= gps_->dimy || right > gps_->dimx ||
            x + static_cast<int>(source.size()) > right) return;
        const auto raw = read_row(y);
        if (raw.compare(x, source.size(), source) != 0) return;
        const auto target = exact_literal_translation("DFHack help: " + std::string(source));
        if (!target) return;
        dfhack_auxiliary_regions.push_back({x, y, static_cast<int>(source.size()), 1});
        if (only_y >= 0 && only_y != y) return;
        Match match{x, y, static_cast<int>(source.size()), kDfhackHotkeysHintRule,
            *target, std::string(source)};
        match.layout_x = x;
        match.layout_length = right - x;
        match.layout_left = true;
        match.layout_clip_right = right;
        dfhack_auxiliary_matches.push_back(std::move(match));
    };
    const auto auxiliary_body = [&](const SDL_Rect &box, int native_width, bool advfort) {
        if (box.x < 0 || box.y < 0 || box.w <= 0 || box.h <= 0 ||
            box.x + box.w > gps_->dimx || box.y + box.h > gps_->dimy) return;
        dfhack_auxiliary_regions.push_back(box);
        std::vector<Match> paragraph;
        const auto flush = [&]() {
            if (paragraph.empty()) return;
            NativeParagraphViewport viewport;
            auto target = translate_dfhack_help_rows(paragraph, native_width, &viewport);
            // advfort's introduction contains a live SELECT key token. Match
            // its complete prose around that token and retain the actual key.
            if (!target && advfort) {
                std::string source;
                for (const auto &row : paragraph) {
                    if (!source.empty()) source += ' ';
                    source += row.source;
                }
                const std::string prefix = "This tool allow you to perform jobs as a dwarf would in dwarf mode. When cursor is available you can press ";
                const std::string suffix = " to enqueue a job from pointer location. If job is 'Build' and there is no planed construction at cursor this tool show possible building choices.";
                if (source.starts_with(prefix) && source.ends_with(suffix) &&
                    source.size() > prefix.size() + suffix.size()) {
                    const std::string key = source.substr(prefix.size(),
                        source.size() - prefix.size() - suffix.size());
                    target = exact_literal_translation("DFHack help: " + prefix + "{k}" + suffix);
                    if (target) {
                        const auto at = target->find("{k}");
                        if (at == std::string::npos) target.reset();
                        else target->replace(at, 3, key);
                    }
                }
            }
            const auto append = [&](std::vector<Match> rows, std::string_view translation,
                    const NativeParagraphViewport &slice) {
                if (!contains_cjk_utf8(translation)) return;
                int clip_bottom = rows.back().y + 1;
                if (slice.total_lines <= static_cast<int>(rows.size())) {
                    while (clip_bottom < box.y + box.h) {
                        const auto raw = read_row(clip_bottom);
                        if (!trim_view(std::string_view(raw).substr(box.x, box.w)).empty()) break;
                        ++clip_bottom;
                    }
                }
                const SDL_Rect clip{box.x, rows.front().y, box.w,
                    clip_bottom - rows.front().y};
                rows.front().layout_native_clip = auxiliary_pixels(clip);
                append_bounded_paragraph(std::move(rows), translation, screen_rows,
                    dfhack_auxiliary_matches, only_y, box.x + box.w, box.x + box.w,
                    {}, false, box.x,
                    slice.first_line >= 0 ? std::optional<NativeParagraphViewport>(slice)
                                         : std::nullopt);
            };
            if (target) append(paragraph, *target, viewport);
            else {
                // Labels can put several semantic fields next to each other
                // without blank rows. Recover the longest complete catalog
                // block at each position; a visible scrolling tail is still
                // matched against the complete native wrap, never guessed.
                for (size_t start = 0; start < paragraph.size();) {
                    bool claimed = false;
                    for (size_t count = paragraph.size() - start; count > 0; --count) {
                        std::vector<Match> rows(paragraph.begin() + start,
                            paragraph.begin() + start + count);
                        NativeParagraphViewport slice;
                        const auto translation = translate_dfhack_help_rows(rows,
                            native_width, &slice);
                        if (!translation) continue;
                        append(std::move(rows), *translation, slice);
                        start += count;
                        claimed = true;
                        break;
                    }
                    if (!claimed) ++start;
                }
            }
            paragraph.clear();
        };
        for (int y = box.y; y < box.y + box.h; ++y) {
            const auto raw = read_row(y);
            const auto field = std::string_view(raw).substr(box.x, box.w);
            const auto text = trim_view(field);
            const bool underline = !text.empty() &&
                std::all_of(text.begin(), text.end(), [](char ch) { return ch == '=' || ch == '-'; });
            if (text.empty() || underline) { flush(); continue; }
            const int x = box.x + static_cast<int>(text.data() - field.data());
            // Each keybinding is an independent Label token. The key remains
            // native; only its complete descriptive field enters the catalog.
            if (advfort) {
                const auto separator = text.find(':');
                if (separator != std::string_view::npos) {
                    auto key = std::string(trim_view(text.substr(0, separator)));
                    std::replace(key.begin(), key.end(), '-', '+');
                    if (is_keybinding_code(key) || key == "CAREFULL MOVE") {
                        flush();
                        const auto action = trim_view(text.substr(separator + 1));
                        if (!action.empty()) auxiliary_literal(
                            x + static_cast<int>(action.data() - text.data()), y,
                            action, box.x + box.w);
                        if (key == "CAREFULL MOVE")
                            auxiliary_literal(x, y, text.substr(0, separator), box.x + box.w);
                        continue;
                    }
                }
            }
            paragraph.push_back({x, y, static_cast<int>(text.size()),
                kDfhackHotkeysHintRule, {}, std::string(text)});
        }
        flush();
    };
    // A help title must belong to the dedicated catalog, its frame must be
    // connected, and its bottom must carry DFHack's native signature. This
    // also covers independent help dialogs added by other DFHack scripts.
    for (int y = 0; y < gps_->dimy; ++y) {
        for (const auto &field : split_text_fields(dfhack_context_rows[y])) {
            const std::string_view title = field.text;
            const std::string folded = lower(std::string(title));
            if (title != "DFHack Quickstart Guide" && folded.find("help") == std::string::npos)
                continue;
            if (!exact_literal_translation("DFHack help: " + std::string(title))) continue;
            const int at = field.start;
            const auto frame = native_dfhack_frame(dfhack_context_rows, y,
                at, static_cast<int>(title.size()));
            if (!frame) continue;
            const bool quickstart = title == "DFHack Quickstart Guide";
            const bool advfort = title == "Help!?!";
            const int right = frame->x + frame->w - 1;
            const int bottom = frame->y + frame->h - 1;
            if (dfhack_context_rows[bottom].compare(right - 7, 6, "DFHack") != 0) continue;
            if (quickstart) {
                const auto &footer = dfhack_context_rows[bottom - 1];
                const auto page = footer.find("Page ", frame->x + 1);
                if (page == std::string::npos || page >= static_cast<size_t>(right) ||
                    footer.find(" of ", page + 5) == std::string::npos) continue;
                const auto number_end = footer.find(" of ", page + 5);
                size_t counter_end = number_end + 4;
                while (counter_end < static_cast<size_t>(right) &&
                    footer[counter_end] >= '0' && footer[counter_end] <= '9') ++counter_end;
                const auto digits = [](std::string_view value) {
                    return !value.empty() && std::all_of(value.begin(), value.end(),
                        [](char ch) { return ch >= '0' && ch <= '9'; });
                };
                const auto current = std::string_view(footer).substr(page + 5, number_end - page - 5);
                const auto total = std::string_view(footer).substr(number_end + 4,
                    counter_end - number_end - 4);
                auto counter = exact_literal_translation("DFHack help: Page {d} of {d}");
                if (counter && digits(current) && digits(total)) {
                    bool complete = true;
                    for (const auto value : {current, total}) {
                        const auto placeholder = counter->find("{d}");
                        if (placeholder == std::string::npos) { complete = false; break; }
                        counter->replace(placeholder, 3, value);
                    }
                    const auto raw = read_row(bottom - 1);
                    if (complete && raw.compare(page, counter_end - page,
                            footer, page, counter_end - page) == 0) {
                        dfhack_auxiliary_regions.push_back({static_cast<int>(page), bottom - 1,
                            static_cast<int>(counter_end - page), 1});
                        if (only_y < 0 || only_y == bottom - 1) {
                            Match match{static_cast<int>(page), bottom - 1,
                                static_cast<int>(counter_end - page), kDfhackHotkeysHintRule,
                                *counter, footer.substr(page, counter_end - page)};
                            match.layout_x = static_cast<int>(page);
                            match.layout_length = static_cast<int>(counter_end - page);
                            match.layout_left = true;
                            match.layout_clip_right = static_cast<int>(counter_end);
                            dfhack_auxiliary_matches.push_back(std::move(match));
                        }
                    }
                }
                const auto back = footer.find("Back", frame->x + 1);
                if (back != std::string::npos && back < static_cast<size_t>(right))
                    auxiliary_literal(static_cast<int>(back), bottom - 1, "Back", right);
                const auto next = footer.find("Next", page + 5);
                if (next != std::string::npos && next < static_cast<size_t>(right))
                    auxiliary_literal(static_cast<int>(next), bottom - 1, "Next", right);
            }
            dfhack_auxiliary_regions.push_back(
                {at, y, static_cast<int>(title.size()), 1});
            auxiliary_literal(at, y, title, right);
            const SDL_Rect body{frame->x + 1, frame->y + 1,
                frame->w - (advfort ? 3 : 5), frame->h - (quickstart ? 4 : (advfort ? 4 : 2))};
            auxiliary_body(body, advfort ? body.w : frame->w - 5, advfort);
        }
    }
    // The tag filter is a 46-column panel inside the launcher. Its controls
    // occupy the bottom row, with two exact dividers around a six-row
    // WrappedLabel. This proof works even though subviews overwrite its side
    // borders. Reserve the description alone, retaining executable tag names.
    for (const auto &launcher : dfhack_launcher_frames) {
        const int left = launcher.x + launcher.w - 75;
        const int right = left + 46;
        if (left < launcher.x + 1 || right > gps_->dimx) continue;
        for (int footer_y = launcher.y + 11;
                footer_y < launcher.y + launcher.h - 1; ++footer_y) {
            const auto &footer = dfhack_context_rows[footer_y];
            const auto cycle = footer.find("Cycle filter", left);
            const auto all = footer.find("Cycle all", left);
            if (cycle == std::string::npos || all == std::string::npos ||
                cycle + 12 > static_cast<size_t>(right) ||
                all + 9 > static_cast<size_t>(right)) continue;
            const auto divider = [&](int row) {
                int bars = 0;
                for (int x = left; x < right; ++x) {
                    const auto ch = static_cast<unsigned char>(dfhack_context_rows[row][x]);
                    bars += ch == 196 || ch == 205 || ch == 197;
                }
                return bars >= 42;
            };
            if (!divider(footer_y - 9) || !divider(footer_y - 2)) continue;
            auxiliary_body({left, footer_y - 8, 43, 6}, 43, false);
            auxiliary_literal(static_cast<int>(cycle), footer_y, "Cycle filter", right);
            auxiliary_literal(static_cast<int>(all), footer_y, "Cycle all", right);
        }
    }
    // Ownership prevents generic rules from translating isolated help words
    // or key names. Unmapped source remains native until its complete entry
    // is supplied; no incomplete sentence is drawn or silently discarded.
    for (const auto &owned : dfhack_auxiliary_regions)
        for (int y = owned.y; y < owned.y + owned.h; ++y)
            std::fill_n(screen_rows[y].begin() + owned.x, owned.w, ' ');
}
