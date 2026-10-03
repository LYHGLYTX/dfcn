#pragma once

#include <functional>
#include <optional>
#include <string>
#include <string_view>

namespace dfcn {

using ItemMaterialRuleLookup = std::function<std::optional<std::string>(
    std::string_view source, std::string_view context)>;

// A complete UTF-8 material field. The caller supplies its own grammar;
// formatting reads only immutable material metadata and those scoped rules.
std::string finish_item_material_qualifier(std::string_view source,
    std::string target, const ItemMaterialRuleLookup &lookup);

} // namespace dfcn
