// Display and search must agree on the grammar of a complete journal title.
// Native search keys and clipped p_list_name fields are not display sources.
std::optional<std::string> Overlay::translate_journal_title(std::string_view source,
        JournalSearchKind kind) const {
    if (source.empty() || source.size() > 65536) return std::nullopt;
    std::optional<std::string> target;
    switch (kind) {
    case JournalSearchKind::Event:
        target = translate_legends_event(source);
        break;
    case JournalSearchKind::Creature:
        target = translate_creature_label(source);
        break;
    case JournalSearchKind::Person:
    case JournalSearchKind::Actor:
        target = translate_legends_name(source, true);
        if (!target) target = translate_procedural_fragment(std::string(source));
        break;
    case JournalSearchKind::Artifact:
        // Artifact headings can be paired native/gloss identities or book
        // titles; neither is a personal name, even when it contains one.
        target = translate_legends_artifact_identity(source);
        if (!target) target = translate_legends_book(source);
        if (!target) target = translate_legends_name(source, false);
        break;
    case JournalSearchKind::Site:
    case JournalSearchKind::Group:
        target = translate_legends_name(source, false);
        if (!target && kind == JournalSearchKind::Group)
            target = translate_procedural_fragment(std::string(source));
        break;
    case JournalSearchKind::Region:
        target = translate_world_region_heading(source);
        if (!target) target = translate_legends_name(source, false);
        break;
    case JournalSearchKind::Organization:
    case JournalSearchKind::PlotOrganization:
        // Intrigue's organization label can be named after its principal
        // actor. It is not necessarily a world historical_entity name.
        target = translate_procedural_fragment(std::string(source));
        if (!target) target = translate_legends_name(source, false);
        if (!target) target = translate_legends_text(std::string(source), false, false);
        break;
    case JournalSearchKind::Agreement:
    case JournalSearchKind::Plot:
        target = translate_announcement_combat(source, "agreement-title");
        if (!target) target = translate_legends_event(source);
        if (!target) target = translate_legends_text(std::string(source), false, false);
        break;
    }
    if (!target) target = exact_literal_translation(source);
    if (!target) target = translate_compositional(std::string(source));
    return target;
}

bool Overlay::translated_journal_search_matches(std::string_view source,
        std::string_view query, JournalSearchKind kind) const {
    TranslationStateScope translation_scope;
    if (!config_.enabled || source.empty() || source.size() > 65536 || query.size() > 4096)
        return false;
    const std::string needle = lower(compact_translated_search_text(query));
    if (needle.empty()) return false;
    const auto matches = [&](std::string_view text) {
        return lower(compact_translated_search_text(text)).find(needle) != std::string::npos;
    };
    if (matches(native_text_to_utf8(source))) return true;
    const auto target = translate_journal_title(source, kind);
    return target && matches(*target);
}

// One translated-search policy for every Legends catalog. Sources come from
// native candidate records, never from clipped or currently visible rows.
bool Overlay::translated_legends_search_matches(std::string_view source,
        std::string_view description, std::string_view query, LegendsSearchKind kind) const {
    TranslationStateScope translation_scope;
    if (!config_.enabled || source.size() + description.size() > 65536 ||
        (source.empty() && description.empty()) || query.size() > 4096) return false;
    const std::string needle = lower(compact_translated_search_text(query));
    if (needle.empty()) return false;
    const auto normalize = [](std::string_view value) {
        return lower(compact_translated_search_text(value));
    };
    // Keep authored Chinese names and mixed native/UTF-8 text literal.
    if (normalize(native_text_to_utf8(source)).find(needle) != std::string::npos ||
        normalize(native_text_to_utf8(description)).find(needle) != std::string::npos)
        return true;

    std::string key(1, static_cast<char>(kind));
    key.append(source).push_back('\0');
    key.append(description);
    auto cached = legends_search_translation_cache_.find(key);
    if (cached == legends_search_translation_cache_.end()) {
        std::optional<std::string> title;
        bool description_in_title = false;
        const bool written = kind == LegendsSearchKind::Artifact ||
                             kind == LegendsSearchKind::WrittenContent;
        if (kind == LegendsSearchKind::Figure && !source.empty() && !description.empty()) {
            const bool unnamed = source == "Unnamed";
            const std::string record = std::string(source) + (unnamed ? " " : ", ") +
                std::string(description);
            // Figure records accept name spellings that are not generic
            // title shapes. Preserve exactly the display's complete parser.
            if (unnamed) {
                title = translate_legends_unnamed_figure(record);
                description_in_title = title.has_value();
            } else if (split_legends_figure_record(record)) {
                title = translate_procedural_fragment(record);
                description_in_title = title.has_value();
            }
        }
        if (!source.empty() && !title) {
            if (written) {
                // Exactly the two-column artifact/book display strategy:
                // repeated book titles use book grammar, not creature names.
                title = split_generated_name_identity(source) || split_repeated_title_identity(source)
                    ? translate_legends_artifact_identity(source) : translate_legends_book(source);
            } else if (kind == LegendsSearchKind::Population) {
                // Population rows display an English entity gloss or the
                // existing species/region participant phrase, not a paired
                // native personal name. Keep that scoped grammar intact.
                title = exact_literal_translation(source);
                if (!title && source.starts_with("the "))
                    title = translate_legends_participant(source, std::nullopt, 0);
                if (!title) title = translate_legends_name(source, false);
                if (!title) title = translate_legends_term(source);
            } else {
                if (kind == LegendsSearchKind::Region)
                    title = translate_world_region_heading(source);
                if (!title) title = exact_literal_translation(source);
                if (!title && !contains_cjk_utf8(source))
                    title = translate_procedural_fragment(std::string(source));
                if (!title && kind != LegendsSearchKind::Figure && !contains_cjk_utf8(source))
                    title = translate_legends_name(source, false);
                if (!title) title = translate_legends_term(source, false);
            }
        }
        std::optional<std::string> type;
        if (!description.empty() && !description_in_title) {
            if (written) type = translate_item_description_term(std::string(description));
            else if (kind == LegendsSearchKind::Building)
                type = translate_legends_structure_type(description);
            else if (kind == LegendsSearchKind::Figure)
                type = translate_creature_descriptor(description);
            else {
                type = exact_literal_translation(description);
                if (!type) type = translate_legends_term(description);
            }
        }
        std::string target = title.value_or(native_text_to_utf8(source));
        if (!description.empty() && !description_in_title) {
            // Preserve field boundaries in the index so a name/type junction
            // cannot invent a word that occurs in neither displayed field.
            target.push_back('\n');
            target.append(type.value_or(native_text_to_utf8(description)));
        }
        // Normalize fields separately; retain their boundary in cached text.
        const size_t boundary = target.find('\n');
        target = boundary == std::string::npos ? normalize(target) :
            normalize(std::string_view(target).substr(0, boundary)) + '\n' +
            normalize(std::string_view(target).substr(boundary + 1));
        constexpr size_t maximum_records = 65536;
        constexpr size_t maximum_bytes = 32u * 1024u * 1024u;
        const size_t cost = 2 * key.size() + target.size();
        while (!legends_search_translation_order_.empty() &&
                (legends_search_translation_cache_.size() >= maximum_records ||
                 legends_search_translation_bytes_ + cost > maximum_bytes)) {
            const auto oldest = legends_search_translation_cache_.find(
                legends_search_translation_order_.front());
            if (oldest != legends_search_translation_cache_.end()) {
                legends_search_translation_bytes_ -= 2 * oldest->first.size() + oldest->second.size();
                legends_search_translation_cache_.erase(oldest);
            }
            legends_search_translation_order_.pop_front();
        }
        legends_search_translation_bytes_ += cost;
        cached = legends_search_translation_cache_.emplace(key, std::move(target)).first;
        legends_search_translation_order_.push_back(std::move(key));
    }
    return cached->second.find(needle) != std::string::npos;
}
