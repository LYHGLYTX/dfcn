#pragma once

#include <cstddef>
#include <cstdint>

#if defined(_WIN32)
#define DFCN_EXPORT extern "C" __declspec(dllexport)
#else
#define DFCN_EXPORT extern "C" __attribute__((visibility("default")))
#endif

// The resident loader never owns a C++ object allocated by the core.
// Increment the ABI when changing this layout or the capture-state encoding.
// All callbacks run with DF's simulation paused, on its SDL/render thread.
constexpr std::uint32_t DFCN_CORE_ABI = 4;
using DfcnStateSink = bool (*)(void *, const void *, std::size_t);

struct DfcnCoreApi {
    std::uint32_t abi;
    std::uint32_t size;
    const char *build;
    bool (*initialize)();
    // false means a hook still references this module: NEVER unload it.
    bool (*shutdown)();
    bool (*enabled)();
    void (*set_enabled)(bool);
    void (*reload_dictionary)();
    bool (*event)(void *);
    bool (*save_state)(DfcnStateSink, void *);
    bool (*restore_state)(const void *, std::size_t);
};

using DfcnGetCoreApi = const DfcnCoreApi *(*)(std::uint32_t);

// Read from the published image before unloading the current core.
// This descriptor must remain a fixed, pointer-free pair of 32-bit fields.
struct DfcnCoreDescriptor {
    std::uint32_t abi;
    std::uint32_t api_size;
};
