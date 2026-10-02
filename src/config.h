#pragma once

#include <filesystem>
#include "runtime_paths.h"

namespace DFHack::DFZH::Hooks {

// Runtime modules use the rules shipped beside their own DLL. Linux's
// established project-directory fallback remains available to data callers.
struct Config {
    static std::filesystem::path getDataPath() {
        const auto installed = dfcn::runtime::data_path();
#if defined(_WIN32)
        return installed;
#else
        if (std::filesystem::is_directory(installed / "rulesets/zh-Hans"))
            return installed;
        return "data/runtime";
#endif
    }
};

} // namespace DFHack::DFZH::Hooks
