// Render one semantic identity for drawing and searching. Classification is
// already settled by native fields and formatter arguments, not its spelling.
std::optional<std::string> Overlay::translate_native_unit_identity(
        const NativeUnitIdentity &unit) const {
    TranslationStateScope translation_scope;
    NativeUnitIdentityRenderScope rendering;
    const auto field_text = [&](std::string_view source) {
        if (auto target = translate_creature_descriptor(source, true)) return *target;
        if (auto target = exact_literal_translation(source)) return *target;
        return native_text_to_utf8(source);
    };
    const auto role = [&]() -> std::string {
        // An animated unit's explicit name replaces the entire role in DF.
        if (!unit.animated_name.empty()) return native_text_to_utf8(unit.animated_name);
        if (!unit.use_custom || unit.custom_profession.empty()) {
            // This is the game's actual RAW/occupation formatter result. Its
            // source type is known even if it happens to equal a custom name.
            if (auto target = translate_creature_label(unit.native_role)) return *target;
            if (auto target = translate_unit_profession(unit.native_role, false)) return *target;
            return native_text_to_utf8(unit.native_role);
        }
        std::string value;
        switch (unit.prefix) {
        case NativeUnitNamePrefix::Stray: value = "无主的"; break;
        case NativeUnitNamePrefix::Fierce: value = "凶猛的"; break;
        case NativeUnitNamePrefix::Agitated: value = "躁动的"; break;
        case NativeUnitNamePrefix::None: break;
        }
        if (unit.ghostly) value += creature_name_status_prefix.at("ghostly");
        if (unit.curse_named && unit.curse_name.empty() && !unit.curse_name_prefix.empty())
            value += field_text(unit.curse_name_prefix);
        // Only an explicit whole-field override can translate an authored
        // profession. Do not infer its meaning from ordinary role, species,
        // or procedural-name rules; all other custom wording stays literal.
        const auto custom = exact_literal_translation(
            "Unit custom profession: " + unit.custom_profession);
        value += custom ? *custom : native_text_to_utf8(unit.custom_profession);
        if (unit.curse_named && !unit.curse_name.empty()) value += field_text(unit.curse_name);
        if (unit.undead) value += "的尸体";
        return value;
    };
    const auto phonetic_name = [&]() -> std::optional<std::string> {
        if (!unit.name.has_name || !unit.native_name_words_valid) return std::nullopt;
        const auto phonetic_word = [&](std::string_view word) -> std::string {
            if (word.empty()) return {};
            if (contains_cjk_utf8(word)) return native_text_to_utf8(word);
            const auto reviewed = native_name_reviewed_transliterations_.find(
                lower_native_name(std::string(word)));
            return reviewed != native_name_reviewed_transliterations_.end() && !reviewed->second.empty()
                ? reviewed->second : transliterate_native_history_name(word);
        };
        // The game selected these precise WORD roots and their language.
        // Keep the established per-root pronunciation without splitting the
        // displayed name or substituting the WORDs' English meanings.
        std::string result;
        const bool nickname = !unit.name.nickname.empty();
        const auto nickname_target = nickname
            ? exact_literal_translation("Unit nickname: " + unit.name.nickname) : std::nullopt;
        const std::string nickname_text = nickname_target
            ? *nickname_target : native_text_to_utf8(unit.name.nickname);
        if (nickname && (unit.name.nickname_mode == 0 || unit.name.nickname_mode == 2))
            result = "“" + nickname_text + "”";
        else {
            result = phonetic_word(unit.name.first_name);
            if (nickname) result += "“" + nickname_text + "”";
        }
        if (nickname && unit.name.nickname_mode == 2) return result;
        const auto append_group = [&](size_t first, size_t last) {
            std::string group;
            for (size_t slot = first; slot <= last; ++slot)
                group += phonetic_word(unit.native_name_words[slot]);
            if (group.empty()) return;
            if (!result.empty()) result += "·";
            result += group;
        };
        append_group(0, 1);
        if (!unit.name.words[2].id.empty() || !unit.name.words[3].id.empty() ||
                !unit.name.words[5].id.empty()) append_group(2, 5);
        append_group(6, 6);
        return result.empty() ? std::nullopt : std::optional<std::string>(std::move(result));
    };
    const auto name = [&]() -> std::string {
        if (unit.native_name.empty()) return {};
        std::optional<std::string> value;
        // A language-less name without WORD slots is literal authored data.
        if (unit.name.language < 0 && unit.name.nickname.empty() &&
                std::all_of(unit.name.words.begin(), unit.name.words.end(),
                    [](const auto &word) { return word.id.empty(); }))
            value = native_text_to_utf8(unit.name.first_name);
        // The native formatter explicitly chooses original language versus
        // English gloss. Its original-language WORD table is independent of
        // the English POS forms used by the semantic history-name renderer.
        else if (unit.english_name || unit.name.language < 0)
            value = translate_history_name(unit.name);
        else value = phonetic_name();
        std::string result = value && !value->empty() ? *value : native_text_to_utf8(unit.native_name);
        if (unit.name_quoted) result = "“" + result + "”";
        return result;
    };

    std::string result;
    if (unit.form != NativeUnitIdentityForm::Role) result = name();
    if (unit.form == NativeUnitIdentityForm::NameOnly) return result;
    if (unit.form == NativeUnitIdentityForm::Name && !result.empty()) return result;
    const std::string occupation = role();
    if (!result.empty() && !occupation.empty()) result += "，";
    result += occupation;
    if (unit.show_gender && unit.two_genders && (unit.sex == 0 || unit.sex == 1)) {
        // Keep the user's authored spelling and the native gelding marks.
        result += unit.use_custom && !unit.custom_profession.empty() ? "," : "，";
        if (unit.gelded) result += 'x';
        result += unit.sex == 0 ? "♀" : "♂";
        if (unit.gelded) result += 'x';
    }
    if (unit.include_status && unit.tame) {
        static constexpr std::array<std::string_view, 8> levels = {{
            "半野生", "已训练", "-已训练-", "+已训练+", "*已训练*",
            "≡已训练≡", "☼已训练☼", "驯服"
        }};
        const auto level = unit.training_level >= 0 && unit.training_level < 8
            ? static_cast<size_t>(unit.training_level) : 0;
        result += "(";
        result += levels[level];
        result += ")";
    }
    return result;
}
