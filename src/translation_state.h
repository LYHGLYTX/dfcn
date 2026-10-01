#pragma once

#include <atomic>
#include <chrono>
#include <cstdint>
#include <functional>
#include <mutex>
#include <source_location>
#include <thread>

namespace dfcn {

// Native input/paragraph callbacks and SDL rendering share the same mutable
// dictionaries, composed-name caches and TOML memoization. Serialize complete
// translation operations, including cache invalidation. Recursive ownership
// lets TOML resolvers call back into the overlay without changing lock order.
// Acquire this before any native capture/snapshot mutex, never while waiting
// for the game to process input or render another frame.
inline std::recursive_mutex translation_state_mutex;

struct TranslationStateLocation {
    const char *file_name = "";
    const char *function_name = "";
    std::uint_least32_t line = 0;
};

struct TranslationStateTiming {
    TranslationStateLocation location;
    TranslationStateLocation owner_at_wait_location;
    std::uint64_t thread_id = 0;
    std::uint64_t owner_at_wait_thread_id = 0;
    double wait_ms = 0;
    double hold_ms = 0;
};

using TranslationStateObserver = void (*)(const TranslationStateTiming &);
inline std::atomic_bool translation_state_trace_enabled{false};
inline std::atomic<TranslationStateObserver> translation_state_observer{nullptr};

inline std::uint64_t translation_state_thread_id() noexcept {
    // A stable process-local identifier; zero is reserved for no known owner.
    static thread_local const auto id = [] {
        const auto value = static_cast<std::uint64_t>(
            std::hash<std::thread::id>{}(std::this_thread::get_id()));
        return value ? value : std::uint64_t{1};
    }();
    return id;
}

namespace translation_state_detail {
inline thread_local unsigned depth = 0;
inline thread_local bool notifying = false;

// Waiters cannot acquire the mutex to inspect its owner. Every shared field
// is atomic, and the sequence protects a coherent snapshot of the location.
// The pointed-to strings come from source_location and have static storage.
inline std::atomic<std::uint64_t> owner_sequence{0};
inline std::atomic<std::uint64_t> owner_thread{0};
inline std::atomic<const char *> owner_file{""};
inline std::atomic<const char *> owner_function{""};
inline std::atomic<std::uint_least32_t> owner_line{0};

inline void publish_owner(const TranslationStateTiming &timing) noexcept {
    owner_sequence.fetch_add(1, std::memory_order_acq_rel);
    owner_file.store(timing.location.file_name, std::memory_order_relaxed);
    owner_function.store(timing.location.function_name, std::memory_order_relaxed);
    owner_line.store(timing.location.line, std::memory_order_relaxed);
    owner_thread.store(timing.thread_id, std::memory_order_relaxed);
    owner_sequence.fetch_add(1, std::memory_order_release);
}

inline void clear_owner() noexcept {
    owner_sequence.fetch_add(1, std::memory_order_acq_rel);
    owner_thread.store(0, std::memory_order_relaxed);
    owner_sequence.fetch_add(1, std::memory_order_release);
}

inline void sample_owner(TranslationStateTiming &timing) noexcept {
    // Never spin while the owner is updating or has been descheduled. Missing
    // this optional attribution is preferable to adding another lock wait.
    for (unsigned attempt = 0; attempt < 2; ++attempt) {
        const auto sequence = owner_sequence.load(std::memory_order_acquire);
        if (sequence & 1) continue;
        const auto thread = owner_thread.load(std::memory_order_relaxed);
        const TranslationStateLocation location{
            owner_file.load(std::memory_order_relaxed),
            owner_function.load(std::memory_order_relaxed),
            owner_line.load(std::memory_order_relaxed),
        };
        std::atomic_thread_fence(std::memory_order_acquire);
        if (owner_sequence.load(std::memory_order_relaxed) != sequence) continue;
        timing.owner_at_wait_thread_id = thread;
        if (thread) timing.owner_at_wait_location = location;
        return;
    }
}
} // namespace translation_state_detail

class TranslationStateScope {
    using Clock = std::chrono::steady_clock;
    std::unique_lock<std::recursive_mutex> lock_{
        translation_state_mutex, std::defer_lock};
    bool tracing_ = false;
    Clock::time_point acquired_{};
    TranslationStateTiming timing_;
public:
    explicit TranslationStateScope(
            const std::source_location caller = std::source_location::current()) {
        tracing_ = translation_state_detail::depth == 0 &&
            translation_state_trace_enabled.load(std::memory_order_relaxed) &&
            !translation_state_detail::notifying;
        Clock::time_point started{};
        if (tracing_) {
            timing_.location = {caller.file_name(), caller.function_name(), caller.line()};
            timing_.thread_id = translation_state_thread_id();
            translation_state_detail::sample_owner(timing_);
            started = Clock::now();
        }
        lock_.lock();
        ++translation_state_detail::depth;
        if (tracing_) {
            acquired_ = Clock::now();
            timing_.wait_ms = std::chrono::duration<double, std::milli>(
                acquired_ - started).count();
            translation_state_detail::publish_owner(timing_);
        }
    }
    ~TranslationStateScope() noexcept {
        if (tracing_) {
            timing_.hold_ms = std::chrono::duration<double, std::milli>(
                Clock::now() - acquired_).count();
            translation_state_detail::clear_owner();
        }
        --translation_state_detail::depth;
        // Diagnostics must never lengthen the translation critical section.
        lock_.unlock();
        if (!tracing_ || (timing_.wait_ms < 500.0 && timing_.hold_ms < 500.0)) return;
        const auto observer = translation_state_observer.load(std::memory_order_acquire);
        if (!observer) return;
        // The observer may itself enter translation code. Suppress diagnostics
        // for that call tree, and never allow logging failures to escape RAII.
        translation_state_detail::notifying = true;
        try {
            observer(timing_);
        } catch (...) {
        }
        translation_state_detail::notifying = false;
    }
    TranslationStateScope(const TranslationStateScope &) = delete;
    TranslationStateScope &operator=(const TranslationStateScope &) = delete;
};

} // namespace dfcn
