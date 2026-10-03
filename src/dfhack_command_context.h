#pragma once
#include <cstdint>

// A separate optional resident-loader interface; DfcnCoreApi is unchanged.
// A non-null request selects only this thread's innermost local Console
// runCommand. A null request returns its leaf, or invocation==0 outside a
// command, together with a process-unique resident thread identity. Native name
// and vector are borrowed for the synchronous caller only: never retain
// them, call through them, or destroy them with the reloadable core's STL.
constexpr uint32_t DFCN_DFHACK_COMMAND_CONTEXT_VERSION = 1;
constexpr uint32_t DFCN_DFHACK_COMMAND_LOCAL_CONSOLE = 1;
struct DfcnDfhackCommandContextV1 {
    uint32_t size;
    uint32_t version;
    uint32_t flags;
    uint32_t thread_identity;
    uint64_t invocation;
    void *out;
    const void *name;
    const void *arguments;
};
using DfcnQueryDfhackCommandContextV1 = int (*)(
    void *requested_console, DfcnDfhackCommandContextV1 *result) noexcept;

// V2 is a separate optional export and POD. V1's size, version and query
// contract remain unchanged. A failed query means unavailable, not that the
// calling thread is outside a command. Name/arguments retain V1's synchronous
// borrowed lifetime; entry_epoch contains no native or Lua object ownership.
constexpr uint32_t DFCN_DFHACK_COMMAND_CONTEXT_VERSION_V2 = 2;
struct DfcnDfhackCommandContextV2 {
    uint32_t size;
    uint32_t version;
    uint32_t flags;
    uint32_t thread_identity;
    uint64_t invocation;
    void *out;
    const void *name;
    const void *arguments;
    // The most recent command callback entry on this resident thread,
    // including completed commands and entries suppressed by the switch.
    // Zero precedes the first entry. Parent-frame restoration never rewinds it.
    uint64_t entry_epoch;
};
using DfcnQueryDfhackCommandContextV2 = int (*)(
    void *requested_console, DfcnDfhackCommandContextV2 *result) noexcept;
