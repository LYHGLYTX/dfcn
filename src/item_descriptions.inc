bool Overlay::is_liquid_food_ingredient(std::string_view source, int native_type) const {
    // A captured ingredient tuple is authoritative, including modded names.
    // DRINK and LIQUID_MISC are shared item_type values, not host ABI policy.
    if (native_type >= 0) return native_type == 69 || native_type == 73;
    const std::string name = lower(trim(native_text_to_utf8(source)));
    if (liquid_material_names_.contains(name)) return true;
    // Templates can retain a generic state name behind an independently
    // supplied animal/plant prefix. Require that complete existing prefix
    // grammar; a wine stew, frozen milk or oil press cake is not a liquid.
    for (size_t space = name.find(' '); space != std::string::npos;
         space = name.find(' ', space + 1)) {
        if (liquid_material_names_.contains(name.substr(space + 1)) &&
            RULESETS.translate_material_prefix(name.substr(0, space))) return true;
    }
    return false;
}

// Item prose uses the same compiled Rule representation as the other scoped
// grammars. Captures must resolve at their semantic boundary: the first period
// in a slab inscription, or the first "and" in a material list, need not end the
// outer capture. Try alternate delimiters without reparsing template syntax.
static std::string normalize_art_utterance(std::string_view source) {
    // The native nickname field is authored text and can contain repeated
    // spaces, quotes and punctuation. Complete art source already retains its
    // native word spacing; sentence and capture boundaries trim their own
    // surrounding whitespace without rewriting the nickname's contents.
    return source.find('`') == std::string_view::npos
        ? normalize_utterance(source) : std::string(trim_view(source));
}

static bool item_description_translation_complete(
        const std::optional<std::string> &target) {
    if (!target || target->empty()) return false;
    const auto ascii_letter = [](unsigned char ch) {
        return (ch >= 'A' && ch <= 'Z') || (ch >= 'a' && ch <= 'z');
    };
    // A typed art-element capture can contain native wear marks, then become
    // an interior noun in a statue or a complete image sentence. Stripping
    // only the outer designation loses that proof after template composition.
    // Accept only exact paired x/X/XX marks enclosing translated CJK content;
    // every other English letter, including one inside the pair, still fails.
    auto complete = [&](auto &&self, std::string_view value, unsigned depth) -> bool {
        if (depth >= 64) return false;
        // Native counts can sit inside or outside the quality/wear pair.
        // Remove only the shared, digit-validated annotations before checking
        // the translated noun; their exact " xN" spelling is not English prose.
        // Every iteration shrinks the view, while interior wear recursion keeps
        // the same depth bound and complete CJK-content requirement below.
        for (;;) {
            const size_t previous = value.size();
            if (const auto suffix = item_number_suffix(value); !suffix.empty())
                value.remove_suffix(suffix.size());
            value = split_item_designation(value).item;
            if (value.size() == previous) break;
        }
        if (value.empty()) return false;
        for (size_t at = 0; at < value.size(); ++at) {
            if (!ascii_letter(static_cast<unsigned char>(value[at]))) continue;
            for (const std::string_view marker : {"XX", "X", "x"}) {
                if (!value.substr(at).starts_with(marker)) continue;
                const size_t end = at + marker.size();
                for (size_t close = value.find(marker, end); close != std::string_view::npos;
                     close = value.find(marker, close + 1)) {
                    const size_t after = close + marker.size();
                    const auto item = value.substr(end, close - end);
                    if (!contains_cjk_utf8(item) || !self(self, item, depth + 1)) continue;
                    if (after == value.size() || self(self, value.substr(after), depth + 1))
                        return true;
                }
            }
            return false;
        }
        return true;
    };
    return complete(complete, *target, 0);
}

// A successfully resolved typed person can retain an authored nickname. Its
// English spelling is user data, not an untranslated part of the art grammar.
// Call this only after a typed resolver succeeded, never for arbitrary literal
// translations. Require the exact native `...' source and its exact rendered
// counterpart; ordinary quotation marks in either language grant no exemption.
// Passing the complete source at every composition boundary also works for
// cached translations without a mutable, cross-paragraph nickname allowlist.
static bool translation_complete_with_native_nicknames(
        const std::optional<std::string> &target, std::string_view source) {
    if (item_description_translation_complete(target)) return true;
    if (!target || target->empty()) return false;
    std::string remaining = *target;
    for (size_t open = source.find('`'); open != std::string_view::npos;
         open = source.find('`', open + 1)) {
        // Nicknames may contain apostrophes and literal backticks. The typed
        // person parser has already established their boundaries and kept
        // separate people apart. Exempt only an exact authored body inside
        // the exact rendered quotes, never an arbitrary English fragment.
        for (size_t close = source.find('\'', open + 1);
             close != std::string_view::npos;
             close = source.find('\'', close + 1)) {
            if (close == open + 1) continue;
            const std::string quoted = "“" + native_text_to_utf8(
                source.substr(open + 1, close - open - 1)) + "”";
            for (size_t at = remaining.find(quoted); at != std::string::npos;
                 at = remaining.find(quoted, at + 3))
                remaining.replace(at, quoted.size(), "名");
        }
    }
    return item_description_translation_complete(remaining);
}

// PE 53.16 0x147e82/0x147ec2/0x147efc identifies a named artifact by its
// complete name followed by " the " and the material/type description from
// the shared item formatter at 0xc65450. The name can be a
// generated artifact name or a written-work title, including title punctuation
// and internal "The" connectors. Prove the entire item suffix before choosing
// that boundary; neither a species-only figure nor ordinary prose is a title.
std::optional<std::string> Overlay::translate_named_art_item(
        std::string_view source) const {
    source = trim_view(source);
    if (source.empty() || source.ends_with("...")) return std::nullopt;
    // The same native element retains Untitled for unnamed written items,
    // and can retain only the artifact name in definite/action references.
    if (source == "Untitled" || source == "an unknown artifact")
        return translate_legends_artifact_identity(source);
    if (source == "unknown artifact")
        return translate_legends_artifact_identity("an unknown artifact");
    const auto pattern = exact_literal_translation("Art image named item: X Y");
    if (!pattern) return std::nullopt;
    for (size_t at = find_template_literal(source, " the ", 0, true);
         at != std::string_view::npos;
         at = find_template_literal(source, " the ", at + 5, true)) {
        const auto name_source = trim_view(source.substr(0, at));
        const auto item_source = trim_view(source.substr(at + 5));
        if (name_source.empty() || item_source.empty()) continue;
        // Figure elements use the same connector, but keep their personal-name
        // semantics in the symbol parser. An item can still carry a creature
        // material, such as harpy parchment, because its full suffix is typed.
        if (translate_creature_descriptor(item_source, true)) continue;
        // The item-term grammar also contains material/ingredient lists. Those
        // must not consume the next depicted element after this artifact.
        // A statue/figurine's own subject is the one typed item production
        // that owns an embedded art-element list; serrated trap components
        // instead have a fixed comma inside their native item noun.
        const auto folded_item = lower(std::string(item_source));
        const bool depicted_item = [&] {
            for (const std::string_view noun :
                    {"statue of ", "statues of ", "figurine of ", "figurines of "}) {
                if (folded_item.starts_with(noun) ||
                    folded_item.find(" " + std::string(noun)) != std::string::npos)
                    return true;
            }
            return false;
        }();
        // a82d7d emits the grown-item flag before every native type branch.
        // The trap branch then appends its RAW prefix, material and noun in
        // that order (a85bb9..a85c3c). Keep the wrapper's meaning in the full
        // parser below while excluding only this proven comma from lists.
        auto list_source = std::string_view(folded_item);
        if (list_source.starts_with("grown ")) list_source.remove_prefix(6);
        if (list_source.starts_with("large, serrated ")) list_source.remove_prefix(16);
        if (!depicted_item && (list_source.find(',') != std::string_view::npos ||
                list_source.find(" and ") != std::string_view::npos) &&
                !item_description_translation_complete(exact_literal_translation(item_source)))
            continue;
        const auto item = translate_item_description_term(item_source);
        if (!translation_complete_with_native_nicknames(item, item_source)) continue;
        const auto name = translate_legends_artifact_identity(name_source);
        if (translation_complete_with_native_nicknames(name, name_source))
            return fill_symbol_roles(*pattern, *item, *name);
    }
    return std::nullopt;
}

template <typename Resolve>
static std::optional<std::string> translate_complete_item_description_rule(
        const Rule &rule, std::string_view raw_source, Resolve &&resolve) {
    TranslationWorkFrame work_frame("item description rule", raw_source);
    // Fixed wording uses canonical whitespace, including multi-sentence
    // inscriptions. Resolve captures from the original bytes instead: a
    // nickname can contain repeated spaces and any number of apostrophes,
    // and a paragraph can contain several independent native nicknames.
    // The origin map preserves them without guessing their closing quotes.
    std::vector<size_t> origins;
    std::string normalized;
    std::string_view source = raw_source;
    const bool normalize = !source.empty() &&
        (native_prose_space(static_cast<unsigned char>(source.front())) ||
         native_prose_space(static_cast<unsigned char>(source.back())) ||
         source.find("  ") != std::string_view::npos ||
         source.find_first_of("\t\r\n") != std::string_view::npos);
    if (normalize) {
        normalized = normalize_utterance(raw_source, &origins);
        source = normalized;
    }
    if (rule.template_kinds.empty()) {
        if (source.size() == rule.source.size() &&
            template_literal_at(source, 0, rule.source, rule.case_insensitive) &&
            item_description_translation_complete(rule.target)) return rule.target;
        return std::nullopt;
    }
    if (rule.template_literals.size() != rule.template_kinds.size() + 1 ||
        !legends_template_literals_fit(rule, source, 0, source.size(), true))
        return std::nullopt;
    std::vector<std::string> captures(rule.template_kinds.size());
    std::vector<std::optional<std::string>> translated(rule.template_kinds.size());
    auto capture = [&](size_t index, size_t begin, size_t end) {
        if (begin >= end || end > source.size()) return false;
        const auto value = normalize
            ? raw_source.substr(origins[begin], origins[end - 1] + 1 - origins[begin])
            : raw_source.substr(begin, end - begin);
        // Match the shared numeric-template contract even on the backtracking
        // path; arbitrary English must never pass through a number capture.
        if (rule.template_kinds[index] == 'd') {
            std::string_view digits = value;
            if (digits.front() == '+' || digits.front() == '-') digits.remove_prefix(1);
            if (digits.empty() || !std::all_of(digits.begin(), digits.end(),
                    [](unsigned char ch) { return ch >= '0' && ch <= '9'; }))
                return false;
        }
        translated[index] = resolve(rule.template_kinds[index], value);
        if (!translation_complete_with_native_nicknames(translated[index], value)) return false;
        captures[index] = std::string(value);
        return true;
    };
    size_t end = 0;
    std::vector<std::string> direct;
    bool counted_noun = false;
    for (size_t index = 0; index < rule.template_kinds.size(); ++index)
        counted_noun = counted_noun || (rule.template_kinds[index] == 'c' &&
            rule.template_literals[index + 1] == " ");
    bool matched = !counted_noun && match_template(rule, source, 0, &end, &direct) &&
        end == source.size() && direct.size() == captures.size();
    size_t direct_position = rule.template_literals.front().size();
    for (size_t index = 0; matched && index < direct.size(); ++index) {
        const size_t stop = direct_position + direct[index].size();
        matched = capture(index, direct_position, stop);
        direct_position = stop + rule.template_literals[index + 1].size();
    }
    if (!matched) {
        std::map<std::pair<size_t, size_t>, bool> failed;
        auto match = [&](auto &&self, size_t index, size_t position) -> bool {
            translation_work_step();
            if (index == captures.size()) return position == source.size();
            if (failed.contains({index, position})) return false;
            const auto &delimiter = rule.template_literals[index + 1];
            const bool final = index + 1 == captures.size();
            const bool longest_count = rule.template_kinds[index] == 'c' && delimiter == " ";
            // Adjacent unbounded captures have no grammatical boundary.
            if (delimiter.empty() && !final) return false;
            size_t stop = final
                ? (source.size() >= delimiter.size()
                    ? source.size() - delimiter.size() : std::string_view::npos)
                : longest_count ? source.rfind(' ')
                    : find_template_literal(source, delimiter, position + 1,
                                            rule.case_insensitive);
            for (; stop != std::string_view::npos && stop > position;) {
                if (template_literal_at(source, stop, delimiter, rule.case_insensitive) &&
                    // Prove the rest of the fixed wording before resolving
                    // this noun. Item lists otherwise recursively translate
                    // every prefix of rules whose later delimiters are absent.
                    (final || legends_template_suffix_literals_fit(rule, source,
                        index + 1, stop + delimiter.size(), source.size(), true)) &&
                    capture(index, position, stop) &&
                    self(self, index + 1, stop + delimiter.size())) return true;
                if (final) break;
                // "twenty one copper rings" has one count, 21. Trying the
                // first space can also parse as 20 × (1 × copper rings), so
                // counted nouns share the symbol parser's longest-count rule.
                stop = longest_count ? source.rfind(' ', stop - 1)
                    : find_template_literal(source, delimiter, stop + 1,
                                             rule.case_insensitive);
            }
            failed.emplace(std::pair{index, position}, true);
            return false;
        };
        matched = match(match, 0, rule.template_literals.front().size());
    }
    if (!matched) return std::nullopt;
    auto target = fill_template(rule, captures, nullptr, nullptr, &translated);
    return translation_complete_with_native_nicknames(target, raw_source)
        ? std::optional<std::string>(std::move(target)) : std::nullopt;
}

#include "item_color_descriptions.inc"
#include "item_craft_descriptions.inc"

std::optional<std::string> Overlay::translate_item_description_term(
        std::string_view raw_source, bool predicate) const {
    const std::string source = normalize_art_utterance(raw_source);
    const std::string key = std::string(predicate ? "V:" : "T:") + source;
    if (const auto found = item_description_cache_.find(key);
        found != item_description_cache_.end()) return found->second;
    std::unordered_map<std::string, std::optional<std::string>> memo;
    auto translate = [&](auto &&self, std::string_view value, bool predicate, unsigned depth)
            -> std::optional<std::string> {
        TranslationWorkFrame work_frame("item description term", value);
        value = trim_view(value);
        if (value.empty() || depth >= 64) return std::nullopt;
        const std::string memo_key = std::string(predicate ? "V:" : "T:") +
            std::to_string(depth) + ":" + std::string(value);
        if (const auto found = memo.find(memo_key); found != memo.end()) return found->second;
        auto resolve = [&]() -> std::optional<std::string> {
            // Existing whole terms win over decomposition. Thus goblin-cap,
            // kobold bulb, horn silver and every other established multiword
            // material retain the same spelling everywhere they appear.
            if (!predicate)
                if (auto target = exact_literal_translation(value);
                    item_description_translation_complete(target)) return target;
            // Native descriptions retain the same trailing item counts as
            // captions. Peel them off before noun/material decomposition:
            // `(material) <#count>` is not one parenthesized material field.
            // Reuse the shared annotation parser and preserve the suffix on
            // the complete translated noun, including its designation marks.
            if (!predicate) {
                if (const auto suffix = item_number_suffix(value); !suffix.empty()) {
                    const auto item = self(self, value.substr(0,
                        value.size() - suffix.size()), false, depth + 1);
                    return item ? std::optional<std::string>(*item + std::string(suffix))
                                : std::nullopt;
                }
            }
            // Item captions put quality/decoration marks around the whole
            // noun, including a statue's depicted subject. Unwrap before
            // the typed grammar so those marks cannot become part of its
            // material or personal-name capture, then preserve both sides.
            if (!predicate) {
                const auto designation = split_item_designation(value);
                if (!designation.prefix.empty()) {
                    const auto item = self(self, designation.item, false, depth + 1);
                    return item ? std::optional<std::string>(
                        designation.prefix + *item + designation.suffix) : std::nullopt;
                }
            }
            // The native copy branch (PE 53.16 0xc656d3..0xc6570a) emits a
            // complete written title followed by this annotation, then returns
            // before material/type description. Establish its book semantics
            // before a generic term can reinterpret title words as a creature
            // or material. The written resolver proves the entire title.
            if (!predicate && value.ends_with(" (copy)"))
                if (auto title = translate_written_item_caption(value);
                    item_description_translation_complete(title)) return title;
            // A written-work title may contain punctuation without quotes in
            // native artwork. Defer rejection until the complete scoped item
            // and named-artifact productions have had a chance to own it;
            // ordinary noun/material fallback must still reject prose.
            bool quoted = false;
            bool punctuated = false;
            for (char ch : value) {
                if (ch == '"' || ch == '\x10' || ch == '\x11') quoted = !quoted;
                if (!quoted && (ch == '.' || ch == '!' || ch == '?')) punctuated = true;
            }
            // Body components share the complete caption grammar with Stocks
            // and inventory. Preserve the unit prefix and noun sense before
            // generic material/item decomposition can produce a qualifier.
            if (!predicate && !punctuated)
                if (auto target = translate_corpsepiece_item_name(value);
                    translation_complete_with_native_nicknames(target, value)) return target;
            // The same material nouns serve condition selectors, recipe
            // requirements and item descriptions. Resolve the entire state
            // before names or equipment can swallow a generated creature's
            // extract, or reinterpret a raw dairy product as an adjective.
            if (!predicate && !punctuated)
                if (auto target = translate_material_name(value);
                    item_description_translation_complete(target)) return target;
            // Contaminants in item prose retain their named source before
            // the species/material noun. Share the inventory deposit grammar
            // so the owner stays a person, not an ordinary material prefix.
            if (!predicate && !punctuated && value.find("'s ") != std::string_view::npos) {
                std::vector<size_t> origins;
                if (auto target = RULESETS.translate_with_origins(native_text_to_utf8(value),
                        "::health::contaminant::material", origins);
                    translation_complete_with_native_nicknames(target, value)) return target;
            }
            // Food already has a complete species/organ/modifier parser.
            // Use it for nouns before generic prose, creature-reference and
            // item segmentation. Stockpile search visits an entire meat
            // catalog synchronously; sending each species/organ combination
            // through the general grammar makes even its first query stall.
            // This is the same parser and vocabulary used by item captions,
            // not a search-only shortcut or a meat-substring approximation.
            if (!predicate && !punctuated)
                if (auto target = translate_embark_food_item({std::string(value)});
                    item_description_translation_complete(target)) return target;
            const auto &indices = predicate ? item_description_predicate_rules_
                                            : item_description_term_rules_;
            for (int index : indices) {
                const Rule &rule = rules_[static_cast<size_t>(index)];
                auto target = translate_complete_item_description_rule(rule, value,
                    [&](char kind, std::string_view part) -> std::optional<std::string> {
                        switch (kind) {
                        // An ingredient is one complete food/material noun,
                        // never another preparation or an ingredient list.
                        // Otherwise the first minced wrapper can swallow
                        // mixed solid/liquid ingredients after "and".
                        case 'f': case 'l': {
                            if ((kind == 'l') != is_liquid_food_ingredient(part))
                                return std::nullopt;
                            if (auto ingredient = translate_material_name(part);
                                item_description_translation_complete(ingredient)) return ingredient;
                            std::vector<size_t> origins;
                            return RULESETS.translate_with_origins(
                                lower(native_text_to_utf8(part)),
                                "::items::food::ingredient", origins);
                        }
                        // Only recursive captures must be shorter. An atomic
                        // number can occupy the complete noun (a die's upward
                        // face), and still uses the shared native count parser.
                        case 's': case 'i':
                            return part.size() < value.size()
                                ? self(self, part, false, depth + 1) : std::nullopt;
                        case 'v': return translate_item_color_pattern(part);
                        case 'j': return translate_item_dye_materials(part);
                        case 'm':
                            return translate_embark_item_material_qualifier(std::string(part), true);
                        case 'e':
                            return part.size() < value.size()
                                ? self(self, part, true, depth + 1) : std::nullopt;
                        case 'a': return translate_symbol_elements(part);
                        case 'n': return translate_legends_actor(part);
                        case 'u':
                            // Unit slots can include a name followed by a profession.
                            if (auto unit = translate_unit_identity(part, true)) return unit;
                            return translate_ui_message_capture(part, true);
                        case 'p': return translate_legends_name(part, false);
                        case 'r': return translate_coin_native_identity(part);
                        case 'b':
                            if (auto title = translate_legends_artifact_identity(part);
                                translation_complete_with_native_nicknames(title, part)) return title;
                            return translate_legends_book(part);
                        case 'k': {
                            const auto word = procedural_terms_.find(lower(std::string(part)));
                            return word == procedural_terms_.end() ? std::nullopt
                                : std::optional<std::string>(word->second);
                        }
                        case 't': return translate_legends_anatomy(part);
                        case 'q':
                            return part.size() < value.size()
                                ? translate_item_description_source(part, true) : std::nullopt;
                        case 'd': return std::string(part);
                        case 'c':
                            if (const auto count = adventure_location_count(lower(std::string(part))))
                                return std::to_string(*count);
                            return std::nullopt;
                        default: return std::nullopt;
                        }
                    });
                if (target) return target;
            }
            // Predicate lists and material lists have distinct types. Thus
            // "rings of copper and menaces with spikes of silver" cannot be
            // rendered as rings made from a mixture of copper and spikes.
            if (predicate) return std::nullopt;
            if (auto target = translate_named_art_item(value)) return target;
            if (punctuated) return std::nullopt;
            // Only articles attached to a complete known noun may disappear.
            // The surrounding predicate/quantity is owned by a reviewed rule.
            for (std::string_view article : {"a ", "an ", "the ", "A ", "An ", "The "}) {
                if (value.starts_with(article))
                    if (auto target = self(self, value.substr(article.size()), false, depth + 1))
                        return target;
            }
            if (auto target = translate_symbol_shape(value);
                item_description_translation_complete(target)) return target;
            if (auto target = translate_legends_color(value);
                item_description_translation_complete(target)) return target;
            // This slot may contain either a creature or a manufactured item.
            // Resolve a typed species together with any outer material/item
            // grammar so a generated owner cannot absorb the item suffix.
            if (auto target = translate_creature_reference(value);
                translation_complete_with_native_nicknames(target, value)) return target;
            // Minted coins carry native civilization/ruler identities before
            // their material. Resolve that typed item name before ordinary
            // item segmentation, which intentionally rejects unknown names.
            if (auto target = translate_coin_item_name(value);
                translation_complete_with_native_nicknames(target, value)) return target;
            // Item/material segmentation already requires every original token
            // to be translated. No proper-name fallback is allowed for prose.
            if (auto target = translate_legends_item(value);
                translation_complete_with_native_nicknames(target, value)) return target;
            return std::nullopt;
        };
        auto target = resolve();
        memo.emplace(memo_key, target);
        return target;
    };
    auto target = translate(translate, source, predicate, 0);
    if (item_description_cache_.size() >= 2048) item_description_cache_.clear();
    item_description_cache_.emplace(key, target);
    return target;
}

std::optional<std::string> Overlay::translate_item_description_source(
        std::string_view raw_source, bool item_context) const {
    std::string source = normalize_art_utterance(raw_source);
    for (char &ch : source)
        if (ch == '\x10' || ch == '\x11') ch = '"';
    if (source.empty()) return std::nullopt;
    // The footer knows its selected category. Other callers, including normal
    // Legends prose, must present an item-specific opening before this grammar
    // may own their paragraph. Generic "It ..." and "The ..." rules are usable
    // only inside an identified item description or its typed inscription.
    const std::string key = std::string(item_context ? "P:I:" : "P:A:") + source;
    if (const auto found = item_description_cache_.find(key);
        found != item_description_cache_.end()) return found->second;
    if (!item_context) {
        // This reviewed sentence is stored with Legends event rules so its
        // subject keeps the shared {e} semantics, but still anchors item prose.
        bool item_opening = source.starts_with("The artwork relates to ");
        for (int index : item_description_sentence_rules_) {
            const Rule &rule = rules_[static_cast<size_t>(index)];
            const std::string_view opening = rule.template_kinds.empty()
                ? std::string_view(rule.source) : std::string_view(rule.template_literals.front());
            if (opening.empty() || opening == "This is " || opening == "These are " ||
                opening == "It " || opening == "It is " || opening == "The " || opening == "I am " ||
                opening == "By " || opening == "In memory of " ||
                opening == "In " || opening == "On " || opening == "With " ||
                opening == "Owner: ") continue;
            if (template_literal_at(source, 0, opening, rule.case_insensitive)) {
                item_opening = true;
                break;
            }
        }
        // A generic introduction is an item anchor only when its entire noun
        // slot resolves. Unknown creature/biographical prose cannot become a
        // guessed item name or trigger item-only diagnostics.
        if (!item_opening) {
            const std::string_view introduction = source.starts_with("This is ")
                ? std::string_view("This is ") : source.starts_with("These are ")
                    ? std::string_view("These are ") : std::string_view{};
            if (!introduction.empty()) {
                bool quoted = false;
                for (size_t at = introduction.size(); at < source.size(); ++at) {
                    if (source[at] == '"' && source.find('`') == std::string::npos)
                        quoted = !quoted;
                    if (quoted || source[at] != '.' ||
                        (at + 1 < source.size() && source[at + 1] != ' ')) continue;
                    const auto noun = std::string_view(source).substr(
                        introduction.size(), at - introduction.size());
                    item_opening = translation_complete_with_native_nicknames(
                        translate_item_description_term(noun), noun);
                    if (item_opening) break;
                }
            }
        }
        if (!item_opening) {
            if (item_description_cache_.size() >= 2048) item_description_cache_.clear();
            item_description_cache_.emplace(key, std::nullopt);
            return std::nullopt;
        }
    }
    // The native item writer appends the complete instrument RAW description
    // (c795d2..c7962e), whose later sentences name only the musician, tuning
    // or registers. Establish that grammar once from a successfully resolved
    // instrument sentence in this same paragraph, before splitting it. Merely
    // mentioning the word in an unknown sentence grants no instrument context.
    bool instrument_context = false;
    const std::string folded_source = lower(source);
    if (folded_source.find("instrument") != std::string::npos ||
        folded_source.find("the string by stopping it against the ") != std::string::npos) {
        for (size_t begin = 0; begin < source.size();) {
            const size_t stop = source.find('.', begin);
            if (stop == std::string::npos) break;
            const auto part = trim_view(std::string_view(source).substr(begin, stop + 1 - begin));
            if (item_description_translation_complete(translate_instrument_description(part))) {
                instrument_context = true;
                break;
            }
            begin = stop + 1;
        }
    }
    auto sentence = [&](std::string_view value) -> std::optional<std::string> {
        // cc23e0 writes the complete memorial into the slab's saved string.
        // Dates, deaths, achievements, family and one selected preference are
        // joined with " / "; a nickname or event can contain those delimiters
        // too. The scoped grammar resolves every complete field before it
        // commits a boundary, shared by the item panel and typed slab path.
        if (value.starts_with("In memory of")) {
            auto target = translate_announcement_combat(value, "memorial-inscription");
            if (translation_complete_with_native_nicknames(target, value)) return target;
            return std::nullopt;
        }
        // cc5d50 is shared with written-work announcements. Its references
        // are people, events, forms and knowledge topics, not item nouns.
        // Reuse that complete typed grammar for every content branch; the
        // generic work-description alias also calls back here, so enter only
        // the native content-sentence family with an explicit literal anchor.
        if (value.starts_with("It asks the question, \"What if ") ||
            value.starts_with("It concerns ") ||
            value.starts_with("The writing conveys a moral lesson regarding ") ||
            value.starts_with("The overall text emphasizes ") ||
            value.starts_with("For lyrics, the composer has selected ") ||
            value.starts_with("For musical accompaniment, the choreographer has selected ") ||
            value.starts_with("It covers ") ||
            (value.starts_with("The ") && value.find(" chapter covers ") != std::string_view::npos)) {
            const auto target = translate_announcement_combat(value, "work-sentence");
            if (translation_complete_with_native_nicknames(target, value)) return target;
        }
        for (int index : item_description_sentence_rules_) {
            const Rule &rule = rules_[static_cast<size_t>(index)];
            auto target = translate_complete_item_description_rule(rule, value,
                [&](char kind, std::string_view part) -> std::optional<std::string> {
                    if (part.size() >= value.size()) return std::nullopt;
                    switch (kind) {
                    case 's': case 'i': return translate_item_description_term(part);
                    case 'v': return translate_item_color_pattern(part);
                    case 'j': return translate_item_dye_materials(part);
                    case 'o': return translate_item_craftsmanship(part);
                    case 'm': return translate_embark_item_material_qualifier(std::string(part), true);
                    case 'e': return translate_item_description_term(part, true);
                    case 'a': return translate_symbol_elements(part);
                    case 'n': return translate_legends_actor(part);
                    case 'u':
                        // Holder/owner captions keep the profession with the name.
                        if (auto unit = translate_unit_identity(part, true)) return unit;
                        return translate_ui_message_capture(part, true);
                    case 'p': return translate_legends_name(part, false);
                    case 'r': return translate_coin_native_identity(part);
                    case 'b':
                        if (auto title = translate_legends_artifact_identity(part);
                            translation_complete_with_native_nicknames(title, part)) return title;
                        return translate_legends_book(part);
                    case 'k': {
                        const auto word = procedural_terms_.find(lower(std::string(part)));
                        return word == procedural_terms_.end() ? std::nullopt
                            : std::optional<std::string>(word->second);
                    }
                    case 't': return translate_legends_anatomy(part);
                    case 'q': return translate_item_description_source(part, true);
                    case 'd': return std::string(part);
                    case 'c':
                        if (const auto count = adventure_location_count(lower(std::string(part))))
                            return std::to_string(*count);
                        return std::nullopt;
                    default: return std::nullopt;
                    }
                });
            if (target) return target;
        }
        // Art figures use exactly the same elements/actions as the editor's
        // preview and deletion list, including species, names and quantities.
        if (auto target = translate_symbol_action(value);
            translation_complete_with_native_nicknames(target, value)) return target;
        if (auto target = translate_symbol_description_source(value);
            translation_complete_with_native_nicknames(target, value)) return target;
        // Existing quality, powers, writing and historical sentences remain
        // authoritative. Their capture meanings are those of Legends, not the
        // item grammar's {a}=art elements and {q}=quoted prose meanings.
        for (int index : matching_legends_rules(value)) {
            const Rule &rule = rules_[static_cast<size_t>(index)];
            auto target = translate_complete_item_description_rule(rule, value,
                [&](char kind, std::string_view part) -> std::optional<std::string> {
                    switch (kind) {
                    case 'a': return translate_legends_participant(part);
                    case 'n': return translate_legends_actor(part);
                    case 'p': return translate_legends_name(part, false);
                    case 's': return translate_legends_term(part);
                    case 'q': return translate_legends_color(part);
                    case 't': return translate_legends_anatomy(part);
                    case 'i': return translate_item_description_term(part);
                    case 'e': return translate_legends_event(part);
                    case 'b': return translate_legends_book(part);
                    case 'r': return translate_deity_spheres(part);
                    case 'd': return std::string(part);
                    case 'c':
                        if (const auto count = adventure_location_count(lower(std::string(part))))
                            return std::to_string(*count);
                        return std::nullopt;
                    default: return std::nullopt;
                    }
                });
            if (target) return target;
        }
        if (auto target = exact_literal_translation(value);
            item_description_translation_complete(target)) return target;
        if (auto target = translate_instrument_description(value, false, instrument_context);
            item_description_translation_complete(target)) return target;
        return std::nullopt;
    };
    // A reviewed production may contain several sentences (slab inscriptions
    // and image details do). Preserve the complete production before splitting.
    auto target = sentence(source);
    if (!target) {
        std::string output;
        bool quoted = false, complete = true, translated_any = false;
        const bool native_nickname = source.find('`') != std::string::npos;
        std::vector<size_t> sentence_ends;
        for (size_t at = 0; at < source.size(); ++at) {
            // An authored nickname can contain unmatched double quotes and
            // sentence punctuation. In that case propose every boundary and
            // let the complete typed production below decide where it ends.
            if (!native_nickname && source[at] == '"') quoted = !quoted;
            const bool punctuation = source[at] == '.' || source[at] == '!' || source[at] == '?';
            // cc5e0d..cc5e7b ends alternate-history questions with ?" and
            // spaces, without an outer period. Include the closing quote in
            // the candidate; a complete production still decides the actual
            // boundary, including quoted titles with internal punctuation.
            if (punctuation && at + 1 < source.size() && source[at + 1] == '"' &&
                (at + 2 == source.size() || source[at + 2] == ' '))
                sentence_ends.push_back(at + 2);
            if (quoted || !punctuation ||
                (at + 1 < source.size() && source[at + 1] != ' ')) continue;
            sentence_ends.push_back(at + 1);
        }
        size_t begin = 0;
        for (size_t boundary = 0; boundary < sentence_ends.size();) {
            size_t selected = boundary;
            std::optional<std::string> translated;
            // BOOK_ART/BOOK_INSTRUCTION titles can end in ! or ? without
            // quotes before " the <item> by <maker>". Punctuation proposes
            // boundaries; only a complete typed production commits one.
            // Keep the earliest successful production so a later sentence
            // cannot hide an unknown predecessor inside a generic fragment.
            for (size_t next = boundary; next < sentence_ends.size(); ++next) {
                if (begin == 0 && sentence_ends[next] == source.size())
                    continue; // The complete production already failed above.
                const auto candidate = trim_view(std::string_view(source).substr(
                    begin, sentence_ends[next] - begin));
                translated = sentence(candidate);
                if (translated) { selected = next; break; }
            }
            const auto part = trim_view(std::string_view(source).substr(
                begin, sentence_ends[selected] - begin));
            if (translated) {
                output += *translated;
                translated_any = true;
            }
            else {
                complete = false;
                // An identified item paragraph keeps each unknown sentence
                // intact while its supported neighbors remain translated.
                // Do not expose that sentence to isolated word replacements.
                // Recursive captures still require a complete Chinese target.
                if (item_context) {
                    if (!output.empty()) output.push_back(' ');
                    output += cp437_to_utf8(std::string(part));
                    output.push_back(' ');
                    log_line("WARN", "Item description sentence not translated: " +
                        cp437_to_utf8(std::string(part)));
                }
            }
            begin = sentence_ends[selected];
            boundary = selected + 1;
        }
        const auto ending = trim_view(std::string_view(source).substr(begin));
        if (item_context && (quoted || !ending.empty()))
            log_line("WARN", "Item description has an incomplete ending: " +
                cp437_to_utf8(std::string(ending)));
        if ((complete || item_context) && translated_any && !quoted &&
            !output.empty() && ending.empty()) target = trim(std::move(output));
    }
    if (item_description_cache_.size() >= 2048) item_description_cache_.clear();
    item_description_cache_.emplace(key, target);
    return target;
}
