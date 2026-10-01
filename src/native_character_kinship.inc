// Resolve captions through the directed family links and first-path order
// used by the native character sheet. Multiple real paths to one person do
// not invalidate the caption. Memoized records belong to this callback only.
static std::optional<std::string> native_character_kinship_term(
        uintptr_t subject, uintptr_t relative, int32_t relation) {
    switch (relation) {
    case 45: return "祖母";
    case 46: return "祖父";
    case 47: return "外祖母";
    case 48: return "外祖父";
    case 52: return "哥哥";
    case 53: return "姐姐";
    case 54: return "兄姊";
    case 55: return "弟弟";
    case 56: return "妹妹";
    case 57: return "弟妹";
    default: break;
    }
    if (!subject || !relative || subject == relative || relation < 49 || relation > 71)
        return std::nullopt;
    const uintptr_t base = native_history_profile_base();
    if (!base) return std::nullopt;
    NativeBorrowedVector<uintptr_t> world_figures;
    if (!native_history_read_vector(native_history_global(0x24f9d18), world_figures))
        return std::nullopt;
    struct Figure {
        int32_t id = -1, mother = -1, father = -1, spouse = -1;
        int32_t born_year = -1, born_seconds = -1;
        int8_t sex = -1;
        std::vector<int32_t> children;
    };
    // The world's collection supplies the bound; no small-family cutoff.
    // unordered_map references remain valid when its buckets are rehashed.
    std::unordered_map<uintptr_t, std::optional<Figure>> figures;
    std::unordered_map<int32_t, const Figure *> identities;
    figures.reserve(32);
    identities.reserve(32);
    auto read_figure = [&](uintptr_t address) -> const Figure * {
        if (!address) return nullptr;
        const auto cached = figures.find(address);
        if (cached != figures.end()) return cached->second ? &*cached->second : nullptr;
        if (figures.size() >= world_figures.size() + 2) return nullptr;
        auto capture = [&]() -> std::optional<Figure> {
            Figure value;
            const auto field = [&](size_t coordinate, auto &destination) {
                return native_history_copy(native_history_object_field(address,
                    "historical_figure", coordinate, sizeof(destination)), destination);
            };
            NativeBorrowedVector<uintptr_t> links;
            if (!field(0xe0, value.id) || value.id < 0 || !field(6, value.sex) ||
                !field(0x10, value.born_year) || !field(0x14, value.born_seconds) ||
                !field(0x118, links) || !links.valid(1u << 24)) return std::nullopt;
            bool seen[3]{};
            for (size_t at = 0; at < links.size(); ++at) {
                const uintptr_t link = native_history_vector_at(links, at);
                int32_t type = -1, target = -1;
                if (!link || !native_history_page_getter(link, 0, type) ||
                    type < 0 || type > 3 || link > UINTPTR_MAX - 8 ||
                    !native_history_copy(link + 8, target)) continue;
                // b98d30 returns the first mother/father/spouse link, even
                // with an unset target. Later links do not veto that record.
                if (type < 3) {
                    if (seen[type]) continue;
                    seen[type] = true;
                    if (target < 0 || target == value.id) continue;
                    if (type == 0) value.mother = target;
                    else if (type == 1) value.father = target;
                    else value.spouse = target;
                } else if (target >= 0 && target != value.id) value.children.push_back(target);
            }
            return value;
        }();
        const auto inserted = figures.emplace(address, std::move(capture)).first;
        const Figure *value = inserted->second ? &*inserted->second : nullptr;
        if (value) identities.emplace(value->id, value);
        return value;
    };
    auto by_id = [&](int32_t id) -> const Figure * {
        if (id < 0) return nullptr;
        const auto found = identities.find(id);
        if (found != identities.end()) return found->second;
        const auto value = read_figure(native_history_find_subject(
            base, NativeHistoryObjectKind::Figure, id));
        const Figure *result = value && value->id == id ? value : nullptr;
        identities.emplace(id, result);
        return result;
    };
    const Figure *self = read_figure(subject), *other = read_figure(relative);
    if (!self || !other || self->id == other->id) return std::nullopt;
    const auto same_id = [](int32_t first, int32_t second) {
        return first >= 0 && first == second;
    };
    const auto lists_child = [](const Figure *parent, int32_t id) {
        return parent && id >= 0 &&
            std::find(parent->children.begin(), parent->children.end(), id) != parent->children.end();
    };
    const auto is_child = [&](const Figure *parent, const Figure *child) {
        return parent && child && (lists_child(parent, child->id) ||
            same_id(child->mother, parent->id) || same_id(child->father, parent->id));
    };
    const auto sex_group = [](int8_t sex) { return sex == 1 ? 0 : sex == 0 ? 1 : 2; };
    const auto ordered_children = [&](const Figure *parent) {
        std::array<std::vector<const Figure *>, 3> groups;
        if (parent) {
            std::unordered_set<int32_t> seen;
            for (const int32_t id : parent->children) {
                const auto child = by_id(id);
                if (child && seen.insert(id).second)
                    groups[sex_group(child->sex)].push_back(child);
            }
        }
        std::vector<const Figure *> result;
        for (const auto &group : groups) result.insert(result.end(), group.begin(), group.end());
        return result;
    };
    const auto older_than = [](const Figure &first, const Figure &second)
            -> std::optional<bool> {
        if (first.born_year < 0 || second.born_year < 0) return std::nullopt;
        if (first.born_year != second.born_year)
            return first.born_year < second.born_year;
        if (first.born_seconds < 0 || second.born_seconds < 0 ||
            first.born_seconds == second.born_seconds) return std::nullopt;
        return first.born_seconds < second.born_seconds;
    };
    const auto sibling_suffix = [](int8_t sex, std::optional<bool> older) -> std::string {
        if (!older) return sex == 1 ? "兄弟" : sex == 0 ? "姐妹" : "兄弟姊妹";
        if (sex == 1) return *older ? "兄" : "弟";
        if (sex == 0) return *older ? "姐" : "妹";
        return *older ? "兄姊" : "弟妹";
    };
    const auto self_mother = by_id(self->mother), self_father = by_id(self->father);
    if (relation >= 65) {
        // bb43d4/45ce compares both parents' forward child lists; reverse
        // mother/father records are additional evidence, not a prerequisite.
        bool same_mother = lists_child(self_mother, other->id);
        bool same_father = lists_child(self_father, other->id);
        if (!same_mother && !same_father) {
            same_mother = same_id(self->mother, other->mother);
            same_father = same_id(self->father, other->father);
        }
        std::string prefix;
        if (same_mother && !same_father) prefix = "异父";
        else if (same_father && !same_mother) prefix = "异母";
        else return std::nullopt;
        switch (relation) {
        case 65: return prefix + "兄";
        case 66: return prefix + "姐";
        case 67: return prefix + "兄姊";
        case 68: return prefix + "弟";
        case 69: return prefix + "妹";
        case 70: return prefix + "弟妹";
        default: return prefix + sibling_suffix(other->sex, older_than(*other, *self));
        }
    }
    if (relation == 63) {
        const auto older = older_than(*other, *self);
        if (older && other->sex == 1) return *older ? "哥哥" : "弟弟";
        if (older && other->sex == 0) return *older ? "姐姐" : "妹妹";
        return sibling_suffix(other->sex, older);
    }
    if (relation >= 49 && relation <= 51) {
        // bb38bb..bb3b9f visits the maternal pair first.
        const auto term = [&](bool maternal) -> std::string {
            if (other->sex == 0) return maternal ? "外祖母" : "祖母";
            if (other->sex == 1) return maternal ? "外祖父" : "祖父";
            return maternal ? "外祖辈" : "祖辈";
        };
        for (const auto parent : {self_mother, self_father}) {
            if (!parent || (!same_id(parent->mother, other->id) &&
                !same_id(parent->father, other->id))) continue;
            const bool maternal = parent == self_mother;
            return term(maternal);
        }
        for (const auto parent : {self_mother, self_father})
            if (parent && lists_child(other, parent->id)) return term(parent == self_mother);
        return std::nullopt;
    }
    if (relation == 61 || relation == 62) {
        const auto term = [&](const Figure *sibling) -> std::string {
            if (sibling->sex == 1)
                return other->sex == 0 ? "侄女" : other->sex == 1 ? "侄子" : "侄辈";
            if (sibling->sex == 0)
                return other->sex == 0 ? "外甥女" : other->sex == 1 ? "外甥" : "外甥辈";
            return other->sex == 0 ? "侄甥女" : other->sex == 1 ? "侄甥" : "侄甥辈";
        };
        // bb43c1..bb5355: maternal male/female/neutral siblings, then
        // paternal siblings not visited already, then each one's children.
        // This order decides even when BOTH target parents are half-siblings
        // of the subject. Rejecting that valid pedigree left English rows.
        std::unordered_set<int32_t> visited;
        for (const auto parent : {self_mother, self_father}) {
            for (const auto sibling : ordered_children(parent)) {
                if (sibling->id == self->id || !visited.insert(sibling->id).second) continue;
                if (lists_child(sibling, other->id)) return term(sibling);
            }
        }
        // Use reverse records only after exhausting the native paths.
        for (const auto parent : {self_mother, self_father}) {
            const std::array<const Figure *, 2> candidates{by_id(other->father), by_id(other->mother)};
            for (int group = 0; group < 3; ++group) for (const auto sibling : candidates) {
                if (sibling && sibling->id != self->id && sex_group(sibling->sex) == group &&
                    is_child(parent, sibling)) return term(sibling);
            }
        }
        return std::nullopt;
    }
    if (relation == 64) {
        const auto term = [&](const Figure *child) -> std::string {
            if (child->sex == 1)
                return other->sex == 0 ? "孙女" : other->sex == 1 ? "孙子" : "孙辈";
            if (child->sex == 0)
                return other->sex == 0 ? "外孙女" : other->sex == 1 ? "外孙" : "外孙辈";
            return "孙辈";
        };
        for (const auto child : ordered_children(self))
            if (lists_child(child, other->id)) return term(child);
        for (const auto child : {by_id(other->father), by_id(other->mother)})
            if (is_child(self, child)) return term(child);
        return std::nullopt;
    }
    if (relation == 58 || relation == 59 || relation == 60) {
        const auto aunt_uncle_term = [&](const Figure *sibling, const Figure *parent,
                bool maternal, bool spouse) -> std::string {
            if (spouse) {
                if (sibling->sex == 1 && other->sex == 0) {
                    if (maternal) return "舅母";
                    const auto older = older_than(*sibling, *parent);
                    return older ? (*older ? "伯母" : "叔母") : "伯叔母";
                }
                if (sibling->sex == 0 && other->sex == 1) return maternal ? "姨父" : "姑父";
                return maternal ? "母辈姻亲" : "父辈姻亲";
            }
            if (sibling->sex == 0) return maternal ? "姨母" : "姑母";
            if (sibling->sex == 1) {
                if (maternal) return "舅父";
                const auto older = older_than(*sibling, *parent);
                return older ? (*older ? "伯父" : "叔父") : "伯叔父";
            }
            return maternal ? "母辈旁亲" : "父辈旁亲";
        };
        const auto cousin_term = [&](const Figure *parent, bool maternal) {
            const std::string prefix = maternal || parent->sex == 0 ? "表" :
                parent->sex == 1 ? "堂" : "堂表";
            return prefix + sibling_suffix(other->sex, older_than(*other, *self));
        };
        // bb5355..bb66fe first uses the maternal grandmother's children,
        // then the paternal grandmother's. Aunt/uncle spouses use the first
        // type-2 link. Grandfathers follow only as incomplete-record recovery.
        struct Branch { const Figure *parent; const Figure *ancestor; bool maternal; };
        const std::array<Branch, 4> branches{{
            {self_mother, self_mother ? by_id(self_mother->mother) : nullptr, true},
            {self_father, self_father ? by_id(self_father->mother) : nullptr, false},
            {self_mother, self_mother ? by_id(self_mother->father) : nullptr, true},
            {self_father, self_father ? by_id(self_father->father) : nullptr, false}
        }};
        for (const auto &branch : branches) {
            if (!branch.parent || !branch.ancestor) continue;
            const auto excluded = [&](const Figure *sibling) {
                return !sibling || same_id(sibling->id, self->mother) ||
                    same_id(sibling->id, self->father);
            };
            if (relation == 58) {
                // Cousins use the original child-link order, not sex groups.
                for (const int32_t id : branch.ancestor->children) {
                    const auto sibling = by_id(id);
                    if (!excluded(sibling) && lists_child(sibling, other->id))
                        return cousin_term(sibling, branch.maternal);
                }
            } else {
                for (const auto sibling : ordered_children(branch.ancestor)) {
                    // Native 59/60 emits only the male/female groups;
                    // neutral siblings remain eligible as cousin parents.
                    if (excluded(sibling) || (sibling->sex != 0 && sibling->sex != 1)) continue;
                    if (sibling->id == other->id)
                        return aunt_uncle_term(sibling, branch.parent, branch.maternal, false);
                    if (same_id(sibling->spouse, other->id))
                        return aunt_uncle_term(sibling, branch.parent, branch.maternal, true);
                }
            }
        }
        // Endpoint records may recover an omitted forward link only after
        // the native path has had the opportunity to select its caption.
        for (const auto &branch : branches) {
            if (!branch.parent || !branch.ancestor) continue;
            const auto excluded = [&](const Figure *sibling) {
                return !sibling || same_id(sibling->id, self->mother) ||
                    same_id(sibling->id, self->father);
            };
            if (relation == 58) {
                for (const auto sibling : {by_id(other->father), by_id(other->mother)})
                    if (!excluded(sibling) && is_child(branch.ancestor, sibling))
                        return cousin_term(sibling, branch.maternal);
            } else {
                if (!excluded(other) && is_child(branch.ancestor, other))
                    return aunt_uncle_term(other, branch.parent, branch.maternal, false);
                const auto spouse = by_id(other->spouse);
                if (!excluded(spouse) && is_child(branch.ancestor, spouse))
                    return aunt_uncle_term(spouse, branch.parent, branch.maternal, true);
            }
        }
    }
    return std::nullopt;
}
