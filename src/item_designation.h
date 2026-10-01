#pragma once

#include <cctype>
#include <set>
#include <string>
#include <string_view>
#include <utility>
#include <vector>

namespace dfcn {

struct ItemDesignationMarker {
    std::string_view left;
    std::string_view right;
    std::string_view display_left;
    std::string_view display_right;
};

// One vocabulary for native CP437 captures and decoded UTF-8, shared by
// complete item captions and the compositional grammar. Keep the original
// quality glyph: the native superior-quality mark is ≡ (CP437 0xF0), not =.
// Wear-marker case is significant; XX must be considered before X.
inline constexpr ItemDesignationMarker item_designation_markers[] = {
    {"$", "$", "$", "$"}, {"‼", "‼", "‼", "‼"},
    {"\x13", "\x13", "‼", "‼"},
    {"XX", "XX", "XX", "XX"}, {"X", "X", "X", "X"},
    {"x", "x", "x", "x"}, {"(", ")", "(", ")"},
    {"{", "}", "{", "}"}, {"-", "-", "-", "-"},
    {"+", "+", "+", "+"}, {"*", "*", "*", "*"},
    {"=", "=", "=", "="}, {"≡", "≡", "≡", "≡"},
    {"\xF0", "\xF0", "≡", "≡"}, {"☼", "☼", "☼", "☼"},
    {"\x0f", "\x0f", "☼", "☼"}, {"<", ">", "<", ">"},
    {"«", "»", "«", "»"}, {"\xAE", "\xAF", "«", "»"},
    {"◄", "►", "◄", "►"}, {"\x11", "\x10", "◄", "►"},
};

// Convert only a proved wrapper span, never the translated noun it surrounds.
// Expanded UTF-8 glyph bytes all inherit their one native source byte; an
// already-UTF-8 wrapper retains its original byte origins and nesting order.
inline std::string display_item_designation_wrapper(std::string_view source,
        bool suffix, std::vector<size_t> *origins = nullptr) {
    if (origins) origins->clear();
    std::string result;
    for (size_t at = 0; at < source.size();) {
        bool converted = false;
        for (const auto &marker : item_designation_markers) {
            const auto native = suffix ? marker.right : marker.left;
            if (!source.substr(at).starts_with(native)) continue;
            const auto display = suffix ? marker.display_right : marker.display_left;
            result += display;
            if (origins)
                for (size_t byte = 0; byte < display.size(); ++byte)
                    origins->push_back(at + (native == display ? byte : 0));
            at += native.size();
            converted = true;
            break;
        }
        if (!converted) {
            result.push_back(source[at]);
            if (origins) origins->push_back(at);
            ++at;
        }
    }
    return result;
}

struct ItemDesignationText {
    std::string_view item;
    std::string prefix;
    std::string suffix;
};

inline ItemDesignationText split_item_designation(std::string_view source) {
    const auto trim = [](std::string_view value) {
        // CP437 0x0b/0x0c are visible caste-sex glyphs. Unwrapping an
        // owned fish must preserve them at the new inner-name boundary.
        const auto padding = [](unsigned char ch) {
            return ch == ' ' || ch == '\t' || ch == '\r' || ch == '\n';
        };
        while (!value.empty() && padding(static_cast<unsigned char>(value.front())))
            value.remove_prefix(1);
        while (!value.empty() && padding(static_cast<unsigned char>(value.back())))
            value.remove_suffix(1);
        return value;
    };
    ItemDesignationText result{trim(source), {}, {}};
    for (;;) {
        bool stripped = false;
        for (const auto &marker : item_designation_markers) {
            if (result.item.size() <= marker.left.size() + marker.right.size() ||
                !result.item.starts_with(marker.left) ||
                !result.item.ends_with(marker.right)) continue;
            result.item = trim(result.item.substr(marker.left.size(),
                result.item.size() - marker.left.size() - marker.right.size()));
            result.prefix += marker.display_left;
            result.suffix = std::string(marker.display_right) + result.suffix;
            stripped = true;
            break;
        }
        if (!stripped) return result;
    }
}

// A grammar capture can be followed by a quantity or more prose. Enumerate
// possible closing positions, then use the same complete-item parser above.
// Return original byte spans rather than display glyphs: the grammar needs
// exact source lengths to consume the suffix and retain its color origins.
inline std::set<std::pair<std::string, std::string>>
match_item_designation_prefixes(std::string_view source) {
    std::set<size_t> ends;
    for (const auto &marker : item_designation_markers) {
        if (!source.starts_with(marker.left)) continue;
        for (size_t at = source.find(marker.right, marker.left.size() + 1);
             at != std::string_view::npos; at = source.find(marker.right, at + 1)) {
            ends.insert(at + marker.right.size());
        }
    }
    std::set<std::pair<std::string, std::string>> results;
    for (size_t end : ends) {
        const auto candidate = source.substr(0, end);
        const auto designation = split_item_designation(candidate);
        if (designation.prefix.empty() || designation.item.empty()) continue;
        const size_t prefix_size = static_cast<size_t>(
            designation.item.data() - candidate.data());
        results.emplace(candidate.substr(0, prefix_size),
            candidate.substr(prefix_size + designation.item.size()));
    }
    if (results.empty()) results.emplace("", "");
    return results;
}

} // namespace dfcn
