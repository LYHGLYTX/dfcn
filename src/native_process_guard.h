#pragma once

#include <cstddef>
#include <cstring>
#include <string>

#ifdef _WIN32
#ifndef NOMINMAX
#define NOMINMAX
#endif
#include <windows.h>
#else
#include <cerrno>
#include <sys/socket.h>
#include <sys/un.h>
#include <unistd.h>
#endif

namespace dfcn {

enum class NativeGuardRole { Loader, Core };

// One owner for each role in this process, including separately loaded copies
// of the plugin. Native resources vanish on close and never create disk files.
class NativeProcessGuard {
    using Report = void (*)(const char *, const std::string &);
    NativeGuardRole role_;
#ifdef _WIN32
    HANDLE handle_ = nullptr;
#else
    int descriptor_ = -1;
#endif

    const char *role_name() const {
        return role_ == NativeGuardRole::Loader ? "loader" : "core";
    }

    bool bind_native(std::string &error) {
#ifdef _WIN32
        // Preserve the names used by already installed resident/core modules.
        const std::wstring name = std::wstring(L"Local\\DFCN-") +
            (role_ == NativeGuardRole::Loader ? L"Loader-" : L"") +
            std::to_wstring(static_cast<unsigned long>(GetCurrentProcessId()));
        HANDLE next = CreateMutexW(nullptr, FALSE, name.c_str());
        const DWORD code = GetLastError();
        if (!next || code == ERROR_ALREADY_EXISTS) {
            if (next) CloseHandle(next);
            error = code == ERROR_ALREADY_EXISTS ? "another instance is already active" :
                "system error " + std::to_string(code);
            return false;
        }
        handle_ = next;
#else
        const std::string name = "dfcn-" + std::string(role_name()) + "-" +
            std::to_string(static_cast<unsigned long>(getpid()));
        sockaddr_un address{};
        address.sun_family = AF_UNIX;
        if (name.size() > sizeof(address.sun_path) - 1) {
            error = "process guard name exceeds the native address limit";
            return false;
        }
        // A leading NUL selects Linux's abstract Unix-domain socket namespace;
        // neither a pathname nor a stale lock file survives this descriptor.
        std::memcpy(address.sun_path + 1, name.data(), name.size());
        const int next = socket(AF_UNIX, SOCK_STREAM | SOCK_CLOEXEC, 0);
        if (next < 0) {
            error = std::strerror(errno);
            return false;
        }
        const auto length = static_cast<socklen_t>(
            offsetof(sockaddr_un, sun_path) + 1 + name.size());
        if (::bind(next, reinterpret_cast<const sockaddr *>(&address), length) != 0) {
            const int code = errno;
            close(next);
            error = code == EADDRINUSE ? "another instance is already active" : std::strerror(code);
            return false;
        }
        descriptor_ = next;
#endif
        return true;
    }

public:
    explicit NativeProcessGuard(NativeGuardRole role) : role_(role) {}
    NativeProcessGuard(const NativeProcessGuard &) = delete;
    NativeProcessGuard &operator=(const NativeProcessGuard &) = delete;
    ~NativeProcessGuard() { release(); }

    bool held() const {
#ifdef _WIN32
        return handle_ != nullptr;
#else
        return descriptor_ >= 0;
#endif
    }

    bool acquire(Report report) {
        if (held()) return true;
        std::string error;
        if (bind_native(error)) return true;
        if (report) report("WARN", "Cannot own the process-wide " +
            std::string(role_name()) + " instance: " + error);
        return false;
    }

    void release() {
#ifdef _WIN32
        if (handle_) CloseHandle(handle_);
        handle_ = nullptr;
#else
        if (descriptor_ >= 0) close(descriptor_);
        descriptor_ = -1;
#endif
    }
};

} // namespace dfcn
