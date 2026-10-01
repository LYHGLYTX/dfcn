// Included in translate_history_event after the shared subject, template,
// date and piece helpers, before the real-event date prefix is emitted.
const auto append_page_confidence = [&](Pieces &result) {
    const int32_t confidence = number("confidence");
    static constexpr const char *knowledge[] = {"",
        "A few issues still trouble scholars, but the picture is fairly clear.",
        "Many facts are still unclear to historians.", "It is still shrouded in mystery.",
        "Its nature is still an intriguing puzzle to the learned.",
        "Only the barest fragments of this amazing story have been uncovered."};
    if (confidence < 0 || confidence > 5) return false;
    if (confidence) {
        auto known = term(knowledge[confidence]);
        if (!known) return false;
        join(result, *known);
        if (confidence == 5) {
            auto untold = term("It is one of the great untold tales of our times.");
            if (!untold) return false;
            join(result, *untold);
        }
    }
    return true;
};
// Biography and religion descriptions share one typed domain list and the
// established sphere glossary, preserving the native displayed order.
const auto page_spheres = [&]() -> std::optional<Pieces> {
    Pieces result;
    const auto &values = numbers("spheres");
    for (size_t index = 0; index < values.size(); ++index) {
        auto key = history_event_sphere_key(values[index]);
        if (!key) return std::nullopt;
        const auto found = deity_sphere_translations_.find(std::string(*key));
        if (found == deity_sphere_translations_.end()) return std::nullopt;
        if (index) result.push_back(piece(index + 1 == values.size() ? "和" : "、", neutral));
        result.push_back(piece(found->second, neutral));
    }
    return result;
};
#include "history_collection_page_semantics.inc"
if (document.page) {
    const auto child_key = [](int32_t relation) -> const char * {
        static constexpr const char *children[] = {
            "eldest son", "second eldest son", "third eldest son", "fourth eldest son",
            "fifth eldest son", "sixth eldest son", "seventh eldest son", "eighth eldest son",
            "ninth eldest son", "tenth eldest son", "son", "youngest son", "only son",
            "eldest daughter", "second eldest daughter", "third eldest daughter", "fourth eldest daughter",
            "fifth eldest daughter", "sixth eldest daughter", "seventh eldest daughter", "eighth eldest daughter",
            "ninth eldest daughter", "tenth eldest daughter", "daughter", "only daughter", "youngest daughter",
            "eldest child", "second eldest child", "third eldest child", "fourth eldest child",
            "fifth eldest child", "sixth eldest child", "seventh eldest child", "eighth eldest child",
            "ninth eldest child", "tenth eldest child", "child", "youngest child", "only child"};
        return relation >= 6 && relation <= 44 ? children[relation - 6] : "child";
    };
    switch (document.page->kind) {
#include "history_page_kill_semantics.inc"
#include "history_artifact_page_semantics.inc"
#include "history_entity_page_semantics.inc"
    case NativeHistoryPageKind::StructureIntroduction: {
        auto building = structure(event.site_id, number("building"));
        auto type = term(text("building.label"));
        auto site = subject(NativeHistoryObjectKind::Site, event.site_id, false);
        if (!building || !type || !site) return std::nullopt;
        auto result = apply("{p} was {s} in {p}.", {*building, *type, *site});
        if (!result || !append_page_confidence(*result)) return std::nullopt;
        return result;
    }
    case NativeHistoryPageKind::SiteIntroduction: {
        auto site = subject(NativeHistoryObjectKind::Site, event.site_id, false);
        std::string key = text("site.label");
        // The native site adjective producer supplies "dark" only for a
        // DarkFortress. It is not a racial prefix and cannot change hills
        // into racial hillocks; the shared type glossary retains that scope.
        if (number("site.site_type") == 1) key.insert(0, "dark ");
        auto type = history_reference_kind(key);
        if (!site || !type) return std::nullopt;
        auto result = apply("{p} was a {s}.", {*site, *type});
        if (!result || !append_page_confidence(*result)) return std::nullopt;
        return result;
    }
    case NativeHistoryPageKind::RegionIntroduction: {
        auto region = subject(NativeHistoryObjectKind::Region, number("region"), false);
        auto world = subject(NativeHistoryObjectKind::World, 0, false);
        if (!region || !world) return std::nullopt;
        auto result = apply("{p} could be found within {p}", {*region, *world});
        if (!result) return std::nullopt;
        result->push_back(piece("。", neutral));
        if (!append_page_confidence(*result)) return std::nullopt;
        return result;
    }
    case NativeHistoryPageKind::FigureBiography: {
        auto actor = subject(NativeHistoryObjectKind::Figure, event.actor_id, false);
        const auto figure = std::find_if(event.subjects.begin(), event.subjects.end(), [&](const auto &entry) {
            return entry.kind == NativeHistoryObjectKind::Figure && entry.id == event.actor_id;
        });
        if (figure != event.subjects.end() && !figure->name.has_name) actor = term("This nameless being");
        if (!actor) return std::nullopt;
        const int32_t identity = number("identity");
        auto species = translate_creature_descriptor(text("species"));
        std::optional<Pieces> identity_sentence;
        if (identity == 1 && event.entity_id >= 0) {
            auto entity = subject(NativeHistoryObjectKind::Entity, event.entity_id, false);
            if (!entity) return std::nullopt;
            identity_sentence = apply("{n} was a deity that occurs in the myths of {p}", {*actor, *entity});
            if (identity_sentence) identity_sentence->push_back(piece("。", neutral));
        } else if (identity == 2 && number("force_region") >= 0) {
            auto region = subject(NativeHistoryObjectKind::Region, number("force_region"), false);
            if (!region) return std::nullopt;
            identity_sentence = apply("{n} was a force which was said to permeate {p}.", {*actor, *region});
        } else if (identity == 1 || identity == 2) {
            auto kind = term(identity == 1 ? "deity" : "force");
            if (!kind) return std::nullopt;
            identity_sentence = apply("{n} was a {s}.", {*actor, *kind});
        } else if (identity == 3) {
            std::optional<Pieces> original;
            if (number("animated_id") >= 0)
                original = subject(NativeHistoryObjectKind::Figure, number("animated_id"));
            else {
                auto label = translate_creature_descriptor(text("animated_label"));
                if (label) original = Pieces{piece(*label, neutral)};
            }
            if (!original) return std::nullopt;
            identity_sentence = apply("{n} was {s}, animated by unknown forces.", {*actor, *original});
        } else {
            if (!species) return std::nullopt;
            const Pieces kind{piece(*species, neutral)};
            identity_sentence = event.year >= 1
                ? apply("{n} was a {s} born in {d}.", {*actor, kind, Pieces{piece(std::to_string(event.year), neutral)}})
                : apply("{n} was a {s}.", {*actor, kind});
        }
        if (!identity_sentence) return std::nullopt;
        Pieces result = *identity_sentence;
        const int32_t sex = number("sex");
        const std::string pronoun = sex == 1 ? "He" : sex == 0 ? "She" : "It";
        const std::string possessive = sex == 1 ? "his" : sex == 0 ? "her" : "its";
        if (number("unknown_parentage")) {
            auto parentage = term(pronoun + " was of unknown parentage.");
            if (!parentage) return std::nullopt;
            join(result, *parentage);
        } else if (!numbers("parents").empty()) {
            Pieces parents;
            for (int32_t id : numbers("parents")) {
                auto parent = subject(NativeHistoryObjectKind::Figure, id, false);
                if (!parent) return std::nullopt;
                if (!parents.empty()) parents.push_back(piece("和", neutral));
                join(parents, *parent);
            }
            auto relationship = term(child_key(number("child_relation")));
            if (!relationship) return std::nullopt;
            auto parentage = apply(pronoun + " was the {s} of {n}.", {*relationship, parents});
            if (!parentage) return std::nullopt;
            join(result, *parentage);
            if (number("missing_parent") >= 0) {
                auto role = term(number("missing_parent") == 0 ? "mother" : "father");
                if (!role) return std::nullopt;
                auto lost = apply("The identity of " + possessive + " {s} has been lost to time.", {*role});
                if (!lost) return std::nullopt;
                join(result, *lost);
            }
        }
        if (number("first_kind") >= 0) {
            static constexpr const char *firsts[] = {
                " the first of ", " one of the first of ", " the only one of ", " one of the only ones of "};
            const int32_t first = number("first_kind");
            if (first > 3) return std::nullopt;
            auto original = term(pronoun + " was" + firsts[first] + possessive + " kind.");
            if (!original) return std::nullopt;
            join(result, *original);
        }
        if (number("fate") >= 0) {
            auto qualifier = term("Although accounts vary, it is universally agreed that");
            static constexpr const char *fates[] = {"{n} was guided by forces unknown.",
                "{n} was possessed of an unusual destiny.", "{n} was chosen by fate as the vanguard of destiny."};
            const int32_t fate = number("fate");
            if (fate > 2 || !qualifier) return std::nullopt;
            auto chosen = apply(fates[fate], {*actor});
            if (!chosen) return std::nullopt;
            join(result, *qualifier);
            join(result, *chosen);
        }
        if (const auto description = event.texts.find("description");
                description != event.texts.end() && !trim_view(description->second).empty()) {
            auto translated = native_raw_description(description->second);
            if (!translated) {
                failure_detail += "; figure=" + std::to_string(event.actor_id);
                return std::nullopt;
            }
            result.push_back(piece(*translated, neutral));
        }
        const auto domains = page_spheres();
        if (!domains) return std::nullopt;
        const Pieces &spheres = *domains;
        if (identity == 1) {
            auto form = translate_legends_term(text("form"));
            if (!form) return std::nullopt;
            std::vector<Pieces> fields{*actor, Pieces{piece(*form, neutral)}};
            std::string key = "{n} was most often depicted as a {s}";
            if (!spheres.empty()) { key += " and was associated with {r}"; fields.push_back(spheres); }
            auto depiction = apply(key + ".", fields);
            if (!depiction) return std::nullopt;
            join(result, *depiction);
        } else if (!spheres.empty()) {
            auto association = apply("{n} was associated with {r}.", {*actor, spheres});
            if (!association) return std::nullopt;
            join(result, *association);
        }
        if (!append_page_confidence(result)) return std::nullopt;
        return result;
    }
    case NativeHistoryPageKind::SectionHeading:
        return term(text("heading"));
    case NativeHistoryPageKind::RelatedFigure: {
        auto actor = subject(NativeHistoryObjectKind::Figure, event.actor_id, number("include_species") == 1);
        const int32_t type = number("link_type"), sex = number("sex");
        std::string key;
        static constexpr const char *relations[] = {
            "mother", "father", "spouse", "child", "", "lover", "prisoner", "imprisoner",
            "master", "apprenticeship", "traveling companion", "former master",
            "former apprentice", "owner", "former spouse", "deceased spouse"};
        if (type < 0 || type >= 16) return std::nullopt;
        key = relations[type];
        if ((type == 0 || type == 1) && sex == -1) key = "parent";
        else if (type == 2) key = sex == -1 ? "spouse" : sex == 0 ? "wife" : "husband";
        else if (type == 3) {
            key = child_key(number("child_relation"));
        } else if (type == 4) {
            const int32_t strength = number("strength");
            key = strength >= 90 ? "object of ardent worship" : strength >= 75 ? "object of faithful worship" :
                strength >= 25 ? "object of worship" : strength >= 10 ? "object of casual worship" : "object of dubious worship";
        }
        auto relation = term(key, "Native history relation: ");
        if (!actor || !relation) return std::nullopt;
        Pieces result = *actor;
        result.push_back(piece("，", neutral));
        join(result, *relation);
        for (const auto &[field, prefix] : {std::pair{"born", "b. {d}"}, std::pair{"died", "d. {d}"}}) {
            const int32_t year = number(field);
            if (year < 1) continue;
            auto date = apply(prefix, {Pieces{piece(std::to_string(year), neutral)}});
            if (!date) return std::nullopt;
            result.push_back(piece("，", neutral));
            join(result, *date);
        }
        return result;
    }
    case NativeHistoryPageKind::RelatedEntity: {
        auto entity = subject(NativeHistoryObjectKind::Entity, event.entity_id, false);
        if (!entity) return std::nullopt;
        const auto scoped_office = [&]() -> std::optional<Pieces> {
            auto role = event.position.empty() ? std::optional<Pieces>(Pieces{}) : office(event.position);
            if (!role || number("position_site") < 0) return role;
            auto site = subject(NativeHistoryObjectKind::Site, number("position_site"), false);
            return site ? apply("{s} of {p}", {*role, *site}) : std::nullopt;
        };
        const int32_t related_kind = number("related_kind");
        if (related_kind != 0) {
            std::optional<Pieces> role;
            if (related_kind == 1) role = scoped_office();
            else if (related_kind == 2) role = term(number("entity_type") == 0 ? "associated civilization" :
                number("entity_type") == 6 ? "militant worshippers" : "religious worshippers");
            else if (related_kind == 3) {
                // Native b92594 branch table, each row ordered by the five
                // thresholds >=100, >=75, >=50, >=25 and positive values.
                static constexpr std::pair<int32_t, std::array<const char *, 5>> levels[] = {
                    {0, {"legendary hero", "famous hero", "hero", "greatly respected for heroic acts", "respected for heroic acts"}},
                    {2, {"legendary brawler", "famous brawler", "noted brawler", "known brawler", "rumored brawler"}},
                    {3, {"legendary villain", "infamous villain", "noted villain", "known villain", "rumored villain"}},
                    {6, {"legendary killer", "infamous killer", "noted killer", "known killer", "rumored killer"}},
                    {7, {"legendary murderer", "infamous murderer", "noted murderer", "known murderer", "rumored murderer"}},
                    {11, {"legendary enemy fighter", "infamous enemy fighter", "noted enemy fighter", "known enemy fighter", "rumored enemy fighter"}},
                    {12, {"legendary fighter", "famous fighter", "noted fighter", "known fighter", "rumored fighter"}},
                    {13, {"legendary bully", "infamous bully", "noted bully", "known bully", "rumored bully"}},
                    {14, {"legendary brigand", "infamous brigand", "noted brigand", "known brigand", "rumored brigand"}},
                    {15, {"legendary loyal soldier", "famous loyal soldier", "noted loyal soldier", "known loyal soldier", "rumored loyal soldier"}},
                    {16, {"legendary monster", "infamous monster", "noted monster", "known monster", "rumored monster"}},
                    {23, {"legendary hunter", "great hunter", "talented hunter", "skilled hunter", "rumored hunter"}},
                    {24, {"legendary protector of the weak", "famous protector of the weak", "noted protector of the weak", "known protector of the weak", "rumored protector of the weak"}},
                    {25, {"legendary treasure hunter", "famous treasure hunter", "noted treasure hunter", "known treasure hunter", "rumored treasure hunter"}},
                    {26, {"legendary thief", "infamous thief", "noted thief", "known thief", "rumored thief"}},
                    {28, {"legendary preserver of knowledge", "famous preserver of knowledge", "noted preserver of knowledge", "known preserver of knowledge", "rumored preserver of knowledge"}},
                    {29, {"legendary intruder", "infamous intruder", "noted intruder", "known intruder", "rumored intruder"}}
                };
                const int32_t value = number("reputation_value"), type = number("reputation_type");
                const size_t tier = value >= 100 ? 0 : value >= 75 ? 1 : value >= 50 ? 2 : value >= 25 ? 3 : 4;
                for (const auto &[kind, labels] : levels)
                    if (kind == type && value > 0) { role = term(labels[tier]); break; }
            }
            if (!role) return std::nullopt;
            Pieces result = *entity;
            result.push_back(piece("（", neutral));
            join(result, *role);
            result.push_back(piece("）", neutral));
            return result;
        }
        const int32_t type = number("link_type");
        if (type >= 10 && type <= 14 && !number("position_present")) {
            Pieces result = *entity;
            result.push_back(piece("（）", neutral));
            return result;
        }
        static constexpr const char *roles[] = {
            "member", "former member", "mercenary", "former mercenary", "slave", "former slave",
            "prisoner", "former prisoner", "enemy", "criminal", "", "", "", "", "", "worker", "former worker"};
        if (type < 0 || type > 16) return std::nullopt;
        auto role = type >= 10 && type <= 14 ? scoped_office() : term(roles[type], "Native history relation: ");
        if (!entity || !role) return std::nullopt;
        Pieces result = *entity;
        result.push_back(piece("（", neutral));
        if (type == 12) {
            auto claim = apply("claim to {s}", {*role});
            if (!claim) return std::nullopt;
            role = std::move(claim);
        }
        join(result, *role);
        const int32_t first = number("start_year"), last = number("end_year");
        if (last >= 0) {
            result.push_back(piece("，", neutral));
            auto date = first >= 0
                ? apply("{d} until {d}", {Pieces{piece(std::to_string(first), neutral)}, Pieces{piece(std::to_string(last), neutral)}})
                : apply("until {d}", {Pieces{piece(std::to_string(last), neutral)}});
            if (!date) return std::nullopt;
            join(result, *date);
        } else if (first >= 0 && type != 11 && type != 14) {
            auto date = apply("{d} to present", {Pieces{piece(std::to_string(first), neutral)}});
            if (!date) return std::nullopt;
            result.push_back(piece("，", neutral));
            join(result, *date);
        }
        result.push_back(piece("）", neutral));
        return result;
    }
    case NativeHistoryPageKind::RelatedSite: {
        auto site = subject(NativeHistoryObjectKind::Site, event.site_id, false);
        static constexpr const char *roles[] = {
            "site occ", "seat of power", "hangout", "home", "home", "lair", "home", "home", "prison", "prison"};
        const int32_t type = number("link_type");
        if (!site || type < 0 || type >= 10) return std::nullopt;
        auto role = term(roles[type], "Native history relation: ");
        if (!role) return std::nullopt;
        Pieces result = *site;
        result.push_back(piece("（", neutral));
        join(result, *role);
        result.push_back(piece("）", neutral));
        return result;
    }
    case NativeHistoryPageKind::MilitaryParticipation: {
        auto actor = subject(NativeHistoryObjectKind::Figure, event.actor_id, false);
        auto battle = collection_title(number("collection"));
        auto when = history_date(event.year, event.seconds);
        if (!actor || !battle || !when) return std::nullopt;
        std::string key;
        std::vector<Pieces> fields;
        const bool hired = number("hired") != 0, scout = number("scout") != 0;
        if (!hired) key = "fought in {e}";
        else if (scout) key = event.entity_id >= 0
            ? "was hired as a scout from {p} for {e}" : "was hired as a scout for {e}";
        else key = event.entity_id >= 0
            ? "was hired as part of {p} to fight in {e}" : "was hired to fight in {e}";
        if (hired && event.entity_id >= 0) {
            auto employer = subject(NativeHistoryObjectKind::Entity, event.entity_id, false);
            if (!employer) return std::nullopt;
            fields.push_back(*employer);
        }
        fields.push_back(*battle);
        if (event.site_id >= 0) {
            auto site = subject(NativeHistoryObjectKind::Site, event.site_id, false);
            if (!site) return std::nullopt;
            key += number("assault") ? ", an assault on {p}" : " in defense of {p}";
            fields.push_back(*site);
        } else if (number("region") >= 0 || number("layer") >= 0) {
            const bool region = number("region") >= 0;
            auto location = subject(region ? NativeHistoryObjectKind::Region :
                NativeHistoryObjectKind::Underground, number(region ? "region" : "layer"), false);
            if (!location) return std::nullopt;
            key += " in {p}";
            fields.push_back(*location);
        }
        auto action = apply(key, fields);
        if (!action) return std::nullopt;
        Pieces result = *when;
        join(result, *actor);
        join(result, *action);
        result.push_back(piece("。", neutral));
        return result;
    }
    default: return std::nullopt;
    }
}
