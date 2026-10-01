// Complete character description grammar, shared by Health -> Description,
// adventurer creation -> Appearance, and the legacy screen-row fallback.
std::optional<std::string> Overlay::translate_health_description_block(
        std::string_view source, std::vector<size_t> *origins) const {
    if (origins) origins->clear();
    auto translate_complete_mapping = [&](std::string_view raw_source)
            -> std::optional<std::string> {
        // DESCRIPTION entries are generated with collapsed RAW/PO whitespace,
        // while native paragraphs retain double spaces between sentences.
        // Normalize only the lookup key: source views and color origins must
        // continue to refer to the untouched native document.
        const std::string source = normalize_utterance(raw_source);
        if (source.empty()) return std::nullopt;
        // Complete RAW introductions carry P and deliberately never enter
        // the row-local tries. Use the shared exact index, which includes
        // both ordinary literals and complete prose without widening either
        // rule's screen-matching scope.
        if (auto translated = exact_literal_translation(source))
            return normalize_chinese_ui_punctuation(std::move(*translated));

        // Several appearance templates can match the same sentence. Prefer
        // the rule with the most literal source text (`Her hair ...`) over a
        // generic capture (`{s} hair ...`), which would render `Her` as `她的`
        // and then append another possessive marker from the target template.
        size_t best_literal_bytes = 0;
        std::optional<std::string> best;
        for (int rule_index : template_rules_) {
            const Rule &rule = rules_[static_cast<size_t>(rule_index)];
            size_t end = 0;
            std::vector<std::string> captures;
            if (!match_template(rule, source, 0, &end, &captures) ||
                end != source.size()) {
                continue;
            }
            bool captures_complete = true;
            std::string rendered = translate_template_captures(
                rule, captures, &captures_complete);
            if (!captures_complete || std::any_of(rendered.begin(), rendered.end(),
                    [](unsigned char c) { return (c >= 'a' && c <= 'z') ||
                                               (c >= 'A' && c <= 'Z'); })) continue;
            size_t literal_bytes = 0;
            for (const std::string &part : rule.template_literals)
                literal_bytes += part.size();
            if (!best || literal_bytes > best_literal_bytes) {
                best_literal_bytes = literal_bytes;
                best = normalize_chinese_ui_punctuation(std::move(rendered));
            }
        }
        return best;
    };
    std::function<std::optional<std::string>(std::string_view, bool)> translate_appearance_noun;
    translate_appearance_noun = [&](std::string_view raw, bool personal)
            -> std::optional<std::string> {
        const std::string source = trim(std::string(raw));
        // The native feature, hairstyle and missing-part builders all append
        // a layer to its anatomical owner using "'s " (PE 0x713c53,
        // 0x714add, 0x7163a2). The owner is a noun, never an adjective.
        const size_t owner_at = source.find("'s ");
        if (owner_at != std::string::npos) {
            auto owner = translate_appearance_noun(
                std::string_view(source).substr(0, owner_at), false);
            auto layer = translate_appearance_noun(
                std::string_view(source).substr(owner_at + 3), false);
            if (owner && layer) return *owner + "的" + *layer;
            return std::nullopt;
        }
        if (personal) {
            if (auto noun = RULESETS.translate_appearance_term(source, "personal_noun"))
                return noun;
        }
        if (auto noun = RULESETS.translate_appearance_term(source, "noun")) return noun;
        if (auto noun = RULESETS.translate_appearance_term(source, "raw::noun")) return noun;
        return RULESETS.translate_anatomy(source);
    };
    auto translate_wound_sentence = [&](std::string_view raw_sentence)
            -> std::optional<std::string> {
        std::string_view sentence = trim_view(raw_sentence);
        if (!sentence.empty() && sentence.back() == '.')
            sentence.remove_suffix(1);
        // This native injury is emitted with a nominative subject, unlike
        // the anatomical wound clauses (PE 0x7125bc).
        for (const auto &[pronoun, chinese] : {
                std::pair<std::string_view, std::string_view>{"He", "他"},
                {"She", "她"}, {"It", "它"}}) {
            if (sentence == std::string(pronoun) + " is gelded") {
                if (auto condition = RULESETS.translate_appearance_term("gelded", "wound"))
                    return std::string(chinese) + *condition + "。";
            }
        }
        std::string_view possessive;
        if (sentence.starts_with("Her ")) {
            possessive = "她的";
            sentence.remove_prefix(4);
        } else if (sentence.starts_with("His ")) {
            possessive = "他的";
            sentence.remove_prefix(4);
        } else if (sentence.starts_with("Its ")) {
            possessive = "它的";
            sentence.remove_prefix(4);
        } else if (sentence.starts_with("Their ")) {
            possessive = "它们的";
            sentence.remove_prefix(6);
        } else {
            return std::nullopt;
        }
        size_t predicate_at = std::string_view::npos;
        std::string_view copula;
        for (std::string_view separator : {" is ", " are ", " bears ", " bear ",
                                          " has ", " have "}) {
            const size_t at = sentence.find(separator);
            if (at < predicate_at) { predicate_at = at; copula = separator; }
        }
        if (predicate_at == std::string_view::npos) return std::nullopt;
        const std::string body_part(sentence.substr(0, predicate_at));
        const std::string predicate(sentence.substr(predicate_at + copula.size()));
        auto translated_body = translate_appearance_noun(body_part, false);
        if (!translated_body) translated_body = translate_compositional(body_part);
        if (!translated_body) translated_body = exact_literal_translation(body_part);
        if (!translated_body || translated_body->empty()) return std::nullopt;

        // Scars use a different verb from open wounds. Keep their article,
        // length and shape together in the scoped appearance vocabulary;
        // the subject still uses the shared anatomical names and ownership.
        if (copula == " bears " || copula == " bear ") {
            auto scar = RULESETS.translate_appearance_term(predicate, "scar");
            if (!scar) return std::nullopt;
            return std::string(possessive) + *translated_body + *scar + "。";
        }
        if (auto condition = RULESETS.translate_appearance_term(predicate, "wound")) {
            return std::string(possessive) + *translated_body +
                   (predicate == "a compound fracture" || predicate == "compound fractures"
                       ? "出现了" : "") +
                   *condition + "。";
        }
        auto translate_fluid = [&](const std::string &fluid) -> std::optional<std::string> {
            auto translated_fluid = translate_compositional(fluid);
            if (!translated_fluid)
                translated_fluid = translate_procedural_fragment(fluid);
            if (!translated_fluid)
                translated_fluid = exact_literal_translation(fluid);
            if (!translated_fluid || translated_fluid->empty())
                return std::nullopt;
            return translated_fluid;
        };
        // Fluid names come from the creature's blood material, independently
        // of the six native emission levels (PE 0x712812..0x712856).
        for (std::string_view verb : {"gouting", "gushing", "spraying", "running with",
                                      "dripping", "oozing"}) {
            const std::string prefix = std::string(verb) + " ";
            if (!predicate.starts_with(prefix)) continue;
            auto action = RULESETS.translate_appearance_term(std::string(verb), "wound_fluid");
            auto fluid = translate_fluid(predicate.substr(prefix.size()));
            if (action && fluid)
                return std::string(possessive) + *translated_body + *action + *fluid + "。";
            return std::nullopt;
        }
        const size_t swelling = predicate.find(" with ");
        if (swelling != std::string::npos &&
            std::string_view(predicate).substr(0, swelling).ends_with("swollen")) {
            auto condition = RULESETS.translate_appearance_term(predicate.substr(0, swelling), "wound");
            auto fluid = translate_fluid(predicate.substr(swelling + 6));
            if (condition && fluid)
                return std::string(possessive) + *translated_body + "因积聚" + *fluid + "而" +
                    *condition + "。";
        }
        return std::nullopt;
    };
    auto has_ascii_letters = [](std::string_view text) {
        return std::any_of(text.begin(), text.end(), [](unsigned char ch) {
            return (ch >= 'A' && ch <= 'Z') || (ch >= 'a' && ch <= 'z');
        });
    };
    auto strip_attributive_suffix = [](std::string value) {
        static constexpr std::string_view suffix = "的";
        if (value.ends_with(suffix))
            value.resize(value.size() - suffix.size());
        return value;
    };
    auto translate_complete_appearance_term = [&](std::string_view raw)
            -> std::optional<std::string> {
        const std::string source = trim(std::string(raw));
        if (source.empty()) return std::nullopt;
        auto translated = exact_literal_translation(source);
        if (!translated) translated = translate_compositional(source);
        if (!translated) translated = translate_procedural_fragment(source);
        if (!translated || translated->empty() || *translated == source ||
            has_ascii_letters(*translated)) {
            return std::nullopt;
        }
        return trim(std::move(*translated));
    };
    auto split_english_list = [](std::string_view raw) {
        std::string normalized = trim(std::string(raw));
        auto replace_all = [&](std::string_view from, std::string_view to) {
            size_t at = 0;
            while ((at = normalized.find(from, at)) != std::string::npos) {
                normalized.replace(at, from.size(), to);
                at += to.size();
            }
        };
        replace_all(", and ", ", ");
        replace_all(" and ", ", ");
        std::vector<std::string> parts;
        size_t cursor = 0;
        while (cursor < normalized.size()) {
            const size_t comma = normalized.find(',', cursor);
            const size_t end = comma == std::string::npos
                ? normalized.size() : comma;
            std::string part = trim(normalized.substr(cursor, end - cursor));
            if (!part.empty()) parts.push_back(std::move(part));
            if (comma == std::string::npos) break;
            cursor = comma + 1;
        }
        return parts;
    };
    auto join_chinese_list = [](const std::vector<std::string> &parts) {
        std::string joined;
        for (size_t index = 0; index < parts.size(); ++index) {
            if (index > 0)
                joined += index + 1 == parts.size() ? "与" : "、";
            joined += parts[index];
        }
        return joined;
    };
    std::function<std::optional<std::string>(std::string_view)> translate_appearance_colour;
    translate_appearance_colour = [&](std::string_view raw)
            -> std::optional<std::string> {
        const std::string colour = trim(std::string(raw));
        if (auto plain = RULESETS.translate_color(colour)) return plain;
        // The native portrait builder (PE 0x715a16..0x71606d) combines two
        // complete colour patterns, not merely two colour names. The second
        // striped pattern uses a suffix; spotted patterns retain a base colour.
        for (const auto &[marker, chinese] : {
                std::pair<std::string_view, std::string_view>{" mixed with ", "，夹杂着"},
                {" with flecks of ", "，夹杂着点点"},
                {" with a touch of ", "，略带"},
                {" with some ", "，夹杂着一些"}}) {
            const size_t at = colour.find(marker);
            if (at == std::string::npos) continue;
            auto base = translate_appearance_colour(std::string_view(colour).substr(0, at));
            auto mixed = translate_appearance_colour(
                std::string_view(colour).substr(at + marker.size()));
            if (base && mixed) return *base + std::string(chinese) + *mixed;
            return std::nullopt;
        }
        auto colour_list = [&](std::string_view source) -> std::optional<std::string> {
            std::vector<std::string> colours;
            for (const auto &part : split_english_list(source)) {
                auto translated = RULESETS.translate_color(part);
                if (!translated) return std::nullopt;
                colours.push_back(std::move(*translated));
            }
            return colours.empty() ? std::nullopt
                : std::optional<std::string>(join_chinese_list(colours));
        };
        if (colour.ends_with(" spots")) {
            const std::string_view pattern(colour.data(), colour.size() - 6);
            const size_t at = pattern.find(" with ");
            if (at != std::string_view::npos) {
                auto base = colour_list(pattern.substr(0, at));
                auto spots = colour_list(pattern.substr(at + 6));
                if (base && spots) return *base + "底，带有" + *spots + "斑点";
                return std::nullopt;
            }
            if (auto spots = colour_list(pattern)) return *spots + "斑点";
        }
        if (colour.ends_with(" stripes")) {
            if (auto stripes = colour_list(
                    std::string_view(colour).substr(0, colour.size() - 8)))
                return *stripes + "条纹";
        }
        for (const auto &[prefix, chinese] : {
                std::pair<std::string_view, std::string_view>{"striped ", "条纹相间"},
                {"mottled ", "斑驳相间"}, {"spotted ", "斑点相间"}}) {
            if (!colour.starts_with(prefix)) continue;
            if (auto colours = colour_list(std::string_view(colour).substr(prefix.size())))
                return *colours + std::string(chinese);
            return std::nullopt;
        }
        if (auto mixed = RULESETS.translate_appearance_term(colour, "color"))
            return mixed;
        return std::nullopt;
    };
    std::function<std::optional<std::string>(std::string_view)> translate_appearance_descriptor;
    translate_appearance_descriptor = [&](std::string_view raw)
            -> std::optional<std::string> {
        const std::string source = trim(std::string(raw));
        if (auto colour = translate_appearance_colour(source)) return colour;
        static constexpr std::pair<std::string_view, std::string_view> patterns[] = {
            {"mottled ", "斑驳相间"},
            {"spotted ", "斑点相间"},
            {"striped ", "条纹相间"},
        };
        for (const auto &[prefix, chinese_pattern] : patterns) {
            if (!source.starts_with(prefix)) continue;
            const auto colour_sources =
                split_english_list(std::string_view(source).substr(prefix.size()));
            std::vector<std::string> colours;
            colours.reserve(colour_sources.size());
            for (const std::string &colour_source : colour_sources) {
                auto colour = translate_appearance_colour(colour_source);
                if (!colour) return std::nullopt;
                colours.push_back(std::move(*colour));
            }
            if (colours.empty()) return std::nullopt;
            return join_chinese_list(colours) + std::string(chinese_pattern);
        }

        const auto colour_sources = split_english_list(source);
        if (colour_sources.size() > 1) {
            std::vector<std::string> colours;
            colours.reserve(colour_sources.size());
            for (const std::string &colour_source : colour_sources) {
                auto colour = translate_appearance_colour(colour_source);
                if (!colour) {
                    colours.clear();
                    break;
                }
                colours.push_back(std::move(*colour));
            }
            if (!colours.empty())
                return join_chinese_list(colours) + "相间";
        }
        if (auto colour = translate_appearance_colour(source)) return colour;

        // Resolve adjective phrases before general item/material composition.
        // In particular "unkempt" must use the ordinary appearance entry,
        // not the Legends material qualifier with the same English spelling.
        if (auto literal = translate_complete_mapping(source)) return literal;
        for (std::string_view modifier : {"slightly", "somewhat", "very", "quite",
                 "extremely", "incredibly", "deeply", "sharply", "nearly",
                 "extraordinarily"}) {
            if (!source.starts_with(std::string(modifier) + " ")) continue;
            auto prefix = translate_complete_mapping(modifier);
            auto tail = translate_appearance_descriptor(
                std::string_view(source).substr(modifier.size() + 1));
            if (prefix && tail) return *prefix + *tail;
        }
        const auto descriptors = split_english_list(source);
        if (descriptors.size() > 1) {
            std::vector<std::string> parts;
            for (const auto &descriptor : descriptors) {
                auto part = translate_appearance_descriptor(descriptor);
                if (!part) return std::nullopt;
                parts.push_back(strip_attributive_suffix(std::move(*part)));
            }
            return join_chinese_list(parts);
        }
        // Adjacent modifiers ("slightly close-set copper eyes") are not one
        // dictionary capture. Split only at word boundaries, longest first.
        for (size_t at = source.rfind(' '); at != std::string::npos;
             at = at == 0 ? std::string::npos : source.rfind(' ', at - 1)) {
            auto left = translate_complete_mapping(std::string_view(source).substr(0, at));
            if (!left) continue;
            auto right = translate_appearance_descriptor(std::string_view(source).substr(at + 1));
            if (right) return strip_attributive_suffix(*left) + "、" + *right;
        }

        if (source.starts_with("oozing ")) return std::nullopt;
        if (RULESETS.translate_appearance_term(source, "wound")) return std::nullopt;
        auto translated = translate_complete_appearance_term(source);
        if (!translated) return std::nullopt;
        translated = strip_attributive_suffix(std::move(*translated));
        return translated->empty() ? std::nullopt : std::move(translated);
    };
    static constexpr std::pair<std::string_view, std::string_view> features[] = {
            {"hair", "毛发"}, {"skin", "皮肤"},
            {"eye", "眼睛"}, {"eyes", "眼睛"},
            {"feather", "羽毛"}, {"feathers", "羽毛"},
            {"scale", "鳞片"}, {"scales", "鳞片"},
            {"fur", "毛皮"}, {"shell", "外壳"},
            {"chitin", "甲壳"}, {"hide", "皮毛"},
            {"mane", "鬃毛"}, {"horn", "角"}, {"horns", "角"},
            {"tusk", "獠牙"}, {"tusks", "獠牙"},
            {"beak", "喙"}, {"claw", "爪子"}, {"claws", "爪子"},
            {"hoof", "蹄"}, {"hooves", "蹄"},
            {"wing", "翅膀"}, {"wings", "翅膀"},
            {"tail", "尾巴"}, {"antenna", "触角"}, {"antennae", "触角"},
            {"pincer", "螯"}, {"pincers", "螯"},
            {"tooth", "牙齿"}, {"teeth", "牙齿"},
            {"head", "头部"}, {"ear", "耳朵"}, {"ears", "耳朵"},
            {"nose", "鼻子"}, {"nose bridge", "鼻梁"},
            {"lip", "嘴唇"}, {"lips", "嘴唇"},
            {"eyebrow", "眉毛"}, {"eyebrows", "眉毛"},
            {"eyelash", "睫毛"}, {"eyelashes", "睫毛"},
            {"voice", "嗓音"}, {"irises", "虹膜"}, {"lobes", "耳垂"},
            {"chin", "下巴"}, {"cheekbone", "颧骨"}, {"cheekbones", "颧骨"},
            {"beard", "胡须"}, {"sideburns", "鬓角"},
            {"moustache", "八字胡"}, {"torso", "躯干"},
            {"arm", "手臂"}, {"arms", "手臂"},
            {"leg", "腿"}, {"legs", "腿"}, {"body", "身体"},
            {"markings", "斑纹"}, {"finger", "手指"}, {"fingers", "手指"},
            {"quills", "棘刺"}, {"flipper", "鳍肢"}, {"flippers", "鳍肢"},
            {"back flippers", "后鳍肢"}, {"hump", "驼峰"}, {"humps", "驼峰"},
            {"neck", "颈部"}, {"belly", "腹部"}, {"antlers", "鹿角"},
            {"trunk", "象鼻"}, {"mask", "面部斑纹"},
            {"poison spurs", "毒距"}, {"carapace", "甲壳"},
            {"tentacles", "触手"}, {"spines", "棘刺"},
            {"stripe", "条纹"}, {"stripes", "条纹"},
            {"foot", "脚"}, {"feet", "脚"},
            {"shape", "体形"}, {"coat", "皮毛"}, {"face", "面部"},
            {"distinct head", "特征鲜明的头部"},
            {"long body", "修长的身体"}, {"short tail", "短尾巴"},
            {"flat tail", "扁平的尾巴"}, {"powerful legs", "强壮的腿"},
    };
    auto translate_body_feature = [&](std::string_view raw)
            -> std::optional<std::string> {
        const std::string source = trim(std::string(raw));
        if (auto noun = translate_appearance_noun(source, false)) return noun;
        for (const auto &[english, chinese] : features) {
            auto noun = [&] {
                auto translated = translate_complete_mapping(english);
                return translated ? *translated : std::string(chinese);
            };
            if (source == english) return noun();
            const std::string suffix = " " + std::string(english);
            if (!source.ends_with(suffix)) continue;
            auto modifier = translate_appearance_descriptor(
                std::string_view(source).substr(0, source.size() - suffix.size()));
            if (modifier) return strip_attributive_suffix(*modifier) + "的" + noun();
        }
        return std::nullopt;
    };

    auto appearance_term = [](std::string_view text, std::string_view context) {
        return RULESETS.translate_appearance_term(
            std::string(text), std::string(context));
    };
    auto join_feature_predicates = [](const std::string &left,
                                      const std::string &right) {
        // Colour and patterned coverings are separate predicates, not another
        // adjective in a stack such as “突出的青铜色的眼睛”.
        const bool separate = left.starts_with("呈") || right.starts_with("呈") ||
            right.starts_with("梳理") || right.starts_with("编成") ||
            right.starts_with("扎成") || right.starts_with("剃") ||
            left.find("相间") != std::string::npos ||
            right.find("相间") != std::string::npos ||
            left.find("，") != std::string::npos || right.find("，") != std::string::npos;
        return left + (separate ? "，" : "而") + right;
    };
    std::function<std::optional<std::string>(std::string_view, std::string_view)>
        translate_feature_predicate;
    auto resolve_feature_predicate = [&](std::string_view raw, std::string_view context)
            -> std::optional<std::string> {
        const std::string_view value = trim_view(raw);
        if (value.empty()) return std::nullopt;
        if (auto word = appearance_term(value, context)) return word;
        if (auto colour = translate_appearance_colour(value)) return "呈" + *colour;
        if (auto word = appearance_term(value, "common")) return word;
        // In the native noun phrase, colour follows both adjective slots.
        // Preserve a complete colour-pattern suffix before splitting lists:
        // the conjunction in "tall striped black and white" belongs to its
        // stripes, not to two independent anatomical predicates.
        for (size_t at = value.find(' '); at != std::string_view::npos;
             at = value.find(' ', at + 1)) {
            auto colour = translate_appearance_colour(value.substr(at + 1));
            if (!colour) continue;
            auto modifier = translate_feature_predicate(value.substr(0, at), context);
            if (modifier) return join_feature_predicates(*modifier, "呈" + *colour);
        }
        for (std::string_view pattern : {"mottled ", "spotted ", "striped "}) {
            if (value.starts_with(pattern)) return translate_appearance_descriptor(value);
        }
        const auto parts = split_english_list(value);
        if (parts.size() > 1) {
            std::vector<std::string> colours;
            for (const auto &part : parts) {
                auto colour = translate_appearance_colour(part);
                if (!colour) { colours.clear(); break; }
                colours.push_back(std::move(*colour));
            }
            if (!colours.empty()) return join_chinese_list(colours) + "相间";
            std::optional<std::string> combined;
            for (const auto &part : parts) {
                auto translated = translate_feature_predicate(part, context);
                if (!translated) return std::nullopt;
                combined = combined ? join_feature_predicates(*combined, *translated)
                                    : std::move(*translated);
            }
            return combined;
        }
        // Resolve degree + contextual adjective BEFORE global literal phrases:
        // “very short” in the global dictionary describes stature, not lashes.
        const size_t space = value.find(' ');
        if (space != std::string_view::npos) {
            if (auto degree = appearance_term(value.substr(0, space), "degree")) {
                auto tail = translate_feature_predicate(value.substr(space + 1), context);
                if (tail) return *degree + *tail;
            }
        }
        if (auto literal = translate_complete_mapping(value))
            return strip_attributive_suffix(std::move(*literal));
        // Adjacent descriptors may include a multiword colour or hairstyle.
        // Every recursive call consumes a nonempty, strictly shorter phrase.
        for (size_t at = value.rfind(' '); at != std::string_view::npos;
             at = at == 0 ? std::string_view::npos : value.rfind(' ', at - 1)) {
            auto left = translate_feature_predicate(value.substr(0, at), context);
            if (!left) continue;
            auto right = translate_feature_predicate(value.substr(at + 1), context);
            if (right) return join_feature_predicates(*left, *right);
        }
        return translate_appearance_descriptor(value);
    };
    // Adjacent multiword descriptors have overlapping split candidates. Cache
    // failures too, so an unfamiliar/modded phrase cannot cause an exponential
    // search through the general translation fallbacks.
    std::unordered_map<std::string, std::optional<std::string>> predicate_cache;
    translate_feature_predicate = [&](std::string_view raw, std::string_view context) {
        const std::string key = std::string(context) + "\n" + std::string(raw);
        const auto found = predicate_cache.find(key);
        if (found != predicate_cache.end()) return found->second;
        auto result = resolve_feature_predicate(raw, context);
        predicate_cache.emplace(key, result);
        return result;
    };
    struct AppearanceFeature {
        std::string context;
        std::string noun;
        std::string_view modifier;
    };
    auto parse_appearance_feature = [&](std::string_view raw, bool personal)
            -> std::optional<AppearanceFeature> {
        const std::string_view phrase = trim_view(raw);
        // Longest anatomical suffix wins: nose bridge is not a generic nose,
        // and back flippers must retain the qualifier identifying the organ.
        std::string_view key;
        for (const auto &[english, chinese] : features) {
            (void)chinese;
            if ((phrase == english || phrase.ends_with(" " + std::string(english))) &&
                english.size() > key.size()) key = english;
        }
        // Scoped anatomical vocabulary may add multiword animal features
        // (front/rear paws) without another hardcoded translation table.
        // Keep the longest noun intact instead of treating its qualifier as
        // an appearance adjective; preceding descriptors remain modifiers.
        for (size_t at = 0; at < phrase.size();) {
            const auto candidate = phrase.substr(at);
            if (candidate.size() <= key.size()) break;
            if (translate_appearance_noun(candidate, personal)) {
                key = candidate;
                break;
            }
            const size_t space = phrase.find(' ', at);
            if (space == std::string_view::npos) break;
            at = space + 1;
        }
        if (key.empty()) return std::nullopt;
        auto noun = translate_appearance_noun(key, personal);
        if (!noun) noun = translate_body_feature(key);
        if (!noun) return std::nullopt;
        std::string context(key);
        for (const auto &[singular, plural] : {
                std::pair<std::string_view, std::string_view>{"eye", "eyes"},
                {"ear", "ears"}, {"lip", "lips"}, {"tooth", "teeth"},
                {"eyelash", "eyelashes"}, {"eyebrow", "eyebrows"}}) {
            if (key == singular || key == plural ||
                key.ends_with(" " + std::string(singular)) ||
                key.ends_with(" " + std::string(plural))) context = plural;
        }
        for (std::string_view feature : {"hair", "skin", "head", "voice", "chin",
                                         "cheekbones", "irises", "lobes", "body"}) {
            if (key.ends_with(" " + std::string(feature))) context = feature;
        }
        return AppearanceFeature{std::move(context), std::move(*noun),
            trim_view(phrase.substr(0, phrase.size() - key.size()))};
    };
    auto render_appearance_feature = [&](const AppearanceFeature &feature,
                                         std::string_view predicate)
            -> std::optional<std::string> {
        std::string main;
        std::string details;
        auto add_detail = [&](const std::string &detail) {
            if (!details.empty()) details += "，";
            details += detail;
        };
        std::function<bool(std::string_view)> collect;
        collect = [&](std::string_view descriptor) {
            descriptor = trim_view(descriptor);
            if (descriptor.empty()) return false;
            if (auto detail = appearance_term(descriptor, "detail_" + feature.context)) {
                add_detail(*detail);
                return true;
            }
            // A lobe/iris detail may occupy either native adjective slot,
            // including the middle of "tall large-irised bronze eyes".
            // Consume the longest complete detail on word boundaries and
            // render its neighbours as ordinary feature predicates.
            auto trim_joiner = [](std::string_view text) {
                text = trim_view(text);
                if (text.starts_with(',')) text = trim_view(text.substr(1));
                if (text.ends_with(',')) text = trim_view(text.substr(0, text.size() - 1));
                if (text.starts_with("and ")) text = trim_view(text.substr(4));
                if (text.ends_with(" and")) text = trim_view(text.substr(0, text.size() - 4));
                if (text.ends_with(',')) text = trim_view(text.substr(0, text.size() - 1));
                return text;
            };
            for (size_t begin = 0; begin < descriptor.size();) {
                for (size_t end = descriptor.size(); end > begin;) {
                    auto detail = appearance_term(
                        trim_joiner(descriptor.substr(begin, end - begin)),
                        "detail_" + feature.context);
                    if (detail) {
                        add_detail(*detail);
                        const auto left = trim_joiner(descriptor.substr(0, begin));
                        const auto right = trim_joiner(descriptor.substr(end));
                        return (left.empty() || collect(left)) &&
                               (right.empty() || collect(right));
                    }
                    const size_t space = descriptor.rfind(' ', end - 1);
                    if (space == std::string_view::npos || space <= begin) break;
                    end = space;
                }
                const size_t space = descriptor.find(' ', begin);
                if (space == std::string_view::npos) break;
                begin = space + 1;
            }
            auto part = translate_feature_predicate(descriptor, feature.context);
            if (!part) return false;
            main = main.empty() ? *part : join_feature_predicates(main, *part);
            return true;
        };
        for (std::string_view descriptor : {feature.modifier, predicate}) {
            if (!descriptor.empty() && !collect(descriptor)) return std::nullopt;
        }
        if (main.empty() && details.empty()) return std::nullopt;
        std::string rendered = main.empty() ? std::string{} : feature.noun + main;
        if (!details.empty()) {
            if (!rendered.empty()) rendered += "，";
            rendered += details;
        }
        return rendered;
    };
    struct AppearanceClause {
        std::string subject;
        std::string predicate;
    };
    std::function<std::optional<AppearanceClause>(std::string_view)>
        parse_appearance_sentence;
    parse_appearance_sentence = [&](std::string_view raw_sentence)
            -> std::optional<AppearanceClause> {
        std::string_view sentence = trim_view(raw_sentence);
        if (sentence.ends_with('.')) sentence.remove_suffix(1);
        // Generated portraits also join complete clauses inside one English
        // sentence: "He has low cheekbones, and he has a round chin." Keep
        // each anatomical noun with its own descriptors before parsing either
        // side; otherwise "low cheekbones, and he has a round" becomes the
        // supposed modifier of "chin". Only split at an explicit subject so
        // adjective/colour lists continue through the feature grammar below.
        for (std::string_view separator : {", and ", " and "}) {
            size_t cursor = 0;
            while (cursor < sentence.size()) {
                const size_t at = sentence.find(separator, cursor);
                if (at == std::string_view::npos) break;
                const std::string_view tail = sentence.substr(at + separator.size());
                bool explicit_subject = false;
                for (std::string_view prefix : {"he has ", "she has ", "it has ",
                         "they have ", "his ", "her ", "its ", "their ",
                         "He has ", "She has ", "It has ", "They have ",
                         "His ", "Her ", "Its ", "Their "}) {
                    if (tail.starts_with(prefix)) { explicit_subject = true; break; }
                }
                if (explicit_subject) {
                    auto left = parse_appearance_sentence(sentence.substr(0, at));
                    if (!left) return std::nullopt;
                    std::string right_source(tail);
                    if (right_source.front() >= 'a' && right_source.front() <= 'z')
                        right_source.front() -= 'a' - 'A';
                    auto right = parse_appearance_sentence(right_source);
                    if (!right || left->subject != right->subject) return std::nullopt;
                    left->predicate += "，" + right->predicate;
                    return left;
                }
                cursor = at + separator.size();
            }
        }
        // Handle both forms in the same paragraph. A single “She has a ...”
        // must not disable the paragraph's subject elision and contextual words.
        for (const auto &[pronoun, chinese] : {
                std::pair<std::string_view, std::string_view>{"She", "她"},
                {"He", "他"}, {"It", "它"}, {"They", "它们"}}) {
            const std::string prefix = std::string(pronoun) +
                (pronoun == "They" ? " have " : " has ");
            if (!sentence.starts_with(prefix)) continue;
            auto phrase = sentence.substr(prefix.size());
            if (phrase.starts_with("a ")) phrase.remove_prefix(2);
            else if (phrase.starts_with("an ")) phrase.remove_prefix(3);
            auto feature = parse_appearance_feature(phrase, pronoun == "She" || pronoun == "He");
            if (!feature) return std::nullopt;
            auto rendered = render_appearance_feature(*feature, {});
            if (!rendered) return std::nullopt;
            return AppearanceClause{std::string(chinese), std::move(*rendered)};
        }
        std::string subject;
        bool personal = false;
        for (const auto &[pronoun, chinese] : {
                std::pair<std::string_view, std::string_view>{"Her", "她"},
                {"His", "他"}, {"Its", "它"}, {"Their", "它们"}}) {
            const std::string prefix = std::string(pronoun) + " ";
            if (!sentence.starts_with(prefix)) continue;
            subject = chinese;
            personal = pronoun == "Her" || pronoun == "His";
            sentence.remove_prefix(prefix.size());
            break;
        }
        if (subject.empty()) return std::nullopt;
        size_t at = std::string_view::npos;
        std::string_view copula;
        for (std::string_view separator : {" is ", " are ", " has ", " have "}) {
            const size_t candidate = sentence.find(separator);
            if (candidate < at) { at = candidate; copula = separator; }
        }
        if (at == std::string_view::npos) return std::nullopt;
        auto feature = parse_appearance_feature(sentence.substr(0, at), personal);
        if (!feature) return std::nullopt;
        auto predicate = sentence.substr(at + copula.size());
        if (copula == " is " || copula == " are ") {
            auto rendered = render_appearance_feature(*feature, predicate);
            if (!rendered) return std::nullopt;
            return AppearanceClause{std::move(subject), std::move(*rendered)};
        }
        auto detail = parse_appearance_feature(predicate, personal);
        if (!detail) return std::nullopt;
        auto rendered = render_appearance_feature(*detail, {});
        if (!rendered) return std::nullopt;
        if (!feature->modifier.empty()) {
            auto main = render_appearance_feature(*feature, {});
            if (!main) return std::nullopt;
            return AppearanceClause{std::move(subject), *main + "，" + *rendered};
        }
        // Iris/lobe already identifies the owner; avoid “耳朵有小的耳垂”.
        if ((feature->context == "eyes" && detail->context == "irises") ||
            (feature->context == "ears" && detail->context == "lobes")) {
            return AppearanceClause{std::move(subject), std::move(*rendered)};
        }
        return AppearanceClause{std::move(subject), feature->noun + "的" + *rendered};
    };
    auto translate_overview_noun_phrase = [&](std::string_view raw,
                                               bool possessed)
            -> std::optional<std::string> {
        std::string source = trim(std::string(raw));
        static constexpr std::pair<std::string_view, std::string_view> complete[] = {
            {"person", "人形生物"}, {"humanoid", "人形生物"},
            {"humanoid creature", "人形生物"},
            {"humanoid monster", "人形怪物"},
            {"man-shaped creature", "人形生物"},
            {"man-like creature", "人形生物"},
            {"creature", "生物"}, {"monster", "怪物"},
            {"man", "人类男子"}, {"woman", "人类女子"},
        };
        if (possessed) {
            if (source == "person") return std::string("人");
            if (source == "man") return std::string("人类男子");
            if (source == "woman") return std::string("人类女子");
        }
        for (const auto &[english, chinese] : complete) {
            if (source == english) return std::string(chinese);
        }

        for (char &ch : source) {
            if (ch == ',') ch = ' ';
        }
        while (source.find("  ") != std::string::npos)
            source.replace(source.find("  "), 2, " ");
        static constexpr std::pair<std::string_view, std::string_view> modifiers[] = {
            {"medium-sized", "中型"}, {"long-bodied", "身躯修长的"},
            {"long-limbed", "四肢修长的"}, {"blue-rumped", "蓝臀的"},
            {"brightly-colored", "色彩鲜艳的"},
            {"dark green", "深绿色的"}, {"long-eared", "长耳的"},
            {"slug-like", "蛞蝓般的"}, {"worm-like", "蠕虫般的"},
            {"bat-like", "蝙蝠般的"},
            {"man-shaped", "人形的"}, {"man-like", "人形的"},
            {"large", "大型"}, {"small", "小型"}, {"tiny", "小型"},
            {"huge", "巨型"}, {"gigantic", "巨型"}, {"giant", "巨型"},
            {"great", "巨大的"}, {"white", "白色的"},
            {"legless", "无腿的"}, {"slender", "纤细的"},
            {"horned", "长角的"}, {"orange", "橙色的"},
            {"grey", "灰色的"}, {"gray", "灰色的"},
            {"striped", "有条纹的"}, {"spotted", "有斑点的"},
            {"spiny", "多刺的"}, {"green", "绿色的"},
            {"hairy", "多毛的"}, {"colorful", "色彩斑斓的"},
            {"muscular", "强壮的"}, {"feathered", "覆有羽毛的"},
            {"crested", "有冠羽的"}, {"reptile", "爬虫类的"},
            {"venomous", "有毒的"},
        };
        std::string prefix;
        bool consumed = true;
        while (consumed) {
            consumed = false;
            for (const auto &[english, chinese] : modifiers) {
                const std::string marker = std::string(english) + " ";
                if (!source.starts_with(marker)) continue;
                prefix += chinese;
                source.erase(0, marker.size());
                consumed = true;
                break;
            }
        }
        for (const auto &[english, chinese] : complete) {
            if (source == english) return prefix + std::string(chinese);
        }
        auto translated = translate_complete_appearance_term(source);
        if (!translated) return std::nullopt;
        return prefix + *translated;
    };
    auto translate_creature_overview_sentence = [&](std::string_view raw_sentence)
            -> std::optional<std::string> {
        std::string_view sentence = trim_view(raw_sentence);
        if (!sentence.empty() && sentence.back() == '.')
            sentence.remove_suffix(1);
        if (sentence.starts_with("An ")) sentence.remove_prefix(3);
        else if (sentence.starts_with("A ")) sentence.remove_prefix(2);
        else return std::nullopt;

        const size_t with_at = sentence.find(" with the ");
        if (with_at == std::string_view::npos) return std::nullopt;
        const std::string_view main_source = sentence.substr(0, with_at);
        const std::string_view details = sentence.substr(with_at + 10);
        size_t owner_at = details.rfind(" of a ");
        size_t owner_prefix = 6;
        const size_t owner_an_at = details.rfind(" of an ");
        if (owner_an_at != std::string_view::npos &&
            (owner_at == std::string_view::npos || owner_an_at > owner_at)) {
            owner_at = owner_an_at;
            owner_prefix = 7;
        }
        if (owner_at == std::string_view::npos) return std::nullopt;

        auto main = translate_overview_noun_phrase(main_source, false);
        auto owner = translate_overview_noun_phrase(
            details.substr(owner_at + owner_prefix), true);
        if (!main || !owner) return std::nullopt;
        const auto part_sources =
            split_english_list(details.substr(0, owner_at));
        std::vector<std::string> parts;
        parts.reserve(part_sources.size());
        for (const std::string &part_source : part_sources) {
            auto part = translate_body_feature(part_source);
            if (!part) return std::nullopt;
            parts.push_back(std::move(*part));
        }
        if (parts.empty()) return std::nullopt;
        return "一种" + *main + "，有着" + *owner + "的" +
               join_chinese_list(parts) + "。";
    };
    auto translate_physical_attributes = [&](std::string_view sentence,
                                             std::vector<size_t> *offsets)
            -> std::optional<std::string> {
        const std::string_view original = sentence;
        if (sentence.ends_with('.')) sentence.remove_suffix(1);
        const size_t subject_end = sentence.find(' ');
        if (subject_end == std::string_view::npos) return std::nullopt;
        const auto subject = sentence.substr(0, subject_end);
        if (subject != "She" && subject != "He" && subject != "It") return std::nullopt;
        auto chinese_subject = translate_complete_mapping(subject);
        if (!chinese_subject) return std::nullopt;
        sentence.remove_prefix(subject_end + 1);
        std::string translated;
        std::vector<size_t> positions;
        auto append = [&](std::string_view text, size_t offset) {
            translated += text;
            positions.insert(positions.end(), text.size(), offset);
        };
        append(*chinese_subject, 0);
        if (!sentence.starts_with("is ") && !sentence.starts_with("isn't ") &&
            !sentence.starts_with("has ") && !sentence.starts_with("bears ") &&
            !sentence.starts_with("would ") && !sentence.starts_with("packs ") &&
            !sentence.starts_with("could ") && !sentence.starts_with("carries "))
            return std::nullopt;
        auto physical_predicate = [&](std::string_view phrase)
                -> std::optional<std::pair<std::string, size_t>> {
            // DF repeats the subject/copula at the green/red boundary.
            for (std::string_view prefix : {"she ", "he ", "it "}) {
                if (phrase.starts_with(prefix)) { phrase.remove_prefix(prefix.size()); break; }
            }
            // Body build, including negative stature and muscle predicates,
            // keeps its whole meaning in the scoped TOML vocabulary. Resolve
            // it before stripping the copula so "isn't tall" retains negation.
            // The native body builder selects one complete predicate from
            // its shape x muscle/fat branch table. Consume that production
            // before interpreting any conjunction inside it as a boundary.
            auto target = appearance_term(phrase, "native_build");
            if (!target) target = appearance_term(phrase, "native_attribute");
            if (!target) target = appearance_term(phrase, "build");
            if (!target && !phrase.starts_with("has ") && !phrase.starts_with("isn't ")) {
                for (std::string_view prefix : {"is ", "manages to be "}) {
                    if (phrase.starts_with(prefix)) { phrase.remove_prefix(prefix.size()); break; }
                }
                // Contrast tails reuse the reviewed physical predicates,
                // e.g. `is very fat`, never material/name meanings of `fat`.
                const std::string copular = "is " + std::string(phrase);
                target = appearance_term(copular, "native_attribute");
                if (!target) target = translate_complete_mapping(copular);
            }
            if (!target) return std::nullopt;
            return std::pair{std::move(*target),
                static_cast<size_t>(phrase.data() - original.data())};
        };
        while (!sentence.empty()) {
            size_t end = sentence.size();
            std::string_view separator;
            // A complete body phrase owns its internal comma/conjunction:
            // `tall, thin frame` and `some muscle and fat` cannot be split.
            // For compound sentences, accept a boundary only after its left
            // side resolves as a complete physical predicate. This also lets
            // `has ... frame but manages to be ...` share the attribute path.
            auto target = physical_predicate(sentence);
            if (!target) {
                for (std::string_view joiner : {", but ", ", and ", " but ", " and ", " yet ", ", "}) {
                    for (size_t at = sentence.find(joiner); at < end;
                         at = sentence.find(joiner, at + joiner.size())) {
                        auto candidate = physical_predicate(sentence.substr(0, at));
                        if (!candidate) continue;
                        end = at;
                        separator = joiner;
                        target = std::move(candidate);
                        break;
                    }
                }
            }
            if (!target) return std::nullopt;
            append(target->first, target->second);
            if (end == sentence.size()) break;
            const size_t separator_offset =
                static_cast<size_t>(sentence.data() - original.data()) + end;
            const size_t contrast = std::min(separator.find("but"), separator.find("yet"));
            if (contrast != std::string_view::npos) {
                // DF emits the comma before switching to the negative color,
                // then emits `but` in that new color. These are distinct
                // semantic origins, even though Chinese joins them as “，但”.
                // Never color the conjunction from the preceding comma or
                // hardcode red: both render paths retain DF's actual palette.
                append("，", separator_offset);
                append("但", separator_offset + contrast);
            } else {
                const size_t conjunction = separator.find("and");
                append("，", separator_offset +
                    (separator.starts_with(',') || conjunction == std::string_view::npos
                        ? 0 : conjunction));
            }
            sentence.remove_prefix(end + separator.size());
        }
        append("。", original.size() - 1);
        if (offsets) *offsets = std::move(positions);
        return translated;
    };
    auto translate_block = [&]() -> std::optional<std::string> {
        // The native Description builder (Windows RVA 0x47a0b2) copies the
        // caste's complete DESCRIPTION without inspecting its opening words.
        // Keep sentence boundaries for contextual attributes and generated
        // clauses, but consume reviewed multi-sentence literals together below.
        std::vector<std::string_view> sentences;
        size_t sentence_cursor = 0;
        while (sentence_cursor < source.size()) {
            while (sentence_cursor < source.size() &&
                   std::isspace(static_cast<unsigned char>(source[sentence_cursor])))
                ++sentence_cursor;
            if (sentence_cursor >= source.size()) break;
            const size_t stop = source.find_first_of(".!?", sentence_cursor);
            const size_t end = stop == std::string_view::npos ? source.size() : stop + 1;
            sentences.push_back(
                source.substr(sentence_cursor, end - sentence_cursor));
            sentence_cursor = end;
        }

        std::string translated;
        std::string previous_subject;
        bool previous_appearance = false;
        size_t appearance_clauses_in_sentence = 0;
        for (size_t index = 0; index < sentences.size(); ++index) {
            const std::string_view sentence = sentences[index];
            std::vector<size_t> offsets;
            auto part = translate_physical_attributes(sentence, origins ? &offsets : nullptr);
            const bool physical = part.has_value();
            if (!part) part = translate_wound_sentence(sentence);
            std::optional<AppearanceClause> appearance;
            if (!part) appearance = parse_appearance_sentence(sentence);
            if (appearance) {
                const bool same_subject = appearance->subject == previous_subject;
                const bool join = same_subject && previous_appearance &&
                    appearance_clauses_in_sentence < 3 && translated.ends_with("。");
                if (join)
                    translated.replace(translated.size() - std::string_view("。").size(),
                        std::string_view("。").size(), "，");
                // Elide repeated subjects without turning the whole portrait
                // into one indefinitely long comma-separated sentence.
                appearance_clauses_in_sentence = join ? appearance_clauses_in_sentence + 1 : 1;
                part = (same_subject ? std::string{} : appearance->subject + "的") +
                    appearance->predicate + "。";
                previous_subject = appearance->subject;
            }
            // RAW descriptions can contain several sentences and can precede
            // other prose in the same block. Match the longest complete span,
            // irrespective of its first word or whether colors are requested.
            // Contextual body clauses above retain their semantic color origins;
            // generic pronoun templates must never claim a multi-sentence span.
            if (!part) {
                for (size_t end_index = sentences.size(); end_index > index; --end_index) {
                    const auto last = sentences[end_index - 1];
                    const auto span = source.substr(
                        static_cast<size_t>(sentence.data() - source.data()),
                        static_cast<size_t>(last.data() + last.size() - sentence.data()));
                    auto literal = exact_literal_translation(normalize_utterance(span));
                    if (!literal) continue;
                    part = normalize_chinese_ui_punctuation(std::move(*literal));
                    index = end_index - 1;
                    break;
                }
            }
            if (!part) part = translate_complete_mapping(sentence);
            if (!part) part = translate_creature_overview_sentence(sentence);
            // Generated species descriptions and experiment origins live in
            // the scoped Legends grammar, outside the ordinary template index.
            // Appearance and Health embed the same prose: keep its recursive
            // descriptors and typed creator/victim/place/color fields intact.
            if (!part) {
                auto generated = translate_legends_text(sentence, false, false);
                if (generated && !generated->empty() && !has_ascii_letters(*generated))
                    part = normalize_chinese_ui_punctuation(std::move(*generated));
            }
            if (!part || part->empty()) return std::nullopt;
            if (origins) {
                const size_t base = static_cast<size_t>(sentence.data() - source.data());
                if (offsets.size() == part->size()) {
                    for (size_t offset : offsets) origins->push_back(base + offset);
                } else origins->insert(origins->end(), part->size(), base);
            }
            translated += *part;
            if (physical) {
                // Keep the stature sentence, but do not repeat its subject at
                // the start of each subsequent appearance clause.
                previous_subject = sentence.starts_with("She ") ? "她" :
                    sentence.starts_with("He ") ? "他" : "它";
            } else if (!appearance) {
                // Do not elide a subject across wounds, species prose or an
                // unknown grammar; only merge consecutive identified clauses.
                previous_subject.clear();
            }
            previous_appearance = appearance.has_value();
        }
        return translated.empty() ? std::nullopt
                                  : std::optional<std::string>(translated);
    };

    return translate_block();
}
