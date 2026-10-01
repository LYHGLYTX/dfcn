#!/usr/bin/env python3
"""Build and publish DFCN with the current host's native tools."""

from __future__ import annotations

import argparse
import ctypes
import json
import os
from pathlib import Path
import platform
import re
import shlex
import shutil
import stat
import subprocess
import sys
import tempfile

sys.dont_write_bytecode = True
from extract_workshop_tooltip_catalog import native_game_executable


ROOT = Path(__file__).resolve().parents[1]
GAME = ROOT.parent
DATA = ROOT / "data"
EXTRACTED = DATA / "extracted"
UPSTREAM = DATA / "upstream"
RUNTIME = DATA / "runtime"
SCRIPT = Path(__file__).resolve()
TEMP = Path(tempfile.gettempdir())

def pe_edition_sources():
    config_path = RUNTIME / "native-pe-images.json"
    if sys.platform != "win32" or not config_path.is_file():
        return {}
    config = json.loads(config_path.read_text(encoding="utf-8"))
    return {**config, **{name: (ROOT / config[name]).resolve()
                        for name in ("reference", "classic")}}


def edition_destinations():
    sources = pe_edition_sources()
    if not sources or not sources.get("deploy_classic", False):
        return ()
    return (sources["classic"].parent / "dfcn",)


def deploy_runtime_data(directory: Path) -> None:
    """Publish the same data layout before a configured edition gets its core."""
    directory = directory.resolve()
    runtime = directory / "data/runtime"

    def install(destination: Path, content: bytes) -> None:
        relative = destination.resolve().relative_to(directory)
        if relative.parts[:2] not in (("data", "runtime"), ("data", "extracted")):
            raise RuntimeError(f"Refusing runtime data publication outside data/: {destination}")
        if destination.is_symlink():
            raise RuntimeError(f"Refusing runtime data publication through a symlink: {destination}")
        if destination.is_file() and destination.read_bytes() == content:
            return
        destination.parent.mkdir(parents=True, exist_ok=True)
        candidate = destination.with_name(destination.name + ".publish")
        if candidate.is_symlink():
            raise RuntimeError(f"Refusing runtime data staging through a symlink: {candidate}")
        try:
            candidate.write_bytes(content)
            os.replace(candidate, destination)
        finally:
            candidate.unlink(missing_ok=True)

    for name in ("translations.tsv", "name-editor.tsv", "instrument-translations.tsv",
                 "procedural-terms.tsv", "procedural-word-senses.tsv"):
        install(runtime / name, (RUNTIME / name).read_bytes())
    for source in sorted((RUNTIME / "rulesets").rglob("*.toml")):
        install(runtime / source.relative_to(RUNTIME), source.read_bytes())

    # Keep this edition's preferences and collected queue during the layout
    # migration. Existing custom external paths continue to work as configured.
    config_source = next(path for path in (runtime / "config.ini", directory / "config.ini",
                                          RUNTIME / "config.ini") if path.is_file())
    config = config_source.read_text(encoding="utf-8")
    relocations = {
        **{f"dfcn/{name}": f"dfcn/data/runtime/{name}"
           for name in ("translations.tsv", "untranslated.tsv", "font.ttf", "font.otf", "font.ttc")},
        "dfcn/capture-first-match.bmp": "dfcn/data/extracted/capture-first-match.bmp",
        "dfcn/dumps/": "dfcn/data/extracted/dumps/",
    }
    for old, new in relocations.items():
        config = config.replace(old, new).replace(old.replace("/", "\\"), new.replace("/", "\\"))
    install(runtime / "config.ini", config.encode("utf-8"))
    for name in ("untranslated.tsv", "font.ttf", "font.otf", "font.ttc"):
        destination = runtime / name
        if destination.exists():
            continue
        legacy = directory / name
        source = legacy if legacy.is_file() else RUNTIME / name
        if source.is_file() and (name != "untranslated.tsv" or source == legacy):
            install(destination, source.read_bytes())
    print(f"Runtime data deployed to {runtime}", flush=True)


# ABI metadata feeds one dependency, compilation, and publication pipeline.
NATIVE_ABIS = {
    "win32": {
        "core": "dfcn_core.dll",
        "loader": "dfhooks_dfcn.dll",
        "compiler": "g++.exe",
        "compiler_hint": TEMP / "codex-world-compute-w64devkit/extracted/w64devkit/bin",
        "target": r"(?:mingw|windows)",
        "compile": ["-static-libgcc", "-static-libstdc++"],
        "link": ["-lgdi32", "-luser32", "-limm32", "-lkernel32"],
        "core_link": [],
        "packages": ["sdl2"],
        "sdk_versions": ["2.30.11", "2.26.2"],
    },
    "linux": {
        "core": "libdfcn_core.so",
        "loader": "libdfhooks.so",
        "compiler": "g++",
        "compiler_hint": None,
        "target": r"linux",
        "compile": ["-fPIC", "-fvisibility=hidden", "-fno-gnu-unique"],
        "link": ["-Wl,-z,relro,-z,now", "-Wl,--no-undefined", "-ldl"],
        "core_link": ["-Wl,-Bsymbolic,--version-script=src/core.exports"],
        "packages": ["sdl2", "freetype2", "fontconfig"],
        "sdk_versions": [],
    },
}


def split_arguments(value: str) -> list[str]:
    return [part[1:-1] if part.startswith('"') and part.endswith('"') else part
            for part in shlex.split(value, posix=os.name != "nt")]


def run(command: list[str], env: dict[str, str], *, capture: bool = False) -> str:
    foreign_launchers = {"wine", "wine64", "proton", "mono", "binfmt", "wsl"}
    if any(Path(part).stem.lower() in foreign_launchers for part in command):
        raise RuntimeError("Build commands must use native executables and dependencies.")
    if os.name != "nt":
        if any(Path(part).suffix.lower() == ".exe" for part in command):
            raise RuntimeError("Build commands must use native executables and dependencies.")
        executable = shutil.which(command[0], path=env.get("PATH"))
        if executable:
            with Path(executable).open("rb") as source:
                if source.read(2) == b"MZ":
                    raise RuntimeError(f"Executable format does not match this host: {executable}")
    result = subprocess.run(command, cwd=ROOT, env=env, check=True,
                            text=True, stdout=subprocess.PIPE if capture else None)
    return result.stdout.strip() if capture else ""


def native_tools(args: argparse.Namespace, abi: dict) -> tuple[list[str], dict[str, str], list[str], list[str]]:
    env = dict(os.environ)
    env["PYTHONDONTWRITEBYTECODE"] = "1"
    compiler_bins = []
    if args.toolchain_root:
        compiler_bins.append(args.toolchain_root.resolve() / "bin")
    elif abi["compiler_hint"]:
        compiler_bins.append(abi["compiler_hint"])
    if compiler_bins:
        env["PATH"] = os.pathsep.join([*(str(path) for path in compiler_bins), env.get("PATH", "")])
    configured = env.get("CXX", "")
    compiler = ([configured] if Path(configured).is_file() else split_arguments(configured)) if configured else []
    if not compiler:
        found = shutil.which(abi["compiler"], path=env["PATH"])
        if not found:
            raise RuntimeError("Native C++ compiler was not found; supply --toolchain-root or CXX.")
        compiler = [found]
    executable = shutil.which(compiler[0], path=env["PATH"])
    if not executable:
        raise RuntimeError(f"Compiler does not exist: {compiler[0]}")
    if os.name != "nt" and Path(executable).suffix.lower() == ".exe":
        raise RuntimeError(f"Compiler is not a native executable: {executable}")
    compiler[0] = executable
    env["PATH"] = str(Path(executable).parent) + os.pathsep + env["PATH"]
    target = run([*compiler, "-dumpmachine"], env, capture=True)
    machine = platform.machine().lower()
    architecture = {"amd64": "x86_64", "arm64": "aarch64"}.get(machine, machine)
    if not re.search(abi["target"], target) or not target.startswith(architecture + "-"):
        raise RuntimeError(f"Compiler target {target!r} does not match this host ({platform.system()}, {machine}).")

    include_flags = []
    library_flags = []
    if args.sdl_root and not abi["sdk_versions"]:
        raise RuntimeError("This dependency configuration uses pkg-config; configure PKG_CONFIG_PATH.")
    sdk_roots = [args.sdl_root.resolve()] if args.sdl_root else [
        TEMP / f"dfcn-sdl2-{version}/SDL2-{version}/x86_64-w64-mingw32"
        for version in abi["sdk_versions"]
    ]
    if not args.sdl_root and (env.get("PKG_CONFIG") or env.get("PKG_CONFIG_PATH")):
        sdk_roots = []  # An explicitly selected dependency configuration takes precedence.
    sdk = next((path for path in sdk_roots
                if (path / "include/SDL2/SDL.h").is_file()
                and (path / "lib/libSDL2.dll.a").is_file()), None)
    if args.sdl_root and sdk is None:
        raise RuntimeError(f"SDL2 headers and dynamic import library were not found in {args.sdl_root.resolve()}.")
    if sdk is not None:
        include_flags += [f"-I{sdk / 'include'}"]
        library_flags += [f"-L{sdk / 'lib'}", "-lSDL2"]
    elif abi["packages"]:
        pkg_config = split_arguments(env.get("PKG_CONFIG", "pkg-config"))
        include_flags += shlex.split(run([*pkg_config, "--cflags", *abi["packages"]], env, capture=True))
        library_flags += shlex.split(run([*pkg_config, "--libs", *abi["packages"]], env, capture=True))
    print(f"Native host: {platform.system()} {machine}; compiler target: {target}", flush=True)
    return compiler, env, include_flags, library_flags


def file_inputs(directory: Path, suffixes: set[str]) -> list[Path]:
    return [path for path in directory.rglob("*") if path.is_file() and path.suffix in suffixes]


def needs_update(outputs: list[Path], inputs: list[Path]) -> bool:
    if any(not path.is_file() for path in outputs):
        return True
    built_at = min(path.stat().st_mtime_ns for path in outputs)
    return any(path.stat().st_mtime_ns > built_at for path in inputs)


def generate_data(env: dict[str, str]) -> None:
    layout_inputs = [ROOT / "tools/build_history_layouts.py",
                     *file_inputs(UPSTREAM / "df-structures", {".xml"})]
    if needs_update([ROOT / "src/native_history_layouts.inc"], layout_inputs):
        run([sys.executable, "-B", "tools/build_history_layouts.py"], env)
    history_inputs = [ROOT / "tools/build_history_event_profiles.py",
                      native_game_executable(GAME)]
    history_output = ROOT / "src/native_history_event_profiles_elf.inc"
    if sys.platform == "win32":
        history_inputs.append(EXTRACTED / "native-history-event-layouts.tsv")
        history_output = ROOT / "src/native_history_event_profiles.inc"
    if needs_update([history_output], history_inputs):
        run([sys.executable, "-B", "tools/build_history_event_profiles.py"], env)
    dictionary = RUNTIME / "translations.tsv"
    anatomy = RUNTIME / "rulesets/zh-Hans/health/bodypart/raw_names.toml"
    creature_names = RUNTIME / "rulesets/zh-Hans/creatures/name/raw_names.toml"
    wood_names = RUNTIME / "rulesets/zh-Hans/items/wood/raw_names.toml"
    outputs = [dictionary, ROOT / "src/preference_vocabulary.inc", anatomy, creature_names, wood_names]
    inputs = [SCRIPT, ROOT / "tools/build_translations.py", ROOT / "tools/legends_grammar.py",
              ROOT / "tools/announcement_grammar.py",
              ROOT / "tools/magical_materials.py", ROOT / "tools/extract_tooltip_catalog.py",
              ROOT / "tools/extract_workshop_tooltip_catalog.py"]
    inputs.append(native_game_executable(GAME))
    inputs += [path for path in file_inputs(RUNTIME, {".tsv"}) if path != dictionary]
    inputs += file_inputs(EXTRACTED, {".tsv"})
    inputs += [UPSTREAM / name for name in ("simple.zh-Hans.csv", "objects.zh-Hans.po",
                                         "dfzh_dict_exact.csv", "dfzh_dict_word.csv")]
    inputs += [path for path in file_inputs(RUNTIME / "rulesets/zh-Hans", {".toml"})
               if path not in (anatomy, creature_names, wood_names)]
    raw_root = GAME / "data/vanilla"
    # Generated religious titles use native singular/plural language nouns.
    # A RAW update must regenerate the dictionary even if the TSV is unchanged.
    inputs.append(raw_root / "vanilla_languages/objects/language_words.txt")
    # RAW building tooltips are inventoried alongside compiled-in tooltips.
    # Include every package's objects (also creature/plant vocabularies) and
    # directory mtimes so added, removed or renamed RAW files invalidate the
    # dictionary even when their archived file timestamps predate the build.
    inputs += [raw_root, *raw_root.glob("*/objects"), *raw_root.glob("*/objects/*.txt")]
    generators = raw_root / "vanilla_procedural/scripts/generators"
    inputs += [generators / name for name in ("materials.lua", "divine.lua", "evil.lua")]
    if needs_update(outputs, inputs):
        run([sys.executable, "-B", "tools/build_translations.py"], env)
    creature_inputs = [ROOT / "tools/build_creature_vocabulary.py", RUNTIME / "creature-name-vocabulary.tsv",
                       ROOT / "tools/legends_grammar.py", RUNTIME / "legends-creature-descriptions.tsv",
                       RUNTIME / "procedural-word-senses.tsv", GAME / "data/init/globals.lua",
                       dictionary, generators / "creatures.lua", generators / "evil.lua",
                       generators / "creatures/rcp.lua",
                       generators / "interactions", *generators.glob("interactions/*.lua")]
    # A RAW adjective can change without changing translations.tsv content
    # or mtime. Track these inputs directly for the creator identity table.
    for package in ("vanilla_creatures", "vanilla_creatures_extinct"):
        objects = raw_root / package / "objects"
        creature_inputs += [objects, *objects.glob("creature_*.txt")]
    if needs_update([ROOT / "src/creature_vocabulary.inc"], creature_inputs):
        run([sys.executable, "-B", "tools/build_creature_vocabulary.py"], env)


def loader_inputs() -> list[Path]:
    pending = [ROOT / "src/loader.cpp", SCRIPT]
    seen = set()
    while pending:
        path = pending.pop().resolve()
        if path in seen:
            continue
        seen.add(path)
        for name in re.findall(r'^\s*#\s*include\s*["<]([^">]+)[">]', path.read_text(encoding="utf-8"), re.MULTILINE):
            included = next((base / name for base in (path.parent, ROOT / "src", ROOT / "compat")
                             if (base / name).is_file()), None)
            if included:
                pending.append(included)
    return list(seen)


def checked_path(path: Path) -> Path:
    absolute = path.absolute()
    if absolute.parent not in (ROOT, GAME, *edition_destinations()) or absolute.is_symlink():
        raise RuntimeError(f"Refusing file operation outside build destinations: {absolute}")
    if absolute.exists() and not stat.S_ISREG(absolute.lstat().st_mode):
        raise RuntimeError(f"Expected a regular build file: {absolute}")
    return absolute


def windows_file_information(path: Path, information_class: int, information: ctypes.Structure) -> None:
    kernel = ctypes.WinDLL("kernel32", use_last_error=True)
    create = kernel.CreateFileW
    create.argtypes = [ctypes.c_wchar_p, ctypes.c_uint32, ctypes.c_uint32, ctypes.c_void_p,
                       ctypes.c_uint32, ctypes.c_uint32, ctypes.c_void_p]
    create.restype = ctypes.c_void_p
    update = kernel.SetFileInformationByHandle
    update.argtypes = [ctypes.c_void_p, ctypes.c_int, ctypes.c_void_p, ctypes.c_uint32]
    update.restype = ctypes.c_int
    close = kernel.CloseHandle
    close.argtypes = [ctypes.c_void_p]
    close.restype = ctypes.c_int
    # DELETE access with shared read/write/delete; never override ACLs or attributes.
    handle = create(str(path), 0x00010000, 0x7, None, 3, 0, None)
    if handle == ctypes.c_void_p(-1).value:
        raise ctypes.WinError(ctypes.get_last_error())
    try:
        if not update(handle, information_class, ctypes.byref(information), ctypes.sizeof(information)):
            raise ctypes.WinError(ctypes.get_last_error())
    finally:
        close(handle)


def remove_file(path: Path) -> None:
    path = checked_path(path)
    if path.exists():
        try:
            path.unlink()
        except PermissionError as original:
            if os.name != "nt":
                raise
            # Request POSIX unlink for open handles; mapped images may still reject it.
            # Do not bypass permissions or ignore read-only attributes.
            class Disposition(ctypes.Structure):
                _fields_ = [("Flags", ctypes.c_uint32)]

            try:
                windows_file_information(path, 21, Disposition(0x1 | 0x2))
            except OSError as error:
                raise OSError(f"Cannot remove {path}; unlink: {original}; native unlink: {error}") from error
    if path.exists():
        raise RuntimeError(f"File remains after removal: {path}")


def replacement_staging(destination: Path) -> set[Path]:
    # ReplaceFileW may prefix its temporary name with the full destination name.
    pattern = re.compile(rf"(?:{re.escape(destination.name)})?~RF[0-9a-f]+\.TMP", re.IGNORECASE)
    return {path for path in destination.parent.iterdir() if pattern.fullmatch(path.name)}


def windows_atomic_rename(candidate: Path, destination: Path) -> None:
    name = str(destination)
    encoded_length = len(name.encode("utf-16-le"))

    class Rename(ctypes.Structure):
        _fields_ = [("Flags", ctypes.c_uint32), ("RootDirectory", ctypes.c_void_p),
                    ("FileNameLength", ctypes.c_uint32), ("FileName", ctypes.c_wchar * (encoded_length // 2 + 1))]

    information = Rename()
    information.Flags = 0x1 | 0x2  # REPLACE_IF_EXISTS | POSIX_SEMANTICS
    information.FileNameLength = encoded_length
    information.FileName = name
    # Existing handles keep the old image; no visible historical copy is created.
    windows_file_information(candidate, 22, information)


class PublishedWithPendingCleanup(OSError):
    """The new official file is installed, but an old mapped image remains."""

    def __init__(self, destination: Path, paths: list[Path], errors: list[str]):
        super().__init__(f"Published {destination}; temporary file cleanup: " + "; ".join(errors))
        self.paths = paths


class DeploymentCleanupPending(RuntimeError):
    """All requested outputs were deployed, but old replacement files remain."""


def windows_publish_mapped_image(candidate: Path, destination: Path) -> None:
    # A mapped image may permit renaming its directory entry while rejecting
    # replacement of that entry. Keep the old image until the new official
    # path exists, and restore it if publication fails. Never unload its user.
    descriptor, name = tempfile.mkstemp(prefix=destination.name + ".retired-",
                                        suffix=".tmp", dir=destination.parent)
    os.close(descriptor)
    retired = checked_path(Path(name))
    try:
        os.replace(destination, retired)
    except OSError:
        remove_file(retired)
        raise
    try:
        os.replace(candidate, destination)
    except OSError as publication_error:
        try:
            os.replace(retired, destination)
        except OSError as restore_error:
            raise OSError(f"Cannot publish {destination}: {publication_error}; "
                          f"cannot restore the original from {retired}: {restore_error}") from restore_error
        raise
    try:
        remove_file(retired)
    except (OSError, RuntimeError) as cleanup_error:
        raise PublishedWithPendingCleanup(destination, [retired],
                                          [f"{retired}: {cleanup_error}"]) from cleanup_error


def atomic_replace(candidate: Path, destination: Path) -> None:
    candidate, destination = checked_path(candidate), checked_path(destination)
    try:
        os.replace(candidate, destination)
    except OSError as original:
        if os.name != "nt" or not destination.exists():
            raise
        try:
            windows_atomic_rename(candidate, destination)
            return
        except OSError as rename_error:
            native_rename_error = str(rename_error)
        # Older filesystems may require the legacy native replacement primitive.
        kernel = ctypes.WinDLL("kernel32", use_last_error=True)
        replace = kernel.ReplaceFileW
        replace.argtypes = [ctypes.c_wchar_p, ctypes.c_wchar_p, ctypes.c_wchar_p,
                            ctypes.c_uint32, ctypes.c_void_p, ctypes.c_void_p]
        replace.restype = ctypes.c_int
        existing_staging = replacement_staging(destination)
        replaced_identities = {(path.stat().st_dev, path.stat().st_ino) for path in (candidate, destination)}
        failure = None
        if not replace(str(destination), str(candidate), None, 0, None, None):
            failure = ctypes.WinError(ctypes.get_last_error())
        cleanup_failures = []
        cleanup_paths = []
        for path in replacement_staging(destination) - existing_staging:
            try:
                metadata = checked_path(path).stat()
                if (metadata.st_dev, metadata.st_ino) not in replaced_identities:
                    continue  # A concurrent application's temporary file is not ours.
                remove_file(path)
            except (OSError, RuntimeError) as error:
                cleanup_failures.append(f"{path}: {error}")
                cleanup_paths.append(path)
        if failure:
            if (not cleanup_failures and candidate.exists() and destination.exists() and
                    failure.winerror in (5, 32, 33)):
                try:
                    windows_publish_mapped_image(candidate, destination)
                    return
                except PublishedWithPendingCleanup:
                    raise
                except OSError as mapped_error:
                    failure = OSError(f"{failure}; mapped-image publication: {mapped_error}")
            details = (f"Cannot publish {destination}; replace: {original}; native rename: {native_rename_error}; "
                       f"native replacement: {failure}")
            if cleanup_failures:
                details += "; temporary file cleanup: " + "; ".join(cleanup_failures)
            raise OSError(details)
        if cleanup_failures:
            raise PublishedWithPendingCleanup(destination, cleanup_paths, cleanup_failures)


def publish(candidate: Path, destination: Path, *, keep_candidate: bool = False) -> None:
    print(f"Publishing {destination}", flush=True)
    if keep_candidate:
        staged = destination.with_name(destination.name + ".publish")
        try:
            shutil.copyfile(checked_path(candidate), checked_path(staged))
            atomic_replace(staged, destination)
        finally:
            remove_file(staged)
    else:
        atomic_replace(candidate, destination)


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--rebuild-loader", action="store_true", help="Recompile and deploy the resident loader.")
    parser.add_argument("--toolchain-root", type=Path, help="Native toolchain directory containing bin/.")
    parser.add_argument("--sdl-root", type=Path, help="Installed SDL2 SDK root when using an SDK dependency configuration.")
    parser.add_argument("--clean", action="store_true", help="Remove the current host's build outputs and staging files.")
    args = parser.parse_args()
    abi = NATIVE_ABIS.get(sys.platform)
    if abi is None:
        raise RuntimeError(f"No native build configuration for this host: {sys.platform}")
    core = ROOT / abi["core"]
    loader = ROOT / abi["loader"]
    game_loader = GAME / abi["loader"]
    core_candidate = core.with_name(core.stem + ".candidate" + core.suffix)
    loader_candidate = loader.with_name(loader.stem + ".candidate" + loader.suffix)
    staging = [core_candidate, loader_candidate,
               *(path.with_name(path.name + ".publish") for path in (core, loader, game_loader))]
    pending_replacements: set[Path] = set()
    if args.clean:
        for path in [*staging, core, loader, game_loader]:
            remove_file(path)
        print("Build outputs removed.")
        return 0

    def publish_ready(candidate: Path, destination: Path, *, keep_candidate: bool = False) -> None:
        try:
            publish(candidate, destination, keep_candidate=keep_candidate)
        except PublishedWithPendingCleanup as error:
            # Publication succeeded. Finish deploying the other official
            # files, then retry these verified replacement remnants together
            # with the other staging files. An actual write failure still
            # aborts immediately; old-image cleanup has a distinct exit status.
            staging.extend(path for path in error.paths if path not in staging)
            pending_replacements.update(error.paths)
            print(str(error), flush=True)

    try:
        for path in staging:
            remove_file(path)
        compiler, env, dependency_includes, dependency_libraries = native_tools(args, abi)
        generate_data(env)
        pe_sources = pe_edition_sources()
        if pe_sources:
            from build_pe_image_bindings import generate as generate_pe_bindings
            output = ROOT / "src/native_pe_build_bindings.inc"
            inputs = [ROOT / "tools/build_pe_image_bindings.py", ROOT / "tools/pe_instruction_match.py",
                      ROOT / "tools/native_pe_coordinates.py", RUNTIME / "native-pe-images.json",
                      UPSTREAM / "df-structures/symbols.xml", pe_sources["reference"], pe_sources["classic"],
                      *[p for p in file_inputs(ROOT / "src", {".h", ".inc", ".cpp"})
                        if p != output and "elf_build_bindings" not in p.name]]
            if needs_update([output], inputs):
                objdump = Path(compiler[0]).with_name("objdump.exe")
                if not objdump.is_file():
                    raise RuntimeError(f"Required native disassembler is missing: {objdump}")
                generate_pe_bindings(pe_sources["reference"], pe_sources["classic"], objdump, output)
        compile_flags = ["-std=c++20", *split_arguments(env.get("CXXFLAGS", "-O2")),
                         "-Wall", "-Wextra", "-Wpedantic", *abi["compile"],
                         "-Icompat", "-Isrc", "-Ithird_party/tomlplusplus/include", "-iquote", "../g_src",
                         *dependency_includes, *split_arguments(env.get("CPPFLAGS", ""))]
        link_flags = ["-shared", *split_arguments(env.get("LDFLAGS", "")),
                      *dependency_libraries, *abi["link"], *split_arguments(env.get("LDLIBS", ""))]
        if "-static" in [*compile_flags, *link_flags]:
            raise RuntimeError("Global static linking is unsupported; SDL2 must remain dynamically linked.")
        core_inputs = [SCRIPT, *file_inputs(ROOT / "src", {".cpp", ".h", ".inc", ".exports"}),
                       *file_inputs(ROOT / "compat", {".h"}),
                       *file_inputs(ROOT / "third_party/tomlplusplus/include", {".h", ".hpp"})]
        if (GAME / "g_src/init.h").is_file():
            core_inputs.append(GAME / "g_src/init.h")
        configured_build = bool(args.toolchain_root or args.sdl_root or any(
            env.get(name) for name in ("CXX", "CPPFLAGS", "CXXFLAGS", "LDFLAGS", "LDLIBS", "PKG_CONFIG", "PKG_CONFIG_PATH")))
        rebuild_core = configured_build or needs_update([core], core_inputs)
        rebuild_loader = args.rebuild_loader or configured_build or needs_update([loader, game_loader], loader_inputs())
        if rebuild_core:
            print("Building the reloadable core...", flush=True)
            run([*compiler, *compile_flags, "-o", str(core_candidate), "src/dfcn.cpp",
                 "src/rulesets_manager.cpp", *link_flags, *abi["core_link"]], env)
        if rebuild_loader:
            print("Building the resident loader...", flush=True)
            run([*compiler, *compile_flags, "-o", str(loader_candidate), "src/loader.cpp", *link_flags], env)
        for directory in edition_destinations():
            deploy_runtime_data(directory)
        if rebuild_core:
            for directory in edition_destinations():
                directory.mkdir(parents=True, exist_ok=True)
                destination = directory / abi["core"]
                staging.append(destination.with_name(destination.name + ".publish"))
                publish_ready(core_candidate, destination, keep_candidate=True)
            publish_ready(core_candidate, core)
        if rebuild_loader:
            for directory in edition_destinations():
                directory.mkdir(parents=True, exist_ok=True)
                destination = directory / abi["loader"]
                staging.append(destination.with_name(destination.name + ".publish"))
                publish_ready(loader_candidate, destination, keep_candidate=True)
            publish_ready(loader_candidate, loader, keep_candidate=True)
            publish_ready(loader_candidate, game_loader)
            print("Core and resident loader deployed to the configured game directories.")
        elif rebuild_core:
            print("Core deployed to the configured game directories.")
        else:
            print("Build outputs are current.")
        print("Deployment does not observe the in-game display.")
        return 0
    finally:
        build_failure = sys.exc_info()[1]
        failures = []
        failed_paths = set()
        for path in staging:
            try:
                remove_file(path)
            except (OSError, RuntimeError) as error:
                failures.append(f"{path}: {error}")
                failed_paths.add(path)
        if failures:
            details = "Temporary files could not be removed:\n" + "\n".join(failures)
            if build_failure is None and failed_paths <= pending_replacements:
                raise DeploymentCleanupPending(details)
            if build_failure is not None:
                details = f"{build_failure}\n{details}"
            raise RuntimeError(details) from build_failure


if __name__ == "__main__":
    try:
        raise SystemExit(main())
    except DeploymentCleanupPending as error:
        print(f"Deployment completed; old-file cleanup pending:\n{error}", file=sys.stderr)
        raise SystemExit(2)
    except (OSError, RuntimeError, subprocess.CalledProcessError) as error:
        print(f"Build failed: {error}", file=sys.stderr)
        raise SystemExit(1)
