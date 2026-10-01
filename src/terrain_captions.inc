// The fortress hover card writes a terrain description and its growth list
// as one sentence. Keep the physical source span (including commas/padding)
// separate from the normalized grammar input and the translated display box.
void Overlay::append_terrain_caption_matches(std::vector<std::string> &rows,
        std::vector<Match> &matches, int only_y, bool raw_layer) const {
    if (!config_.compositional_rules) return;
    if (raw_layer) {
        std::vector<std::string> context(rows.size(), std::string(gps_->dimx, ' '));
        for (int y = 0; y < gps_->dimy; ++y)
            for (int x = 0; x < gps_->dimx; ++x) {
                const unsigned char ch = visible_char_at(x, y);
                context[y][x] = ch ? ch : ' ';
            }
        std::vector<Match> captions;
        append_terrain_caption_matches(context, captions, -1);
        if (!captions.empty()) {
            for (const Match &caption : captions) {
                if (only_y >= 0 && only_y != caption.y) continue;
                int cursor = 0;
                while (cursor < caption.length) {
                    while (cursor < caption.length &&
                        rows[caption.y][caption.x + cursor] != caption.source[cursor]) ++cursor;
                    const int begin = cursor;
                    while (cursor < caption.length &&
                        rows[caption.y][caption.x + cursor] == caption.source[cursor]) ++cursor;
                    if (begin == cursor) continue;
                    matches.push_back({caption.x + begin, caption.y, cursor - begin,
                        kTerrainCaptionRule, {}, caption.source.substr(begin, cursor - begin)});
                    std::fill_n(rows[caption.y].begin() + caption.x + begin, cursor - begin, ' ');
                }
            }
            return;
        }
    }

    // Recognize the current fortress HUD, never a remembered hover. This
    // excludes item lists, prose, and plant-selection controls elsewhere.
    bool population = false, stocks = false;
    int header_y = -1;
    for (int y = 0; y < std::min(3, gps_->dimy); ++y) {
        auto inspect = [&](const std::string &row) {
            for (std::string_view label : {"Pop", "Population", "Stocks"}) {
                size_t at = row.find(label);
                if (at == std::string::npos ||
                    !has_word_boundaries(row, at, at + label.size())) continue;
                if (label == "Stocks") stocks = true;
                else { population = true; header_y = y; }
            }
        };
        inspect(rows[y]);
        if (raw_layer) {
            std::string composed(gps_->dimx, ' ');
            for (int x = 0; x < gps_->dimx; ++x) {
                const unsigned char ch = visible_char_at(x, y);
                composed[x] = ch ? ch : ' ';
            }
            inspect(composed);
        }
    }
    if (!population || !stocks) return;

    struct Field { int left, right, region; std::string text; };
    std::vector<Match> captions;
    for (int y = header_y + 3; y < gps_->dimy; ++y) {
        const std::string &row = rows[y];
        // Cheap source-shape filter before entering the recursive grammar.
        // These are English identifiers only, not a second plant dictionary.
        const bool plant_shape = [&] {
            for (std::string_view marker : {"twigs", "branches", "trunk", "roots",
                    "leaves", "Snow-covered"})
                if (row.find(marker) != std::string::npos) return true;
            return false;
        }();
        if (!plant_shape) continue;
        std::vector<Field> fields;
        int cursor = 0, region = 0;
        while (cursor < gps_->dimx) {
            const unsigned char ch = row[cursor];
            if (ch <= ' ' || ch >= 0x7f) {
                if (ch != ' ') ++region;
                ++cursor;
                continue;
            }
            const int begin = cursor;
            while (cursor < gps_->dimx) {
                const unsigned char next = row[cursor];
                if (next < ' ' || next >= 0x7f ||
                    (next == ' ' && cursor + 1 < gps_->dimx && row[cursor + 1] == ' ')) break;
                ++cursor;
            }
            int end = cursor;
            while (end > begin && row[end - 1] == ' ') --end;
            if (end > begin) fields.push_back({begin, end, region, row.substr(begin, end - begin)});
        }
        for (size_t begin = 0; begin < fields.size(); ++begin) {
            std::optional<Match> best;
            size_t best_end = begin;
            std::string normalized;
            for (size_t end = begin; end < fields.size(); ++end) {
                if (fields[end].region != fields[begin].region) break;
                if (!normalized.empty()) normalized.push_back(' ');
                normalized += fields[end].text;
                // No byte limit tied to one tree name; a caption must only
                // fit the current native row. Unknown growths reject the
                // whole phrase instead of being transliterated as names.
                const bool tree_part = normalized.find(" twigs") != std::string::npos ||
                    normalized.find(" branches") != std::string::npos ||
                    normalized.find(" trunk") != std::string::npos ||
                    normalized.find(" roots") != std::string::npos ||
                    normalized.find(" leaves") != std::string::npos ||
                    normalized.starts_with("Snow-covered ");
                if (!tree_part) continue;
                auto target = RULESETS.translate_tile_description(cp437_to_utf8(normalized));
                if (!target || target->empty() || !contains_cjk_utf8(*target)) continue;
                if (auto literal = exact_literal_translation(normalized)) target = std::move(literal);
                const int left = fields[begin].left;
                const int length = fields[end].right - left;
                best = Match{left, y, length, kTerrainCaptionRule,
                    std::move(*target), row.substr(left, length)};
                best_end = end;
            }
            if (best) {
                captions.push_back(std::move(*best));
                begin = best_end;
            }
        }
    }
    // The separately colored snow deposit is a second line of the same
    // card. Read each amount's exact translation and align to the terrain,
    // rather than centering it inside the shorter English phrase.
    const size_t terrain_count = captions.size();
    for (size_t index = 0; index < terrain_count; ++index) {
        const int x = captions[index].x, y = captions[index].y + 1;
        if (y >= gps_->dimy) continue;
        for (std::string_view snow : {"A dusting of snow", "A small pile of snow", "A pile of snow"}) {
            if (x + static_cast<int>(snow.size()) > gps_->dimx ||
                rows[y].compare(x, snow.size(), snow) != 0 ||
                !has_word_boundaries(rows[y], x, x + snow.size())) continue;
            if (auto target = exact_literal_translation(snow))
                captions.push_back({x, y, static_cast<int>(snow.size()),
                    kTerrainCaptionRule, std::move(*target), std::string(snow)});
            break;
        }
    }
    for (Match &caption : captions) {
        caption.layout_x = caption.x;
        caption.layout_length = caption.length;
        caption.layout_left = true;
        bool top = false;
        const auto *cell = cell_at(caption.x, caption.y, &top);
        if (cell && cell[0] == static_cast<unsigned char>(caption.source.front()))
            caption.layout_foreground_rgb = (cell[1] << 16) | (cell[2] << 8) | cell[3];
        std::fill_n(rows[caption.y].begin() + caption.x, caption.length, ' ');
        if (only_y < 0 || only_y == caption.y) matches.push_back(std::move(caption));
    }
}

void Overlay::layout_terrain_captions(SDL_Renderer *renderer) {
    if (!gps_ || !face_ || !renderer ||
        gps_->tile_pixel_x <= 0 || gps_->tile_pixel_y <= 0) return;
    const NativePanelBorders borders(*gps_);
    std::vector<Match *> captions;
    for (Match &match : prepared_matches_)
        if (match.rule == kTerrainCaptionRule && !match.target.empty()) captions.push_back(&match);
    std::sort(captions.begin(), captions.end(), [](const Match *a, const Match *b) {
        return a->x != b->x ? a->x < b->x : a->y < b->y;
    });
    std::unordered_set<Match *> laid_out;
    for (Match *caption : captions) {
        if (laid_out.contains(caption)) continue;
        const int left = caption->x;
        const auto panel = native_panel_interior(borders, *gps_, left,
            left + caption->length, caption->y);
        std::vector<std::vector<Match *>> rows{{caption}};
        // The terrain is the semantic anchor for the whole hover card, not
        // the start of a new text column. Creatures/items above it and surface
        // deposits below it must share its left edge and font too. Do not
        // deduplicate equal names: two native rows can be two different units.
        for (const int direction : {-1, 1}) {
            for (int y = caption->y + direction; y >= 3 && y < gps_->dimy; y += direction) {
                if (panel && (y < panel->y || y >= panel->y + panel->h)) break;
                auto row = fortress_text_row(left, y);
                if (row.empty()) break;
                rows.push_back(std::move(row));
            }
        }
        for (const auto &row : rows)
            for (Match *part : row) laid_out.insert(part);
        if (panel) {
            layout_fortress_text_rows(renderer, rows, left, panel->x + panel->w);
        } else {
            // A partial hover skin does not make the longest English run a
            // control boundary. Preserve its anchor for native resolution.
            for (const auto &row : rows)
                for (Match *part : row) {
                    part->layout_x = left;
                    part->layout_left = true;
                    part->layout_font_pixels = unified_font_pixels();
                    part->layout_lock_font_pixels = true;
                }
        }
    }
}
