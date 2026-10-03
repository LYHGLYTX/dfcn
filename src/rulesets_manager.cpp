
#include "rulesets_manager.h"
#include "item_designation.h"
#include "item_material_qualifier.h"
#include "config.h"
#include "logger.h"
#include "translation_state.h"
#include "translation_work.h"

#include <algorithm>
#include <array>
#include <cctype>
#include <functional>
#include <sstream>

#define TOML_EXCEPTIONS 0
#include <toml++/toml.hpp>


namespace DFHack {
namespace DFZH {
namespace Hooks {
    RulesetsManager::RulesetsManager() {
    }

    RulesetsManager::CaptionSnapshot RulesetsManager::make_caption_snapshot(
            std::unordered_map<std::string, std::string> material_qualifiers) const {
        dfcn::TranslationStateScope translation_scope;
        auto parser = std::shared_ptr<RulesetsManager>(new RulesetsManager,
            [](RulesetsManager* value) { delete value; });
        parser->rulesets_ = rulesets_;
        parser->cyclic_rule_signatures_ = cyclic_rule_signatures_;
        parser->static_creature_names_ = static_creature_names_;
        // Leaf indexes contain views into token storage, so rebuild them in
        // the copied graph. Memoized trees and Overlay resolvers stay empty.
        parser->rebuild_rule_prefix_indexes();
        const auto complete = [owner = parser.get()](std::string_view source,
                std::string_view name) -> std::optional<std::string> {
            const auto results = owner->resolve_namespace(
                std::string(source), std::string(name), 0);
            const ResultTree* best = nullptr;
            for (const auto& result : results) {
                if (!result->remaining.empty() || result->translated.empty()) continue;
                if (!best || result->preferred_to(*best)) best = result.get();
            }
            if (!best) return std::nullopt;
            std::string target = best->translated;
            normalize_translation(target);
            return target;
        };
        // Finished item grammars bind this material namespace through the
        // usual typed callback. Resolve it inside this detached graph only.
        parser->phrase_resolver_ = [complete, material_qualifiers = std::move(material_qualifiers)](
                std::string_view source,
                std::string_view kind) -> std::optional<std::string> {
            if (kind != "item_material") return std::nullopt;
            std::string key(source);
            for (char &ch : key)
                if (ch >= 'A' && ch <= 'Z') ch += 'a' - 'A';
            if (const auto known = material_qualifiers.find(key);
                    known != material_qualifiers.end()) return known->second;
            auto target = complete(source, "::materials::adjective");
            if (!target) target = complete(source, "::materials");
            auto qualifier = dfcn::finish_item_material_qualifier(
                source, target ? std::move(*target) : std::string{}, complete);
            return qualifier.empty() ? std::nullopt :
                std::optional<std::string>(std::move(qualifier));
        };
        auto mutex = std::make_shared<std::mutex>();
        return [parser = std::move(parser), mutex = std::move(mutex), complete](
                std::string_view kind, std::string_view source) -> std::optional<std::string> {
            if (source.empty() || source.size() > 65536) return std::nullopt;
            std::lock_guard<std::mutex> lock(*mutex);
            dfcn::TranslationWorkScope work;
            if (kind == "item") return complete(source, "::items");
            if (kind == "material") return complete(source, "::materials");
            if (kind == "material_adjective") return complete(source, "::materials::adjective");
            if (kind == "tile") return complete(source, "::tiles");
            if (kind == "building") return complete(source, "::map_hover::building");
            if (kind == "job") {
                for (const auto* ns : {"::activities", "::tasks", "::menu"})
                    if (auto target = complete(source, ns)) return target;
                return std::nullopt;
            }
            if (kind == "profession") {
                if (auto target = complete(source, "::skills::name")) return target;
                return complete(source, "::professions");
            }
            if (kind == "creature") {
                if (auto target = complete(source, "::creatures::name::singular")) return target;
                return complete(source, "::creatures::name::plural");
            }
            return std::nullopt;
        };
    }

    // Public operations share the overlay's recursive state lock. Native
    // search and SDL drawing both reach the memoized parser, whose callbacks
    // can enter Overlay and return through another public grammar operation.
    // Private recursive parsing inherits its caller's lock.

    void RulesetsManager::load_from_dir(const std::filesystem::path& dir) {
        dfcn::TranslationStateScope translation_scope;
        if (!std::filesystem::exists(dir) || !std::filesystem::is_directory(dir)) {
            return;
        }
        memo_cache_.clear();
        rule_prefix_indexes_.clear();
        literal_leaf_rules_.clear();
        std::optional<std::string> visited_root;
        parse_dir(dir, dir, visited_root);
        validate_references();
        analyze_from_root();
        rebuild_rule_prefix_indexes();
        rebuild_static_creature_names();
    }

    bool RulesetsManager::init() {
        dfcn::TranslationStateScope translation_scope;
        if (!load_rule_sets()) {
            return false;
        }
        initialized = true;
        return true;
    }

    void RulesetsManager::shutdown() {
        dfcn::TranslationStateScope translation_scope;
        initialized = false;
        last_load_error_.clear();
        memo_cache_.clear();
        rulesets_.clear();
        rule_prefix_indexes_.clear();
        literal_leaf_rules_.clear();
        cyclic_rule_signatures_.clear();
        static_creature_names_.clear();
        creature_name_resolver_ = {};
        creature_name_resolver_active_ = false;
        phrase_resolver_ = {};
        phrase_resolver_active_ = false;
        material_list_resolver_active_ = false;
    }

    std::string RulesetsManager::last_load_error() const {
        dfcn::TranslationStateScope translation_scope;
        return last_load_error_;
    }

    void RulesetsManager::print_cache_stats() const {
        dfcn::TranslationStateScope translation_scope;
        size_t total_entries = 0;
        for (const auto& [id, inner] : memo_cache_) total_entries += inner.size();
        LOGGERMANAGER.getLogger()->info("[Cache] {} identifiers, {} entries (LRU max {}/identifier)",
            memo_cache_.size(), total_entries, LruMemoMap::DEFAULT_MAX);
    }

    // -------------------------------------------------------------------------
    // 从根出发的图分析（循环检测 + simple 叶子路径）
    // -------------------------------------------------------------------------

    /// 从 "::" 出发做全量 DFS（无缓存，每条路径完整探索），同时完成三件事：
    ///
    ///   设计决策：不使用 visited 集合剪枝（即同一 namespace 可能被多条路径重复访问）。
    ///   规则集图规模有限（实际 ~585 节点，边数可控），全量遍历的开销在加载期可接受。
    ///   保留 visited 仅用于统计可达节点数，不用于控制流程 —— 确保每条 distinct 路径的
    ///   simple 属性都被独立评估，每条循环路径都被完整发现。
    ///
    ///   1. 循环检测：通过 in_stack 检测 back-edge，发现循环时标记规则签名
    ///      到 cyclic_rule_signatures_ 并打印循环路径。
    ///
    ///   2. simple 叶子路径：parent_simple 在规则粒度沿 DFS 传播。
    ///      source 为单 token 的规则是"简单委派"，不切断 simple 链。
    ///      当 namespace 所有规则都是 1-token 纯字面时打印 [SimpleLeaf]。
    ///
    ///   3. 深度追踪：每次深入新节点时记录最深路径。
    void RulesetsManager::analyze_from_root() {
        cyclic_rule_signatures_.clear();

        if (!rulesets_.contains("::")) {
            LOGGERMANAGER.getLogger()->warn("[Analyze] root \"::\" not found, skip");
            return;
        }

        std::set<std::string> in_stack;      // 当前路径上的 namespace（循环检测）
        std::set<std::string> visited;       // 所有已探索的 namespace（纯统计）
        std::vector<std::string> path_stack; // 当前路径（有序）

        // edge_stack[i] = 从 path_stack[i] 到 path_stack[i+1] 所经过的规则签名
        struct Edge { std::string from_ns; Tokens rule_source; };
        std::vector<Edge> edge_stack;

        size_t global_max_depth = 0;
        std::string deepest_id;

        // parent_simple: 从根到当前 namespace 的路径上所有祖先都是 simple
        std::function<std::string(const std::string&, bool)> dfs =
            [&](const std::string& current, bool parent_simple) -> std::string {

            // back-edge：current 已在当前路径上 → 发现循环
            if (in_stack.contains(current)) {
                auto stack_it = std::find(path_stack.begin(), path_stack.end(), current);
                // in_stack 与 path_stack 始终同步，current 必在 path_stack 中
                size_t idx = stack_it - path_stack.begin();
                for (size_t i = idx; i < edge_stack.size(); ++i) {
                    cyclic_rule_signatures_.insert({edge_stack[i].from_ns, edge_stack[i].rule_source});
                }
                // 打印循环路径
                std::string cycle_path = current;
                cycle_path.reserve(256);
                for (size_t i = idx + 1; i < path_stack.size(); ++i)
                    cycle_path += " → " + path_stack[i];
                cycle_path += " → " + current + " (back)";
                LOGGERMANAGER.getLogger()->error("[Cycle] {}", cycle_path);
                return current;  // 返回 cycle target
            }

            in_stack.insert(current);
            path_stack.push_back(current);

            // 深度追踪
            if (path_stack.size() > global_max_depth) {
                global_max_depth = path_stack.size();
                deepest_id = current;
                std::string depth_path;
                depth_path.reserve(256);
                for (size_t i = 0; i < path_stack.size(); ++i) {
                    if (i > 0) depth_path += " → ";
                    depth_path += path_stack[i];
                }
                LOGGERMANAGER.getLogger()->debug("[Depth]{}: {}", global_max_depth, depth_path);
            }

            auto it = rulesets_.find(current);
            if (it != rulesets_.end()) {
                // [SimpleLeaf] 检查（namespace 级别）：所有规则 source 都是单 token 且无引用
                {
                    bool all_single_token = true;
                    bool has_ref = false;
                    for (const auto& [orig_tokens, trans_tokens] : it->second) {
                        if (orig_tokens.size() == 1 && trans_tokens.size() == 1
                            && orig_tokens[0].type == Type::Literal && orig_tokens[0].value.empty()
                            && trans_tokens[0].type == Type::Literal && trans_tokens[0].value.empty())
                            continue;

                        if (orig_tokens.size() != 1) {
                            all_single_token = false;
                            break;
                        }
                        if (orig_tokens[0].type == Type::Reference) has_ref = true;
                    }
                    if (parent_simple && all_single_token && !has_ref) {
                        std::string path_str;
                        path_str.reserve(256);
                        for (size_t i = 0; i < path_stack.size(); ++i) {
                            if (i > 0) path_str += " → ";
                            path_str += path_stack[i];
                        }
                        LOGGERMANAGER.getLogger()->debug("[SimpleLeaf] {}", path_str);
                    }
                }

                // 逐规则遍历引用 — parent_simple 在规则粒度判断：
                // 单 token source 的规则是"简单委派"，不影响 child 的 simple 链；
                // 多 token source 的规则是"复杂匹配"，切断 simple 链。
                std::string cycle_target;
                for (const auto& [orig_tokens, trans_tokens] : it->second) {
                    // 判断当前这条规则是否"简单"（source 只有 1 个 token）
                    bool is_optional_empty = (orig_tokens.size() == 1 && trans_tokens.size() == 1
                        && orig_tokens[0].type == Type::Literal && orig_tokens[0].value.empty()
                        && trans_tokens[0].type == Type::Literal && trans_tokens[0].value.empty());
                    bool rule_is_single = is_optional_empty || (orig_tokens.size() == 1);
                    bool child_simple = parent_simple && rule_is_single;

                    for (const auto& token : orig_tokens) {
                        if (token.type != Type::Reference) continue;
                        if (token.value[0] == '@' || token.value[0] == '#') continue;

                        // 决定要跟踪的目标 namespace。
                        // - 普通引用：直接使用 token.value（已由 parse_file 规范化）
                        // - % 引用：格式为 %replacer:base_ns[:qualifier]（已规范化）
                        //   从中提取目标 namespace ::base_ns[::qualifier]
                        std::string ref_target;
                        if (token.value[0] == '%') {
                            auto first_colon = token.value.find(':');
                            if (first_colon == std::string::npos) continue;       // 无冒号（不应出现）
                            auto second_colon = token.value.find(':', first_colon + 1);
                            if (second_colon == std::string::npos) {
                                // %replacer:base_ns → 目标为 ::base_ns
                                std::string base = token.value.substr(first_colon + 1);
                                if (base.empty()) continue;                      // %replacer: → 跳过
                                ref_target = "::" + base;
                            } else {
                                // %replacer:base_ns:qualifier → 目标为 ::base_ns::qualifier
                                std::string base = token.value.substr(first_colon + 1, second_colon - first_colon - 1);
                                std::string qualifier = token.value.substr(second_colon + 1);
                                if (qualifier.starts_with("::"))
                                    ref_target = qualifier;                      // 已是绝对路径
                                else
                                    ref_target = "::" + base + "::" + qualifier;
                            }
                        } else {
                            ref_target = token.value;
                        }

                        edge_stack.push_back({current, orig_tokens});
                        std::string target = dfs(ref_target, child_simple);
                        edge_stack.pop_back();

                        if (!target.empty()) {
                            cyclic_rule_signatures_.insert({current, orig_tokens});
                            if (target != current) cycle_target = target;
                        }
                    }
                }

                path_stack.pop_back();
                in_stack.erase(current);
                visited.insert(current);
                return (cycle_target == current) ? "" : cycle_target;
            }

            path_stack.pop_back();
            in_stack.erase(current);
            visited.insert(current);
            return "";
        };

        dfs("::", true);  // 根 "::" 本身视为在 simple 路径起点

        if (!cyclic_rule_signatures_.empty()) {
            LOGGERMANAGER.getLogger()->info("[Analyze] {} cyclic rule(s) detected",
                cyclic_rule_signatures_.size());
        }
        if (global_max_depth > 0) {
            LOGGERMANAGER.getLogger()->info("[Analyze] deepest chain: {}, depth {}",
                deepest_id, global_max_depth);
        }

        LOGGERMANAGER.getLogger()->info("[Analyze] {} namespaces reachable from root", visited.size());
    }

    bool RulesetsManager::load_rule_sets() {
        dfcn::TranslationStateScope translation_scope;
        shutdown();

        try {
            auto ruleset_dir = Config::getDataPath() / "rulesets/zh-Hans";
            if (std::filesystem::exists(ruleset_dir)) {
                load_from_dir(ruleset_dir);
                LOGGERMANAGER.getLogger()->info("RulesetsManager loaded: {} rulesets", rulesets_.size());
            } else {
                throw std::runtime_error("Rulesets directory not found: " + ruleset_dir.string());
            }
        } catch (const std::exception& e) {
            // A failed graph must not remain partly usable without the
            // owner callbacks/indexes. Preserve the actual diagnostic for
            // DFCN's shared log instead of dropping it in the quiet adapter.
            shutdown();
            last_load_error_ = e.what();
            LOGGERMANAGER.getLogger()->error("RulesetsManager init failed: {}", e.what());
            return false;
        }
        return true;
    }

    /// 翻译输入文本，返回翻译结果。
    ///
    /// 单次递归匹配：从根命名空间 :: 出发，由一条完整规则消费全部输入。
    /// 跨域组合词（如 "Pig iron bars"）的翻译应由 TOML 规则本身覆盖
    /// （例如在 ::items 中定义 "{::materials} bars" = "{::materials}锭"），
    /// 而非由引擎通过多轮迭代动态拼凑。单规则完整匹配也保证了 build_translated
    /// 可以按需调整子翻译的语序，而不受左到右拼接约束。
    ///
    /// @param text 待翻译的英文文本
    /// @return     翻译后的中文文本，无法翻译时返回 std::nullopt
    std::optional<std::string> RulesetsManager::translate(const std::string& text) const {
        dfcn::TranslationStateScope translation_scope;
        // Use the same owner/child/tissue parser in health and inventory as
        // in Legends, including names with more than one owning body part.
        if (text.find(',') != std::string::npos)
            if (auto anatomy = translate_anatomy(text)) return anatomy;
        auto results = find_translations(text, false);

        if (results.empty()) return std::nullopt;

        // A generated owner's title can also contain an item/material noun.
        // Keep every creature prefix available to the grammar, but at the
        // untyped root prefer a real outer structure over swallowing its noun
        // into a complete creature name. Typed creature APIs remain unchanged.
        const auto is_creature = [](const ResultTree& tree) {
            return tree.identifier.starts_with("::creatures::");
        };
        const auto has_complete_creature = [&](const auto& self,
                const ResultTree& tree) -> bool {
            if (is_creature(tree) && tree.matched.size() == text.size())
                return true;
            for (const auto& [_, child] : tree.children)
                if (self(self, *child)) return true;
            return false;
        };
        const auto contains_creature = [&](const auto& self,
                const ResultTree& tree) -> bool {
            if (!tree.matched.empty() && is_creature(tree)) return true;
            for (const auto& [_, child] : tree.children)
                if (self(self, *child)) return true;
            return false;
        };
        const auto has_outer_structure = [&](const auto& self,
                const ResultTree& tree) -> bool {
            // Do not reinterpret vocabulary used inside a creature name as
            // an outer material or item. In particular items::fish::main can
            // simply alias a caste, so the presence of ::items is insufficient.
            if (is_creature(tree)) return false;
            if (!tree.matched.empty()) {
                if (tree.identifier == "::materials::state" ||
                    tree.identifier.starts_with("::materials::state::"))
                    return true;
                if (tree.identifier.starts_with("::items::") &&
                    tree.identifier.ends_with("::main") &&
                    !contains_creature(contains_creature, tree))
                    return true;
            }
            for (const auto& [_, child] : tree.children)
                if (self(self, *child)) return true;
            return false;
        };
        const bool creature_ambiguity = std::ranges::any_of(results,
            [&](const auto& tree) {
                return has_complete_creature(has_complete_creature, *tree);
            });
        auto best = std::ranges::min_element(results,
            [&](const std::shared_ptr<const ResultTree>& a, const std::shared_ptr<const ResultTree>& b) {
                if (a->uses_name_fallback != b->uses_name_fallback)
                    return a->preferred_to(*b);
                if (creature_ambiguity) {
                    const bool a_outer = has_outer_structure(has_outer_structure, *a);
                    const bool b_outer = has_outer_structure(has_outer_structure, *b);
                    if (a_outer != b_outer) return a_outer;
                }
                return a->preferred_to(*b);
            });

        // LOGGERMANAGER.getLogger()->debug("\n========== All %zu Translation Results for \"%s\" ==========\n", results.size(), text.c_str());
        // for (size_t i = 0; i < results.size(); ++i) {
        //     LOGGERMANAGER.getLogger()->debug("--- Result #%zu (weight=%zu) ---\n", i, results[i]->weight());
        //     print_translation_path(*results[i]);
        // }
        // LOGGERMANAGER.getLogger()->debug("======================================================\n\n");

        std::string translated = (*best)->translated;
        normalize_translation(translated);
        return translated;
    }

    void RulesetsManager::normalize_translation(
            std::string& translated, std::vector<size_t>* origins) {
        // The bundled community rules distinguish domestic species with 家,
        // but DFCN uses the shorter common name consistently in creature
        // rows and in compounds such as leather equipment.
        static constexpr std::array<std::pair<std::string_view, std::string_view>, 6>
            domestic_creature_terms = {{
                {"家猫", "猫"}, {"家鸡", "鸡"}, {"家犬", "狗"},
                {"家鹅", "鹅"}, {"家猪", "猪"}, {"家兔", "兔"},
            }};
        for (const auto &[source, target] : domestic_creature_terms) {
            size_t position = 0;
            while ((position = translated.find(source, position)) !=
                   std::string::npos) {
                if (origins) {
                    const size_t origin = (*origins)[position];
                    origins->erase(origins->begin() + position,
                        origins->begin() + position + source.size());
                    origins->insert(origins->begin() + position, target.size(), origin);
                }
                translated.replace(position, source.size(), target);
                position += target.size();
            }
        }
    }

    std::optional<std::string> RulesetsManager::compose_bound_rule(
            const std::string& context, const std::string& source_pattern,
            const std::vector<std::pair<std::string, std::string>>& fields,
            std::vector<size_t>* origins) const {
        dfcn::TranslationStateScope translation_scope;
        if (origins) origins->clear();
        const auto found = rulesets_.find(context);
        if (found == rulesets_.end() || !context.starts_with("::")) return std::nullopt;
        // Relative references in a production use its file's base namespace.
        // Callers of a named subruleset use absolute references instead.
        const std::string base = context.substr(2);
        Tokens source;
        if (fields.empty()) {
            // With no bindings, only a literal production can succeed below.
            // Runtime vocabulary probes (for example a hover caption's first
            // word) are text, not grammar: a native item/name may contain
            // braces, including an unmatched brace in this extracted prefix.
            if (!source_pattern.empty())
                source.emplace_back(Token{Type::Literal, source_pattern});
        } else {
            source = parse_tokens(base, source_pattern);
        }
        const auto rule = std::find_if(found->second.begin(), found->second.end(),
            [&](const auto& entry) { return entry.first == source; });
        if (rule == found->second.end()) return std::nullopt;
        BindingMap bindings;
        for (const auto& [name, value] : fields) {
            const auto identifier = to_canonical_identifier(name, base);
            if (std::none_of(source.begin(), source.end(), [&](const Token& token) {
                    return token.type == Type::Reference && token.value == identifier;
                }) || std::any_of(bindings.begin(), bindings.end(), [&](const auto& bound) {
                    return bound.first == identifier;
                })) return std::nullopt;
            bindings.emplace_back(identifier, std::make_shared<ResultTree>(
                identifier, "", value, "", BindingMap{}));
        }
        for (const auto* tokens : {&rule->first, &rule->second})
            for (const auto& token : *tokens)
                if (token.type == Type::Reference && std::none_of(bindings.begin(), bindings.end(),
                        [&](const auto& bound) { return bound.first == token.value; }))
                    return std::nullopt;
        // Use the ordinary grammar renderer and normalization, not a second
        // word-order implementation for native snapshots.
        auto target = build_translated(rule->second, bindings, origins);
        normalize_translation(target, origins);
        return target;
    }

    std::optional<std::string> RulesetsManager::translate_with_origins(
            const std::string& text, const std::string& context,
            std::vector<size_t>& origins) const {
        dfcn::TranslationStateScope translation_scope;
        origins.clear();
        const auto results = resolve_namespace(text, context, 0);
        const ResultTree* best = nullptr;
        for (const auto& result : results) {
            if (!result->remaining.empty() || result->translated.empty()) continue;
            if (!best || result->preferred_to(*best)) best = result.get();
        }
        if (!best || !translation_origins(*best, origins)) {
            origins.clear();
            return std::nullopt;
        }
        std::string translated = best->translated;
        normalize_translation(translated, &origins);
        return translated;
    }

    std::optional<std::string> RulesetsManager::translate_activity(
            const std::string& text) const {
        dfcn::TranslationStateScope translation_scope;
        for (const auto* ns : {"::activities", "::tasks", "::menu"}) {
            const auto results = resolve_namespace(text, ns, 0);
            const ResultTree* best = nullptr;
            for (const auto& result : results) {
                if (!result->remaining.empty() || result->translated.empty()) continue;
                if (!best || result->preferred_to(*best)) best = result.get();
            }
            if (!best) continue;
            std::string translated = best->translated;
            normalize_translation(translated);
            return translated;
        }
        return std::nullopt;
    }

    std::optional<std::string> RulesetsManager::translate_ammunition_type(
            const std::string& text) const {
        dfcn::TranslationStateScope translation_scope;
        for (const auto* ns : {"::items::ammo::default::main",
                "::items::ammo::singular::main", "::items::ammo::plural::main"}) {
            const auto results = resolve_namespace(text, ns, 0);
            for (const auto& result : results)
                if (result->remaining.empty() && !result->translated.empty())
                    return result->translated;
        }
        return std::nullopt;
    }

    std::optional<std::string> RulesetsManager::translate_coin_name(
            const std::string& text) const {
        dfcn::TranslationStateScope translation_scope;
        const auto results = resolve_namespace(text, "::items::coin", 0);
        for (const auto& result : results)
            if (result->remaining.empty() && !result->translated.empty())
                return result->translated;
        return std::nullopt;
    }

    std::optional<std::string> RulesetsManager::translate_equipment_type(
            const std::string& text, bool wearable_only) const {
        dfcn::TranslationStateScope translation_scope;
        for (const auto* family : {"armor", "helm", "gloves", "shoes", "pants", "shield",
                                 "weapon", "ammo", "trapcomp"}) {
            if (wearable_only && (std::string_view(family) == "weapon" ||
                std::string_view(family) == "ammo" || std::string_view(family) == "trapcomp")) continue;
            for (const auto* form : {"default", "singular", "plural"}) {
                const std::string ns = std::string("::items::") + family +
                    "::" + form + "::main";
                const auto results = resolve_namespace(text, ns, 0);
                for (const auto& result : results)
                    if (result->remaining.empty() && !result->translated.empty())
                        return result->translated;
            }
        }
        return std::nullopt;
    }

    std::optional<std::string> RulesetsManager::translate_equipment_modifier(
            const std::string& text) const {
        dfcn::TranslationStateScope translation_scope;
        const auto results = resolve_namespace(
            text, "::items::prefix::equipment_modifier", 0);
        for (const auto& result : results)
            if (result->remaining.empty() && !result->translated.empty())
                return result->translated;
        return std::nullopt;
    }

    std::optional<std::string> RulesetsManager::translate_equipment_name(
            const std::string& text, bool allow_material) const {
        dfcn::TranslationStateScope translation_scope;
        // Keep the same item grammar for compound types such as a right
        // mitten or long skirt. Bare ::main type lookups omit these modifiers;
        // splitting them into ordinary words changes their item-specific meaning.
        const auto contains_material = [](const auto& self, const ResultTree& result)
                -> bool {
            if (!result.matched.empty() &&
                (result.identifier.starts_with("::materials::") ||
                 result.identifier == "::materials" ||
                 result.identifier.ends_with("::^material"))) return true;
            for (const auto& [_, child] : result.children)
                if (self(self, *child)) return true;
            return false;
        };
        std::shared_ptr<const ResultTree> best;
        for (const auto* family : {"armor", "helm", "gloves", "shoes", "pants", "shield"}) {
            const auto results = resolve_namespace(
                text, std::string("::items::") + family, 0);
            for (const auto& result : results) {
                if (!result->remaining.empty() || result->translated.empty() ||
                    (!allow_material && contains_material(contains_material, *result))) continue;
                if (!best || result->preferred_to(*best)) best = result;
            }
        }
        return best ? std::optional<std::string>(best->translated) : std::nullopt;
    }

    std::optional<std::string> RulesetsManager::translate_furniture_type(
            const std::string& text) const {
        dfcn::TranslationStateScope translation_scope;
        for (const auto* family : {"altar", "bed", "chair", "table", "cabinet",
                "coffin", "box", "bookcase", "statue", "door", "floodgate",
                "hatch_cover", "grate", "armorstand", "weaponrack", "pedestal", "anvil",
                "animaltrap"}) {
            const auto results = resolve_namespace(
                text, std::string("::items::") + family + "::main", 0);
            for (const auto& result : results)
                if (result->remaining.empty() && !result->translated.empty())
                    return result->translated;
        }
        return std::nullopt;
    }

    std::optional<std::string> RulesetsManager::translate_drinkware_type(
            const std::string& text) const {
        dfcn::TranslationStateScope translation_scope;
        const auto results = resolve_namespace(text, "::items::goblet::main", 0);
        for (const auto& result : results)
            if (result->remaining.empty() && !result->translated.empty())
                return result->translated;
        return std::nullopt;
    }

    std::optional<std::string> RulesetsManager::translate_meat_term(
            const std::string& text) const {
        dfcn::TranslationStateScope translation_scope;
        if (text.empty()) return std::nullopt;
        // The item table distinguishes edible organs from material states
        // and anatomy. Prefer its direct meat entry when both a literal and
        // the shared material reference can consume the complete term.
        std::shared_ptr<const ResultTree> best;
        for (const auto* ns : {"::items::meat::^0", "::items::meat::^1",
                "::items::meat::^prefix", "::items::meat::singular::main",
                "::items::meat::plural::main"}) {
            const auto results = resolve_namespace(text, ns, 0);
            for (const auto& result : results) {
                if (!result->remaining.empty() || result->translated.empty()) continue;
                if (!best || result->preferred_to(*best)) best = result;
            }
        }
        return best ? std::optional<std::string>(best->translated) : std::nullopt;
    }

    bool RulesetsManager::is_item_material(const std::string& text) const {
        dfcn::TranslationStateScope translation_scope;
        if (text.empty()) return false;
        for (const auto* ns : {"::materials", "::materials::adjective"}) {
            const auto results = resolve_namespace(text, ns, 0);
            for (const auto& result : results)
                if (result->remaining.empty() && !result->translated.empty()) return true;
        }
        return false;
    }

    std::optional<std::string> RulesetsManager::translate_material_state(
            const std::string& text, bool adjective) const {
        dfcn::TranslationStateScope translation_scope;
        const auto results = resolve_namespace(text, adjective ?
            "::materials::state::adjective" : "::materials::state", 0);
        for (const auto& result : results)
            if (result->remaining.empty() && !result->translated.empty())
                return result->translated;
        return std::nullopt;
    }

    std::optional<std::string> RulesetsManager::translate_material_prefix(
            const std::string& text) const {
        dfcn::TranslationStateScope translation_scope;
        if (text.empty()) return std::string{};
        // The trailing separator belongs to the existing prefix grammar;
        // the producer already supplied the entire species/plant field.
        const auto results = resolve_namespace(text + " ", "::materials::^prefix", 0);
        for (const auto& result : results)
            if (result->remaining.empty() && !result->translated.empty())
                return result->translated;
        return std::nullopt;
    }

    std::optional<std::string> RulesetsManager::translate_woven_plant_material(
            const std::string& text) const {
        dfcn::TranslationStateScope translation_scope;
        const auto results = resolve_namespace(text, "::materials::woven_plant", 0);
        for (const auto& result : results)
            if (result->remaining.empty() && !result->translated.empty())
                return result->translated;
        return std::nullopt;
    }

    bool RulesetsManager::is_material_state(const std::string& text) const {
        dfcn::TranslationStateScope translation_scope;
        if (text.empty()) return false;
        // No optional species/plant prefix here: callers resolve a generated
        // creature separately, then require a complete, real material state.
        for (const auto* ns : {"::materials::state", "::materials::state::adjective"}) {
            const auto results = resolve_namespace(text, ns, 0);
            for (const auto& result : results)
                if (result->remaining.empty() && !result->translated.empty()) return true;
        }
        return false;
    }

    std::optional<std::string> RulesetsManager::translate_creature_name(
            const std::string& text) const {
        dfcn::TranslationStateScope translation_scope;
        const auto results = resolve_namespace(text, "::creatures::name", 0);
        for (const auto& result : results)
            if (result->remaining.empty() && !result->translated.empty())
                return result->translated;
        return std::nullopt;
    }

    void RulesetsManager::set_creature_name_resolver(
            std::function<std::optional<std::string>(std::string_view)> resolver) {
        dfcn::TranslationStateScope translation_scope;
        // Cached parent phrases contain the old child translation as well.
        // Clear all namespaces when the owner's vocabulary changes.
        memo_cache_.clear();
        creature_name_resolver_ = std::move(resolver);
    }

    void RulesetsManager::set_phrase_resolver(
            std::function<std::optional<std::string>(
                std::string_view, std::string_view)> resolver) {
        dfcn::TranslationStateScope translation_scope;
        memo_cache_.clear();
        phrase_resolver_ = std::move(resolver);
    }

    static std::string creature_lookup_key(std::string_view source) {
        std::string key(source);
        for (char& ch : key)
            if (ch >= 'A' && ch <= 'Z') ch += 'a' - 'A';
        return key;
    }

    void RulesetsManager::rebuild_static_creature_names() {
        static_creature_names_.clear();
        std::set<std::string> visiting;
        const auto collect = [&](auto&& self, const std::string& identifier) -> void {
            if (!identifier.starts_with("::creatures::") ||
                !visiting.insert(identifier).second) return;
            const auto found = rulesets_.find(identifier);
            if (found != rulesets_.end()) {
                for (const auto& [source, target] : found->second) {
                    // Follow only identity aliases to the installed RAW leaf
                    // tables. Prefix/status grammars are not static names.
                    if (source.size() == 1 && target.size() == 1 &&
                        source.front().type == Type::Reference &&
                        target.front().type == Type::Reference &&
                        source.front().value == target.front().value) {
                        self(self, source.front().value);
                    } else if (source.size() == 1 &&
                               source.front().type == Type::Literal &&
                               !source.front().value.empty() &&
                               std::all_of(target.begin(), target.end(), [](const Token& token) {
                                   return token.type == Type::Literal;
                               })) {
                        std::string translated;
                        for (const auto& token : target) translated += token.value;
                        if (translated.empty()) continue;
                        normalize_translation(translated);
                        static_creature_names_.try_emplace(
                            creature_lookup_key(source.front().value), std::move(translated));
                    }
                }
            }
            visiting.erase(identifier);
        };
        // Species wording remains authoritative for materials (cow -> 牛).
        // Caste-only names fill gaps without replacing that species wording.
        for (const auto* identifier : {"::creatures::name::singular",
                "::creatures::name::plural", "::creatures::caste::singular"})
            collect(collect, identifier);
    }

    std::optional<std::string> RulesetsManager::translate_static_creature_name(
            const std::string& text) const {
        dfcn::TranslationStateScope translation_scope;
        const auto found = static_creature_names_.find(creature_lookup_key(text));
        return found == static_creature_names_.end()
            ? std::nullopt : std::optional<std::string>(found->second);
    }

    std::optional<std::string> RulesetsManager::expand_shortened_creature_name(
            const std::string& text) const {
        dfcn::TranslationStateScope translation_scope;
        const std::string key = creature_lookup_key(text);
        if (key.size() < 2 || static_creature_names_.contains(key)) return std::nullopt;
        std::optional<std::string> expanded;
        bool ambiguous = false;
        const auto consider = [&](const std::string& name) {
            if (name.size() <= key.size() || name.front() != key.front()) return;
            std::string shortened(name);
            // Native 53.16's 0x52d910 helper scans backwards, retaining each
            // word's first letter and deleting a/e/i/o/u until the width fits.
            // Its final hard truncation is deliberately not reconstructible.
            for (size_t at = shortened.size(); at > 1 && shortened.size() > key.size();) {
                --at;
                if (shortened[at - 1] != ' ' &&
                    std::string_view("aeiou").find(shortened[at]) != std::string_view::npos)
                    shortened.erase(at, 1);
            }
            if (shortened != key) return;
            // Equal translated labels do not prove equal source identities.
            // Refuse every ambiguous abbreviation, including caste aliases.
            if (expanded && *expanded != name) { ambiguous = true; return; }
            expanded = name;
        };
        // Use the same scoped authored-role vocabulary as the descriptor
        // parser. Only a complete known species licenses these candidates;
        // never expand arbitrary words or guess a hard-truncated tail.
        std::vector<std::string> purposes;
        if (const auto rules = rulesets_.find("::creatures::caste::name::purpose");
                rules != rulesets_.end()) {
            for (const auto& [source, target] : rules->second)
                if (source.size() == 1 && source.front().type == Type::Literal &&
                    source.front().value.ends_with(' '))
                    purposes.push_back(creature_lookup_key(source.front().value));
        }
        for (const auto& [name, target] : static_creature_names_) {
            consider(name);
            for (const auto& purpose : purposes) consider(purpose + name);
            if (ambiguous) return std::nullopt;
        }
        return expanded;
    }

    std::string_view RulesetsManager::external_prefix_kind(std::string_view identifier) {
        if (identifier == "::materials::item_qualifier") return "item_material";
        if (identifier == "::materials::list") return "material_list";
        if (identifier == "::items::storage_container") return "storage_container";
        if (identifier == "::creatures::caste::name") return "creature_label";
        if (identifier == "::creatures::name::singular" ||
            identifier == "::creatures::name::plural" ||
            identifier == "::creatures::caste::singular") return "creature";
        if (identifier.starts_with("::text::")) {
            const auto suffix = identifier.substr(8);
            for (const std::string_view candidate : {"name", "person", "book", "topic", "form", "deity",
                    "skill", "skill_rating", "rated_skill", "sphere", "instrument",
                    "activity_place", "artifact", "material", "native_item_name"})
                if (suffix == candidate) return candidate;
        }
        return {};
    }

    std::vector<std::shared_ptr<const RulesetsManager::ResultTree>>
    RulesetsManager::resolve_external_prefixes(
            const std::string& text, const std::string& identifier) const {
        const std::string_view kind = external_prefix_kind(identifier);
        const bool creature = kind == "creature";
        const bool material_list = kind == "material_list";
        if (creature) {
            if (!creature_name_resolver_ || creature_name_resolver_active_) return {};
        } else if (material_list) {
            if (!phrase_resolver_ || material_list_resolver_active_) return {};
        } else if (kind.empty() || !phrase_resolver_ || phrase_resolver_active_) {
            return {};
        }

        // Owner callbacks may query other typed grammar. Prevent a resolver
        // from re-entering itself, and keep every nested parse out of memo:
        // a result found with an active resolver is not a normal grammar result.
        // A material list resolves complete material leaves, which may have
        // their own typed owner/name. Do not disable those leaf resolvers.
        struct ResolverGuard {
            bool& active;
            explicit ResolverGuard(bool& value) : active(value) { active = true; }
            ~ResolverGuard() { active = false; }
        } guard(creature ? creature_name_resolver_active_ :
                material_list ? material_list_resolver_active_ : phrase_resolver_active_);
        std::vector<std::shared_ptr<const ResultTree>> results;
        const auto name_byte = [](unsigned char ch) {
            return (ch >= 'A' && ch <= 'Z') || (ch >= 'a' && ch <= 'z') ||
                (ch >= '0' && ch <= '9') || ch >= 0x80 || ch == '-' || ch == '\'';
        };
        for (size_t end = 1; end <= text.size(); ++end) {
            const auto previous = static_cast<unsigned char>(text[end - 1]);
            // Never offer the owner a prefix cut inside a UTF-8 codepoint.
            if (end < text.size() &&
                (static_cast<unsigned char>(text[end]) & 0xc0) == 0x80) continue;
            if (creature) {
                if (!name_byte(previous) && previous != ' ') break;
                if (!name_byte(previous)) continue;
                // An outer possessive also offers a boundary for event
                // grammar such as `seeing a <caste>'s dead body`.
                const bool possessive = end + 1 < text.size() && text[end] == '\'' &&
                    (text[end + 1] == 's' || text[end + 1] == 'S') &&
                    (end + 2 == text.size() || !name_byte(
                        static_cast<unsigned char>(text[end + 2])));
                if (end < text.size() && text[end] != ' ' && !possessive &&
                    name_byte(static_cast<unsigned char>(text[end]))) continue;
            } else {
                if (std::isspace(previous)) continue;
                // Typed references consume complete words. Keep punctuation
                // boundaries for titles/topics and possessives for enclosing
                // grammar, without querying every letter of a long subject.
                if (end < text.size() && name_byte(previous) &&
                    name_byte(static_cast<unsigned char>(text[end])) &&
                    text[end] != '\'') continue;
            }
            // Prose titles can contain punctuation, quotes and non-ASCII
            // words. The scoped callback must accept the whole candidate;
            // the enclosing grammar decides where the capture ends.
            const auto source = std::string_view(text).substr(0, end);
            dfcn::translation_work_step();
            auto translated = creature ? creature_name_resolver_(source)
                : phrase_resolver_(source, kind);
            if (!translated || translated->empty()) continue;
            results.push_back(std::make_shared<const ResultTree>(identifier,
                text.substr(0, end), std::move(*translated), text.substr(end),
                BindingMap{}, nullptr, nullptr, true));
        }
        return results;
    }

    std::optional<std::string> RulesetsManager::translate_tile_description(
            const std::string& text) const {
        dfcn::TranslationStateScope translation_scope;
        auto complete = [&](const std::string& source, const std::string& ns)
                -> std::optional<std::string> {
            const auto results = resolve_namespace(source, ns, 0);
            const ResultTree* best = nullptr;
            for (const auto& result : results) {
                if (!result->remaining.empty() || result->translated.empty()) continue;
                if (!best || result->preferred_to(*best)) best = result.get();
            }
            return best ? std::optional<std::string>(best->translated) : std::nullopt;
        };
        const auto part_at = [&](size_t start, size_t end) {
            std::string part = text.substr(start, end - start);
            const size_t first = part.find_first_not_of(' ');
            return first == std::string::npos ? std::string{}
                : part.substr(first, part.find_last_not_of(' ') - first + 1);
        };
        const auto growths = [&](std::string translated, size_t end)
                -> std::optional<std::string> {
            if (end == text.size()) return translated;
            const auto separator = complete(", ", "::tiles::growth_separator");
            if (!separator) return std::nullopt;
            size_t start = end + 1;
            while (start < text.size()) {
                const size_t comma = text.find(',', start);
                end = comma == std::string::npos ? text.size() : comma;
                // After the complete tile, every entry must be a growth.
                // Do not reinterpret another terrain or a person as foliage.
                auto target = complete(part_at(start, end), "::plants::growth::plural");
                if (!target) return std::nullopt;
                translated += *separator + *target;
                if (end == text.size()) return translated;
                start = end + 1;
            }
            return std::nullopt; // A trailing comma has no growth after it.
        };
        size_t comma = text.find(',');
        const size_t first_end = comma == std::string::npos ? text.size() : comma;
        // Native tree/sapling/shrub paths prepend name + ", " before the
        // plant description (PE 0xe7d749/0xe7f9b5/0xe7fb10). The first comma
        // is therefore not necessarily a growth boundary. Require the typed
        // name AND tree/shrub/sapling production before trying the name as a
        // terrain fragment, then parse any remaining growths normally. The
        // named-plant grammar excludes standalone foliage/growth nouns, so a
        // material followed by its growth list retains the ordinary route.
        while (comma != std::string::npos) {
            comma = text.find(',', comma + 1);
            const size_t end = comma == std::string::npos ? text.size() : comma;
            if (auto target = complete(part_at(0, end), "::tiles::named_plant"))
                if (auto caption = growths(*target, end)) return caption;
        }
        if (auto target = complete(part_at(0, first_end), "::tiles")) {
            if (auto caption = growths(*target, first_end)) return caption;
        }
        return std::nullopt;
    }

    std::optional<std::string> RulesetsManager::translate_color(
            const std::string& text) const {
        dfcn::TranslationStateScope translation_scope;
        // Color names such as copper/cardinal are not material/species names
        // in an appearance sentence. Use the existing reviewed color table.
        const auto results = resolve_namespace(text, "::color::name", 0);
        const ResultTree* best = nullptr;
        for (const auto& result : results) {
            if (!result->remaining.empty() || result->translated.empty()) continue;
            if (!best || result->preferred_to(*best)) best = result.get();
        }
        return best ? std::optional<std::string>(best->translated) : std::nullopt;
    }

    std::optional<std::string> RulesetsManager::translate_appearance_term(
            const std::string& text, const std::string& context) const {
        dfcn::TranslationStateScope translation_scope;
        const auto results = resolve_namespace(
            text, "::health::appearance::" + context, 0);
        for (const auto& result : results) {
            if (result->remaining.empty() && !result->translated.empty())
                return result->translated;
        }
        return std::nullopt;
    }

    std::optional<std::string> RulesetsManager::translate_anatomy(
            const std::string& text) const {
        dfcn::TranslationStateScope translation_scope;
        if (text.empty() || text.find_first_of(".;:!?\"()\n\r") != std::string::npos)
            return std::nullopt;
        auto complete = [&](const std::string& source, const std::string& ns)
                -> std::optional<std::string> {
            const auto results = resolve_namespace(source, ns, 0);
            const ResultTree* best = nullptr;
            for (const auto& result : results) {
                if (!result->remaining.empty() || result->translated.empty()) continue;
                if (!best || result->preferred_to(*best)) best = result.get();
            }
            return best ? std::optional<std::string>(best->translated) : std::nullopt;
        };
        std::vector<std::string> parts;
        size_t start = 0;
        while (start <= text.size()) {
            const size_t comma = text.find(',', start);
            const size_t end = comma == std::string::npos ? text.size() : comma;
            std::string part = text.substr(start, end - start);
            const size_t first = part.find_first_not_of(" \t");
            if (first == std::string::npos) return std::nullopt;
            part = part.substr(first, part.find_last_not_of(" \t") - first + 1);
            parts.push_back(std::move(part));
            if (comma == std::string::npos) break;
            start = comma + 1;
        }
        // DF appends tissue AFTER the owner chain. Resolve this through the
        // tissue namespace, not the body-part vocabulary: reversing all comma
        // fields would turn "finger, hand, skin" into "skin hand finger".
        std::string tissue;
        if (parts.size() > 1) {
            if (auto suffix = complete(", " + parts.back(), "::health::bodypart::main_tissue")) {
                tissue = std::move(*suffix);
                parts.pop_back();
            }
        }
        std::string translated;
        for (auto it = parts.rbegin(); it != parts.rend(); ++it) {
            auto part = complete(*it, "::health::bodypart::bodypart_main");
            // An injury may name a tissue on its own (skin, nail, etc.).
            // Only a single unqualified field can use this fallback.
            if (!part && parts.size() == 1 && text.find(',') == std::string::npos)
                part = complete(*it, "::health::bodypart::tissue");
            if (!part) return std::nullopt;
            translated += *part;
        }
        return translated + tissue;
    }

    /// 递归遍历目录，收集 .toml 文件并按排序顺序加载。
    ///
    /// 目录条目排序确保确定性加载顺序，匹配 Rust 参考实现 sorted_paths.sort() 的行为。
    ///
    /// @param base         规则集根目录
    /// @param curr         当前遍历目录
    /// @param visited_root 记录已访问的根文件（确保唯一）
    void RulesetsManager::parse_dir(const std::filesystem::path& base, const std::filesystem::path& curr,
                std::optional<std::string>& visited_root) {
        LOGGERMANAGER.getLogger()->info("Loading rulesets from: {}", curr.string());

        // 收集并排序目录条目，确保确定性加载顺序（匹配 Rust sorted_paths.sort()）
        std::vector<std::filesystem::path> paths;
        for (const auto& entry : std::filesystem::directory_iterator(curr)) {
            paths.push_back(entry.path());
        }
        std::sort(paths.begin(), paths.end());

        for (const auto& path : paths) {
            if (std::filesystem::is_directory(path)) {
                parse_dir(base, path, visited_root);
            } else if (path.extension() == ".toml") {
                parse_file(base, path, visited_root);
            }
        }
    }

    /// 解析单个 TOML 规则集文件。
    ///
    /// 加载流程：
    ///   1. 读取 [base] 字段（可选），验证与文件路径的一致性
    ///   2. 遍历 [[rulesets]] 数组，为每个规则集构建规则
    ///   3. 解析 [rulesets.rules] 表，将每条 key = value 转换为 (Tokens, Tokens)
    ///   4. 校验规则的有效性（重复引用、翻译模板中引用未在原文出现）
    ///
    /// @param base         规则集根目录
    /// @param path         当前 TOML 文件路径
    /// @param visited_root 记录已访问的根文件
    /// @throws std::runtime_error 文件格式错误或校验失败时抛出
    void RulesetsManager::parse_file(const std::filesystem::path& base, const std::filesystem::path& path,
                    std::optional<std::string>& visited_root) {
        auto result = toml::parse_file(path.u8string());

        if (!result) {
            std::ostringstream error;
            error << result.error();
            throw std::runtime_error("TOML parsing failed in " + path.string() + ": " + error.str());
        }

        const toml::table& toml_data = result.table();

        // [base] 字段（可选）：无 base 的文件为根文件，全局只能有一个
        std::optional<std::string> file_base = toml_data["base"].value<std::string>();

        if (!file_base.has_value()) {
            if (visited_root.has_value()) {
                throw std::runtime_error("Multiple root bases found: " + visited_root.value() +
                                        " and " + path.string());
            }
            visited_root = path.string();
        }

        std::string base_namespace = file_base.value_or("");

        // 验证 base_namespace 与文件路径一致，防止 TOML 作者误写 base 字段
        {
            auto relative = std::filesystem::relative(path, base);

            std::vector<std::string> parts;
            for (const auto& component : relative) {
                parts.push_back(component.string());
            }

            // 去除文件名中的 .toml 后缀
            if (!parts.empty() && parts.back().ends_with(".toml")) {
                parts.back() = parts.back().substr(0, parts.back().size() - 5);
            }

            // data/runtime/rulesets/zh-Hans/index.toml 是目录的默认规则文件，不贡献路径段
            if (!parts.empty() && parts.back() == "index") {
                parts.pop_back();
            }

            // 用 :: 连接各路径段作为期望的命名空间
            std::string expected;
            for (size_t i = 0; i < parts.size(); ++i) {
                if (i > 0) expected += "::";
                expected += parts[i];
            }

            if (base_namespace != expected) {
                throw std::runtime_error(
                    "Base namespace mismatch in " + path.string() +
                    ": expected \"" + expected + "\", found \"" + base_namespace + "\""
                );
            }
        }

        // [[rulesets]] 数组
        if (!toml_data.contains("rulesets")) {
            return; // 允许空文件（无规则集）
        }
        auto rulesets_array = toml_data["rulesets"].as_array();
        if (!rulesets_array) {
            throw std::runtime_error("rulesets must be an array in " + path.string());
        }

        for (const auto& ruleset_entry : *rulesets_array) {
            if (!ruleset_entry.is_table()) {
                throw std::runtime_error("Non-table entry in rulesets array in " + path.string());
            }
            const auto& tbl = *ruleset_entry.as_table();

            std::string name_suffix;
            bool optional = false;

            // [rulesets.name]（可选）
            name_suffix = tbl["name"].value_or("");

            // [rulesets.optional]（默认 false）
            optional = tbl["optional"].value_or(false);

            // 构建完整的命名空间标识符
            std::string identifier = "::";
            if (!base_namespace.empty()) {
                identifier += base_namespace;
                if (!name_suffix.empty()) {
                    identifier += "::" + name_suffix;
                }
            } else {
                if (!name_suffix.empty()) {
                    identifier += name_suffix;
                }
            }

            validate_identifier_format(identifier);

            auto& rules = rulesets_[identifier];

            // optional 规则集：插入空匹配回退规则
            if (optional) {
                rules.emplace_back(
                    Tokens{Token{Type::Literal, ""}},
                    Tokens{Token{Type::Literal, ""}}
                );
            }

            // [rulesets.rules] 表
            if (!tbl.contains("rules")) {
                continue; // 允许无规则
            }
            auto rules_table = tbl["rules"].as_table();
            if (!rules_table) {
                throw std::runtime_error("rules must be a table in " + path.string());
            }

            for (const auto& [orig_str, trans_val] : *rules_table) {
                if (auto trans_node = trans_val.as_string()) {
                    std::string trans_str = trans_node->get();

                    // 解析原文和译文为 Token 序列
                    Tokens orig_tokens = parse_tokens(base_namespace, std::string(orig_str));
                    Tokens trans_tokens = parse_tokens(base_namespace, trans_str);

                    // 校验：原文中不能有重复引用
                    std::set<std::string> orig_refs;
                    for (const auto& tok : orig_tokens) {
                        if (tok.type == Type::Reference) {
                            if (!orig_refs.insert(tok.value).second) {
                                throw std::runtime_error(
                                    "Original entry \"" + std::string(orig_str) +
                                    "\" has duplicate reference: " + tok.value
                                    );
                            }
                        }
                    }

                    // 校验：译文中的引用必须全部出现在原文中
                    for (const auto& tok : trans_tokens) {
                        if (tok.type == Type::Reference) {
                            if (orig_refs.find(tok.value) == orig_refs.end()) {
                                throw std::runtime_error(
                                    "Translated reference \"" + tok.value +
                                    "\" not found in original: " + std::string(orig_str)
                                    );
                            }
                        }
                    }

                    // 校验：Placeholder（@ 前缀）后的 token 必须是 Literal
                    for (size_t i = 0; i < orig_tokens.size(); ++i) {
                        if (orig_tokens[i].type == Type::Reference && is_placeholder(orig_tokens[i].value)) {
                            if (i + 1 < orig_tokens.size() && orig_tokens[i + 1].type != Type::Literal) {
                                throw std::runtime_error(
                                    "Placeholder '" + orig_tokens[i].value +
                                    "' must be followed by a Literal token in: " + std::string(orig_str));
                            }
                        }
                    }

                    // 插入规则（保持插入顺序，匹配 Rust IndexMap 行为）
                    rules.emplace_back(std::move(orig_tokens), std::move(trans_tokens));
                }
            }
        }
    }

    /// 验证所有规则中的非 Replacer 引用是否指向已加载的规则集。
    ///
    /// 遍历所有规则的所有 original Token，确保每个 Reference
    /// （% Replacer 除外）在 rulesets_ 中都能找到对应的规则集。
    ///
    /// @throws std::runtime_error 引用无法解析时抛出
    void RulesetsManager::validate_references() const {
        for (const auto& [name, ruleset] : rulesets_) {
            for (const auto& [orig, _] : ruleset) {
                for (const auto& token : orig) {
                    if (token.type == Type::Reference && token.value[0] != '%' && token.value[0] != '@' && token.value[0] != '#') {
                        if (!rulesets_.contains(token.value))
                            throw std::runtime_error("Reference not found in " + name + ": " + token.value);
                    }
                }
            }
        }
    }

    void RulesetsManager::rebuild_rule_prefix_indexes() {
        decltype(rule_prefix_indexes_) indexes;
        decltype(literal_leaf_rules_) leaves;
        for (const auto& [identifier, rules] : rulesets_) {
            auto& index = indexes[identifier];
            for (size_t ordinal = 0; ordinal < rules.size(); ++ordinal) {
                const auto& source = rules[ordinal].first;
                if (source.empty() || source.front().type != Type::Literal ||
                    source.front().value.empty()) {
                    index.unrestricted.push_back(ordinal);
                    continue;
                }
                unsigned char initial = static_cast<unsigned char>(source.front().value.front());
                // Use exactly the ASCII case folding of ci_char_equal.
                // UTF-8 bytes and punctuation remain distinct.
                if (initial >= 'A' && initial <= 'Z') initial |= 0x20;
                index.literal_starts[initial].push_back(ordinal);
            }
            // A dynamic owner can add spellings absent from the literal
            // table. Nullable, mixed and large vocabularies retain their
            // ordinary parser; skipping this optional filter loses no rule.
            constexpr size_t max_leaf_rules = 128;
            if (!rules.empty() && rules.size() <= max_leaf_rules &&
                external_prefix_kind(identifier).empty() &&
                std::all_of(rules.begin(), rules.end(), [](const auto& rule) {
                    return rule.first.size() == 1 &&
                        rule.first.front().type == Type::Literal &&
                        !rule.first.front().value.empty();
                })) {
                auto& words = leaves[identifier];
                words.reserve(rules.size());
                for (const auto& rule : rules) words.push_back(rule.first.front().value);
            }
        }
        rule_prefix_indexes_ = std::move(indexes);
        literal_leaf_rules_ = std::move(leaves);
    }

    bool RulesetsManager::rule_literals_fit(std::string_view text, const Tokens& tokens) const {
        size_t at = 0;
        for (const auto& token : tokens) {
            dfcn::translation_work_step();
            if (token.type == Type::Literal) {
                if (token.value.empty()) continue;
                const auto found = find_literal_position(text.substr(at), token.value);
                if (!found) return false;
                at += *found + token.value.size();
                continue;
            }
            const auto leaf = literal_leaf_rules_.find(token.value);
            if (leaf == literal_leaf_rules_.end()) continue;
            size_t earliest_end = std::string_view::npos;
            for (const auto word : leaf->second) {
                dfcn::translation_work_step();
                const auto found = find_literal_position(text.substr(at), word);
                if (found) earliest_end = std::min(earliest_end, at + *found + word.size());
            }
            if (earliest_end == std::string_view::npos) return false;
            at = earliest_end;
        }
        // Namespace results may consume only a prefix. Unknown references
        // may also be optional, so neither requires an extra source byte.
        return true;
    }

    // -------------------------------------------------------------------------
    // 翻译核心
    // -------------------------------------------------------------------------

    /// 获取所有可能的翻译结果。
    /// @param partial_match true 时返回部分匹配结果，false 时仅返回完整匹配
    std::vector<std::shared_ptr<const RulesetsManager::ResultTree>> RulesetsManager::find_translations(const std::string& text, bool partial_match) const {
        auto results = resolve_namespace(text, "::", 0);
        if (partial_match) return results;
        std::vector<std::shared_ptr<const ResultTree>> full;
        for (auto& r : results)
            if (r->remaining.empty()) full.push_back(std::move(r));
        return full;
    }

    /// 在指定标识符命名空间内递归求解所有可能的翻译结果。
    ///
    /// 算法步骤：
    ///   0. 如果是 Replacer 引用（% 前缀），委托给 resolve_replacer
    ///   1. 检查记忆化缓存，命中则直接返回
    ///   2. 查找当前标识符对应的规则集
    ///   3. 遍历每条规则（OR 分支），逐 Token 匹配（AND 序列）
    ///      - Literal: 大小写不敏感前缀匹配
    ///      - Reference: 递归调用 resolve_namespace，绑定子结果
    ///   4. 对每个成功匹配的 Candidate 构建 ResultTree
    ///   5. 缓存结果到 memo_cache_（形成 DAG 共享边）
    ///
    /// 循环引用：加载时由 analyze_from_root() 预检测，
    /// 翻译时仅通过 cyclic_rule_signatures_ 做 O(log n) 查表跳过。
    ///
    /// @param text       待翻译的剩余文本
    /// @param identifier 当前命名空间标识符
    /// @param level      递归深度（仅用于调试输出）
    /// @return           所有可能的翻译结果列表
    std::vector<std::shared_ptr<const RulesetsManager::ResultTree>> RulesetsManager::resolve_namespace(
        const std::string& text,
        const std::string& identifier,
        size_t level
    ) const {
        dfcn::TranslationWorkFrame translation_work_frame(identifier, text);
        const bool use_memo = !creature_name_resolver_active_ && !phrase_resolver_active_ &&
                              !material_list_resolver_active_;
        // === 0. 记忆化检查 — 两级异构查找，0 次临时字符串分配 ===
        if (use_memo) {
            if (auto outer_it = memo_cache_.find(identifier); outer_it != memo_cache_.end()) {
                if (auto* cached = outer_it->second.find(text)) {
                    return *cached;
                }
            }
        }

        // === 1. 处理 Replacer 引用（% 前缀）===
        if (!identifier.empty() && identifier[0] == '%') {
            auto results = resolve_replacer(text, identifier, level);
            if (use_memo) memo_cache_[identifier].insert(text, results);
            return results;
        }

        auto all_results = resolve_external_prefixes(text, identifier);
        std::set<size_t> resolved_external_lengths;
        for (const auto& result : all_results)
            resolved_external_lengths.insert(result->matched.size());

        // === 2. 查找规则集 ===
        auto ruleset_it = rulesets_.find(identifier);
        if (ruleset_it == rulesets_.end()) {
            if (use_memo) memo_cache_[identifier].insert(text, all_results);
            return all_results;
        }
        const auto& rules = ruleset_it->second;

        const auto prefix_it = rule_prefix_indexes_.find(identifier);
        const RulePrefixIndex* prefix_index = prefix_it == rule_prefix_indexes_.end()
            ? nullptr : &prefix_it->second;
        const std::vector<size_t>* literal_rules = nullptr;
        if (prefix_index && !text.empty()) {
            unsigned char initial = static_cast<unsigned char>(text.front());
            if (initial >= 'A' && initial <= 'Z') initial |= 0x20;
            const auto found = prefix_index->literal_starts.find(initial);
            if (found != prefix_index->literal_starts.end()) literal_rules = &found->second;
        }
        size_t unrestricted_at = 0, literal_at = 0, linear_at = 0;
        // Merge original ordinals so prefix pruning cannot change equal-weight
        // results, reference precedence, or the order of prefix alternatives.
        for (;;) {
            size_t ordinal;
            if (!prefix_index) {
                // A failed/incomplete reload can leave no index. Retain the
                // original linear behavior instead of omitting any rule.
                if (linear_at == rules.size()) break;
                ordinal = linear_at++;
            } else {
                const size_t unrestricted = unrestricted_at < prefix_index->unrestricted.size()
                    ? prefix_index->unrestricted[unrestricted_at] : rules.size();
                const size_t literal = literal_rules && literal_at < literal_rules->size()
                    ? (*literal_rules)[literal_at] : rules.size();
                if (unrestricted == rules.size() && literal == rules.size()) break;
                if (unrestricted < literal) {
                    ordinal = unrestricted;
                    ++unrestricted_at;
                } else {
                    ordinal = literal;
                    ++literal_at;
                }
            }
            const auto& [orig_tokens, trans_tokens] = rules[ordinal];
            // The full leading literal is a necessary condition too. Reject
            // impossible dictionary entries before charging an actual parse
            // step; large noun tables otherwise exhaust a paragraph's budget
            // on entries whose first token can never match its source.
            if (!orig_tokens.empty() && orig_tokens.front().type == Type::Literal &&
                !orig_tokens.front().value.empty() &&
                !matches_literal(text, orig_tokens.front().value)) continue;
            if (!rule_literals_fit(text, orig_tokens)) continue;
            dfcn::translation_work_step();

            // 跳过加载时已确认的循环规则（O(log n) 查表）
            if (!cyclic_rule_signatures_.empty() && cyclic_rule_signatures_.contains({identifier, orig_tokens})) continue;

            // === 3.1 逐 Token 匹配（AND 序列）—— 生成 Candidate 列表 ===
            std::vector<Candidate> candidates{Candidate({}, text)};

            for (size_t ti = 0; ti < orig_tokens.size(); ++ti) {
                dfcn::translation_work_step();
                const auto& token = orig_tokens[ti];
                if (candidates.empty()) break;
                std::vector<Candidate> next_candidates;

                if (token.type == Type::Literal) {
                    for (auto& candidate : candidates) {
                        dfcn::translation_work_step();
                        // 字面文本：大小写不敏感前缀匹配
                        std::string_view pattern = token.value;
                        std::string_view remaining_text = candidate.remaining;
                        if (matches_literal(remaining_text, pattern)) {
                            std::string new_remaining(remaining_text.substr(pattern.size()));
                            next_candidates.emplace_back(std::move(candidate.results), std::move(new_remaining));
                        }
                    }
                } else if (is_placeholder(token.value)) {
                    // Placeholder（@ 前缀）：捕获文本并原样穿透输出。
                    // 加载时已保证后面若有 token 则必为 Literal，见 parse_file()。
                    for (auto& candidate : candidates) {
                        dfcn::translation_work_step();
                        if (ti + 1 < orig_tokens.size()) {
                            // 情况 A：后面还有 Literal（unique delimiter，只需首次匹配）
                            const auto& next_lit = orig_tokens[ti + 1];
                            auto pos = find_literal_position(
                                candidate.remaining, next_lit.value);
                            if (pos) {
                                std::string captured = candidate.remaining.substr(0, *pos);
                                std::string rem = candidate.remaining.substr(
                                    *pos + next_lit.value.size());
                                auto new_results = candidate.results;
                                new_results.emplace_back(token.value,
                                    std::make_shared<const ResultTree>(
                                        token.value, captured, captured, "", BindingMap{}));
                                next_candidates.emplace_back(
                                    std::move(new_results), std::move(rem));
                            }
                        } else {
                            // 情况 B：最后一个 token → 消费全部剩余文本
                            auto new_results = candidate.results;
                            new_results.emplace_back(token.value,
                                std::make_shared<const ResultTree>(
                                    token.value, candidate.remaining,
                                    candidate.remaining, "", BindingMap{}));
                            next_candidates.emplace_back(
                                std::move(new_results), "");
                        }
                    }
                    // 仅在确有候选存活时跳过已消费的 Literal；
                    // 若 delimiter 未找到（所有候选死于 placeholder），则不推进 ti，
                    // 由循环顶部 candidates.empty() break 安全退出。
                    if (ti + 1 < orig_tokens.size() && !next_candidates.empty()) ti++;
                } else if (is_builtin(token.value)) {
                    // Builtin token（# 前缀）：内联匹配，不递归。
                    // #digits: 匹配首部连续 ASCII 数字，原样穿透。
                    for (auto& candidate : candidates) {
                        dfcn::translation_work_step();
                        std::string matched;
                        for (char ch : candidate.remaining) {
                            if (!std::isdigit(static_cast<unsigned char>(ch))) break;
                            matched.push_back(ch);
                        }
                        if (matched.empty()) continue;

                        std::string remaining = candidate.remaining.substr(matched.size());
                        auto new_results = candidate.results;
                        new_results.emplace_back(token.value,
                            std::make_shared<const ResultTree>(
                                token.value, matched, matched, remaining, BindingMap{}));
                        next_candidates.emplace_back(
                            std::move(new_results), std::move(remaining));
                    }
                } else {
                    for (auto& candidate : candidates) {
                        dfcn::translation_work_step();
                        // 引用 Token：递归求解子目标（AND 绑定）
                        auto sub_results = resolve_namespace(candidate.remaining, token.value, level + 1);

                        // 为每个子结果创建新的 Candidate 分支
                        for (auto& sub_result : sub_results) {
                            dfcn::translation_work_step();
                            std::string remaining_copy = sub_result->remaining;
                            auto new_results = candidate.results;
                            new_results.emplace_back(sub_result->identifier, std::move(sub_result));
                            next_candidates.emplace_back(std::move(new_results), std::move(remaining_copy));
                        }
                    }
                }
                candidates = std::move(next_candidates);
            }

            // === 3.2 为每个存活的 Candidate 构建 ResultTree ===
            for (auto& candidate : candidates) {
                dfcn::translation_work_step();
                std::string matched = text.substr(0, text.size() - candidate.remaining.size());
                // The common resolver already supplied this exact typed
                // span. Retain shorter alternatives for the enclosing grammar,
                // but do not let an older literal sense win on equal length.
                if (resolved_external_lengths.contains(matched.size())) continue;

                std::string translated_str = build_translated(trans_tokens, candidate.results);

                auto result = std::make_shared<const ResultTree>(
                    identifier,
                    std::move(matched),
                    std::move(translated_str),
                    std::move(candidate.remaining),
                    std::move(candidate.results), &orig_tokens, &trans_tokens
                );
                all_results.push_back(std::move(result));
            }
        }

        // === 4. 缓存结果 — 形成 DAG 边，共享子问题可复用 ===
        if (use_memo) memo_cache_[identifier].insert(text, all_results);
        return all_results;
    }

    /// 将 Replacer 引用（% 前缀标识符）解析为翻译结果。
    ///
    /// 当前仅支持 item_designation：
    ///   匹配物品标记（品质符号、磨损标记、括号等），
    ///   剥离标记后委托到引用命名空间翻译内部文本，最后恢复标记包装。
    ///
    /// 完整的 Replacer 实现见 reference/replacer/item_designation.rs 中的 Rust 代码。
    std::vector<std::shared_ptr<const RulesetsManager::ResultTree>> RulesetsManager::resolve_replacer(
        const std::string& text,
        const std::string& identifier,
        size_t level
    ) const {
        // 解析格式：%name:base_ns 或 %name:base_ns:config
        size_t first_colon = identifier.find(':');
        if (first_colon == std::string::npos) return {};

        std::string replacer_name = identifier.substr(1, first_colon - 1);
        std::string rest = identifier.substr(first_colon + 1);

        // 提取 base_ns 和可选的 config
        size_t second_colon = rest.find(':');
        std::string base_ns = (second_colon != std::string::npos)
            ? rest.substr(0, second_colon) : rest;
        std::string config = (second_colon != std::string::npos)
            ? rest.substr(second_colon + 1) : std::string{};

        if (replacer_name == "item_designation") {
            std::string reference = config.empty()
                ? to_canonical_identifier(base_ns, "")
                : to_canonical_identifier(config, base_ns);
            std::vector<std::shared_ptr<const ResultTree>> results;

            // 对每种可能的物品标记（无标记、"("、"{...}"、"$...$" 等），
            // 剥离标记 → 翻译内部文本 → 恢复标记
            for (const auto& [prefix, suffix] : dfcn::match_item_designation_prefixes(text)) {
                std::string inner_text = text.substr(prefix.size());
                auto inner_results = resolve_namespace(inner_text, reference, level + 1);

                for (auto& inner : inner_results) {
                    // 内部翻译的剩余文本必须以预期后缀开头
                    if (!inner->remaining.starts_with(suffix)) continue;

                    std::string remaining = inner->remaining.substr(suffix.size());
                    std::string matched = text.substr(0, text.size() - remaining.size());
                    std::string translated =
                        dfcn::display_item_designation_wrapper(prefix, false) +
                        inner->translated +
                        dfcn::display_item_designation_wrapper(suffix, true);

                    BindingMap children;
                    children.emplace_back("item", inner);

                    results.push_back(std::make_shared<const ResultTree>(
                        identifier,
                        std::move(matched),
                        std::move(translated),
                        std::move(remaining),
                        std::move(children)
                    ));
                }
            }
            return results;
        }

        // 未知 Replacer 类型：返回空结果
        return {};
    }

    // -----------------------------------------------------------------------------
    // 标识符处理
    // -----------------------------------------------------------------------------

    /// 将字符串解析为 Token 序列。
    ///
    /// 使用正则 `{([^{}]+)}` 识别引用标记：
    ///   - 花括号内的内容 → Reference Token（经 to_canonical_identifier 规范化）
    ///   - 花括号外的内容 → Literal Token
    ///
    /// @param base_ns 当前文件的命名空间，用于相对引用展开
    /// @param input   待解析的字符串
    /// @return        解析后的 Token 序列
    /// @throws std::runtime_error 括号不匹配时抛出
    RulesetsManager::Tokens RulesetsManager::parse_tokens(const std::string& base_ns, const std::string& input) const {
        // 校验括号是否成对出现
        int lbrace = 0, rbrace = 0;
        for (char c : input) {
            if (c == '{') ++lbrace;
            else if (c == '}') ++rbrace;
        }
        if (lbrace != rbrace)
            throw std::runtime_error("Mismatched braces in token string");

        // 收集所有分割位置。0 在最前，input.size() 在最后，
        // 中间每次匹配推入 start/end 且 regex 迭代器保证递增，
        // 整个序列天然有序，无需 sort，只需去重
        std::vector<size_t> positions{0};
        for (std::sregex_iterator it(input.begin(), input.end(), token_split_regex()), end;
            it != end; ++it) {
            positions.push_back(it->position());
            positions.push_back(it->position() + it->length());
        }
        positions.push_back(input.size());
        positions.erase(std::unique(positions.begin(), positions.end()), positions.end());

        Tokens tokens;
        for (size_t i = 0; i < positions.size() - 1; ++i) {
            size_t l = positions[i], r = positions[i + 1];
            std::string chunk = input.substr(l, r - l);
            if (!chunk.empty() && chunk.front() == '{' && chunk.back() == '}') {
                std::string inner = chunk.substr(1, chunk.size() - 2);
                std::string ref = to_canonical_identifier(inner, base_ns);
                validate_identifier_format(ref);
                tokens.emplace_back(Token{Type::Reference, std::move(ref)});
            } else if (!chunk.empty()) {
                tokens.emplace_back(Token{Type::Literal, std::move(chunk)});
            }
        }

        // 注意：不在此处检查 original 中的重复引用；
        // 该检查由 parse_file 中调用方负责（见 reference/translator.rs 的 duplicate detection）

        return tokens;
    }

    /// 将标识符转换为规范形式。
    ///
    /// 处理三种形式：
    ///   - "::prefix"         → 绝对引用，原样返回
    ///   - "%replacer:ns"     → Replacer 引用，插入 base_ns
    ///   - "bare_name"        → 相对引用，展开为 "::base_ns::bare_name"
    ///
    /// @param identifier 原始标识符
    /// @param base_ns    当前文件的基础命名空间
    /// @return           规范化后的标识符字符串
    std::string RulesetsManager::to_canonical_identifier(const std::string& identifier, const std::string& base_ns) const {
        if (identifier.starts_with("::")) {
            return identifier;
        }
        if (identifier.starts_with("@")) {
            return identifier;  // Placeholder: local to rule, no namespace scoping
        }
        if (identifier.starts_with("#")) {
            return identifier;  // Builtin token: processed inline, no namespace scoping
        }
        if (identifier.starts_with("%")) {
            size_t colon = identifier.find(':', 1);
            if (colon == std::string::npos) {
                return identifier;      // Replacer: no namespace scoping
            } else {
                std::string result;
                result.reserve((colon + 1) + base_ns.size() + (identifier.size() - colon));
                result.append(identifier, 0, colon + 1);
                result += base_ns;
                result.append(identifier, colon);
                return result;
            }
        }
        if (base_ns.empty()) {
            std::string result;
            result.reserve(2 + identifier.size());
            result += "::";
            result += identifier;
            return result;
        }
        std::string result;
        result.reserve(4 + base_ns.size() + identifier.size());
        result += "::";
        result += base_ns;
        result += "::";
        result += identifier;
        return result;
    }

    /// 校验标识符格式的合法性。
    ///
    /// - Replacer 标识符（% 前缀）必须包含 ':' 分隔符
    /// - 普通标识符不能以 "::" 结尾（根 "::" 除外）
    /// - 普通标识符中不能出现连续三个及以上的冒号
    ///
    /// @throws std::runtime_error 格式不合法时抛出
    void RulesetsManager::validate_identifier_format(const std::string& identifier) const {
        if (identifier.starts_with("@")) {
            return;     // Placeholder: local name, no format requirements
        }
        if (identifier.starts_with("#")) {
            return;     // Builtin token: no format requirements
        }
        if (identifier.starts_with("%")) {
            return;     // Replacer: 无需校验格式，resolve_replacer 处理未知类型时返回空
        }

        if (identifier != "::" && identifier.ends_with("::"))
            throw std::runtime_error("Identifier cannot end with '::'");

        std::sregex_iterator it(identifier.begin(), identifier.end(), consecutive_colons_regex()), end;
        while (it != end) {
            if (it->str().size() != 2)
                throw std::runtime_error("Identifier contains invalid colon sequence");
            ++it;
        }
    }

    /// 大小写不敏感字符相等比较（位运算替代 std::tolower）。
    /// 作为 matches_literal 和 find_literal_position 的共用 comparator。
    bool RulesetsManager::ci_char_equal(unsigned char a, unsigned char b) {
        if (a >= 'A' && a <= 'Z') a |= 0x20;
        if (b >= 'A' && b <= 'Z') b |= 0x20;
        return a == b;
    }

    /// 大小写不敏感的前缀匹配，委托 ci_char_equal 逐字符比较。
    /// @return input 以 pattern 开头时返回 true
    bool RulesetsManager::matches_literal(std::string_view input, std::string_view pattern) {
        if (input.size() < pattern.size()) return false;
        return std::equal(pattern.begin(), pattern.end(), input.begin(), ci_char_equal);
    }

    /// 检查标识符是否为 Placeholder（@ 前缀）。
    /// Placeholder 没有对应规则集，用于捕获任意文本并原样穿透输出。
    bool RulesetsManager::is_placeholder(std::string_view identifier) {
        return !identifier.empty() && identifier[0] == '@';
    }

    /// 检查标识符是否为内建 token（# 前缀）。
    /// 内建 token 没有对应规则集，由引擎在 token 循环中内联处理。
    bool RulesetsManager::is_builtin(std::string_view identifier) {
        return !identifier.empty() && identifier[0] == '#';
    }

    /// 在文本中查找字面量的第一处大小写不敏感出现位置。
    /// 使用 std::search + ci_char_equal；placeholder 的后续 Literal
    /// 是 unique delimiter，只需首次匹配即可。
    /// @param text    待搜索的文本
    /// @param literal 要查找的字面量模式
    /// @return        匹配起始字节偏移，未找到返回 std::nullopt
    std::optional<size_t> RulesetsManager::find_literal_position(
        std::string_view text, std::string_view literal)
    {
        if (literal.empty()) return 0;
        auto it = std::search(text.begin(), text.end(),
                              literal.begin(), literal.end(), ci_char_equal);
        if (it == text.end()) return std::nullopt;
        return it - text.begin();
    }

    /// 根据翻译模板和绑定结果构建最终翻译文本。
    ///
    /// 遍历 trans_tokens：
    ///   - Literal → 直接拼接其值
    ///   - Reference → 查找 bindings 中对应的子结果，拼接其 translated 字段
    ///
    /// @throws std::runtime_error 引用未绑定时抛出
    std::string RulesetsManager::build_translated(const Tokens& trans_tokens,
            const BindingMap& bindings, std::vector<size_t>* origins) {
        std::string s;
        if (origins) origins->clear();
        for (const auto& t : trans_tokens) {
            if (t.type == Type::Literal) {
                s += t.value;
                if (origins) origins->insert(origins->end(), t.value.size(), std::string::npos);
            } else {
                auto it = std::find_if(bindings.begin(), bindings.end(),
                    [&](const auto& p) { return p.first == t.value; });
                if (it == bindings.end()) {
                    throw std::runtime_error("Unbound reference: " + t.value);
                }
                s += it->second->translated;
                if (origins) {
                    size_t start = 0;
                    for (auto prior = bindings.begin(); prior != it; ++prior)
                        start += prior->second->translated.size();
                    for (size_t i = 0; i < it->second->translated.size(); ++i)
                        origins->push_back(start + i);
                }
            }
        }
        return s;
    }

    bool RulesetsManager::translation_origins(
            const ResultTree& tree, std::vector<size_t>& origins) {
        origins.clear();
        if (tree.matched.empty()) return tree.translated.empty();
        if (tree.external_leaf) {
            // An externally resolved capture is one semantic field. Its
            // translation inherits the first source byte's color; enclosing grammar
            // still offsets the field when it reorders neighboring captures.
            origins.assign(tree.translated.size(), 0);
            return true;
        }
        if (tree.matched == tree.translated) {
            for (size_t i = 0; i < tree.translated.size(); ++i) origins.push_back(i);
            return true;
        }
        if (!tree.source_tokens || !tree.target_tokens) {
            // A native one-byte designation can render as a UTF-8 glyph.
            // Keep original spans for parsing and exact byte origins for
            // every rendered glyph, including wrappers inside a larger noun.
            if (!tree.identifier.starts_with("%item_designation:") ||
                tree.children.size() != 1) return false;
            const auto& child = *tree.children.front().second;
            if (child.remaining.size() < tree.remaining.size()) return false;
            const size_t suffix = child.remaining.size() - tree.remaining.size();
            if (child.matched.size() + suffix > tree.matched.size()) return false;
            const size_t prefix = tree.matched.size() - child.matched.size() - suffix;
            std::vector<size_t> inner;
            if (!translation_origins(child, inner)) return false;
            std::vector<size_t> before, after;
            const auto matched = std::string_view(tree.matched);
            const auto display_prefix = dfcn::display_item_designation_wrapper(
                matched.substr(0, prefix), false, &before);
            const auto display_suffix = dfcn::display_item_designation_wrapper(
                matched.substr(matched.size() - suffix), true, &after);
            if (display_prefix + child.translated + display_suffix != tree.translated)
                return false;
            origins.insert(origins.end(), before.begin(), before.end());
            for (size_t i : inner) origins.push_back(prefix + i);
            for (size_t i : after) origins.push_back(tree.matched.size() - suffix + i);
            return origins.size() == tree.translated.size();
        }
        struct ChildSource { const ResultTree* tree; size_t start; };
        std::unordered_map<std::string, ChildSource> bindings;
        size_t cursor = 0;
        for (const auto& token : *tree.source_tokens) {
            if (token.type == Type::Literal) {
                cursor += token.value.size();
            } else {
                const auto child = std::find_if(tree.children.begin(), tree.children.end(),
                    [&](const auto& binding) { return binding.first == token.value; });
                if (child == tree.children.end()) return false;
                bindings.emplace(token.value, ChildSource{child->second.get(), cursor});
                cursor += child->second->matched.size();
            }
        }
        if (cursor != tree.matched.size()) return false;
        for (const auto& token : *tree.target_tokens) {
            if (token.type == Type::Literal) {
                // Connective words inherit the enclosing clause's base
                // color; a final stop belongs to the original final stop.
                const bool final_stop = token.value == "。" || token.value == "！" ||
                    token.value == "？";
                const size_t origin = final_stop ? tree.matched.size() - 1 : 0;
                origins.insert(origins.end(), token.value.size(), origin);
            } else {
                const auto found = bindings.find(token.value);
                if (found == bindings.end()) return false;
                std::vector<size_t> child_origins;
                if (!translation_origins(*found->second.tree, child_origins)) return false;
                for (size_t offset : child_origins)
                    origins.push_back(found->second.start + offset);
            }
        }
        return origins.size() == tree.translated.size() &&
            std::all_of(origins.begin(), origins.end(),
                [&](size_t offset) { return offset < tree.matched.size(); });
    }

    /// 递归打印翻译路径（调试用）。
    /// 从根节点开始，逐层打印每条规则的匹配和翻译信息。
    void RulesetsManager::print_translation_path(const ResultTree& node, int indent) {
        std::string pad(indent * 2, ' ');
        printf("%s[%s]\n", pad.c_str(), node.identifier.c_str());
        printf("%s  matched   : \"%s\"\n", pad.c_str(), node.matched.c_str());
        printf("%s  translated: \"%s\"\n", pad.c_str(), node.translated.c_str());
        if (!node.remaining.empty())
            printf("%s  remaining : \"%s\"\n", pad.c_str(), node.remaining.c_str());
        printf("%s  weight    : %zu\n", pad.c_str(), node.weight());
        for (const auto& [ref_id, child] : node.children) {
            printf("%s  ref: %s\n", pad.c_str(), ref_id.c_str());
            print_translation_path(*child, indent + 1);
        }
    }

} // namespace Hooks
} // namespace DFZH
} // namespace DFHack
