#pragma once

#include "core_api.h"
#include "native_process_guard.h"
#include <array>
#include <cerrno>
#include <cstring>
#include <ctime>
#include <filesystem>
#include <memory>
#include <string>
#include <utility>
#include <vector>

#if defined(_WIN32)
#ifndef NOMINMAX
#define NOMINMAX
#endif
#include <windows.h>
#else
#include <dlfcn.h>
#include <fcntl.h>
#include <link.h>
#include <sys/mman.h>
#include <sys/stat.h>
#include <unistd.h>
#endif

namespace dfcn::module {

using Report = void (*)(const char *, const std::string &);

namespace native {

#if defined(_WIN32)

#include "core_image_format.h"

inline void local_time(std::tm &result, const std::time_t &now) {
    localtime_s(&result, &now);
}

inline constexpr const char *library_name = "dfcn_core.dll";

inline std::filesystem::path resident_path(void *anchor) {
    HMODULE module = nullptr;
    if (!GetModuleHandleExW(GET_MODULE_HANDLE_EX_FLAG_FROM_ADDRESS |
                           GET_MODULE_HANDLE_EX_FLAG_UNCHANGED_REFCOUNT,
                           reinterpret_cast<LPCWSTR>(anchor), &module))
        return {};
    std::vector<wchar_t> name(32768);
    const DWORD length = GetModuleFileNameW(module, name.data(), static_cast<DWORD>(name.size()));
    if (!length || length >= name.size())
        return {};
    return std::filesystem::path(std::wstring(name.data(), length));
}

struct Source {
    HANDLE file = INVALID_HANDLE_VALUE;
    std::filesystem::path path;

    ~Source() {
        if (file != INVALID_HANDLE_VALUE) CloseHandle(file);
    }
};

struct Image {
    HMODULE handle = nullptr;

    bool close(Report report) {
        if (handle && !FreeLibrary(handle)) {
            report("ERROR", "Cannot release core module: system error " + std::to_string(GetLastError()));
            return false;
        }
        handle = nullptr;
        return true;
    }

    void *symbol(const char *name) const {
        return reinterpret_cast<void *>(GetProcAddress(handle, name));
    }
};

inline constexpr bool eager_load = false;

inline std::unique_ptr<Source> prepare(const std::filesystem::path &path, Report report) {
    auto source = std::make_unique<Source>();
    source->path = path;
    // Keep the validated bytes immutable throughout the callback's handoff.
    source->file = CreateFileW(path.c_str(), GENERIC_READ, FILE_SHARE_READ, nullptr,
                              OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, nullptr);
    if (source->file == INVALID_HANDLE_VALUE) {
        report("ERROR", "Cannot open deployed core: system error " + std::to_string(GetLastError()));
        return {};
    }
    LARGE_INTEGER size{};
    if (!GetFileSizeEx(source->file, &size) || size.QuadPart <= 0 || size.QuadPart > 512 * 1024 * 1024) {
        report("ERROR", "Core is not a readable library of a supported size");
        return {};
    }
    std::vector<unsigned char> bytes(static_cast<std::size_t>(size.QuadPart));
    DWORD count = 0;
    if (!ReadFile(source->file, bytes.data(), static_cast<DWORD>(bytes.size()), &count, nullptr) ||
        count != bytes.size()) {
        report("ERROR", "Cannot read complete core image; retry after the build finishes");
        return {};
    }
    CorePeView view{bytes, {}, {}};
    if (!view.compatible()) {
        report("ERROR", "Core image or ABI is incompatible with the resident loader");
        return {};
    }
    return source;
}

inline bool load(Source &source, Image &image, Report report) {
    HMODULE existing = nullptr;
    if (GetModuleHandleExW(GET_MODULE_HANDLE_EX_FLAG_UNCHANGED_REFCOUNT,
                          source.path.c_str(), &existing)) {
        report("ERROR", "Core is still mapped after releasing the loader reference; thread-local cleanup or another owner may retain it. Restart the game to release it");
        return false;
    }
    image.handle = LoadLibraryExW(source.path.c_str(), nullptr,
        LOAD_LIBRARY_SEARCH_DLL_LOAD_DIR | LOAD_LIBRARY_SEARCH_DEFAULT_DIRS);
    if (!image.handle) {
        report("ERROR", "Cannot load core: system error " + std::to_string(GetLastError()));
        return false;
    }
    return true;
}

#else

struct Descriptor {
    int fd = -1;
    ~Descriptor() { if (fd >= 0) close(fd); }
};

inline void local_time(std::tm &result, const std::time_t &now) {
    localtime_r(&now, &result);
}

inline constexpr const char *library_name = "libdfcn_core.so";

inline std::filesystem::path resident_path(void *anchor) {
    Dl_info info{};
    if (!dladdr(anchor, &info) || !info.dli_fname)
        return {};
    return std::filesystem::absolute(info.dli_fname);
}

struct Source {
    Descriptor image;
};

struct Image {
    Descriptor image;
    void *handle = nullptr;

    bool close(Report report) {
        if (handle && dlclose(handle) != 0) {
            const char *error = dlerror();
            report("ERROR", std::string("Cannot release core module: ") +
                (error ? error : "unknown error"));
            return false;
        }
        handle = nullptr;
        return true;
    }

    void *symbol(const char *name) const { return dlsym(handle, name); }
};

inline constexpr bool eager_load = true;

inline std::unique_ptr<Source> prepare(const std::filesystem::path &path, Report report) {
    Descriptor published{open(path.c_str(), O_RDONLY | O_CLOEXEC)};
    if (published.fd < 0) {
        report("ERROR", "Cannot open " + path.string() + ": " + std::strerror(errno));
        return {};
    }
    struct stat before{}, after{};
    if (fstat(published.fd, &before) != 0 || !S_ISREG(before.st_mode) || before.st_size <= 0) {
        report("ERROR", "Core is not a readable regular library");
        return {};
    }
    auto source = std::make_unique<Source>();
    source->image.fd = memfd_create("dfcn-core", MFD_CLOEXEC | MFD_ALLOW_SEALING);
    if (source->image.fd < 0) {
        report("ERROR", std::string("Cannot allocate core image: ") + std::strerror(errno));
        return {};
    }
    // A fresh sealed mapping avoids loader cache reuse and protects the active
    // image from subsequent publication. Its bytes exist only in memory.
    std::array<char, 65536> buffer{};
    off_t copied = 0;
    while (copied < before.st_size) {
        const auto remaining = static_cast<std::uint64_t>(before.st_size - copied);
        const std::size_t count = remaining < buffer.size() ? static_cast<std::size_t>(remaining) : buffer.size();
        const ssize_t got = read(published.fd, buffer.data(), count);
        if (got < 0 && errno == EINTR) continue;
        if (got <= 0) {
            report("ERROR", "Cannot read complete core image; retry after the build finishes");
            return {};
        }
        for (ssize_t written = 0; written < got;) {
            const ssize_t count_written = write(source->image.fd, buffer.data() + written,
                                                static_cast<std::size_t>(got - written));
            if (count_written < 0 && errno == EINTR) continue;
            if (count_written <= 0) {
                report("ERROR", "Cannot populate the anonymous core image");
                return {};
            }
            written += count_written;
        }
        copied += got;
    }
    if (fstat(published.fd, &after) != 0 || before.st_size != after.st_size ||
        before.st_mtim.tv_sec != after.st_mtim.tv_sec ||
        before.st_mtim.tv_nsec != after.st_mtim.tv_nsec ||
        before.st_ctim.tv_sec != after.st_ctim.tv_sec ||
        before.st_ctim.tv_nsec != after.st_ctim.tv_nsec) {
        report("ERROR", "Core file changed while loading; retry after the build finishes");
        return {};
    }
    if (fcntl(source->image.fd, F_ADD_SEALS,
              F_SEAL_WRITE | F_SEAL_GROW | F_SEAL_SHRINK | F_SEAL_SEAL) < 0) {
        report("ERROR", std::string("Cannot seal core image: ") + std::strerror(errno));
        return {};
    }
    return source;
}

inline bool load(Source &source, Image &image, Report report) {
    std::string path;
    for (;;) {
        path = "/proc/self/fd/" + std::to_string(source.image.fd);
        // dlclose can leave an image resident (for example, until its TLS
        // destructors run). Closing its descriptor does not remove the
        // linker's pathname cache. A new memfd reusing that descriptor would
        // therefore make dlopen return the resident image instead of opening
        // the newly sealed bytes. Choose a pathname no resident image owns.
        const bool occupied = dl_iterate_phdr(
            [](dl_phdr_info *info, std::size_t, void *opaque) {
                const auto &candidate = *static_cast<const std::string *>(opaque);
                return info->dlpi_name && candidate == info->dlpi_name ? 1 : 0;
            }, &path) != 0;
        if (!occupied) break;
        const int distinct = fcntl(source.image.fd, F_DUPFD_CLOEXEC, source.image.fd + 1);
        if (distinct < 0) {
            report("ERROR", std::string("Cannot give the core image a distinct loader path: ") +
                std::strerror(errno));
            return false;
        }
        close(source.image.fd);
        source.image.fd = distinct;
    }
    image.handle = dlopen(path.c_str(), RTLD_NOW | RTLD_LOCAL);
    if (!image.handle) {
        const char *error = dlerror();
        report("ERROR", std::string("Cannot load core: ") + (error ? error : "unknown error"));
        return false;
    }
    image.image.fd = std::exchange(source.image.fd, -1);
    return true;
}

#endif

} // namespace native

using native::local_time;
inline NativeProcessGuard loader_guard{NativeGuardRole::Loader};
inline bool acquire_guard(Report report) { return loader_guard.acquire(report); }
inline void release_guard() { loader_guard.release(); }

inline std::filesystem::path library_path(void *anchor) {
    const auto resident = native::resident_path(anchor);
    if (resident.empty())
        return std::filesystem::absolute(std::filesystem::path("dfcn") / native::library_name);
    const auto directory = resident.parent_path();
    if (std::filesystem::exists(directory / "src/core_api.h") ||
        std::filesystem::exists(directory / native::library_name))
        return directory / native::library_name;
    return directory / "dfcn" / native::library_name;
}

class CoreModule {
    native::Image image;
    Report report;
    bool retained = false;

    friend class PreparedCore;

public:
    explicit CoreModule(Report reporter) : report(reporter) {}
    CoreModule(const CoreModule &) = delete;
    CoreModule &operator=(const CoreModule &) = delete;

    ~CoreModule() {
        if (!retained) {
            try { image.close(report); } catch (...) {}
        }
    }

    void *symbol(const char *name) const { return image.symbol(name); }
    bool close() { return image.close(report); }
    void keep_resident() { retained = true; }
};

// Owns a validated publication until the caller completes the handoff. A
// prepared mapping may be acquired immediately; an exclusive mapping is
// acquired only after the caller releases its current module reference.
class PreparedCore {
    std::unique_ptr<native::Source> source;
    std::unique_ptr<CoreModule> module;
    Report report;

    bool load() {
        auto next = std::make_unique<CoreModule>(report);
        if (!native::load(*source, next->image, report)) return false;
        module = std::move(next);
        return true;
    }

public:
    explicit PreparedCore(Report reporter) : report(reporter) {}

    static std::unique_ptr<PreparedCore> prepare(const std::filesystem::path &path, Report report) {
        auto result = std::make_unique<PreparedCore>(report);
        result->source = native::prepare(path, report);
        if (!result->source || (native::eager_load && !result->load())) return {};
        return result;
    }

    bool has_image() const { return static_cast<bool>(module); }

    std::unique_ptr<CoreModule> acquire() {
        if (!module && !load()) return {};
        return std::move(module);
    }
};

} // namespace dfcn::module
