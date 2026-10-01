#pragma once

#include <chrono>
#include <cstddef>
#include <string>
#include <string_view>

namespace dfcn {

// A native draw cannot wait for every possible interpretation of generated
// prose. Share one budget through the event parser, typed names and TOML
// callbacks; a nested parser must not restart the clock or swallow exhaustion.
struct TranslationWorkLimit {
    const char *reason;
    std::string stage;
    std::string input;
    std::size_t steps;
    std::size_t depth;
};

struct TranslationWorkState {
    std::chrono::steady_clock::time_point deadline;
    std::size_t steps = 0;
    std::size_t depth = 0;
    std::string_view stage = "historical paragraph";
    std::string_view input = {};
};

// Only a trivial TLS pointer: retaining a nontrivial TLS object would pin the
// reloadable core. The active scope owns this state on its ordinary stack.
inline thread_local TranslationWorkState *active_translation_work = nullptr;

[[noreturn]] inline void translation_work_exhausted(
        const TranslationWorkState &state, const char *reason) {
    // Copy only on exhaustion: the source view may belong to a stack frame
    // that is gone by the time the paragraph reports the failure.
    throw TranslationWorkLimit{reason, std::string(state.stage),
        std::string(state.input.substr(0, 256)), state.steps, state.depth};
}

inline void translation_work_step() {
    auto *state = active_translation_work;
    if (!state) return;
    if (std::chrono::steady_clock::now() >= state->deadline)
        translation_work_exhausted(*state, "deadline");
    // Cheap rejected literals are work checkpoints too. Counting them is
    // useful for diagnosis, but their number does not measure frame latency.
    // A large reviewed dictionary must not reject a normal event while it
    // still fits within the same elapsed-time allowance.
    ++state->steps;
}

class TranslationWorkScope {
    TranslationWorkState state_{std::chrono::steady_clock::now() +
        std::chrono::milliseconds(50)};
    TranslationWorkState *previous_ = active_translation_work;
public:
    TranslationWorkScope() {
        if (!previous_) active_translation_work = &state_;
    }
    ~TranslationWorkScope() { active_translation_work = previous_; }
    TranslationWorkScope(const TranslationWorkScope &) = delete;
    TranslationWorkScope &operator=(const TranslationWorkScope &) = delete;
    bool owns_budget() const { return !previous_; }
};

class TranslationWorkFrame {
    TranslationWorkState *state_ = active_translation_work;
    std::string_view previous_stage_;
    std::string_view previous_input_;
public:
    TranslationWorkFrame(std::string_view stage = {}, std::string_view input = {}) {
        if (state_) {
            previous_stage_ = state_->stage;
            previous_input_ = state_->input;
            if (!stage.empty()) {
                state_->stage = stage;
                state_->input = input;
            }
        }
        translation_work_step();
        if (state_ && state_->depth >= 128)
            translation_work_exhausted(*state_, "depth");
        if (state_) ++state_->depth;
    }
    ~TranslationWorkFrame() {
        if (state_) {
            --state_->depth;
            state_->stage = previous_stage_;
            state_->input = previous_input_;
        }
    }
    TranslationWorkFrame(const TranslationWorkFrame &) = delete;
    TranslationWorkFrame &operator=(const TranslationWorkFrame &) = delete;
};

} // namespace dfcn
