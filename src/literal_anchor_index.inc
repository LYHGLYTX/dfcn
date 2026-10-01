// Necessary-literal indexing is shared by ordinary templates and complete UI
// messages. Callers supply their grammar's literal representation (UI prose
// ignores native whitespace); this index does not resolve or rank captures.
class LiteralAnchorIndex {
    struct Node {
        std::unordered_map<unsigned char, int> next;
        std::vector<int> rules;
    };
    std::vector<Node> nodes_{1};
    std::vector<int> unanchored_;
public:
    void clear() {
        nodes_.clear();
        nodes_.emplace_back();
        unanchored_.clear();
    }

    void add(std::string_view anchor, int index) {
        if (anchor.empty()) {
            unanchored_.push_back(index);
            return;
        }
        int node = 0;
        for (unsigned char raw : anchor) {
            const unsigned char ch = fold_ascii(raw);
            const auto found = nodes_[node].next.find(ch);
            if (found != nodes_[node].next.end()) {
                node = found->second;
            } else {
                const int next = static_cast<int>(nodes_.size());
                nodes_[node].next.emplace(ch, next);
                nodes_.emplace_back();
                node = next;
            }
        }
        nodes_[node].rules.push_back(index);
    }

    std::vector<int> candidates(std::string_view source) const {
        std::vector<int> result = unanchored_;
        for (size_t start = 0; start < source.size(); ++start) {
            int node = 0;
            for (size_t at = start; at < source.size(); ++at) {
                const auto found = nodes_[node].next.find(
                    fold_ascii(static_cast<unsigned char>(source[at])));
                if (found == nodes_[node].next.end()) break;
                node = found->second;
                const auto &rules = nodes_[node].rules;
                result.insert(result.end(), rules.begin(), rules.end());
            }
        }
        // Preserve the caller's original catalogue order and keep repeated
        // occurrences from running the same typed matcher multiple times.
        std::sort(result.begin(), result.end());
        result.erase(std::unique(result.begin(), result.end()), result.end());
        return result;
    }
};
