#pragma once

#include <memory>
#include <string_view>

namespace DFHack::DFZH::Hooks {

// dfzh uses spdlog for detailed rule-graph diagnostics. DFCN keeps its own
// compact runtime log, so this source-compatible adapter intentionally drops
// the very verbose per-namespace analysis messages.
class NullRuleLogger {
public:
    template <typename... Args> void debug(std::string_view, Args &&...) {}
    template <typename... Args> void info(std::string_view, Args &&...) {}
    template <typename... Args> void warn(std::string_view, Args &&...) {}
    template <typename... Args> void error(std::string_view, Args &&...) {}
};

class RuleLoggerManager {
public:
    static RuleLoggerManager &getInstance() {
        static RuleLoggerManager value;
        return value;
    }
    NullRuleLogger *getLogger() { return &logger_; }
    NullRuleLogger *getUntransLogger() { return &logger_; }

private:
    NullRuleLogger logger_;
};

#define LOGGERMANAGER DFHack::DFZH::Hooks::RuleLoggerManager::getInstance()

} // namespace DFHack::DFZH::Hooks

