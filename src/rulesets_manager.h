// SPDX-License-Identifier: MIT
// Algorithm & rule logic referenced from:
// https://github.com/DFI18n/dfi18n/tree/develop/crates/rule_based_translator
// Original License: MIT
// This implementation is independently rewritten in C++ with performance
// optimizations and C++ idiom improvements.
// Copyright (c) 2026 0x53an

#pragma once

#include <filesystem>
#include <functional>
#include <list>
#include <memory>
#include <optional>
#include <regex>
#include <set>
#include <string>
#include <string_view>
#include <unordered_map>
#include <vector>

namespace DFHack {
namespace DFZH {
namespace Hooks {

    class RulesetsManager {
    public:
        static RulesetsManager& getInstance() {
            static RulesetsManager instance;
            return instance;
        }

        bool init();
        void shutdown();
        std::string last_load_error() const;

        void print_cache_stats() const;

        bool load_rule_sets();
        void load_from_dir(const std::filesystem::path& dir);

        std::optional<std::string> translate(const std::string& text) const;
        // Local command callbacks can own DFHack's Console lock. Give their
        // explicitly typed human captions a detached grammar and cache; they
        // must never wait for Overlay or enter its game-backed callbacks.
        using CaptionSnapshot = std::function<std::optional<std::string>(
            std::string_view kind, std::string_view text)>;
        CaptionSnapshot make_caption_snapshot(
            std::unordered_map<std::string, std::string> material_qualifiers = {}) const;
        // Native semantic fields bind an exact existing TOML production.
        // No input sentence matching, word segmentation or type inference.
        // With no fields, source_pattern is literal text, not token syntax.
        // Optional origins index bytes in the concatenated field values;
        // rule literals use string::npos. Reordered fields retain metadata.
        std::optional<std::string> compose_bound_rule(
            const std::string& context, const std::string& source_pattern,
            const std::vector<std::pair<std::string, std::string>>& fields = {},
            std::vector<size_t>* origins = nullptr) const;
        // Complete activity/menu grammar keeps the action before its item;
        // equipment material extraction must not reorder an entire job name.
        std::optional<std::string> translate_activity(const std::string& text) const;
        // Resolve through the same grammar, retaining the source byte behind
        // each translated UTF-8 byte. Reordered references keep their colors.
        // No game color or layout policy belongs in this parser.
        std::optional<std::string> translate_with_origins(
            const std::string& text, const std::string& context,
            std::vector<size_t>& origins) const;
        // Bare ammunition types from the item grammar, never material/name
        // fragments. Callers compose the material with the shared qualifier.
        std::optional<std::string> translate_ammunition_type(const std::string& text) const;
        // Coin names share the material + noun grammar with minting/hauling tasks.
        std::optional<std::string> translate_coin_name(const std::string& text) const;
        // Complete equipment nouns, isolated from material, skill and prose
        // rules. Textile callers can restrict the same resolver to wear/shields.
        std::optional<std::string> translate_equipment_type(
            const std::string& text, bool wearable_only = true) const;
        // Size, handedness and garment type after a material field was removed.
        // Material-bearing names may also be requested to distinguish a finished
        // garment from a homonymous terrain caption (for example pig tail cap).
        std::optional<std::string> translate_equipment_name(
            const std::string& text, bool allow_material = false) const;
        // Furniture type nouns, isolated from material and prose rules.
        std::optional<std::string> translate_furniture_type(const std::string& text) const;
        // Bare cup/mug/goblet types; keep their complete material field separate.
        std::optional<std::string> translate_drinkware_type(const std::string& text) const;
        // Equipment specifications have their own vocabulary, separate from appearance.
        std::optional<std::string> translate_equipment_modifier(const std::string& text) const;
        // Meat organs and preparation modifiers use the reviewed item vocabulary.
        // Modifiers include the trailing space from their source rule.
        std::optional<std::string> translate_meat_term(const std::string& text) const;
        bool is_item_material(const std::string& text) const;
        bool is_material_state(const std::string& text) const;
        // Complete material nouns, isolated from homonymous calendar/name rules.
        std::optional<std::string> translate_material_state(
            const std::string& text, bool adjective = false) const;
        // A complete native material prefix, using the shared plant/species rule.
        std::optional<std::string> translate_material_prefix(const std::string& text) const;
        // Plant-fiber qualifiers only for finished equipment and tools.
        std::optional<std::string> translate_woven_plant_material(const std::string& text) const;
        std::optional<std::string> translate_creature_name(const std::string& text) const;
        // One complete UTF-8 species/caste resolver serves every typed TOML
        // reference, including references embedded in materials and prose.
        void set_creature_name_resolver(
            std::function<std::optional<std::string>(std::string_view)> resolver);
        // Typed captures only: creature_label/name/person/book/topic/form/deity,
        // skill/skill_rating/rated_skill/storage_container/item_material/material_list/native_item_name. The owner
        // must translate the entire UTF-8 capture or return nullopt; a partial
        // translation or an unchanged fallback is not a resolved phrase.
        void set_phrase_resolver(std::function<std::optional<std::string>(
            std::string_view source, std::string_view kind)> resolver);
        // RAW vocabulary only: safe for the shared resolver to query without
        // invoking itself again through the dynamic creature namespaces.
        std::optional<std::string> translate_static_creature_name(const std::string& text) const;
        // Roster abbreviations only: recover one RAW-backed English identity
        // after native right-to-left vowel removal. Never guess clipped tails.
        std::optional<std::string> expand_shortened_creature_name(const std::string& text) const;
        // Complete anatomical names only; never use item/name/prose fallback.
        std::optional<std::string> translate_color(const std::string& text) const;
        // Scoped prose vocabulary; never flattened into global item/name rules.
        std::optional<std::string> translate_appearance_term(
            const std::string& text, const std::string& context) const;
        std::optional<std::string> translate_anatomy(const std::string& text) const;
        // A terrain caption followed by zero or more plant-growth labels.
        // Never treat its comma-separated leaves/fruit as anatomical owners.
        std::optional<std::string> translate_tile_description(const std::string& text) const;

    private:
        // =====================================================================
        // 1. 构造
        // =====================================================================
        RulesetsManager();
        RulesetsManager(const RulesetsManager&) = delete;
        RulesetsManager& operator=(const RulesetsManager&) = delete;
        RulesetsManager(RulesetsManager&&) = delete;
        ~RulesetsManager() = default;

        // =====================================================================
        // 2. 嵌套类型（按依赖从底到顶）
        // =====================================================================

        enum class Type { Literal, Reference };

        struct Token {
            Type type;
            std::string value;
            auto operator<=>(const Token&) const = default;
        };

        using Tokens = std::vector<Token>;

        struct RuleSignature {
            std::string identifier;
            Tokens rule;
            auto operator<=>(const RuleSignature&) const = default;
        };

        struct ResultTree;
        using BindingMap = std::vector<std::pair<std::string, std::shared_ptr<const ResultTree>>>;

        struct ResultTree {
            std::string identifier;
            std::string matched;
            std::string translated;
            std::string remaining;
            BindingMap children;
            // Grammar storage is immutable while memoized trees are alive.
            // Keep token identities, not a second set of translation rules.
            const Tokens* source_tokens = nullptr;
            const Tokens* target_tokens = nullptr;
            bool external_leaf = false;
            // External fields prove their own dynamic text, but do not own
            // literals that an enclosing production can consume. Prefer the
            // complete parse with less text delegated to those fields before
            // comparing grammar depth: otherwise a person can absorb Warm,
            // Damp or Engraving, and a plant name can absorb surface states.
            // Count every external leaf, including opaque material/container
            // resolvers which can themselves contain a personal-name field.
            size_t external_capture_bytes = 0;
            // A validated native item name is a fallback when this text also
            // has a complete material/item/building production. Propagate
            // that semantic role through every enclosing grammar wrapper.
            bool uses_name_fallback = false;

            ResultTree(std::string id, std::string mat,
                    std::string trans, std::string rem,
                    BindingMap kids, const Tokens* input = nullptr,
                    const Tokens* output = nullptr, bool external = false
            ) : identifier(std::move(id)), matched(std::move(mat)),
                translated(std::move(trans)), remaining(std::move(rem)), children(std::move(kids)),
                source_tokens(input), target_tokens(output), external_leaf(external),
                external_capture_bytes(external ? matched.size() : 0),
                uses_name_fallback(identifier == "::text::native_item_name") {
                for (const auto& [_, child] : children) {
                    external_capture_bytes += child->external_capture_bytes;
                    if (child->uses_name_fallback) uses_name_fallback = true;
                }
            }

            ResultTree(const ResultTree&) = default;
            ResultTree(ResultTree&&) = default;
            ResultTree& operator=(const ResultTree&) = delete;
            ResultTree& operator=(ResultTree&&) = delete;

            [[nodiscard]] size_t weight() const {
                size_t w = matched.empty() ? 0 : 1;
                for (const auto& [_, child] : children) w += child->weight();
                return w;
            }

            [[nodiscard]] bool preferred_to(const ResultTree& other) const {
                if (uses_name_fallback != other.uses_name_fallback)
                    return !uses_name_fallback;
                if (external_capture_bytes != other.external_capture_bytes)
                    return external_capture_bytes < other.external_capture_bytes;
                return weight() < other.weight();
            }
        };

        struct TransparentHash {
            using is_transparent = void;
            size_t operator()(std::string_view sv) const noexcept {
                return std::hash<std::string_view>{}(sv);
            }
        };

        struct TransparentEqual {
            using is_transparent = void;
            bool operator()(std::string_view a, std::string_view b) const noexcept {
                return a == b;
            }
        };

        struct Candidate {
            BindingMap results;
            std::string remaining;

            Candidate(BindingMap res, std::string rem
            ) : results(std::move(res)), remaining(std::move(rem)) {}

            Candidate() = default;
            Candidate(const Candidate&) = default;
            Candidate(Candidate&&) = default;
            Candidate& operator=(const Candidate&) = delete;
            Candidate& operator=(Candidate&&) = default;
        };

        struct LruMemoMap {
            using Value = std::vector<std::shared_ptr<const ResultTree>>;
            using List   = std::list<std::pair<std::string, Value>>;
            using Map    = std::unordered_map<std::string, List::iterator,
                                            TransparentHash, TransparentEqual>;

            static constexpr size_t DEFAULT_MAX = 100;

            List lru_list;
            Map cache_map;
            size_t max_entries;

            LruMemoMap(size_t max = DEFAULT_MAX) : max_entries(max) {}

            Value* find(std::string_view text) {
                auto it = cache_map.find(text);
                if (it == cache_map.end()) return nullptr;
                lru_list.splice(lru_list.begin(), lru_list, it->second);
                return &it->second->second;
            }

            void insert(std::string text, Value value) {
                auto it = cache_map.find(text);
                if (it != cache_map.end()) {
                    lru_list.splice(lru_list.begin(), lru_list, it->second);
                    it->second->second = std::move(value);
                    return;
                }
                if (lru_list.size() >= max_entries) {
                    cache_map.erase(lru_list.back().first);
                    lru_list.pop_back();
                }
                lru_list.emplace_front(std::move(text), std::move(value));
                cache_map.emplace(lru_list.front().first, lru_list.begin());
            }

            size_t size() const { return lru_list.size(); }
        };

        using MemoOuterMap = std::unordered_map<
            std::string,
            LruMemoMap,
            TransparentHash,
            TransparentEqual
        >;

        using RuleSet = std::vector<std::pair<Tokens, Tokens>>;
        using RuleSets = std::unordered_map<std::string, RuleSet>;

        struct RulePrefixIndex {
            // Each list retains source-rule order. Merge the matching byte
            // with the unrestricted rules at lookup, without duplicating
            // reference/empty-prefix rules into every possible byte bucket.
            std::unordered_map<unsigned char, std::vector<size_t>> literal_starts;
            std::vector<size_t> unrestricted;
        };

        // =====================================================================
        // 3. 成员变量
        // =====================================================================
        bool initialized = false;
        std::string last_load_error_;
        RuleSets rulesets_;
        std::unordered_map<std::string, RulePrefixIndex> rule_prefix_indexes_;
        // Small closed leaf vocabularies can prove that a later noun is
        // absent before an earlier material/reference expands its branches.
        std::unordered_map<std::string, std::vector<std::string_view>> literal_leaf_rules_;
        mutable MemoOuterMap memo_cache_;
        std::set<RuleSignature> cyclic_rule_signatures_;
        std::unordered_map<std::string, std::string, TransparentHash, TransparentEqual>
            static_creature_names_;
        std::function<std::optional<std::string>(std::string_view)> creature_name_resolver_;
        mutable bool creature_name_resolver_active_ = false;
        std::function<std::optional<std::string>(std::string_view, std::string_view)>
            phrase_resolver_;
        mutable bool phrase_resolver_active_ = false;
        mutable bool material_list_resolver_active_ = false;

        // =====================================================================
        // 4. 函数声明（按调用链：加载 → 翻译 → Token → 工具）
        // =====================================================================

        // TOML 加载
        void parse_dir(const std::filesystem::path& base, const std::filesystem::path& curr, std::optional<std::string>& visited_root);
        void parse_file(const std::filesystem::path& base, const std::filesystem::path& path, std::optional<std::string>& visited_root);
        void validate_references() const;
        void analyze_from_root();
        void rebuild_rule_prefix_indexes();
        void rebuild_static_creature_names();

        // 翻译核心
        std::vector<std::shared_ptr<const ResultTree>> find_translations(const std::string& text, bool partial_match) const;
        std::vector<std::shared_ptr<const ResultTree>> resolve_namespace(const std::string& text, const std::string& identifier, size_t level) const;
        std::vector<std::shared_ptr<const ResultTree>> resolve_replacer(const std::string& text, const std::string& identifier, size_t level) const;
        std::vector<std::shared_ptr<const ResultTree>> resolve_external_prefixes(
            const std::string& text, const std::string& identifier) const;
        static std::string_view external_prefix_kind(std::string_view identifier);
        bool rule_literals_fit(std::string_view text, const Tokens& tokens) const;

        // Token 处理
        Tokens parse_tokens(const std::string& base_ns, const std::string& input) const;
        std::string to_canonical_identifier(const std::string& identifier, const std::string& base_ns) const;
        void validate_identifier_format(const std::string& identifier) const;

        // 工具
        static bool ci_char_equal(unsigned char a, unsigned char b);
        static bool matches_literal(std::string_view input, std::string_view pattern);
        static bool is_placeholder(std::string_view identifier);
        static bool is_builtin(std::string_view identifier);
        static std::optional<size_t> find_literal_position(std::string_view text, std::string_view literal);
        static std::string build_translated(const Tokens& trans_tokens, const BindingMap& bindings,
                                           std::vector<size_t>* origins = nullptr);
        static bool translation_origins(const ResultTree& tree, std::vector<size_t>& origins);
        static void normalize_translation(std::string& translated, std::vector<size_t>* origins = nullptr);
        static void print_translation_path(const ResultTree& node, int indent = 0);
        static const std::regex& token_split_regex() {
            static const std::regex re(R"(\{([^\{\}]+)\})");
            return re;
        }
        static const std::regex& consecutive_colons_regex() {
            static const std::regex re(":+");
            return re;
        }
    };

    #define RULESETS DFHack::DFZH::Hooks::RulesetsManager::getInstance()

} // namespace Hooks
} // namespace DFZH
} // namespace DFHack
