#!/bin/bash
# Linux entry point for the shared native build/deploy pipeline.
set -euo pipefail

if [[ "$OSTYPE" != linux* ]]; then
    printf '%s\n' 'Build/deploy failed: this entry point requires Linux.' >&2
    exit 1
fi
if (( $# != 0 )); then
    printf '%s\n' 'Build/deploy failed: this entry point takes no arguments.' >&2
    exit 1
fi

project_root="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
python="$HOME/.cache/codex-runtimes/codex-primary-runtime/dependencies/python/bin/python3"
compiler=/usr/bin/g++
pkg_config=/usr/bin/pkg-config
for executable in "$python" "$compiler" "$pkg_config"; do
    if [[ ! -x "$executable" ]]; then
        printf 'Required build executable is missing: %s\n' "$executable" >&2
        exit 1
    fi
done

# Keep the same optimized C++20 configuration without debug information as the Windows
# wrapper. Child-only environment changes do not affect the caller's shell.
unset CPPFLAGS LDFLAGS LDLIBS PKG_CONFIG_PATH PKG_CONFIG_LIBDIR PKG_CONFIG_SYSROOT_DIR
unset GCC_EXEC_PREFIX COMPILER_PATH LIBRARY_PATH CPATH C_INCLUDE_PATH CPLUS_INCLUDE_PATH
unset PYTHONHOME PYTHONPATH
export CXX="$compiler" CXXFLAGS='-O2' PKG_CONFIG="$pkg_config"
export PYTHONDONTWRITEBYTECODE=1

printf 'Python: %s\nCompiler: %s\npkg-config: %s\n' "$python" "$compiler" "$pkg_config"
# build.py owns publication, cleanup and exit codes 0/1/2 on both hosts.
exec "$python" -B -u "$project_root/tools/build.py"
