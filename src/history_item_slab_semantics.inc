const auto item_slab_description = [&]() -> std::optional<Pieces> {
    if (!number("slab.has_writing")) return Pieces{};
    const int32_t source = number("slab.structured");
    if (source == 0 || source == 2) {
        // Secret slabs recover the selected interaction source's original
        // IS_NAME. Custom/memorial writing retains its saved creation-time
        // source because the original random choices are not all persisted.
        const auto translated = source == 2 ?
            native_raw_description(text("slab.secret.label"), NativeSourceText::Name) :
            native_raw_description(text("slab.saved_writing"), NativeSourceText::Inscription);
        if (!translated) return std::nullopt;
        return item_improvement_apply("sentence", "The slab reads \"{q}\".",
            {Pieces{piece(*translated, neutral)}});
    }
    if (source != 1) return std::nullopt;
    // Rebuild the true-name writing from the identity WORD slots and exact
    // artifact binding agreement, preserving the original orthography.
    auto raw_name = translate_procedural_fragment(text("slab.native_name"), true,
        false, {}, ProceduralFragmentContext::generated_name);
    if (!raw_name) {
        std::istringstream words(text("slab.native_name"));
        std::string word, rendered;
        while (words >> word) {
            const auto reviewed = native_name_reviewed_transliterations_.find(lower_native_name(word));
            const std::string part = reviewed != native_name_reviewed_transliterations_.end()
                && !reviewed->second.empty() ? reviewed->second : transliterate_native_history_name(word);
            if (part.empty()) return std::nullopt;
            if (!rendered.empty()) rendered += "·";
            rendered += part;
        }
        if (!rendered.empty()) raw_name = std::move(rendered);
    }
    if (!raw_name || raw_name->empty()) return std::nullopt;
    std::vector<Pieces> fields{Pieces{piece(*raw_name, neutral)}};
    std::string key = "I am {n}";
    if (number("slab.alternate_name")) {
        auto meaning = subject(NativeHistoryObjectKind::Identity, number("slab.true_identity"), false);
        if (!meaning) return std::nullopt;
        key += ", {n}";
        fields.push_back(*meaning);
    }
    auto deity = subject(NativeHistoryObjectKind::Figure, number("slab.deity"), false);
    if (!deity) return std::nullopt;
    fields.push_back(*deity);
    key += ", once of the Underworld. By {n}, I bind myself to this place.";
    auto inscription = item_improvement_apply("sentence", key, fields);
    return inscription ? item_improvement_apply("sentence", "The slab reads \"{q}\".", {*inscription}) : std::nullopt;
};
