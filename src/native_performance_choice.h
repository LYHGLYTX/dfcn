#pragma once

#include <cstdint>
#include <optional>
#include <string>

namespace dfcn {

struct NativePerformanceChoice {
    int32_t type = -1, id = -1;
    bool unnamed = false;
    std::string species;

    bool operator==(const NativePerformanceChoice &) const = default;
};

// Accept the actual print_name or list_name field borrowed by the native
// renderer/search filter. Equal visible text does not establish ownership.
static std::optional<NativePerformanceChoice> capture_native_performance_choice(
    uintptr_t caption_address);

} // namespace dfcn
