// Recipe cards, work-order conditions and building material requirements use
// the native job-item describer's complete noun grammar and share one cache.
// Its independent flags are not separate screen captions: translating only
// the recognised fragments can erase a constraint or leave English between
// them. Resolve every modifier, quantity and item before claiming the row.
// The scoped vocabulary is maintained in data/runtime/workshop-recipe-translations.tsv;
// installed RAW item/material names keep the shared inventory terminology.
// DF 53.16 ELF: all three condition render paths call 0x1bbc8d0 at
// 0xd89634 / 0xd8b700 / 0xd8cdb4, with the same job-item flags and no count.
// Ordinary item literals precede instrument lookup below so ring/rope/pipe
// cannot acquire the coincidentally spelled native-language name meaning.
std::optional<std::string> Overlay::translate_workshop_recipe_source(
        std::string_view raw_source) const {
    const std::string source = normalize_utterance(raw_source);
    if (source.empty()) return std::nullopt;
    refresh_native_instrument_names();
    if (const auto found = workshop_recipe_translation_cache_.find(source);
        found != workshop_recipe_translation_cache_.end()) return found->second;
    const auto complete = [](const std::optional<std::string> &target) {
        return target && !target->empty() &&
            target->find("[C:") == std::string::npos &&
            std::none_of(target->begin(), target->end(), [](unsigned char ch) {
                return (ch >= 'A' && ch <= 'Z') || (ch >= 'a' && ch <= 'z') ||
                    ch == '\r' || ch == '\n';
            });
    };
    const auto scoped = [&](std::string_view role, std::string_view value) {
        return exact_literal_translation("Workshop recipe: " + std::string(role) +
            lower(std::string(value)));
    };
    const auto format = [&](std::string_view key,
                            const std::vector<std::pair<std::string, std::string>> &fields)
            -> std::optional<std::string> {
        auto target = scoped("format ", key);
        if (!target) return std::nullopt;
        for (const auto &[slot, value] : fields) {
            const size_t at = target->find(slot);
            if (at == std::string::npos || target->find(slot, at + slot.size()) != std::string::npos)
                return std::nullopt;
            target->replace(at, slot.size(), value);
        }
        if (target->find_first_of("{}") != std::string::npos) return std::nullopt;
        return complete(target) ? target : std::nullopt;
    };
    std::unordered_map<std::string, std::optional<std::string>> memo;
    const auto translate = [&](auto &&self, std::string_view value, unsigned depth)
            -> std::optional<std::string> {
        value = trim_view(value);
        if (value.empty() || depth > 64) return std::nullopt;
        const std::string key(value), folded = lower(key);
        if (const auto found = memo.find(key); found != memo.end()) return found->second;
        const auto resolve = [&]() -> std::optional<std::string> {
            if (auto target = scoped("", folded); complete(target)) return target;
            // The searchable task list wraps the same native requirement
            // noun used in recipe cards. Keep its brackets and translate the
            // whole item, including instrument names and scoped piece terms.
            constexpr std::string_view requirement_prefix = "[requires ";
            if (folded.starts_with(requirement_prefix) && folded.ends_with(']')) {
                const auto item = self(self, value.substr(requirement_prefix.size(),
                    value.size() - requirement_prefix.size() - 1), depth + 1);
                return item ? format("requirement", {{"{s}", *item}}) : std::nullopt;
            }
            // A real material such as bone opal is one established noun,
            // even when its first word also names a native job-item flag.
            if (auto target = translate_material_name(value); complete(target)) return target;
            // Raw glass is a reviewed item name, not the food-state adjective.
            if (folded.starts_with("raw ") && RULESETS.is_item_material(folded.substr(4)))
                if (auto target = exact_literal_translation(value); complete(target)) return target;

            // Quantities already have the native thread/cloth/sheet/bar
            // dimension conversion applied. Retain those display digits;
            // never divide a displayed number by the RAW dimension again.
            size_t digits = 0;
            while (digits < value.size() && value[digits] >= '0' && value[digits] <= '9') ++digits;
            if (digits && digits < value.size() && value[digits] == ' ') {
                const auto item = self(self, value.substr(digits + 1), depth + 1);
                if (!item) return std::nullopt;
                std::string unit;
                // Longest complete suffix selects an optional Chinese unit;
                // it does not change or infer a native quantity or item type.
                for (size_t at = digits + 1; at < value.size();) {
                    if (auto candidate = scoped("unit ", value.substr(at)); complete(candidate)) {
                        unit = *candidate;
                        break;
                    }
                    at = value.find(' ', at);
                    if (at == std::string_view::npos) break;
                    ++at;
                }
                return format(unit.empty() ? "quantity" : "quantity with unit",
                    unit.empty()
                        ? std::vector<std::pair<std::string, std::string>>{
                            {"{d}", std::string(value.substr(0, digits))}, {"{s}", *item}}
                        : std::vector<std::pair<std::string, std::string>>{
                            {"{d}", std::string(value.substr(0, digits))},
                            {"{u}", unit}, {"{s}", *item}});
            }

            constexpr std::string_view excluded_bin = " that isn't a bin";
            if (folded.ends_with(excluded_bin)) {
                const auto item = self(self, value.substr(0, value.size() - excluded_bin.size()), depth + 1);
                return item ? format("exclude bin", {{"{s}", *item}}) : std::nullopt;
            }

            // Native flags have different semantic roles. Parse the complete
            // prefix run first, then select ONE noun and qualify it once.
            // A body-component category such as tooth already names the
            // object; it must not become "tooth + body part" in Chinese.
            struct Modifier {
                std::string source;
                std::optional<std::string> state, material, kind;
                bool material_category = false;
            };
            std::vector<Modifier> modifiers;
            size_t noun_at = 0;
            while (noun_at < value.size()) {
                // A complete known material is opaque to the flag grammar.
                // This also protects a named material after outer states.
                const std::string remainder = lower(std::string(value.substr(noun_at)));
                if (RULESETS.is_item_material(remainder)) break;
                bool consumed = false;
                for (size_t end = value.rfind(' '); end != std::string_view::npos && end > noun_at;
                     end = value.rfind(' ', end - 1)) {
                    const std::string part(value.substr(noun_at, end - noun_at));
                    Modifier modifier{lower(part), scoped("state ", part),
                        scoped("material ", part), scoped("kind ", part)};
                    if (auto category = scoped("material category ", part); complete(category)) {
                        modifier.material = std::move(category);
                        modifier.material_category = true;
                    }
                    // Runtime reaction materials and colors participate in
                    // the same state list, even when they follow a material
                    // category. They are not pre-rendered nested noun strings.
                    if (!complete(modifier.state) && !complete(modifier.material) &&
                        !complete(modifier.kind)) {
                        for (std::string_view suffix : {"-bearing", "-producing", "-containing"}) {
                            if (!modifier.source.ends_with(suffix) || part.size() <= suffix.size()) continue;
                            const auto material = self(self,
                                std::string_view(part).substr(0, part.size() - suffix.size()), depth + 1);
                            if (material) modifier.state = format("state " + std::string(suffix),
                                {{"{s}", *material}});
                            break;
                        }
                        if (!modifier.state && modifier.source.starts_with("color "))
                            modifier.state = translate_legends_color(std::string_view(part).substr(6));
                    }
                    if (!complete(modifier.state) && !complete(modifier.material) &&
                        !complete(modifier.kind)) continue;
                    modifiers.push_back(std::move(modifier));
                    noun_at = end + 1;
                    consumed = true;
                    break;
                }
                if (!consumed) break;
            }
            if (!modifiers.empty() && noun_at < value.size()) {
                const std::string_view native_noun = trim_view(value.substr(noun_at));
                const std::string noun_key = lower(std::string(native_noun));
                const bool body = noun_key == "body part" || noun_key == "body parts";
                const bool glob = noun_key == "glob" || noun_key == "globs";
                const bool logs = noun_key == "log" || noun_key == "logs";
                const bool plant = noun_key == "plant" || noun_key == "plants";
                const bool generic = noun_key == "item" || noun_key == "items" || noun_key == "tool";
                std::vector<std::string> states, materials, kinds, body_nouns, body_materials;
                std::string material_source;
                bool material_category = false;
                std::optional<std::string> noun;
                const auto join = [&](const std::vector<std::string> &parts,
                                      std::string_view relation) -> std::optional<std::string> {
                    if (parts.empty()) return std::nullopt;
                    std::optional<std::string> target = parts.front();
                    for (size_t i = 1; i < parts.size() && target; ++i)
                        target = format(relation, {{"{s1}", *target}, {"{s2}", parts[i]}});
                    return target;
                };
                for (const auto &modifier : modifiers) {
                    if (complete(modifier.state)) states.push_back(*modifier.state);
                    if (complete(modifier.kind)) {
                        // These native filters repeat the category in the
                        // noun. Keep its more specific leaf/fruit/live form.
                        const bool implied =
                            (modifier.source == "extract-bearing plant" &&
                                (plant || noun_key == "leaf or fruit" || noun_key == "leaves and fruit")) ||
                            (modifier.source == "extract-bearing fish" && noun_key == "fish") ||
                            ((modifier.source == "extract-bearing small creature" ||
                              modifier.source == "tameable small creature") &&
                                (noun_key == "small live animal" || noun_key == "small tame animal"));
                        if (!implied) kinds.push_back(*modifier.kind);
                    }
                    if (!complete(modifier.material)) {
                        if (body && !noun)
                            noun = scoped("body capability ", modifier.source);
                        continue;
                    }
                    if (body) {
                        // Scoped component categories replace "body part".
                        // A job's horn flag includes hooves, unlike the
                        // concrete horn noun in corpsepiece's anatomy table.
                        // Other materials describe actual material-bodied
                        // creatures, so their body-component meaning remains.
                        if (auto anatomy = scoped("body noun ", modifier.source); complete(anatomy))
                            body_nouns.push_back(*anatomy);
                        else {
                            auto substance = scoped("body substance ", modifier.source);
                            if (!complete(substance)) substance = modifier.material;
                            body_materials.push_back(*substance);
                        }
                        continue;
                    }
                    // A plant log is already a log, and paper slurry already
                    // denotes the bulk pulp. These head refinements are
                    // independent of all outer states, counts and capabilities.
                    if (modifier.source == "plant" && (logs || plant)) continue;
                    if (glob)
                        if (auto bulk = scoped("bulk noun ", modifier.source); complete(bulk)) {
                            if (noun) return std::nullopt;
                            noun = *bulk;
                            continue;
                        }
                    materials.push_back(*modifier.material);
                    material_category |= modifier.material_category;
                    if (!material_source.empty()) material_source += ' ';
                    material_source += modifier.source;
                }
                if (!body_materials.empty()) {
                    const auto substance = join(body_materials, "join or");
                    if (!substance) return std::nullopt;
                    if (body_nouns.empty()) {
                        const auto state = format("body substance state", {{"{s}", *substance}});
                        if (!state) return std::nullopt;
                        states.push_back(*state);
                        noun.reset();
                    } else {
                        const auto component = format("material body part", {{"{s}", *substance}});
                        if (!component) return std::nullopt;
                        body_nouns.push_back(*component);
                    }
                }
                if (!body_nouns.empty()) noun = join(body_nouns, "join or");
                if (generic && !kinds.empty()) {
                    noun = join(kinds, "join or");
                    kinds.clear();
                }
                if (!noun) noun = self(self, native_noun, depth + 1);
                if (!complete(noun)) return std::nullopt;
                if (!materials.empty()) {
                    // Scoped resource nouns (stone boulders, cloth) retain
                    // the head selected for this requirement. Other complete
                    // material-item names keep the shared inventory grammar.
                    const std::string compound_source = material_source + " " + std::string(native_noun);
                    auto compound = scoped("", compound_source);
                    // A native flag can accept more than the homonymous
                    // concrete material (HORN also accepts HOOF). Do not let
                    // inventory composition narrow that reviewed category.
                    if (!complete(compound) && !material_category && !glob &&
                        noun_key != "cloth" && noun_key != "thread")
                        compound = translate_item_description_term(compound_source);
                    if (complete(compound)) noun = compound;
                    else {
                        const auto material = join(materials, "join or");
                        if (!material) return std::nullopt;
                        noun = format("material noun", {{"{s1}", *material}, {"{s2}", *noun}});
                    }
                }
                if (!kinds.empty()) {
                    const auto kind = join(kinds, "join or");
                    if (!kind) return std::nullopt;
                    noun = format("kind noun", {{"{s1}", *kind}, {"{s2}", *noun}});
                }
                if (states.empty()) return noun;
                const auto state = join(states, "join states");
                return state ? format("qualified noun", {{"{s1}", *state}, {"{s2}", *noun}})
                             : std::nullopt;
            }

            // Reaction classes/products and CONTAINS expand a complete
            // material before these suffixes (e.g. milk of lime-containing).
            // Resolve that material as one noun, retaining every component.
            for (std::string_view marker : {"-bearing ", "-producing ", "-containing "}) {
                for (size_t at = folded.find(marker); at != std::string::npos;
                     at = folded.find(marker, at + 1)) {
                    if (!at || at + marker.size() >= value.size()) continue;
                    const auto material = self(self, value.substr(0, at), depth + 1);
                    const auto item = self(self, value.substr(at + marker.size()), depth + 1);
                    if (material && item)
                        if (auto target = format(trim(std::string(marker)),
                                {{"{s1}", *material}, {"{s2}", *item}})) return target;
                }
            }
            // Native color restrictions precede a complete color name and
            // the tool/item noun; a multiword color must not be split early.
            constexpr std::string_view color_prefix = "color ";
            if (folded.starts_with(color_prefix)) {
                for (size_t end = value.rfind(' '); end > color_prefix.size() &&
                        end != std::string_view::npos; end = value.rfind(' ', end - 1)) {
                    const auto color = translate_legends_color(value.substr(
                        color_prefix.size(), end - color_prefix.size()));
                    const auto item = self(self, value.substr(end + 1), depth + 1);
                    if (complete(color) && item)
                        if (auto target = format("color", {{"{s1}", *color}, {"{s2}", *item}}))
                            return target;
                }
            }

            // Complete established item/material phrases precede splitting
            // alternatives. This preserves goblin-cap, kobold bulb, alloys,
            // creature materials, native instrument names and instrument parts.
            if (auto target = exact_literal_translation(value); complete(target)) return target;
            if (auto target = translate_embark_instrument_item(value, false); complete(target)) return target;
            if (auto target = translate_embark_instrument_item(value, true); complete(target)) return target;
            if (auto target = translate_item_description_term(value); complete(target)) return target;
            // Generated words outside the four language dictionaries become
            // instrument names only after a complete instrument description
            // has identified them. Reuse those exact named fields, including
            // a separately validated material, without phonetic guessing of
            // arbitrary English requirement words.
            if (const auto named = described_instrument_items_.find(folded);
                named != described_instrument_items_.end()) return named->second;
            for (size_t at = folded.find(' '); at != std::string::npos;
                 at = folded.find(' ', at + 1)) {
                const auto named = described_instrument_items_.find(folded.substr(at + 1));
                if (named == described_instrument_items_.end()) continue;
                const bool string_piece = named->first == "string" || named->first == "strings" ||
                    named->first.ends_with(" string") || named->first.ends_with(" strings");
                const auto material = string_piece
                    ? translate_instrument_string_material(value.substr(0, at))
                    : translate_embark_item_material_qualifier(std::string(value.substr(0, at)));
                if (complete(material)) return *material + named->second;
            }

            // Product names can carry a material-bound book or dye mixture;
            // these remain the same complete shared item grammar as inventory.
            for (std::string_view marker : {"-bound ", " laced with "}) {
                const size_t at = folded.find(marker);
                if (at == std::string::npos || !at || at + marker.size() >= value.size()) continue;
                const auto first = self(self, value.substr(0, at), depth + 1);
                const auto second = self(self, value.substr(at + marker.size()), depth + 1);
                if (first && second)
                    if (auto target = format(trim(std::string(marker)),
                            {{"{s1}", *first}, {"{s2}", *second}})) return target;
            }
            for (std::string_view suffix : {" dye mix", " paste", " powder"}) {
                if (!folded.ends_with(suffix) || value.size() <= suffix.size()) continue;
                const auto material = self(self, value.substr(0, value.size() - suffix.size()), depth + 1);
                if (material)
                    if (auto target = format(trim(std::string(suffix)), {{"{s}", *material}})) return target;
            }
            for (std::string_view separator : {", ", " or ", " and ", "/"}) {
                for (size_t at = folded.find(separator); at != std::string::npos;
                     at = folded.find(separator, at + separator.size())) {
                    if (!at || at + separator.size() >= value.size()) continue;
                    const auto first = self(self, value.substr(0, at), depth + 1);
                    const auto second = self(self, value.substr(at + separator.size()), depth + 1);
                    if (first && second)
                        if (auto target = format("join " + trim(std::string(separator)),
                                {{"{s1}", *first}, {"{s2}", *second}})) return target;
                }
            }
            return std::nullopt;
        };
        auto target = resolve();
        memo.emplace(key, target);
        return target;
    };
    auto target = translate(translate, source, 0);
    if (workshop_recipe_translation_cache_.size() >= 4096)
        workshop_recipe_translation_cache_.clear();
    workshop_recipe_translation_cache_.emplace(source, target);
    return target;
}
