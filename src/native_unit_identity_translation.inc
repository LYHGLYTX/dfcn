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
    if (unit.form == NativeUnitIdentityForm::Reference) {
        std::string result;
        const auto reference_role = [&](auto &&self, std::string_view raw) -> std::string {
            const std::string_view source = trim_view(raw);
            const std::string folded = lower(std::string(source));
            // The native 103/104 (child/baby) branches keep their caste role
            // and append these statuses; adult roles are replaced outright.
            for (const auto &[suffix, target] : {
                    std::pair<std::string_view, std::string_view>{" slave", "奴隶"},
                    {" prisoner", "囚犯"}}) {
                if (folded.ends_with(suffix) && source.size() > suffix.size())
                    return self(self, source.substr(0, source.size() - suffix.size())) +
                        "（" + std::string(target) + "）";
            }
            if (auto target = translate_creature_label(source)) return *target;
            if (auto target = translate_unit_profession(source, false)) return *target;
            return field_text(source);
        };
        for (const auto &part : unit.reference_parts) {
            std::string value;
            switch (part.kind) {
            case NativeUnitReferencePartKind::Literal: {
                const std::string source = lower(trim(part.source));
                if (source.empty() || source == "the" || source == "a" || source == "an") break;
                if (source == "the force" || source == "force") value = "自然之灵";
                else if (source == "the deity" || source == "deity") value = "神祇";
                else if (source == "ghost" || source == "ghostly") value = "幽灵";
                else if (source == "one") value = "者";
                else if (source == "you") value = "你";
                else if (source == "stray") value = "无主的";
                else if (source == "fierce") value = "凶猛的";
                else if (source == "agitated") value = "躁动的";
                else if (source == "corpse") value = result.empty() ? "尸体" : "的尸体";
                else value = field_text(trim_view(part.source));
                break;
            }
            case NativeUnitReferencePartKind::Authored:
                // Animated names and modes 4/5's direct first-name field are
                // explicit literal strings, with no generated-name inference.
                value = native_text_to_utf8(part.source);
                break;
            case NativeUnitReferencePartKind::GivenName:
                // The known companion branch deliberately renders only the
                // selected identity's first_name. Never add surname WORDs or
                // a nickname which DF did not reveal on this branch.
                if (part.name.language < 0 || contains_cjk_utf8(part.source))
                    value = native_text_to_utf8(part.source);
                else {
                    const auto reviewed = native_name_reviewed_transliterations_.find(
                        lower_native_name(part.name.first_name));
                    value = reviewed != native_name_reviewed_transliterations_.end()
                        ? reviewed->second : transliterate_native_history_name(part.name.first_name);
                    if (value.empty()) value = native_text_to_utf8(part.source);
                }
                break;
            case NativeUnitReferencePartKind::Species:
                if (auto target = translate_creature_descriptor(part.source, true)) value = *target;
                else value = field_text(part.source);
                break;
            case NativeUnitReferencePartKind::Curse:
                if (auto target = translate_creature_descriptor(part.source, false)) value = *target;
                else value = field_text(trim_view(part.source));
                break;
            case NativeUnitReferencePartKind::Appearance: {
                // 717d30's distinguishing body/voice/RAW feature comes from
                // unit+13e8. The complete existing hover grammar owns colors,
                // body size and `<modifier>-<body part>` compounds.
                std::vector<size_t> origins;
                const auto target = RULESETS.translate_with_origins(
                    native_text_to_utf8(lower(trim(part.source))),
                    "::map_hover::unit::appearance", origins);
                value = (target ? *target : field_text(trim_view(part.source))) + "的";
                break;
            }
            case NativeUnitReferencePartKind::Role:
                if (!unit.custom_profession.empty()) {
                    const auto custom = exact_literal_translation(
                        "Unit custom profession: " + unit.custom_profession);
                    value = custom ? *custom : native_text_to_utf8(part.source);
                } else if (part.entity_present) {
                    const std::string suffix = " of " + part.entity_source;
                    const size_t at = part.source.rfind(suffix);
                    const std::string role = part.source.substr(0, at) +
                        part.source.substr(at + suffix.size());
                    NativeUnitIdentity entity;
                    entity.form = NativeUnitIdentityForm::NameOnly;
                    entity.name = part.entity_name;
                    entity.native_name = part.entity_source;
                    entity.english_name = true;
                    const auto target = translate_native_unit_identity(entity);
                    const std::string territory = target && !target->empty() ? *target :
                        part.entity_source.empty() ? "无名势力" : native_text_to_utf8(part.entity_source);
                    value = territory +
                        "的" + reference_role(reference_role, role);
                } else value = reference_role(reference_role, part.source);
                break;
            case NativeUnitReferencePartKind::Name:
            case NativeUnitReferencePartKind::Title: {
                NativeUnitIdentity identity;
                identity.form = NativeUnitIdentityForm::NameOnly;
                identity.name = part.name;
                identity.native_name = part.source;
                identity.native_name_words = part.native_name_words;
                identity.native_name_words_valid = part.native_name_words_valid;
                identity.english_name = part.english_name;
                const auto name = translate_native_unit_identity(identity);
                value = name && !name->empty() ? *name :
                    part.kind == NativeUnitReferencePartKind::Title && part.source.empty()
                        ? "无名势力" : native_text_to_utf8(part.source);
                if (part.kind == NativeUnitReferencePartKind::Title) value = "（" + value + "）";
                else if (!result.empty()) result += ' ';
                break;
            }
            }
            result += value;
        }
        return result.empty() ? std::nullopt : std::optional<std::string>(std::move(result));
    }
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
