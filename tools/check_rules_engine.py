#!/usr/bin/env python3
"""Load the built core and run its recursive-rule translation smoke cases."""

from __future__ import annotations

import ctypes
import os
import sys
from pathlib import Path

from build import NATIVE_ABIS, ROOT


def main() -> int:
    script_root = ROOT
    default_library = script_root / NATIVE_ABIS[sys.platform]["core"]
    library_path = Path(sys.argv[1]).resolve() if len(sys.argv) > 1 else default_library
    # The exported smoke tests intentionally exercise the deployed
    # dfcn/data/runtime/translations.tsv and related data using game-root-relative paths.
    os.chdir(script_root.parent)
    dll_directories = []
    if hasattr(os, "add_dll_directory"):
        # Register the library and game directories when explicit dependency
        # search directories are supported by the native module loader.
        for directory in (library_path.parent, library_path.parent.parent):
            if directory.is_dir():
                dll_directories.append(os.add_dll_directory(str(directory)))
    library = ctypes.CDLL(str(library_path))
    test = library.dfcn_ruleset_self_test
    test.argtypes = []
    test.restype = ctypes.c_int
    result = test()
    if result:
        raise SystemExit(f"DFCN recursive rule engine smoke case {result} failed")
    procedural_test = library.dfcn_procedural_name_self_test
    procedural_test.argtypes = []
    procedural_test.restype = ctypes.c_int
    result = procedural_test()
    if result:
        raise SystemExit(f"DFCN procedural-name smoke case {result} failed")
    template_test = library.dfcn_template_self_test
    template_test.argtypes = []
    template_test.restype = ctypes.c_int
    result = template_test()
    if result:
        raise SystemExit(f"DFCN dynamic template smoke case {result} failed")
    print("DFCN rule engine checks passed: 7 compositional/CP437, 43 procedural/history/sidebar/soundtrack/condition, and 8 dynamic-template cases")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
