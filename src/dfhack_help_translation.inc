// DFHack help has its own catalogue. It never contributes global word rules
// and executable command examples retain their original source text.
static std::string normalize_dfhack_help(std::string_view source) {
    std::string result;
    for (unsigned char ch : source) {
        if (native_prose_space(ch)) {
            if (!result.empty() && result.back() != ' ') result.push_back(' ');
        } else result.push_back(static_cast<char>(ch));
    }
    if (!result.empty() && result.back() == ' ') result.pop_back();
    return result;
}

static std::vector<std::string> dfhack_help_native_wrap(std::string_view source, int width) {
    std::vector<std::string> rows;
    if (width <= 0) return rows;
    std::string row;
    for (size_t at = 0; at < source.size();) {
        const size_t end = source.find(' ', at);
        const std::string_view word = source.substr(at,
            (end == std::string_view::npos ? source.size() : end) - at);
        if (!row.empty() && row.size() + 1 + word.size() > static_cast<size_t>(width)) {
            rows.push_back(std::move(row));
            row.clear();
        }
        if (!row.empty()) row.push_back(' ');
        row.append(word);
        while (row.size() > static_cast<size_t>(width)) {
            rows.push_back(row.substr(0, width));
            row.erase(0, width);
        }
        if (end == std::string_view::npos) break;
        at = end + 1;
    }
    if (!row.empty()) rows.push_back(std::move(row));
    return rows;
}

void Overlay::index_dfhack_help_paragraph(const Rule &rule) {
    constexpr std::string_view prefix = "DFHack help: ";
    const std::string source = normalize_dfhack_help(
        std::string_view(rule.source).substr(prefix.size()));
    if (source.empty() || rule.target.empty()) return;
    if (const auto found = dfhack_help_source_index_.find(source);
            found != dfhack_help_source_index_.end()) {
        dfhack_help_paragraphs_[found->second].target = rule.target;
        capture_translations_.insert_or_assign(std::string(prefix) + source, rule.target);
        return;
    }
    const size_t index = dfhack_help_paragraphs_.size();
    dfhack_help_paragraphs_.push_back({source, rule.target});
    dfhack_help_source_index_.emplace(source, index);
    capture_translations_.insert_or_assign(std::string(prefix) + source, rule.target);
    std::unordered_set<std::string> seen;
    std::istringstream words(source);
    for (std::string word; words >> word;)
        if (seen.insert(word).second) dfhack_help_words_[word].push_back(index);
}

void Overlay::load_dfhack_help_catalog() {
    static constexpr std::array<const char *, 3> names{
        "dfhack-help-translations.tsv", "dfhack-help-overrides.tsv",
        "dfhack-help-command-overrides.tsv"};
    const auto directory = fs::u8path(config_.mapping_path).parent_path();
    for (size_t file = 0; file < names.size(); ++file) {
        const auto path = directory / names[file];
        std::error_code error;
        const auto mtime = fs::last_write_time(path, error);
        dfhack_help_mtimes_[file] = error ? fs::file_time_type{} : mtime;
        std::ifstream input(path, std::ios::binary);
        if (!input) continue;
        size_t line_number = 0;
        for (std::string line; std::getline(input, line);) {
            ++line_number;
            if (!line.empty() && line.back() == '\r') line.pop_back();
            if (line_number == 1 && line.starts_with("\xef\xbb\xbf")) line.erase(0, 3);
            if (line.empty() || line.front() == '#') continue;
            const size_t tab = line.find('\t');
            if (tab == std::string::npos) continue;
            const size_t flags = line.find('\t', tab + 1);
            bool source_ok = false, target_ok = false;
            Rule rule;
            rule.source = unescape_tsv(std::string_view(line).substr(0, tab), &source_ok);
            rule.target = unescape_tsv(std::string_view(line).substr(tab + 1,
                flags == std::string::npos ? std::string::npos : flags - tab - 1), &target_ok);
            std::vector<uint32_t> codepoints;
            const bool gui_field = rule.source.starts_with("DFHack GUI ");
            if (!source_ok || !target_ok ||
                    (!gui_field && !rule.source.starts_with("DFHack help: ")) ||
                    trim(rule.target).empty() || !decode_utf8(rule.target, codepoints)) continue;
            if (gui_field)
                capture_translations_.insert_or_assign(rule.source, rule.target);
            else index_dfhack_help_paragraph(rule);
        }
    }
}

std::optional<std::string> Overlay::translate_dfhack_help_rows(
        const std::vector<Match> &rows, int native_width,
        NativeParagraphViewport *viewport, std::string *complete_source) const {
    if (viewport) *viewport = {};
    if (complete_source) complete_source->clear();
    if (rows.empty() || native_width <= 0) return std::nullopt;
    std::string visible;
    for (const Match &row : rows) {
        if (!visible.empty()) visible.push_back(' ');
        visible += row.source;
    }
    visible = normalize_dfhack_help(visible);
    if (visible.empty()) return std::nullopt;
    if (auto target = exact_literal_translation("DFHack help: " + visible)) {
        if (complete_source) *complete_source = visible;
        return target;
    }
    // The version/commit is a runtime value. Preserve it as one value rather
    // than putting its English prefix through unrelated noun/name grammars.
    constexpr std::string_view version_prefix = "You're running DFHack ";
    if (visible.starts_with(version_prefix)) {
        if (auto target = exact_literal_translation("DFHack help: You're running DFHack")) {
            if (complete_source) *complete_source = visible;
            return *target + " " + visible.substr(version_prefix.size());
        }
    }
    // Use the rarest visible word to recover a complete documented block.
    // Every visible byte must occur contiguously in that source, with actual
    // word boundaries. A shared short suffix cannot select another document.
    const std::vector<size_t> *candidates = nullptr;
    std::istringstream words(visible);
    size_t word_count = 0;
    for (std::string word; words >> word;) {
        ++word_count;
        const auto found = dfhack_help_words_.find(word);
        if (found != dfhack_help_words_.end() &&
                (!candidates || found->second.size() < candidates->size()))
            candidates = &found->second;
    }
    if (!candidates || word_count < 3 || visible.size() < 20) return std::nullopt;
    const DfhackHelpParagraph *selected = nullptr;
    NativeParagraphViewport selected_viewport{};
    for (size_t index : *candidates) {
        const auto &paragraph = dfhack_help_paragraphs_[index];
        const size_t at = paragraph.source.find(visible);
        if (at == std::string::npos ||
                (at > 0 && paragraph.source[at - 1] != ' ') ||
                (at + visible.size() < paragraph.source.size() &&
                 paragraph.source[at + visible.size()] != ' ')) continue;
        const auto wrapped = dfhack_help_native_wrap(paragraph.source, native_width);
        int first_line = -1;
        for (size_t first = 0; first + rows.size() <= wrapped.size(); ++first) {
            bool same = true;
            for (size_t line = 0; same && line < rows.size(); ++line)
                same = normalize_dfhack_help(wrapped[first + line]) ==
                    normalize_dfhack_help(rows[line].source);
            if (same) { first_line = static_cast<int>(first); break; }
        }
        int total_lines = static_cast<int>(wrapped.size());
        if (first_line < 0) {
            // helpdb also preserves hard line breaks and list indents from
            // rendered docs before WrappedLabel wraps them. Their exact
            // contiguous source still proves the paragraph; determine the
            // scroll position from its preceding native text allocation.
            const auto preceding = dfhack_help_native_wrap(
                trim_view(std::string_view(paragraph.source).substr(0, at)), native_width);
            first_line = static_cast<int>(preceding.size());
            const auto following = dfhack_help_native_wrap(
                trim_view(std::string_view(paragraph.source).substr(at + visible.size())), native_width);
            total_lines = first_line + static_cast<int>(rows.size() + following.size());
        }
        if (selected && selected->source.size() < paragraph.source.size()) continue;
        if (selected && selected->source.size() == paragraph.source.size() &&
                selected->source != paragraph.source) return std::nullopt;
        selected = &paragraph;
        selected_viewport = {first_line, std::max(total_lines,
            first_line + static_cast<int>(rows.size()))};
    }
    if (!selected) return std::nullopt;
    if (viewport) *viewport = selected_viewport;
    if (complete_source) *complete_source = selected->source;
    return selected->target;
}

// A DFHack title replaces a run of its own top edge. Prove the remaining
// corners, both connected sides, and the complete bottom edge/signature.
// Restored CP437 comes only from set_tile writes whose texture is live.
static std::optional<SDL_Rect> native_dfhack_frame(
        const std::vector<std::string> &rows, int title_y,
        int title_x, int title_length, int minimum_width = 26, int minimum_height = 7) {
    if (rows.empty() || title_y < 0 || title_y >= static_cast<int>(rows.size()) ||
            title_x < 0 || title_length < 0) return std::nullopt;
    const int width = static_cast<int>(rows[title_y].size());
    const auto ch = [&](int x, int y) { return static_cast<unsigned char>(rows[y][x]); };
    const auto vertical = [&](int x, int y) {
        const auto value = ch(x, y);
        return value == 0xb3 || value == 0xba || value == 0xc3 ||
            value == 0xcc || value == 0xb4 || value == 0xb9;
    };
    const auto horizontal = [&](int x, int y) {
        const auto value = ch(x, y);
        return value == 0xc4 || value == 0xcd || value == 0xc2 ||
            value == 0xcb || value == 0xc1 || value == 0xca;
    };
    for (int left = title_x - 1; left >= 0; --left) {
        if (ch(left, title_y) != 0xda && ch(left, title_y) != 0xc9) continue;
        for (int right = title_x + title_length; right < width; ++right) {
            if (ch(right, title_y) != 0xbf && ch(right, title_y) != 0xbb) continue;
            bool top = true;
            for (int x = left + 1; top && x < right; ++x)
                top = horizontal(x, title_y) ||
                    (x >= title_x && x < title_x + title_length) ||
                    (x >= title_x - 2 && x <= title_x + title_length + 1 && ch(x, title_y) == ' ');
            if (!top) continue;
            for (int bottom = title_y + 1; bottom < static_cast<int>(rows.size()); ++bottom) {
                const auto lc = ch(left, bottom), rc = ch(right, bottom);
                if ((lc == 0xc0 || lc == 0xc8) && (rc == 0xd9 || rc == 0xbc)) {
                    bool lower = true;
                    const size_t signature = rows[bottom].find("DFHack", left + 1);
                    const size_t pause = rows[bottom].find(" PAUSE FORCED ", left + 1);
                    const bool pause_blink = left + 16 < right &&
                        rows[bottom].compare(left + 2, 14, std::string(14, ' ')) == 0;
                    for (int x = left + 1; lower && x < right; ++x)
                        lower = horizontal(x, bottom) ||
                            (signature != std::string::npos &&
                             x >= static_cast<int>(signature) - 1 &&
                             x <= static_cast<int>(signature) + 6) ||
                            (pause != std::string::npos && x >= static_cast<int>(pause) &&
                             x < static_cast<int>(pause) + 14) ||
                            (pause_blink && x >= left + 2 && x < left + 16);
                    if (lower && right - left + 1 >= minimum_width &&
                            bottom - title_y + 1 >= minimum_height)
                        return SDL_Rect{left, title_y, right - left + 1, bottom - title_y + 1};
                    break;
                }
                if (!vertical(left, bottom) || !vertical(right, bottom)) break;
            }
        }
    }
    return std::nullopt;
}
