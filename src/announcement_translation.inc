// A submitted record is the translation unit. Dictionary reload invalidates
// this cache; layout and colors remain shared with all bounded paragraphs.
std::optional<std::string> Overlay::translate_complete_announcement(
        std::string_view source, const std::vector<int> &source_colors,
        std::vector<int> &target_colors) const {
    const std::string key(source);
    if (const auto found = announcement_translation_cache_.find(key);
            found != announcement_translation_cache_.end() &&
            found->second.source_colors == source_colors) {
        announcement_translation_order_.splice(announcement_translation_order_.end(),
            announcement_translation_order_, found->second.use);
        target_colors = found->second.target_colors;
        return found->second.target;
    }
    target_colors.clear();
    if (source.empty() || source_colors.size() != source.size()) return std::nullopt;
    const auto translate_block = [&](std::string_view block, const std::vector<int> &colors,
            std::vector<int> &translated_colors) -> std::optional<std::string> {
        translated_colors.clear();
        if (const auto original = native_original_speech_source(block)) {
            const std::vector<int> original_colors(original->size(), colors.front());
            auto translated = translate_complete_announcement(*original, original_colors, translated_colors);
            const auto voice = exact_literal_translation("Announcement speech: lisp");
            if (!translated || !voice) return std::nullopt;
            *translated += *voice;
            for (unsigned char ch : *voice)
                if ((ch & 0xc0) != 0x80) translated_colors.push_back(colors.front());
            return translated;
        }
        // Spoken memories share the overview's authored wording. Resolve a
        // complete memory chain before generic paragraph literals, which can
        // contain older versions of the same reactions. The quote resolver
        // preserves each clause's source color and admits only complete,
        // typed memory sentences (including dynamic event fields).
        std::vector<size_t> memory_origins;
        if (const auto memory = translate_overview_quote(
                "\"" + std::string(block) + "\"", &memory_origins);
                memory && memory->starts_with("“") && memory->ends_with("”")) {
            const auto body = std::string_view(*memory).substr(3, memory->size() - 6);
            for (size_t at = 0; at < body.size(); ++at) {
                if ((static_cast<unsigned char>(body[at]) & 0xc0) == 0x80) continue;
                const size_t origin = memory_origins[at + 3];
                translated_colors.push_back(colors[std::min(
                    origin ? origin - 1 : 0, colors.size() - 1)]);
            }
            return std::string(body);
        }
        // A reviewed complete message is stronger evidence than a recursive
        // grammar with generated-name slots. Otherwise "The weather has
        // cleared." matches the rumor "{person} has {book}." before its
        // existing catalog translation can be considered. Keep catalog
        // whitespace normalization and palette handling in the shared parser.
        auto translated = translate_help_paragraph(block, colors, translated_colors,
            true, -1, true);
        if (translated) return translated;
        // ELF 53.16 1882b38/1882bc0 builds spoken memories with the SAME
        // event and emotion formatters (101b7f0, 10283d0) as the overview.
        // Share complete authored sentences, including intensity/negation;
        // the full-record partitioner below composes their independent parts.
        if (const auto found = overview_sentence_translations_.find(normalize_utterance(block));
                found != overview_sentence_translations_.end()) {
            for (unsigned char ch : found->second)
                if ((ch & 0xc0) != 0x80) translated_colors.push_back(colors.front());
            return found->second;
        }
        translated = translate_announcement_combat(block);
        if (!translated) translated = translate_announcement_dialogue(block);
        if (translated) {
            // Combat and speech builders emit one native announcement color.
            for (unsigned char ch : *translated)
                if ((ch & 0xc0) != 0x80) translated_colors.push_back(colors.front());
        } else translated = translate_help_paragraph(block, colors, translated_colors, true);
        if (!translated) {
            // Reading and news can submit a complete existing item, work or
            // historical-event description without an announcement prefix.
            // Unlinked Legends prose requires every source span and typed
            // field to resolve, and never treats unknown prose as a name.
            translated = translate_legends_text(block, false, false);
            if (translated) {
                translated_colors.clear();
                for (unsigned char ch : *translated)
                    if ((ch & 0xc0) != 0x80) translated_colors.push_back(colors.front());
            }
        }
        return translated;
    };
    auto target = translate_block(source, source_colors, target_colors);
    if (!target) {
        // One submitted record may combine an attack, a status change, and a
        // spoken reaction. Candidate sentence boundaries do not imply a valid
        // split: both sides must resolve completely. Full-paragraph rules get
        // first choice, retaining names and titles with embedded punctuation.
        std::vector<size_t> starts{0};
        for (size_t at = 1; at < source.size(); ++at) {
            if (!std::isspace(static_cast<unsigned char>(source[at]))) continue;
            const char preceding = source[at - 1];
            if (preceding != '.' && preceding != '!' && preceding != '?') continue;
            while (at < source.size() && std::isspace(static_cast<unsigned char>(source[at]))) ++at;
            if (at < source.size()) starts.push_back(at);
        }
        starts.push_back(source.size());
        struct CompleteSuffix {
            std::string text;
            std::vector<int> colors;
        };
        std::vector<std::optional<CompleteSuffix>> resolved(starts.size());
        resolved.back() = CompleteSuffix{};
        for (size_t part = starts.size() - 1; part-- > 0;) {
            for (size_t next = starts.size() - 1; next > part; --next) {
                if (!resolved[next] || (part == 0 && next == starts.size() - 1)) continue;
                size_t end = starts[next];
                while (end > starts[part] && std::isspace(static_cast<unsigned char>(source[end - 1]))) --end;
                if (end <= starts[part]) continue;
                std::vector<int> block_colors(source_colors.begin() + starts[part], source_colors.begin() + end);
                std::vector<int> translated_colors;
                const auto translated = translate_block(source.substr(starts[part], end - starts[part]),
                    block_colors, translated_colors);
                if (!translated) continue;
                CompleteSuffix suffix{*translated + resolved[next]->text, std::move(translated_colors)};
                suffix.colors.insert(suffix.colors.end(), resolved[next]->colors.begin(), resolved[next]->colors.end());
                resolved[part] = std::move(suffix);
                break;
            }
        }
        if (resolved.front()) {
            target = std::move(resolved.front()->text);
            target_colors = std::move(resolved.front()->colors);
        }
    }
    // Scroll through long histories without periodically discarding every
    // visible record. Retain failures too; repeated unsupported prose must
    // not restart its complete grammar search on each frame. Coordinates
    // and viewport positions never participate in this semantic cache.
    constexpr size_t maximum_entries = 2048;
    constexpr size_t maximum_bytes = 8 * 1024 * 1024;
    AnnouncementTranslation entry{source_colors, target, target_colors};
    entry.bytes = 2 * (key.size() + 1) + sizeof(AnnouncementTranslation) +
        sizeof(std::string) + 5 * sizeof(void *) +
        (entry.source_colors.capacity() + entry.target_colors.capacity()) * sizeof(int) +
        (entry.target ? entry.target->capacity() + 1 : 0);
    if (entry.bytes <= maximum_bytes) {
        // Nested speech translation uses this cache too. Look up the current
        // entry only after parsing, rather than retaining an invalidatable
        // iterator across a recursive translation or its LRU evictions.
        if (const auto previous = announcement_translation_cache_.find(key);
                previous != announcement_translation_cache_.end()) {
            announcement_translation_bytes_ -= previous->second.bytes;
            announcement_translation_order_.erase(previous->second.use);
            announcement_translation_cache_.erase(previous);
        }
        while (!announcement_translation_order_.empty() &&
                (announcement_translation_cache_.size() >= maximum_entries ||
                 announcement_translation_bytes_ > maximum_bytes - entry.bytes)) {
            const auto oldest = announcement_translation_cache_.find(
                announcement_translation_order_.front());
            announcement_translation_bytes_ -= oldest->second.bytes;
            announcement_translation_cache_.erase(oldest);
            announcement_translation_order_.pop_front();
        }
        announcement_translation_order_.push_back(key);
        entry.use = std::prev(announcement_translation_order_.end());
        const size_t bytes = entry.bytes;
        try {
            announcement_translation_cache_.emplace(key, std::move(entry));
        } catch (...) {
            announcement_translation_order_.pop_back();
            throw;
        }
        announcement_translation_bytes_ += bytes;
    }
    return target;
}

std::optional<std::string> Overlay::translate_announcement_items(
        std::string_view source) const {
    // The item-description grammar owns coordination, names with internal
    // commas/and, materials, quality and designation marks. Its coordinated
    // productions recursively resolve EVERY item; no fixed list length or
    // verbatim English tail is introduced in announcement capture.
    return translate_item_description_term(source);
}
