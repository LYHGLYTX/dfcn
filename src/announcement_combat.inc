// Recursive grammar for original combat records. All English predicates and
// Chinese wording live in the reloadable dictionary. The grammar's field
// scopes distinguish an attack verb, unit, item, anatomy, tissue, and complete
// consequence; no successful branch can leave an untranslated remainder.
// Native construction evidence is beside each rule in
// data/runtime/announcement-combat-grammar.tsv, imported by tools/announcement_grammar.py.
void Overlay::rebuild_announcement_combat_rules() {
    announcement_combat_rules_.clear();
    constexpr std::string_view prefix = "Announcement combat ";
    for (const Rule &entry : rules_) {
        if (!entry.source.starts_with(prefix)) continue;
        const size_t open = entry.source.find(" [", prefix.size());
        const size_t close = entry.source.find("]: ", open);
        if (open == std::string::npos || close == std::string::npos) continue;
        const std::string scope = entry.source.substr(prefix.size(), open - prefix.size());
        const std::string fields = entry.source.substr(open + 2, close - open - 2);
        Rule rule = entry;
        rule.source.erase(0, close + 3);
        // Native builders capitalize the first clause after constructing it.
        // Fold only grammar literals; typed names retain their original case.
        rule.case_insensitive = true;
        rule.template_literals.clear();
        rule.template_kinds.clear();
        rule.target_template_literals.clear();
        rule.target_capture_order.clear();
        split_template(rule.source, &rule.template_literals, &rule.template_kinds);
        if (!rule.template_kinds.empty() && !compile_template_target(rule)) continue;
        const size_t count = fields.empty() ? 0 :
            1 + static_cast<size_t>(std::count(fields.begin(), fields.end(), ','));
        if (count != rule.template_kinds.size()) continue;
        announcement_combat_rules_[scope].emplace_back(fields, std::move(rule));
    }
    // Exact and more specific constructions precede recursive alternatives.
    // Stable ties preserve intentional type precedence (anatomy before item).
    for (auto &[scope, entries] : announcement_combat_rules_)
        std::stable_sort(entries.begin(), entries.end(), [](const auto &a, const auto &b) {
            const auto literal_size = [](const Rule &r) {
                return r.source.size() - r.template_kinds.size() * 3;
            };
            return literal_size(a.second) > literal_size(b.second);
        });
}

std::optional<std::string> Overlay::translate_announcement_combat(
        std::string_view raw_source, std::string_view initial_scope) const {
    TranslationWorkFrame work_frame("announcement grammar", raw_source);
    if (announcement_combat_rules_.empty()) return std::nullopt;
    // Match native prose in a canonical view, but give typed leaves their
    // original bytes. Memorial death clauses can contain doubled spaces while
    // an authored nickname in the same inscription owns its exact whitespace.
    // The mapping also preserves nicknames inside READ_ITEM inscriptions and
    // historical collection titles reached through the shared grammar.
    std::vector<size_t> origins;
    const bool preserve_fields = raw_source.find('`') != std::string_view::npos;
    const std::string source = normalize_utterance(raw_source,
        preserve_fields ? &origins : nullptr);
    if (source.empty()) return std::nullopt;
    // Shared historical/item fields can enter this grammar through another
    // parser. Track the semantic span across calls as well as within resolve,
    // without imposing a nesting or list-size limit on actual source records.
    // A nontrivial TLS destructor retains the core until the game thread
    // exits. Keep the set module-owned so ordinary hot reload can release it.
    auto &active_calls = reloadable_thread_state<
        std::unordered_set<std::string>, struct CombatActiveCallsTag>();
    const std::string call_key = std::string(initial_scope) + '\x1f' +
        std::string(preserve_fields ? raw_source : std::string_view(source));
    if (!active_calls.insert(call_key).second) return std::nullopt;
    struct ActiveCall {
        std::unordered_set<std::string> &calls;
        const std::string &key;
        ~ActiveCall() { calls.erase(key); }
    } call{active_calls, call_key};
    using Result = std::optional<std::string>;
    std::unordered_map<std::string, Result> memo;
    std::unordered_set<std::string> active;
    std::function<Result(std::string_view, std::string_view)> resolve;
    resolve = [&](std::string_view scope, std::string_view input) -> Result {
        TranslationWorkFrame field_work("announcement grammar field", input);
        input = trim_view(input);
        if (input.empty()) return std::nullopt;
        std::string_view original = input;
        if (preserve_fields) {
            const size_t begin = static_cast<size_t>(input.data() - source.data());
            const size_t end = begin + input.size();
            original = raw_source.substr(origins[begin], origins[end - 1] + 1 - origins[begin]);
        }
        std::string key(scope);
        key.push_back('\x1f');
        key.append(original);
        if (auto found = memo.find(key); found != memo.end()) return found->second;
        // Aliases may preserve span length while changing semantic scope. A
        // visited (scope, span) prevents cycles without truncating long reports.
        if (!active.insert(key).second) return std::nullopt;
        const auto finish = [&](Result result) -> Result {
            active.erase(key);
            if (result && result->empty()) result.reset();
            memo.emplace(key, result);
            return result;
        };
        if (scope.starts_with("$")) input = original;
        if (scope == "$memorial-actor") {
            auto result = translate_legends_actor(input);
            return finish(translation_complete_with_native_nicknames(result, input)
                ? std::move(result) : std::nullopt);
        }
        if (scope == "$memorial-artifact") {
            auto result = translate_legends_artifact_identity(input);
            return finish(translation_complete_with_native_nicknames(result, input)
                ? std::move(result) : std::nullopt);
        }
        if (scope == "$memorial-item") {
            auto result = translate_item_description_term(input);
            return finish(translation_complete_with_native_nicknames(result, input)
                ? std::move(result) : std::nullopt);
        }
        if (scope == "$memorial-preference") {
            auto result = translate_character_preference_term(input);
            return finish(item_description_translation_complete(result)
                ? std::move(result) : std::nullopt);
        }
        if (scope == "$memorial-material") {
            auto result = translate_material_name(input);
            if (!translation_complete_with_native_nicknames(result, input))
                result = translate_character_preference_term(input);
            return finish(translation_complete_with_native_nicknames(result, input)
                ? std::move(result) : std::nullopt);
        }
        if (scope == "$memorial-form") {
            auto result = translate_character_preference_term(input, true);
            return finish(item_description_translation_complete(result)
                ? std::move(result) : std::nullopt);
        }
        if (scope == "$unit") return finish(translate_ui_message_capture(input, true));
        if (scope == "$office") {
            // Intrigue and negotiation insert position.name directly from
            // the native position record. Resolve that complete typed title
            // through the shared office/profession vocabulary, never names.
            auto result = translate_unit_profession(input, false);
            if (!result) result = translate_legends_term(input, false);
            if (result && (result->find("[C:") != std::string::npos ||
                std::any_of(result->begin(), result->end(), [](unsigned char ch) {
                    return (ch >= 'A' && ch <= 'Z') || (ch >= 'a' && ch <= 'z');
                }))) result.reset();
            return finish(std::move(result));
        }
        if (scope == "$item") return finish(translate_legends_item(input));
        if (scope == "$body") return finish(translate_legends_anatomy(input));
        if (scope == "$creature") return finish(translate_creature_reference(input));
        if (scope == "$term") return finish(translate_ui_message_capture(input, false));
        if (scope == "$person") return finish(translate_legends_name(input, true));
        if (scope == "$name") return finish(translate_legends_name(input, false));
        if (scope == "$event") return finish(translate_legends_event(input, 0));
        if (scope == "$number") return finish(translate_announcement_number(input));
        if (scope == "$date") return finish(translate_announcement_date(input));
        if (scope == "$sphere") return finish(translate_deity_spheres(input));
        if (scope == "$distance") return finish(exact_literal_translation(
            "Announcement distance: " + lower(std::string(input))));
        if (scope == "$digits") {
            const size_t start = input.front() == '-' ? 1 : 0;
            return finish(start < input.size() && std::all_of(
                    input.begin() + start, input.end(), [](unsigned char ch) {
                        return ch >= '0' && ch <= '9';
                    }) ? Result(std::string(input)) : std::nullopt);
        }
        if (scope == "$reference") {
            // Native work subjects use general_ref's complete display field:
            // reviewed knowledge, a work title, historical event, place or
            // figure. These shared parsers validate the whole field; ordinary
            // lowercase prose never enters an unrestricted name fallback.
            auto result = translate_legends_term(input);
            if (!result) result = translate_legends_artifact_identity(input);
            if (!result) result = translate_legends_event(input, 0);
            if (!result) result = translate_legends_participant(input, std::nullopt, 0);
            return finish(std::move(result));
        }
        if (scope == "$description") return finish(translate_legends_text(input, false, false));
        if (scope == "$inscription") {
            // The native READ_ITEM quoted branches contain the slab's entire
            // writing field, not its title. Only complete reviewed item prose
            // may resolve here; the item panel's partial display is not valid.
            auto result = translate_item_description_source(input, true);
            return finish(translation_complete_with_native_nicknames(result, input)
                ? std::move(result) : std::nullopt);
        }
        if (scope == "$book") {
            auto result = translate_legends_artifact_identity(input);
            if (!result) result = translate_legends_book(input);
            return finish(std::move(result));
        }
        if (scope == "$message") {
            const std::vector<int> source_colors(input.size(), 0xffffff);
            std::vector<int> target_colors;
            return finish(translate_help_paragraph(input, source_colors, target_colors, true));
        }
        if (scope == "$announcement") {
            const std::vector<int> source_colors(input.size(), 0xffffff);
            std::vector<int> target_colors;
            return finish(translate_complete_announcement(input, source_colors, target_colors));
        }
        if (scope == "work-reference-list") {
            // `and` and commas can belong to one known knowledge subject or
            // generated title. Resolve that intact reference before trying
            // the native multiple-subject separator productions.
            if (auto result = resolve("work-reference", input)) return finish(std::move(result));
        }
        const auto entries = announcement_combat_rules_.find(std::string(scope));
        if (entries == announcement_combat_rules_.end()) return finish(std::nullopt);
        for (const auto &[signature, rule] : entries->second) {
            translation_work_step();
            if (rule.template_kinds.empty()) {
                if (input.size() == rule.source.size() &&
                    template_literal_at(input, 0, rule.source, true)) return finish(rule.target);
                continue;
            }
            const auto &literals = rule.template_literals;
            // Every fixed fragment must fit in order, with a nonempty typed
            // field between fragments. Reject impossible rules before any
            // name/item parser runs, preserving the actual capture order.
            if (!legends_template_literals_fit(rule, input, 0, input.size(), true))
                continue;
            std::vector<std::string_view> scopes;
            for (size_t at = 0; at < signature.size();) {
                size_t end = signature.find(',', at);
                if (end == std::string::npos) end = signature.size();
                scopes.emplace_back(signature.data() + at, end - at);
                at = end + 1;
            }
            // A fixed terminal vocabulary can reject the whole production
            // before earlier name fields try every possible separator. Use
            // only table-owned scopes: special resolvers can accept text
            // beyond the productions recorded in their table.
            if (!scopes.empty() && !scopes.back().starts_with('$') &&
                    scopes.back() != "work-reference-list") {
                const auto terminal = announcement_combat_rules_.find(std::string(scopes.back()));
                if (terminal != announcement_combat_rules_.end() &&
                    std::all_of(terminal->second.begin(), terminal->second.end(),
                        [](const auto &entry) { return entry.second.template_kinds.empty(); })) {
                    const auto &following = literals.back();
                    if (following.size() > input.size() ||
                        !template_literal_at(input, input.size() - following.size(),
                            following, rule.case_insensitive)) continue;
                    // resolve() trims the captured field before matching a
                    // leaf. Trim the same terminal edge here, including when
                    // the outer production has no trailing literal.
                    const auto body = trim_view(input.substr(0, input.size() - following.size()));
                    const bool terminal_fits = std::any_of(
                        terminal->second.begin(), terminal->second.end(), [&](const auto &entry) {
                            const auto &leaf = entry.second;
                            return !leaf.source.empty() && leaf.source.size() <= body.size() &&
                                template_literal_at(body, body.size() - leaf.source.size(),
                                    leaf.source, leaf.case_insensitive);
                        });
                    if (!terminal_fits) continue;
                }
            }
            std::vector<std::string> captures(scopes.size());
            std::vector<Result> translated(scopes.size());
            // Earlier fields can reach the same impossible suffix through
            // different splits. Only failures are reused so a successful
            // branch still fills every capture in its original order.
            std::set<std::pair<size_t, size_t>> failed_states;
            std::function<bool(size_t, size_t)> match = [&](size_t field, size_t at) {
                TranslationWorkFrame match_work;
                if (field == scopes.size()) return at == input.size();
                const auto state = std::make_pair(field, at);
                if (failed_states.contains(state)) return false;
                const std::string &following = literals[field + 1];
                // An interior literal can be longer than the entire input.
                // Check the remaining span before subtracting; otherwise an
                // unsigned underflow turns this scan into a SIZE_MAX loop.
                if (at >= input.size() || following.size() >= input.size() - at) {
                    failed_states.insert(state);
                    return false;
                }
                const size_t final_end = input.size() - following.size();
                // A final field owns the entire remaining span. Interior
                // fields backtrack only over native literal boundaries.
                for (size_t end = field + 1 == scopes.size() ? final_end : at + 1;
                        end <= final_end; ++end) {
                    translation_work_step();
                    if (end <= at || !template_literal_at(input, end, following, true)) continue;
                    const auto value = input.substr(at, end - at);
                    if (value.front() == ' ' || value.back() == ' ') continue;
                    if (!legends_template_suffix_literals_fit(rule, input, field + 1,
                            end + following.size(), input.size(), true)) continue;
                    auto result = resolve(scopes[field], value);
                    if (!result) continue;
                    captures[field] = std::string(value);
                    translated[field] = std::move(result);
                    if (match(field + 1, end + following.size())) return true;
                }
                failed_states.insert(state);
                return false;
            };
            if (match(0, literals.front().size()))
                return finish(fill_template(rule, captures, &capture_translations_, nullptr, &translated));
        }
        return finish(std::nullopt);
    };
    // Mixed combat, dialogue and catalog sentences are combined by the
    // shared complete-announcement parser. This scope always owns its span.
    return resolve(initial_scope, source);
}
