#pragma once

#include <filesystem>
#include <iterator>
#include <string>
#include <string_view>

#if defined(_WIN32)
#ifndef NOMINMAX
#define NOMINMAX
#endif
#include <windows.h>
#include <vector>
#endif

namespace dfcn::runtime {

namespace detail {

// This address belongs to the DLL including this header. The resident loader
// and the reloadable core each locate their own installed runtime directory.
inline void module_anchor() {}

inline std::filesystem::path find_directory() {
#if defined(_WIN32)
    HMODULE module = nullptr;
    if (GetModuleHandleExW(GET_MODULE_HANDLE_EX_FLAG_FROM_ADDRESS |
                          GET_MODULE_HANDLE_EX_FLAG_UNCHANGED_REFCOUNT,
                          reinterpret_cast<LPCWSTR>(&module_anchor), &module)) {
        std::vector<wchar_t> filename(32768);
        const DWORD length = GetModuleFileNameW(
            module, filename.data(), static_cast<DWORD>(filename.size()));
        if (length && length < filename.size()) {
            const auto directory = std::filesystem::path(
                std::wstring(filename.data(), length)).parent_path();
            std::error_code error;
            if (std::filesystem::is_directory(directory / "data/runtime", error))
                return directory;
            return directory / "dfcn";
        }
    }
#endif
    // Linux cores are mapped through memfd, so their loader pathname cannot
    // locate resources. Retain the game's established working-directory layout.
    return std::filesystem::current_path() / "dfcn";
}

} // namespace detail

inline std::filesystem::path directory() {
    static const std::filesystem::path installed = detail::find_directory();
    return installed;
}

inline std::filesystem::path path(std::string_view relative) {
    return directory() / std::filesystem::u8path(relative.begin(), relative.end());
}

inline std::filesystem::path data_path() {
    return path("data/runtime");
}

inline std::filesystem::path config_path() {
    return path("data/runtime/config.ini");
}

inline std::filesystem::path resolve_path(std::string_view configured) {
    auto configured_path = std::filesystem::u8path(configured.begin(), configured.end());
    if (configured_path.is_absolute())
        return configured_path;
    const auto first = configured_path.begin();
    if (first != configured_path.end() && *first == "dfcn") {
        std::filesystem::path relative;
        for (auto component = std::next(first); component != configured_path.end(); ++component)
            relative /= *component;
        return directory() / relative;
    }
    // User-selected relative paths still refer to the game directory. Only the
    // historical packaged dfcn/... prefix is relocated to the module directory.
    return configured_path;
}

inline std::string utf8(const std::filesystem::path &value) {
    const auto bytes = value.u8string();
    return std::string(reinterpret_cast<const char *>(bytes.data()), bytes.size());
}

} // namespace dfcn::runtime
