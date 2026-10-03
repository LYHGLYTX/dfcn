// Console batches can color a captured value independently of its sentence.
// Match the complete logical line first; a color change is not a prose boundary.
// Only this local Console sink sees the remapping, never RPC or file streams.
static std::optional<NativeDfhackConsoleFragments> native_dfhack_console_color_record(
        const NativeDfhackConsoleFragments &fragments) {
    std::string source;
    std::vector<int> source_colors;
    for (const auto &fragment : fragments) {
        source += fragment.text;
        source_colors.insert(source_colors.end(), fragment.text.size(), fragment.color);
    }
    if (source.empty()) return std::nullopt;
    const size_t body_end = source.back() == '\n' ? source.size() - 1 : source.size();
    const auto body = trim_view(std::string_view(source).substr(0, body_end));
    if (body.empty() || body.starts_with("> ")) return std::nullopt;
    const auto catalog = g_dfhack_output_snapshot.load(std::memory_order_acquire);
    if (!catalog) return std::nullopt;
    const auto target = translate_dfhack_console_output(source);
    if (!target || target->empty() || *target == source || !contains_cjk_utf8(*target))
        return std::nullopt;
    const size_t body_offset = static_cast<size_t>(body.data() - source.data());
    const size_t suffix_offset = body_offset + body.size();
    NativeDfhackConsoleFragments result;
    const auto append = [&](int color, std::string_view text) {
        if (text.empty()) return;
        if (!result.empty() && result.back().color == color) result.back().text += text;
        else result.push_back({color, std::string(text)});
    };
    const auto copy = [&](size_t at, size_t length) {
        const size_t end = at + length;
        while (at < end) {
            size_t next = at + 1;
            while (next < end && source_colors[next] == source_colors[at]) ++next;
            append(source_colors[at], std::string_view(source).substr(at, next - at));
            at = next;
        }
    };
    const Rule *selected = nullptr;
    std::vector<std::string> captures;
    std::vector<std::pair<size_t, size_t>> ranges;
    size_t specificity = 0;
    bool ambiguous = false;
    std::unordered_set<size_t> candidates;
    for (const auto &word : dfhack_output_anchor_words(body))
        if (const auto found = catalog->template_words.find(word); found != catalog->template_words.end())
            candidates.insert(found->second.begin(), found->second.end());
    for (size_t index : candidates) {
        const auto &rule = catalog->templates[index];
        size_t bytes = 0;
        for (const auto &literal : rule.template_literals) bytes += literal.size();
        if (selected && bytes < specificity) continue;
        std::vector<std::string> values;
        std::vector<std::pair<size_t, size_t>> positions;
        if (!match_dfhack_output_template(rule, body, values, &positions)) continue;
        if (selected && bytes == specificity) {
            if (fill_template(*selected, captures) != fill_template(rule, values)) ambiguous = true;
            continue;
        }
        selected = &rule;
        captures = std::move(values);
        ranges = std::move(positions);
        specificity = bytes;
        ambiguous = false;
    }
    if (selected && !ambiguous && ranges.size() == captures.size()) {
        const auto resolved = resolve_dfhack_output_captures(*catalog, *selected, captures, 0, true);
        const auto rendered = fill_template(*selected, captures, nullptr, nullptr, &resolved);
        const std::string expected = source.substr(0, body_offset) + rendered + source.substr(suffix_offset);
        if (expected == *target && selected->target_template_literals.size() ==
                selected->target_capture_order.size() + 1) {
            int prose_color = source_colors[body_offset];
            bool found_color = false;
            size_t start = 0;
            for (size_t interval = 0; interval <= ranges.size() && !found_color; ++interval) {
                const size_t end = interval < ranges.size() ? ranges[interval].first : body.size();
                for (size_t at = start; at < end; ++at) {
                    const auto ch = static_cast<unsigned char>(body[at]);
                    if ((ch >= 'A' && ch <= 'Z') || (ch >= 'a' && ch <= 'z')) {
                        prose_color = source_colors[body_offset + at];
                        found_color = true;
                        break;
                    }
                }
                if (interval < ranges.size()) start = ranges[interval].first + ranges[interval].second;
            }
            copy(0, body_offset);
            for (size_t output = 0; output < selected->target_capture_order.size(); ++output) {
                append(prose_color, selected->target_template_literals[output]);
                const size_t field = selected->target_capture_order[output];
                const auto &[at, length] = ranges[field];
                const std::string &value = resolved[field] ? *resolved[field] : captures[field];
                if (value == captures[field]) copy(body_offset + at, length);
                else append(source_colors[body_offset + at], value);
            }
            append(prose_color, selected->target_template_literals.back());
            copy(suffix_offset, source.size() - suffix_offset);
            return result;
        }
    }
    // Complete literal/help/assembled messages have no capture boundaries.
    // Retain every uniquely preserved native run (names, IDs, punctuation),
    // while the translated prose inherits the changed authored run's color.
    int base = source_colors[body_offset];
    size_t longest_changed = 0;
    for (const auto &fragment : fragments) {
        const auto text = trim_view(fragment.text);
        if (!text.empty() && target->find(text) == std::string::npos && text.size() > longest_changed) {
            base = fragment.color;
            longest_changed = text.size();
        }
    }
    std::vector<int> target_colors(target->size(), base);
    std::vector<bool> assigned(target->size());
    for (const auto &fragment : fragments) {
        const auto text = trim_view(fragment.text);
        if (text.empty()) continue;
        const size_t at = target->find(text);
        if (at == std::string::npos || target->find(text, at + 1) != std::string::npos) continue;
        const size_t end = at + text.size();
        if ((static_cast<unsigned char>((*target)[at]) & 0xc0) == 0x80 ||
                (end < target->size() &&
                 (static_cast<unsigned char>((*target)[end]) & 0xc0) == 0x80) ||
                (at && ascii_word_byte(static_cast<unsigned char>(text.front())) &&
                ascii_word_byte(static_cast<unsigned char>((*target)[at - 1]))) ||
                (end < target->size() && ascii_word_byte(static_cast<unsigned char>(text.back())) &&
                 ascii_word_byte(static_cast<unsigned char>((*target)[end]))) ||
                std::any_of(assigned.begin() + at, assigned.begin() + end,
                    [](bool value) { return value; })) continue;
        std::fill(target_colors.begin() + at, target_colors.begin() + end, fragment.color);
        std::fill(assigned.begin() + at, assigned.begin() + end, true);
    }
    if (source.back() == '\n' && target->back() == '\n') target_colors.back() = source_colors.back();
    for (size_t at = 0; at < target->size();) {
        size_t next = at + 1;
        while (next < target->size() && target_colors[next] == target_colors[at]) ++next;
        append(target_colors[at], std::string_view(*target).substr(at, next - at));
        at = next;
    }
    return result;
}
