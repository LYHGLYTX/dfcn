#pragma once

#include <memory>
#include <mutex>
#include <vector>

namespace dfcn {

// Nontrivial thread_local destructors can retain the core until the game
// threads exit: MinGW holds a DLL reference, and ELF defers DSO unloading.
// Own their objects in the module instead, and keep only a
// trivial pointer in TLS. The loader unloads only at DF's paused SDL event
// boundary; no thread can access these objects while the registry is freed.
// Each Tag gives otherwise identical types independent thread-local slots.
template <typename T, typename Tag>
T &reloadable_thread_state() {
    static std::mutex mutex;
    static std::vector<std::unique_ptr<T>> objects;
    static thread_local T *local = nullptr;
    if (!local) {
        auto object = std::make_unique<T>();
        std::lock_guard<std::mutex> lock(mutex);
        objects.push_back(std::move(object));
        local = objects.back().get();
    }
    return *local;
}

} // namespace dfcn
