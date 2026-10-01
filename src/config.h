#pragma once

#include <filesystem>

namespace DFHack::DFZH::Hooks {

// The standalone DFCN rule engine reads data/runtime/rulesets/zh-Hans,
// whether the current directory is the game or the project.
struct Config {
    static std::filesystem::path getDataPath() {
        const std::filesystem::path from_game_root = "dfcn/data/runtime";
        if (std::filesystem::is_directory(from_game_root / "rulesets/zh-Hans"))
            return from_game_root;
        return "data/runtime";
    }
};

} // namespace DFHack::DFZH::Hooks
