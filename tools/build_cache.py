"""Persistent native build receipts and objects, shared by the two entry points.

This is an incremental build cache, not a second build entry point. Content
digests avoid recompilation after timestamp-only changes; file metadata makes
the unchanged path cheap. GCC owns the actual header dependency graph.
"""

from __future__ import annotations

from contextlib import contextmanager
import hashlib
import json
import os
from pathlib import Path
import platform
import re
import sys
import time


CACHE_VERSION = 1
OBJECT_CACHE_BYTES = 2 * 1024 * 1024 * 1024


def digest(value) -> str:
    return hashlib.sha256(json.dumps(value, sort_keys=True, separators=(",", ":"))
                          .encode("utf-8")).hexdigest()


def dependencies(path: Path, root: Path) -> list[Path]:
    # -MT supplies a simple target, so drive-letter colons only occur on the
    # right-hand side. GNU make escapes spaces/# and doubles dollar signs;
    # shlex would corrupt Windows backslashes and is deliberately not used.
    text = re.sub(r"\\\r?\n", "", path.read_text(encoding="utf-8"))
    target, separator, text = text.partition(":")
    if not separator or target.strip() != "dfcn_object":
        raise RuntimeError(f"Invalid compiler dependency file: {path}")
    words, word = [], []
    index = 0
    while index < len(text):
        char = text[index]
        if char == "\\" and index + 1 < len(text) and text[index + 1] in " \\#\t":
            index += 1
            word.append(text[index])
        elif char == "$" and text[index:index + 2] == "$$":
            word.append("$")
            index += 1
        elif char.isspace():
            if word:
                words.append("".join(word))
                word = []
        else:
            word.append(char)
        index += 1
    if word:
        words.append("".join(word))
    result = sorted({(root / name).absolute() for name in words})
    if not result or any(not item.is_file() for item in result):
        raise RuntimeError(f"Compiler dependencies are missing or unreadable: {path}")
    return result


def stable_discovered(paths, known, started_ns):
    # A newly included header/library was not in the pre-action receipt. Do
    # not associate a potentially old object with its newer bytes if an editor
    # or package update changed that input while the compiler/linker ran.
    known = {os.path.normcase(os.path.abspath(path)) for path in known}
    for path in paths:
        if os.path.normcase(os.path.abspath(path)) not in known:
            info = path.stat()
            if max(info.st_mtime_ns, info.st_ctime_ns) >= started_ns:
                raise RuntimeError(f"New dependency changed during the build: {path}")


class BuildCache:
    def __init__(self, root: Path):
        self.root = root
        self.directory = root / ".build-cache" / f"{sys.platform}-{platform.machine().lower()}"
        self.directory.mkdir(parents=True, exist_ok=True)
        self.path = self.directory / "state.json"
        self.state = {}
        self.dirty = False
        self.observed = {}
        self.selected_inputs = []

    @contextmanager
    def locked(self):
        # The OS releases this lock on failures and process termination. Never
        # allow simultaneous builds to overwrite each other's fixed staging files.
        with (self.directory / "build.lock").open("a+b") as handle:
            handle.seek(0, os.SEEK_END)
            if handle.tell() == 0:
                handle.write(b"\0")
                handle.flush()
            handle.seek(0)
            try:
                if os.name == "nt":
                    import msvcrt
                    msvcrt.locking(handle.fileno(), msvcrt.LK_NBLCK, 1)
                else:
                    import fcntl
                    fcntl.flock(handle.fileno(), fcntl.LOCK_EX | fcntl.LOCK_NB)
            except OSError as error:
                raise RuntimeError("Another build is using this workspace; let it finish first.") from error
            try:
                try:
                    self.state = json.loads(self.path.read_text(encoding="utf-8"))
                except (OSError, ValueError):
                    self.state = {}
                if (not isinstance(self.state, dict)
                        or self.state.get("version") != CACHE_VERSION
                        or self.state.get("root") != str(self.root)
                        or not isinstance(self.state.get("files"), dict)
                        or not isinstance(self.state.get("actions"), dict)):
                    self.state = {"version": CACHE_VERSION, "root": str(self.root),
                                  "files": {}, "actions": {}}
                    self.dirty = True
                yield self
            finally:
                try:
                    self.save()
                finally:
                    handle.seek(0)
                    if os.name == "nt":
                        msvcrt.locking(handle.fileno(), msvcrt.LK_UNLCK, 1)
                    else:
                        fcntl.flock(handle.fileno(), fcntl.LOCK_UN)

    def save(self) -> None:
        if self.dirty:
            staged = self.path.with_suffix(".json.tmp")
            try:
                staged.write_text(json.dumps(self.state, separators=(",", ":")), encoding="utf-8")
                os.replace(staged, self.path)
            finally:
                staged.unlink(missing_ok=True)
            self.dirty = False

    def fingerprint(self, paths, *, fresh=False) -> str:
        result = []
        for name in sorted({str(Path(path).absolute()) for path in paths}):
            if not fresh and name in self.observed:
                result.append((name, self.observed[name]))
                continue
            path = Path(name)
            try:
                info = path.stat()
            except FileNotFoundError:
                self.observed[name] = None
                result.append((name, None))
                continue
            stamp = [info.st_size, info.st_mtime_ns, info.st_ctime_ns,
                     info.st_mode, info.st_ino, info.st_dev]
            previous = self.state["files"].get(name, {})
            if previous.get("stamp") == stamp:
                content = previous["digest"]
            else:
                if path.is_dir():
                    with os.scandir(path) as entries:
                        content = digest(sorted((item.name, item.is_dir()) for item in entries))
                else:
                    with path.open("rb") as stream:
                        content = hashlib.file_digest(stream, "sha256").hexdigest()
                # Do not certify a file that changed while we read it.
                after = path.stat()
                if (info.st_size, info.st_mtime_ns, info.st_ctime_ns) != (
                        after.st_size, after.st_mtime_ns, after.st_ctime_ns):
                    raise RuntimeError(f"Build input changed while reading: {path}")
                self.state["files"][name] = {"stamp": stamp, "digest": content}
                self.dirty = True
            self.observed[name] = content
            result.append((name, content))
        return digest(result)

    def current(self, name, signature, inputs, outputs) -> bool:
        old = self.state["actions"].get(name, {})
        return (old.get("signature") == signature
                and all(path.is_file() for path in outputs)
                and old.get("inputs") == self.fingerprint(inputs)
                and old.get("outputs") == self.fingerprint(outputs))

    def record(self, name, signature, inputs, outputs, *, expected_inputs=None, **extra) -> None:
        if any(not path.is_file() for path in outputs):
            raise RuntimeError(f"Build action did not produce its outputs: {name}")
        input_id = self.fingerprint(inputs, fresh=True)
        if expected_inputs is not None and expected_inputs != input_id:
            raise RuntimeError(f"Build inputs changed before caching: {name}")
        self.state["actions"][name] = {
            "signature": signature, "inputs": input_id,
            "outputs": self.fingerprint(outputs, fresh=True), **extra,
        }
        self.dirty = True

    def generate(self, name, inputs, outputs, action) -> None:
        key = "generate:" + name
        signature = digest([sys.executable, sys.version])
        if self.current(key, signature, inputs, outputs):
            self.selected_inputs.append((key, inputs, self.state["actions"][key]["inputs"]))
            return
        started = time.perf_counter()
        before = self.fingerprint(inputs)
        action()
        if before != self.fingerprint(inputs, fresh=True):
            raise RuntimeError(f"Generator inputs changed during generation: {name}")
        self.record(key, signature, inputs, outputs)
        self.selected_inputs.append((key, inputs, self.state["actions"][key]["inputs"]))
        print(f"Generated {name}: {time.perf_counter() - started:.3f}s", flush=True)

    def tool_inputs(self, compiler, env, run) -> list[Path]:
        # Query only this configured compiler, never discover another toolchain.
        # Track its back end, assembler, linker, specs and runtime libraries too.
        key = "native-tools"
        signature = digest([compiler, env.get("PATH"), self.fingerprint([Path(compiler[0])])])
        old = self.state["actions"].get(key, {})
        if old.get("signature") == signature:
            paths = [Path(name) for name in old.get("paths", [])]
            if paths and old.get("inputs") == self.fingerprint(paths):
                return paths
        paths = [Path(compiler[0])]
        import shutil
        for option in ("-print-prog-name=cc1plus", "-print-prog-name=as", "-print-prog-name=ld",
                       "-print-prog-name=collect2", "-print-file-name=specs",
                       "-print-file-name=libstdc++.a", "-print-file-name=libgcc.a",
                       "-print-file-name=libgcc_s.so", "-print-file-name=crtbegin.o"):
            value = run([*compiler, option], env, capture=True)
            path = Path(value)
            if not path.is_file() and option.startswith("-print-prog-name="):
                located = shutil.which(value, path=env.get("PATH"))
                if located:
                    path = Path(located)
            if path.is_file():
                paths.extend([path.absolute(), path.absolute().parent])
        paths = sorted(set(paths))
        self.state["actions"][key] = {"signature": signature,
                                      "inputs": self.fingerprint(paths),
                                      "paths": [str(path) for path in paths]}
        self.dirty = True
        return paths

    def compile(self, source, compiler, flags, support, namespace, env, run) -> Path:
        source = self.root / source
        store = self.directory / "objects"
        store.mkdir(exist_ok=True)
        candidate = self.directory / (source.stem + ".o.tmp")
        dep_candidate = self.directory / (source.stem + ".d.tmp")
        key = "compile:" + str(source)
        # ActionID describes the computation, separately from the content ID of
        # its result. Retain old successful actions so switching back to an
        # already-built source/header/configuration reuses its object as Go does.
        environment = {name: env.get(name) for name in (
            "SOURCE_DATE_EPOCH", "GCC_EXEC_PREFIX", "COMPILER_PATH", "LIBRARY_PATH",
            "CPATH", "C_INCLUDE_PATH", "CPLUS_INCLUDE_PATH", "LANG", "LC_ALL", "TZ")}
        signature = digest([compiler, flags, namespace, environment])
        previous = self.state["actions"].get(key, {})
        history = self.state.setdefault("object_history", {}).get(key, [])
        input_digests = {}
        for entry in [previous, *reversed(history)]:
            identity = entry.get("action_id", "")
            if entry.get("signature") != signature or not re.fullmatch(r"[0-9a-f]{64}", identity):
                continue
            headers = tuple(entry.get("headers", []))
            if headers not in input_digests:
                paths = [Path(name) for name in headers]
                input_digests[headers] = self.fingerprint(
                    [source, *paths, *support, *(path.parent for path in paths)])
            if input_digests[headers] != entry.get("inputs"):
                continue
            output, depfile = store / (identity + ".o"), store / (identity + ".d")
            if not all(path.is_file() for path in (output, depfile)):
                continue
            if entry.get("outputs") != self.fingerprint([output, depfile]):
                continue
            if previous.get("action_id") != identity:
                self.state["actions"][key] = entry
                self.dirty = True
            # Avoid rewriting the index on every no-change invocation.
            if time.time() - entry.get("used", 0) > 3600:
                entry["used"] = time.time()
                for saved in history:
                    if saved.get("action_id") == identity:
                        saved["used"] = entry["used"]
                self.dirty = True
            paths = [Path(name) for name in headers]
            inputs = [source, *paths, *support, *(path.parent for path in paths)]
            self.selected_inputs.append((key, inputs, entry["inputs"]))
            print(f"Cached {source.name} [{identity[:12]}]", flush=True)
            return output
        headers = [Path(name) for name in previous.get("headers", [])]
        inputs = [source, *headers, *support, *(path.parent for path in headers)]
        started = time.perf_counter()
        print(f"Compiling {source.name}...", flush=True)
        before = self.fingerprint(inputs)
        started_ns = time.time_ns()
        try:
            run([*compiler, *flags, "-MD", "-MF", str(dep_candidate), "-MT", "dfcn_object",
                 "-c", str(source), "-o", str(candidate)], env)
            if before != self.fingerprint(inputs, fresh=True):
                raise RuntimeError(f"Source dependencies changed during compilation: {source}")
            headers = dependencies(dep_candidate, self.root)
            stable_discovered(headers, inputs, started_ns)
            inputs = [source, *headers, *support, *(path.parent for path in headers)]
            input_id = self.fingerprint(inputs, fresh=True)
            action_id = digest(["c++-object-v2", signature, input_id])
            output, depfile = store / (action_id + ".o"), store / (action_id + ".d")
            os.replace(candidate, output)
            os.replace(dep_candidate, depfile)
            self.record(key, signature, inputs, [output, depfile],
                        headers=[str(path) for path in headers], action_id=action_id,
                        used=time.time(), size=output.stat().st_size + depfile.stat().st_size,
                        expected_inputs=input_id)
            entries = self.state.setdefault("object_history", {}).setdefault(key, [])
            entries[:] = [entry for entry in entries if entry.get("action_id") != action_id]
            entries.append(self.state["actions"][key])
            self.selected_inputs.append((key, inputs, input_id))
            print(f"Compiled {source.name}: {time.perf_counter() - started:.3f}s", flush=True)
        finally:
            candidate.unlink(missing_ok=True)
            dep_candidate.unlink(missing_ok=True)
        return output

    def confirm_inputs(self) -> None:
        # Read each shared dependency once more before linking. Cache hits also
        # need this: a file edited during the build must not be hidden by the
        # invocation's earlier memoized observation.
        self.fingerprint([path for _, inputs, _ in self.selected_inputs for path in inputs], fresh=True)
        for name, inputs, expected in self.selected_inputs:
            if self.fingerprint(inputs) != expected:
                raise RuntimeError(f"Build inputs changed before linking: {name}")

    def trim_objects(self) -> None:
        # Bound historical intermediate objects; retain all outputs selected by
        # this build. These are compilation results, never deployed DLL backups.
        histories = self.state.get("object_history", {})
        entries = {entry["action_id"]: (key, entry) for key, history in histories.items()
                   for entry in history if re.fullmatch(r"[0-9a-f]{64}", entry.get("action_id", ""))}
        size = sum(entry.get("size", 0) for _, entry in entries.values())
        if size <= OBJECT_CACHE_BYTES:
            return
        protected = {entry.get("action_id") for key, entry in self.state["actions"].items()
                     if key.startswith("compile:")}
        store = (self.directory / "objects").resolve()
        for identity, (key, entry) in sorted(entries.items(), key=lambda item: item[1][1].get("used", 0)):
            if size <= OBJECT_CACHE_BYTES:
                break
            if identity in protected:
                continue
            for suffix in (".o", ".d"):
                path = store / (identity + suffix)
                if path.resolve().parent != store or path.is_symlink():
                    raise RuntimeError(f"Invalid object cache path: {path}")
                path.unlink(missing_ok=True)
                self.state["files"].pop(str(path), None)
            histories[key] = [old for old in histories[key] if old.get("action_id") != identity]
            size -= entry.get("size", 0)
            self.dirty = True

    def link(self, name, objects, compiler, flags, support, extra_inputs, outputs,
             candidate, env, run, publish, *, force=False) -> bool:
        key = "link:" + name
        signature = digest([compiler, flags, [str(path) for path in objects]])
        old = self.state["actions"].get(key, {})
        libraries = [Path(path) for path in old.get("libraries", [])]
        inputs = [*objects, *support, *extra_inputs, *libraries,
                  *(path.parent for path in libraries)]
        if not force and self.current(key, signature, inputs, outputs):
            return False
        started = time.perf_counter()
        print(f"Linking {name}...", flush=True)
        before = self.fingerprint(inputs)
        started_ns = time.time_ns()
        trace = run([*compiler, "-o", str(candidate), *(str(path) for path in objects),
                     *flags, "-Wl,-t"], env, capture=True)
        if before != self.fingerprint(inputs, fresh=True):
            raise RuntimeError(f"Link inputs changed while linking: {name}")
        libraries = []
        for line in trace.splitlines():
            path = self.root / line.strip()
            if path.is_file() and path not in objects:
                libraries.append(path.absolute())
        if not libraries:
            raise RuntimeError(f"The native linker did not report its input libraries: {name}")
        stable_discovered(libraries, inputs, started_ns)
        inputs = [*objects, *support, *extra_inputs, *libraries,
                  *(path.parent for path in libraries)]
        for index, destination in enumerate(outputs):
            publish(candidate, destination, keep_candidate=index != len(outputs) - 1)
        self.record(key, signature, inputs, outputs, libraries=[str(path) for path in libraries])
        print(f"Linked and deployed {name}: {time.perf_counter() - started:.3f}s", flush=True)
        return True


def include_namespace(directories) -> str:
    # An added header may shadow an existing include or satisfy __has_include.
    # Track names, not contents, here; GCC's depfile decides which edits matter.
    names = []
    for directory in directories:
        names.append(str(directory))
        for base, subdirs, files in os.walk(directory):
            subdirs.sort()
            names.append((base, sorted(files)))
    return digest(names)
