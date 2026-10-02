#pragma once

#include <cstddef>
#include <cstdint>
#include <optional>
#include <string>

namespace dfcn {

// One actual unit-name append inside the native movement caption constructor.
// Offsets refer to the original caption bytes, before decoding or translation.
// Unit boundaries come from 0x8415ef/0x841609, even when several units occupy
// the tile and the game concatenates their names without a separator.
struct NativeAdventureChargePart {
    size_t offset = 0, length = 0;
    std::string source;
    uintptr_t unit = 0;
    // Bound while the formatter still owns its temporary output. Equal
    // spellings from different units need not share one translated identity.
    std::optional<std::string> target;
};

} // namespace dfcn
