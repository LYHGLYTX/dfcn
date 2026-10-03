#include "core_api.h"
#include "core_module.h"
#include "runtime_paths.h"
#include "dfhack_toggle.h"
#include <SDL2/SDL.h>
#include <cstdio>
#include <ctime>
#include <memory>
#include <string>
#include <vector>

namespace {

static void log(const char *level, const std::string &message) {
    const auto filename = dfcn::runtime::path("dfcn.log");
#if defined(_WIN32)
    FILE *out = _wfopen(filename.c_str(), L"a");
#else
    FILE *out = std::fopen(dfcn::runtime::utf8(filename).c_str(), "a");
#endif
    if (!out) return;
    const std::time_t now = std::time(nullptr);
    std::tm tm{};
    dfcn::module::local_time(tm, now);
    char stamp[32]{};
    std::strftime(stamp, sizeof(stamp), "%Y-%m-%d %H:%M:%S", &tm);
    std::fprintf(out, "%s [%s] [loader] %s\n", stamp, level, message.c_str());
    std::fclose(out);
}

struct CoreImage {
    std::unique_ptr<dfcn::module::CoreModule> module;
    const DfcnCoreApi *api = nullptr;
    bool detached = true;
    bool ready = false;

    ~CoreImage() {
        // Even exceptional cleanup must keep any live callback mapped.
        if (module && !detached) module->keep_resident();
    }
};

// Explicit lifetime: a failed hook removal keeps exactly this active image
// resident until its callbacks can be safely detached.
CoreImage *core = nullptr;
bool initialized = false;
bool f10_consumed = false;
dfcn::dfhack::Toggle dfhack_toggle;
std::uint64_t generation = 0;
// Keep source data across failed initialization / partial hook-removal retries.
// Cleared as soon as a new core takes ownership; never stores executable code.
std::vector<unsigned char> pending_captures;

static void loader_anchor() {}

static bool bind_api(CoreImage &image) {
    if (!image.module) return false;
    const auto get_api = reinterpret_cast<DfcnGetCoreApi>(image.module->symbol("dfcn_get_core_api"));
    image.api = get_api ? get_api(DFCN_CORE_ABI) : nullptr;
    const auto *api = image.api;
    if (!api || api->abi != DFCN_CORE_ABI || api->size != sizeof(DfcnCoreApi) ||
        !api->build || !api->initialize || !api->shutdown || !api->enabled ||
        !api->set_enabled || !api->reload_dictionary || !api->event ||
        !api->save_state || !api->restore_state) {
        log("ERROR", "Core ABI is incompatible with the resident loader");
        return false;
    }
    return true;
}

static bool capture_state(void *context, const void *data, std::size_t size) {
    auto &bytes = *static_cast<std::vector<unsigned char> *>(context);
    const auto *begin = static_cast<const unsigned char *>(data);
    bytes.assign(begin, begin + size);
    return true;
}

static bool stop_core() {
    if (!core) return true;
    core->ready = false;
    if (!core->api->shutdown()) {
        log("ERROR", "Reload deferred: existing hooks still reference the current core");
        return false;
    }
    core->detached = true;
    if (!core->module->close()) return false;
    delete core;
    core = nullptr;
    return true;
}

static bool load_core(bool enable) {
    // Validate the new library and transfer only data before dismantling the
    // current hooks. Neither a partial build nor an ABI mismatch disables
    // the resident keyboard handler; the next Shift+F10 can always retry.
    auto prepared = dfcn::module::PreparedCore::prepare(
        dfcn::module::library_path(reinterpret_cast<void *>(&loader_anchor)), log);
    if (!prepared) return false;
    auto next = std::make_unique<CoreImage>();
    if (prepared->has_image()) {
        next->module = prepared->acquire();
        if (!bind_api(*next)) return false;
    }
    if (core && (core->ready || pending_captures.empty())) {
        std::vector<unsigned char> captures;
        if (!core->api->save_state(capture_state, &captures)) {
            log("ERROR", "Reload cancelled: native page text could not be transferred");
            return false;
        }
        pending_captures = std::move(captures);
    }
    if (!next->module) {
        // An exclusive image needs the current module reference released first.
        if (!stop_core()) return false;
        next->module = prepared->acquire();
        if (!bind_api(*next)) return false;
    }
    if (!pending_captures.empty() &&
        !next->api->restore_state(pending_captures.data(), pending_captures.size())) {
        log("ERROR", "Reload cancelled: native page text could not be restored");
        return false;
    }
    if (!stop_core()) return false;
    core = next.release();
    core->detached = false;
    if (!core->api->initialize()) {
        log("ERROR", "New core initialization failed; Shift+F10 will retry the deployed library");
        core->api->set_enabled(false);
        stop_core();
        return false;
    }
    core->ready = true;
    if (enable) core->api->set_enabled(true);
    std::vector<unsigned char>().swap(pending_captures);
    ++generation;
    log("INFO", "Core " + std::string(enable ? "hot-reloaded" : "loaded") +
        "; generation=" + std::to_string(generation) + "; build=" + core->api->build);
    return true;
}

} // namespace

// Optional read-only command context lives independently of DfcnCoreApi.
// It touches only the resident loader's calling-thread POD frame, never the
// current core image, native strings, render state or game synchronization.
DFCN_EXPORT int dfcn_get_dfhack_command_context_v1(void *requested_console,
        DfcnDfhackCommandContextV1 *result) noexcept {
    return dfcn::dfhack::Toggle::query_command_context(requested_console, result);
}

DFCN_EXPORT int dfcn_get_dfhack_command_context_v2(void *requested_console,
        DfcnDfhackCommandContextV2 *result) noexcept {
    return dfcn::dfhack::Toggle::query_command_context_v2(requested_console, result);
}

DFCN_EXPORT void dfhooks_init() {
    if (initialized) return;
    if (!dfcn::module::acquire_guard(log)) return;
    initialized = true;
    try {
        log("INFO", "Resident hot-reload loader initialized");
        dfhack_toggle.initialize(log);
        load_core(false);
    } catch (...) {
        log("ERROR", "Core load failed; Shift+F10 remains available to retry");
    }
}

DFCN_EXPORT void dfhooks_shutdown() {
    if (!initialized) return;
    initialized = false;
    f10_consumed = false;
    try {
        dfhack_toggle.shutdown();
        stop_core();
    } catch (...) {
        log("ERROR", "Core shutdown failed; retaining its active mapping");
    }
    if (!core) dfcn::module::release_guard();
}

// These callbacks are intentionally inert.
// In particular hooks_update can run on DF's simulation thread. Do not read
// or dispatch core pointers here without adding a quiescence protocol.
DFCN_EXPORT void dfhooks_update() {}
DFCN_EXPORT void dfhooks_prerender() {}
DFCN_EXPORT bool dfhooks_ncurses_key(int) { return false; }
DFCN_EXPORT void dfhooks_sdl_loop() {}

DFCN_EXPORT bool dfhooks_sdl_event(void *raw_event) {
    if (!initialized || !raw_event) return false;
    if (dfhack_toggle.event(raw_event)) return true;
    const auto &event = *static_cast<const SDL_Event *>(raw_event);
    if (event.type == SDL_WINDOWEVENT && event.window.event == SDL_WINDOWEVENT_FOCUS_LOST)
        f10_consumed = false;
    if (event.type == SDL_KEYUP && event.key.keysym.sym == SDLK_F10 && f10_consumed) {
        f10_consumed = false;
        return true;
    }
    if (event.type == SDL_KEYDOWN && event.key.keysym.sym == SDLK_F10) {
        if (f10_consumed) return true;
        const auto mods = static_cast<SDL_Keymod>(event.key.keysym.mod);
        if ((mods & KMOD_SHIFT) && !(mods & (KMOD_ALT | KMOD_GUI))) {
            f10_consumed = true;
            if (!event.key.repeat) {
                try {
                    if (mods & KMOD_CTRL) {
                        if (core && core->ready) core->api->reload_dictionary();
                    } else if (core && core->ready && core->api->enabled()) {
                        core->api->set_enabled(false);
                    } else {
                        // enablerst::eventLoop_SDL pauses the simulation BEFORE
                        // hooks_sdl_event and is itself the SDL render thread.
                        // No core render/capture callback is on either stack.
                        // Never unload from sdl_loop (simulation resumed).
                        load_core(true);
                    }
                } catch (...) {
                    log("ERROR", "Hotkey operation failed; retry Shift+F10 after updating the core");
                }
            }
            return true;
        }
    }
    try {
        return core && core->ready ? core->api->event(raw_event) : false;
    } catch (...) {
        log("ERROR", "Core event handler threw an exception");
        return false;
    }
}
