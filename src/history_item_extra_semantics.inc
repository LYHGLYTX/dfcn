// These lambdas consume the owned item/art-image snapshot. Source templates
// select grammar only; displayed English sentences never select a branch.
const auto item_extra_label = [&](const std::string &raw) -> std::optional<Pieces> {
    if (raw.empty()) return Pieces{};
    if (const auto value = term(raw)) return value;
    if (const auto value = translate_legends_item(raw)) return Pieces{piece(*value, neutral)};
    if (const auto value = translate_creature_descriptor(raw)) return Pieces{piece(*value, neutral)};
    return std::nullopt;
};
const auto item_extra_number = [&](int32_t value) { return Pieces{piece(std::to_string(value), neutral)}; };
const auto item_extra_link = [&](Pieces value, int kind, int32_t id) {
    for (size_t i = 0; i < document.tokens.size(); ++i) {
        const auto &token = document.tokens[i];
        if (token.link_type != kind || token.link_id != id) continue;
        for (auto &part : value) {
            part.foreground_rgb = token.color;
            part.source_end = i + 1;
            part.native_link_type = kind;
            part.native_link_id = id;
            part.native_link_subid = token.link_subid;
        }
    }
    return value;
};
const auto item_art_group = [&](const Pieces &species, std::string_view key)
        -> std::optional<Pieces> {
    const auto pattern = exact_literal_translation(key);
    if (!pattern) return std::nullopt;
    Pieces result;
    std::string literal;
    for (char ch : *pattern) {
        if (ch != 'X') { literal += ch; continue; }
        if (!literal.empty()) { result.push_back(piece(std::move(literal), neutral)); literal.clear(); }
        join(result, species);
    }
    if (!literal.empty()) result.push_back(piece(std::move(literal), neutral));
    return result;
};
const auto item_art_element = [&](const std::string &prefix, bool definite = false,
        bool dice = false) -> std::optional<Pieces> {
    using Kind = NativeHistoryArtElementKind;
    const auto kind = static_cast<Kind>(number(prefix + ".kind"));
    const int32_t count = number(prefix + ".count");
    if (kind == Kind::None) return Pieces{};
    const int32_t artifact = number(prefix + ".artifact");
    if (kind == Kind::Item && artifact >= 0 && !dice)
        return subject(NativeHistoryObjectKind::Artifact, artifact, false);
    const int32_t figure = number(prefix + ".figure");
    if (kind == Kind::Creature && figure >= 0 && !dice) {
        const bool named = number(prefix + ".named") != 0;
        auto name = named ? subject(NativeHistoryObjectKind::Identity,
            number(prefix + ".name"), false, number(prefix + ".name.subid")) : std::optional<Pieces>(Pieces{});
        if (!name) return std::nullopt;
        if (named && definite) return item_extra_link(*name, 0, figure);
        if (number(prefix + ".deity")) {
            std::vector<Pieces> spheres;
            for (int32_t id : numbers(prefix + ".spheres")) {
                const auto key = history_event_sphere_key(id);
                if (!key) return std::nullopt;
                const auto found = deity_sphere_translations_.find(std::string(*key));
                if (found == deity_sphere_translations_.end()) return std::nullopt;
                spheres.push_back(Pieces{piece(found->second, neutral)});
            }
            const auto domains = item_improvement_list(spheres);
            std::string raw;
            const int flags = number(prefix + ".flags");
            if (flags & 0x10) raw += "skeletal ";
            if (flags & 0x20) raw += "rotting ";
            if (flags & 0x80) raw += "ghostly ";
            if (!text(prefix + ".gender").empty()) raw += text(prefix + ".gender") + " ";
            raw += text(prefix + ".figure_species");
            // Deity form chooses gender independently of the RAW caste.
            // Share the image element's status/gender/species grammar, which
            // handles e.g. a female form even when no such caste name exists.
            const auto form = translate_symbol_element(raw);
            const auto species = form ? std::optional<Pieces>(Pieces{piece(*form, neutral)})
                                      : std::nullopt;
            if (!domains || !species) return std::nullopt;
            const auto result = named ? item_improvement_apply("term",
                "{n}, the deity of {s}, depicted as a {s}", {*name, *domains, *species}) :
                item_improvement_apply("term", "the deity of {s}, depicted as a {s}", {*domains, *species});
            return result ? std::optional<Pieces>(item_extra_link(*result, 0, figure)) : std::nullopt;
        }
        const auto species = item_extra_label(text(prefix + ".figure_species"));
        if (!species) return std::nullopt;
        if (!named) return item_extra_link(*species, 0, figure);
        const auto pattern = exact_literal_translation("Art image named creature: X Y");
        if (!pattern) return std::nullopt;
        Pieces result;
        std::string literal;
        for (char c : *pattern) {
            if (c != 'X' && c != 'Y') { literal += c; continue; }
            if (!literal.empty()) { result.push_back(piece(std::move(literal), neutral)); literal.clear(); }
            join(result, c == 'X' ? *species : *name);
        }
        if (!literal.empty()) result.push_back(piece(std::move(literal), neutral));
        return item_extra_link(std::move(result), 0, figure);
    }
    auto result = kind == Kind::Item ? item(prefix + (dice ? ".dice" : "")) :
        item_extra_label(text(prefix + ".label"));
    if (!result) return std::nullopt;
    if (!text(prefix + ".adjective").empty()) {
        const auto adjective = item_extra_label(text(prefix + ".adjective"));
        if (!adjective) return std::nullopt;
        Pieces described = *adjective;
        join(described, *result);
        result = std::move(described);
    }
    if (count >= 2 && !dice)
        return item_improvement_apply("term", "{c} {s}", {item_extra_number(count), *result});
    if (kind == Kind::Creature && count == 0 && !dice)
        return item_art_group(*result, "Art image group: X");
    return result;
};

const auto item_art_action = [&](const std::string &prefix, const std::vector<int32_t> &property)
        -> std::optional<Pieces> {
    if (property.size() != 4) return std::nullopt;
    const int32_t kind = property[0], first = property[1], second = property[2], verb = property[3];
    const auto &elements = numbers(prefix + ".elements");
    if (kind == -1 || first < 0 || size_t(first) >= elements.size() ||
        (kind == 0 && (second < 0 || size_t(second) >= elements.size()))) return Pieces{};
    // Exact finite jump-table maps: 146dec (transitive, IDs 1..46) and
    // 147580 (intransitive, IDs 0..47). A default slot retains its subject
    // and appends punctuation (146ce8 / 1474c7), but no predicate/object.
    static constexpr const char *transitive[] = {
        "", "surrounded by", "massacring", "fighting with", "", "greeting", "refusing",
        "speaking with", "embracing", "striking down", "", "", "raising", "hiding", "", "",
        "devouring", "admiring", "burning", "", "", "", "", "", "", "", "", "", "", "", "", "", "",
        "shooting", "torturing", "committing a depraved act upon", "praying to", "contemplating",
        "cooking", "engraving", "prostrating itself before", "", "impaled on", "", "being flayed by",
        "hanging from", "being mutilated by"};
    static constexpr const char *intransitive[] = {
        "is withering away", "", "", "", "is laboring", "", "", "", "", "",
        "is striking a menacing pose", "is traveling", "", "", "looks confused", "looks terrified",
        "", "", "is burning", "is weeping", "looks dejected", "is cringing", "is screaming",
        "is making a submissive gesture", "is in a fetal position", "is smeared out into a spiral",
        "is falling", "is dead", "is laughing", "looks offended", "is being shot",
        "is making a plaintive gesture", "is melting", "", "is being tortured",
        "is committing a depraved act", "is praying", "is contemplating", "is cooking", "is engraving",
        "", "is suffering", "", "is unnaturally contorted", "is being flayed", "", "is being mutilated",
        "is striking a triumphant pose"};
    std::string key;
    if (kind == 0) {
        if (verb >= 0 && size_t(verb) < std::size(transitive) && *transitive[verb])
            key = "X is " + std::string(transitive[verb]) + " Y";
    } else if (kind == 1) {
        if (verb >= 0 && size_t(verb) < std::size(intransitive) && *intransitive[verb])
            key = "X " + std::string(intransitive[verb]);
    } else return std::nullopt;
    const auto first_label = item_art_element(prefix + ".element." + std::to_string(first), true);
    if (!first_label) return std::nullopt;
    if (key.empty()) {
        Pieces result = *first_label;
        result.push_back(piece("。", neutral));
        return result;
    }
    const auto pattern = exact_literal_translation(key);
    auto second_label = kind == 0 ? item_art_element(prefix + ".element." + std::to_string(second), true) :
        std::optional<Pieces>(Pieces{});
    if (!pattern || !first_label || !second_label) return std::nullopt;
    if (kind == 0 && first != second) {
        const auto first_key = prefix + ".element." + std::to_string(first);
        const auto second_key = prefix + ".element." + std::to_string(second);
        const auto unnamed_group = [&](const std::string &key) {
            return number(key + ".kind") == static_cast<int32_t>(NativeHistoryArtElementKind::Creature) &&
                number(key + ".count") == 0 && number(key + ".figure") < 0;
        };
        if (unnamed_group(first_key) && unnamed_group(second_key) &&
                text(first_key + ".label") == text(second_key + ".label")) {
            const auto species = item_extra_label(text(second_key + ".label"));
            if (!species) return std::nullopt;
            second_label = item_art_group(*species, "Art image other group: X");
            if (!second_label) return std::nullopt;
        }
    }
    Pieces result;
    std::string literal;
    for (char c : *pattern) {
        if (c != 'X' && c != 'Y') { literal += c; continue; }
        if (!literal.empty()) { result.push_back(piece(std::move(literal), neutral)); literal.clear(); }
        join(result, c == 'X' ? *first_label : *second_label);
    }
    if (!literal.empty()) result.push_back(piece(std::move(literal), neutral));
    result.push_back(piece("。", neutral));
    return result;
};

const auto item_art_image = [&](const std::string &prefix, int placement,
        bool suppress = false, int32_t quality_override = -1, int32_t maker_override = -1)
        -> std::optional<Pieces> {
    if (!number(prefix + ".present")) return Pieces{};
    std::vector<Pieces> elements;
    for (int32_t index : numbers(prefix + ".elements")) {
        const auto value = item_art_element(prefix + ".element." + std::to_string(index));
        if (!value) return std::nullopt;
        elements.push_back(*value);
    }
    const auto depicted = item_improvement_list(elements);
    if (!depicted) return std::nullopt;
    auto image = elements.empty() ? item_extra_label("image") :
        item_improvement_apply("term", "image of {a}", {*depicted});
    if (number(prefix + ".material_present")) {
        const auto material = item_improvement_material(prefix + ".material");
        if (!material) return std::nullopt;
        // 14526e9 skips " of " and the element list when it is empty;
        // 14527d7 still emits the independently present material.
        image = elements.empty()
            ? item_improvement_apply("term", "image in {i}", {*material})
            : item_improvement_apply("term", "image of {a} in {i}", {*depicted, *material});
    }
    if (!image) return std::nullopt;
    static constexpr const char *qualities[] = {"", "well-designed {s}", "finely-designed {s}",
        "superiorly designed {s}", "exceptionally designed {s}", "masterfully designed {s}"};
    const int32_t quality = number(prefix + ".quality"), maker = number(prefix + ".creator");
    if (!suppress && quality >= 1 && quality <= 5) {
        image = item_improvement_apply("term", qualities[quality], {*image});
        if (!image) return std::nullopt;
    }
    if (!suppress && maker >= 0) {
        const auto creator = subject(NativeHistoryObjectKind::Figure, maker, false);
        if (!creator) return std::nullopt;
        image = item_improvement_apply("term", "{s} by {n}", {*image, *creator});
        if (!image) return std::nullopt;
    }
    if (number(prefix + ".source_kind") == 8) {
        const int32_t name_id = number(prefix + ".name");
        const int32_t name_subid = number(prefix + ".name.subid");
        const auto found = std::find_if(event.subjects.begin(), event.subjects.end(), [&](const auto &s) {
            return s.kind == NativeHistoryObjectKind::Identity && s.id == name_id && s.subid == name_subid;
        });
        if (found != event.subjects.end() && found->name.has_name) {
            const auto name = subject(NativeHistoryObjectKind::Identity, name_id, false, name_subid);
            if (!name) return std::nullopt;
            Pieces named = *name;
            named.push_back(piece("，", neutral));
            join(named, *image);
            image = std::move(named);
        }
        image = item_improvement_apply("term", "rendition of {a}", {*image});
        if (!image) return std::nullopt;
        static constexpr const char *rendition[] = {"", "well-crafted {s}", "fine {s}",
            "superior quality {s}", "exceptional {s}", "masterful {s}"};
        if (quality_override >= 1 && quality_override <= 5) {
            image = item_improvement_apply("term", rendition[quality_override], {*image});
            if (!image) return std::nullopt;
        }
        if (!suppress && maker_override >= 0 && maker_override != maker) {
            const auto creator = subject(NativeHistoryObjectKind::Figure, maker_override, false);
            if (!creator) return std::nullopt;
            image = item_improvement_apply("term", "{s} by {n}", {*image, *creator});
            if (!image) return std::nullopt;
        }
    }
    std::optional<Pieces> result;
    if (placement == 4) {
        const auto predicate = item_improvement_apply("predicate", "is {s}", {*image});
        result = predicate ? item_improvement_apply("sentence", "The item {e}.", {*predicate}) : std::nullopt;
    } else result = item_improvement_apply("sentence", placement == 16 ? "On the item is {s}." :
        placement == 17 ? "On the front of the coin is {s}." :
        placement == 18 ? "On the coin's back is {s}." : "It is {s}.", {*image});
    if (!result) return std::nullopt;
    for (int32_t index : numbers(prefix + ".properties")) {
        const auto action = item_art_action(prefix, numbers(prefix + ".property." + std::to_string(index)));
        if (!action) return std::nullopt;
        join(*result, *action);
    }
    const int32_t event_id = number(prefix + ".event");
    if (event_id >= 0) {
        auto history = story(event_id);
        const int32_t collection = number(prefix + ".collection");
        if (history && collection >= 0) {
            const auto title = collection_title(collection);
            if (!title) return std::nullopt;
            history = item_improvement_apply("term", "{s} during {s}", {*history, *title});
        }
        if (!history) return std::nullopt;
        const auto relation = item_improvement_apply("sentence", "The artwork relates to {s}.", {*history});
        if (!relation) return std::nullopt;
        join(*result, *relation);
    }
    const int32_t entity_id = number(prefix + ".entity");
    if (entity_id >= 0) {
        const int32_t type = number(prefix + ".entity_type"), category = number(prefix + ".entity_category");
        static constexpr const char *types[] = {"civilization", "government", "vessel", "group", "group",
            "religion", "military organization", "group", "performance troupe", "merchant company", "craft guild"};
        if (type < 0 || size_t(type) >= std::size(types)) return std::nullopt;
        auto description = item_improvement_apply("term", types[type], {});
        if (type == 10) {
            const auto profession = item_extra_label(text(prefix + ".guild"));
            if (!profession) return std::nullopt;
            description = item_improvement_apply("term", "{s} guild", {*profession});
        }
        if (!description) return std::nullopt;
        if (!text(prefix + ".entity_species").empty()) {
            const auto species = item_extra_label(text(prefix + ".entity_species"));
            if (!species) return std::nullopt;
            Pieces full = *species;
            join(full, *description);
            description = std::move(full);
        }
        const char *modifier = type == 1 ? "local {s}" : type == 3 ? "migrating {s}" :
            type == 4 ? "nomadic {s}" : type == 7 ? "outcast {s}" : nullptr;
        if (modifier) description = item_improvement_apply("term", modifier, {*description});
        if (!description) return std::nullopt;
        const auto found = std::find_if(event.subjects.begin(), event.subjects.end(), [&](const auto &s) {
            return s.kind == NativeHistoryObjectKind::Entity && s.id == entity_id;
        });
        const bool named = found != event.subjects.end() && found->name.has_name;
        std::optional<Pieces> relation;
        if (category != 0 && category != 1) return std::nullopt;
        if (named) {
            const auto entity = subject(NativeHistoryObjectKind::Entity, entity_id, false);
            if (!entity) return std::nullopt;
            relation = item_improvement_apply("sentence", category == 0 ?
                "The image is the symbol of {p}, a {s}." :
                "The image was commissioned by {p}, a {s}.", {*entity, *description});
        } else relation = item_improvement_apply("sentence", category == 0 ?
            "The image is the symbol of a {s}." : "The image was commissioned by a {s}.", {*description});
        if (!relation) return std::nullopt;
        join(*result, *relation);
    }
    return result;
};

const auto item_extra_dice = [&](const std::string &prefix) -> std::optional<Pieces> {
    const auto &faces = numbers(prefix + ".faces");
    int32_t common = -1, minimum = -1, maximum = -1;
    bool same = true;
    for (int32_t id : faces) {
        const auto &face = numbers(prefix + ".face." + std::to_string(id));
        if (face.size() != 4) return std::nullopt;
        if (minimum == -1 || face[3] < minimum) minimum = face[3];
        if (maximum == -1 || face[3] > maximum) maximum = face[3];
        if (common == -1) common = face[0];
        else if (common != face[0]) same = false;
    }
    if (!same) common = -1;
    const char *kind = common == 0 ? "images" : common == 1 ? "words" : common == 2 ? "symbols" :
        common == 3 ? "dots" : common == 4 ? "numbers" : "images and symbols";
    auto description = item_improvement_apply("term", kind, {});
    if (!description) return std::nullopt;
    if (common == 3 || common == 4) {
        if (minimum != -1 && minimum != maximum)
            description = item_improvement_apply("term", "{s}, ranging from {c} to {c}",
                {*description, item_extra_number(minimum), item_extra_number(maximum)});
    } else {
        const auto counted = item_improvement_apply("term", "{c} " + std::string(kind),
            {item_extra_number(static_cast<int32_t>(faces.size()))});
        if (!counted) return std::nullopt;
        description = item_improvement_apply("term", "a series of {s}", {*counted});
    }
    if (!description) return std::nullopt;
    auto result = number(prefix + ".kind") == 0 ? item_improvement_apply("sentence",
        "On the faces of the object are {s}.", {*description}) : std::optional<Pieces>(*description);
    if (!result) return std::nullopt;
    if (number(prefix + ".kind") != 0) result->push_back(piece("。", neutral));
    const int32_t upward = number(prefix + ".upward");
    if (upward < 0) return result;
    const std::string key = prefix + ".face." + std::to_string(upward);
    const auto &face = numbers(key);
    const int32_t count = face[3];
    std::optional<Pieces> value = Pieces{};
    if (face[0] == 3 || face[0] == 4) value = item_extra_number(count);
    else if (face[0] == 2) {
        value = item_extra_label(text(key + ".label"));
        const auto adjective = item_extra_label(text(key + ".adjective"));
        if (!value || !adjective) return std::nullopt;
        Pieces label = *adjective;
        join(label, *value);
        value = count == 1 ? std::optional<Pieces>(label) : item_improvement_apply("term", "{c} {s}",
            {item_extra_number(count), label});
    } else if (face[0] == 1) {
        const int part = number(key + ".part");
        const char *pos = part == 0 || part == 1 ? "NOUN" : part == 2 ? "ADJ" : part == 3 ? "PREFIX" :
            part >= 4 && part <= 8 ? "VERB" : nullptr;
        Pieces word;
        if (pos) {
            const auto found = procedural_word_senses_.find(text(key + ".word") + "\t" + pos);
            if (found == procedural_word_senses_.end()) return std::nullopt;
            word.push_back(piece(found->second, neutral));
        }
        value = count == 1 ? item_improvement_apply("term", "the word \"{k}\"", {word}) :
            item_improvement_apply("term", "{c} \"{k}\"s", {item_extra_number(count), word});
    } else if (face[0] == 0 && number(key + ".image.present") &&
            !numbers(key + ".image.elements").empty()) {
        const std::string image = key + ".image";
        const std::string element = image + ".element.0";
        using ElementKind = NativeHistoryArtElementKind;
        const auto element_kind = static_cast<ElementKind>(number(element + ".kind"));
        if (element_kind == ElementKind::Creature || element_kind == ElementKind::Item) {
            value = item_art_element(element, false, true);
            if (!value) return std::nullopt;
            if (element_kind == ElementKind::Creature && !numbers(image + ".properties").empty()) {
                const auto &property = numbers(image + ".property.0");
                static constexpr const char *modifiers[] = {"laboring {s}", "menacing {s}", "traveling {s}",
                    "confused {s}", "terrified {s}", "burning {s}", "weeping {s}", "screaming {s}",
                    "submitting {s}", "dead {s}", "laughing {s}", "offended {s}", "plaintive {s}",
                    "praying {s}", "triumphant {s}"};
                static constexpr uint8_t selected[] = {0,15,15,15,15,15,1,2,15,15,3,4,15,15,5,6,
                    15,15,7,8,15,15,15,9,10,11,15,12,15,15,15,15,13,15,15,15,15,15,15,15,15,15,15,14};
                if (property.size() == 4 && property[0] == 1 && property[3] >= 4 && property[3] <= 47) {
                    const int modifier = selected[property[3] - 4];
                    if (modifier < 15) value = item_improvement_apply("term", modifiers[modifier], {*value});
                }
            }
            if (value && count != 1)
                value = item_improvement_apply("term", "{c} {s}", {item_extra_number(count), *value});
        }
    }
    if (!value) return std::nullopt;
    const auto face_sentence = item_improvement_apply("sentence", "The upward face is {s}.", {*value});
    if (!face_sentence) return std::nullopt;
    join(*result, *face_sentence);
    return result;
};

// Native c75000 order: 0 base artwork; 1 image-set improvements; 2 currency
// and dye; 3 contaminants, interaction source text, tool/instrument RAW text.
const auto item_extra_phase = [&](const std::string &prefix, int phase) -> std::optional<Pieces> {
    Pieces result;
    const auto append = [&](std::optional<Pieces> value) {
        if (!value) return false;
        join(result, *value);
        return true;
    };
    if (phase == 0) return item_art_image(prefix + ".image", 4);
    if (phase == 1) {
        for (int32_t id : numbers(prefix + ".dice"))
            if (!append(item_extra_dice(prefix + ".dice." + std::to_string(id)))) return std::nullopt;
    } else if (phase == 2) {
        if (number(prefix + ".coin")) {
            const std::string key = prefix + ".currency";
            const int32_t entity_id = number(key + ".entity");
            if (entity_id != -1) {
                const auto material = item_improvement_material(key + ".material");
                auto entity = subject(NativeHistoryObjectKind::Entity, entity_id, false);
                if (!material || !entity) return std::nullopt;
                const int32_t ruler = number(key + ".ruler");
                std::optional<Pieces> currency;
                if (number(key + ".dated")) {
                    const int32_t year = number(key + ".year");
                    entity = year == -1 ? item_improvement_apply("term", "{s} from an unknown year", {*entity}) :
                        item_improvement_apply("term", "{s} from the year {c}", {*entity, item_extra_number(year)});
                } else if (ruler >= 0) {
                    if (number(key + ".ruler_present")) {
                        const auto name = subject(NativeHistoryObjectKind::Identity,
                            number(key + ".ruler_name"), false, number(key + ".ruler_name.subid"));
                        if (!name) return std::nullopt;
                        currency = item_improvement_apply("sentence", "This is the {i} currency of {r} under {r}.",
                            {*material, *entity, item_extra_link(*name, 0, ruler)});
                    } else entity = item_improvement_apply("term", "{s} under an obscure ruler", {*entity});
                } else entity = item_improvement_apply("term", "{s} from a period of no rule", {*entity});
                if (!entity) return std::nullopt;
                if (!currency) currency = item_improvement_apply("sentence", "This is the {i} currency of {r}.",
                    {*material, *entity});
                if (!append(currency)) return std::nullopt;
            }
            if (!append(item_art_image(key + ".front", 17)) || !append(item_art_image(key + ".back", 18)))
                return std::nullopt;
        }
        if (!text(prefix + ".dye").empty()) {
            const auto color = translate_item_color_pattern(text(prefix + ".dye"));
            if (!color || !append(item_improvement_apply("sentence", "When used as a dye, it produces {v}.",
                    {Pieces{piece(*color, neutral)}})))
                return std::nullopt;
        }
    } else if (phase == 3) {
        const auto append_raw = [&](const std::string &raw,
                NativeSourceText source_kind = NativeSourceText::Description) {
            if (raw.empty()) return true;
            // Authored interaction/itemdef RAW DESCRIPTION, bounded at capture.
            const auto translated = native_raw_description(raw, source_kind);
            return translated && append(Pieces{piece(*translated, neutral)});
        };
        for (int32_t id : numbers(prefix + ".contaminants")) {
            const std::string key = prefix + ".contaminant." + std::to_string(id);
            const auto material = item_improvement_material(key);
            if (!material || !append(item_improvement_sentence(number(key + ".amount") >= 100 ?
                    "is coated with {s}" : "is spattered with {s}", *material))) return std::nullopt;
        }
        for (int32_t id : numbers(prefix + ".effects")) {
            const auto &raw = text(prefix + ".effect." + std::to_string(id));
            if (!append_raw(raw)) return std::nullopt;
        }
        const auto &special = text(prefix + ".special");
        if (!append_raw(special, number(prefix + ".special_type") == 13 ?
                NativeSourceText::Instrument : NativeSourceText::Item)) return std::nullopt;
    } else if (phase != 1) return std::nullopt;
    return result;
};
