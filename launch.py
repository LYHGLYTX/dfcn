#!/usr/bin/env python3
"""从本目录启动游戏；临时入口只建在 run/，不安装到外部目录。"""

from __future__ import annotations

import argparse
import os
from pathlib import Path
import signal
import stat
import subprocess
import sys


ROOT = Path(__file__).resolve().parent

# Native filenames and loader search variables only; preparation, launch and
# cleanup use the same implementation. Never invoke a compatibility layer.
NATIVE_IMAGES = {
    b"\x7fELF": ("linux", "libdfhooks.so", "libdfcn_core.so", "libdfhooks.so", "LD_LIBRARY_PATH"),
    b"MZ": ("win32", "dfhooks_dfcn.dll", "dfcn_core.dll", "dfhooks.dll", "PATH"),
}


def local_directory(path: Path) -> Path:
    """Do not follow a pre-existing runtime-directory link outside the project."""
    if path.parent != ROOT:
        local_directory(path.parent)
    if path.is_symlink():
        raise RuntimeError(f"运行目录不能是符号链接：{path}")
    path.mkdir(exist_ok=True)
    if not path.is_dir():
        raise RuntimeError(f"运行目录不是目录：{path}")
    return path


def launch(game: Path, arguments: list[str]) -> int:
    game = game.expanduser().resolve(strict=True)
    with game.open("rb") as source:
        magic = source.read(4)
    binding = next((value for marker, value in NATIVE_IMAGES.items()
                    if magic.startswith(marker)), None)
    if binding is None:
        raise RuntimeError(f"不是受支持的原生游戏可执行文件：{game}")
    host, loader, core, entry, search_variable = binding
    if sys.platform != host:
        raise RuntimeError(f"游戏格式与当前宿主不匹配：{game}；不通过兼容层启动")
    for name in (loader, core, "data/runtime/config.ini", "data/runtime/translations.tsv"):
        if not (ROOT / name).is_file():
            raise RuntimeError(f"缺少正式文件：{ROOT / name}；代码构建请使用当前系统的 build-deploy 入口")
    if not (game.parent / "data").is_dir():
        raise RuntimeError(f"找不到游戏数据目录：{game.parent / 'data'}")

    run = local_directory(ROOT / "run")
    # An exclusive lock avoids one launcher removing another game's links.
    # Never guess whether a stale lock belongs to a still-running game.
    lock = run / ".launch-lock"
    lock_identity = None
    owned: list[tuple[Path, Path, int, int]] = []
    process: subprocess.Popen | None = None
    pending_signal = 0
    handlers = {}
    errors: list[str] = []
    result = 1

    def forward_signal(number, _frame):
        nonlocal pending_signal
        if process is None:
            # Finish recording any just-created link before unwinding.
            pending_signal = number
        elif process.poll() is None:
            process.send_signal(number)

    def link(name: str, target: Path):
        path = run / name
        if os.path.lexists(path):
            raise RuntimeError(f"不会覆盖已有运行入口：{path}；请核实后自行处理")
        path.symlink_to(target, target_is_directory=target.is_dir())
        info = path.lstat()
        owned.append((path, target, info.st_dev, info.st_ino))

    try:
        for name in ("SIGINT", "SIGTERM", "SIGHUP"):
            number = getattr(signal, name, None)
            if number is not None:
                handlers[number] = signal.signal(number, forward_signal)
        try:
            lock.mkdir()
        except FileExistsError:
            raise RuntimeError(f"已有启动会话或异常退出留下的锁：{lock}。"
                               "请先正常退出该会话；异常退出时确认游戏已退出后再移除这个空目录。") from None
        info = lock.lstat()
        lock_identity = (info.st_dev, info.st_ino)

        # Keep the existing profile location exactly as configured. In
        # particular, do not override XDG_DATA_HOME, XDG_CONFIG_HOME or
        # APPDATA: the user explicitly wants the original settings/saves.
        environment = os.environ.copy()
        directories = {
            "XDG_CACHE_HOME": "cache",
            "TMPDIR": "tmp", "TMP": "tmp", "TEMP": "tmp",
        }
        for variable, name in directories.items():
            environment[variable] = str(local_directory(run / name))

        link("dfcn", ROOT)
        link("data", game.parent / "data")
        link(game.name, game)
        link(entry, ROOT / loader)
        # Only the current loader is an autoload entry; do not mirror old
        # plugins or other copies of the translation core into this session.
        for library in sorted(game.parent.iterdir()):
            if (library.is_file() and
                    (".so" in library.suffixes or library.suffix.lower() in (".dll", ".dylib")) and
                    not library.name.lower().startswith(("dfhooks", "libdfhooks", "dfcn", "libdfcn"))):
                link(library.name, library)

        search = [str(run), str(game.parent)]
        if environment.get(search_variable):
            search.append(environment[search_variable])
        environment[search_variable] = os.pathsep.join(search)
        print(f"游戏：{game}\n运行目录：{run}\n汉化日志：{ROOT / 'dfcn.log'}", flush=True)
        if pending_signal:
            raise KeyboardInterrupt
        process = subprocess.Popen([str(run / game.name), *arguments], cwd=run,
                                   env=environment, start_new_session=True)
        if pending_signal and process.poll() is None:
            process.send_signal(pending_signal)
        result = process.wait()
        if result < 0:
            result = 128 - result
    finally:
        # Cleanup must never unlink files underneath a still-running child.
        # Signals received by this launcher go only to its own child.
        if process is not None:
            while process.poll() is None:
                try:
                    process.wait()
                except KeyboardInterrupt:
                    continue
        for path, target, device, inode in reversed(owned):
            try:
                info = path.lstat()
                if (not stat.S_ISLNK(info.st_mode) or (info.st_dev, info.st_ino) != (device, inode)
                        or path.readlink() != target):
                    raise RuntimeError("入口已被其他操作替换，未删除")
                path.unlink()
                if os.path.lexists(path):
                    raise RuntimeError("删除后入口仍存在")
            except FileNotFoundError:
                pass
            except (OSError, RuntimeError) as error:
                errors.append(f"{path}：{error}")
        if lock_identity is not None:
            try:
                info = lock.lstat()
                if not stat.S_ISDIR(info.st_mode) or (info.st_dev, info.st_ino) != lock_identity:
                    raise RuntimeError("锁目录已被其他操作替换，未删除")
                lock.rmdir()
                if os.path.lexists(lock):
                    raise RuntimeError("删除后锁目录仍存在")
            except FileNotFoundError:
                pass
            except (OSError, RuntimeError) as error:
                errors.append(f"{lock}：{error}")
        for number, handler in handlers.items():
            signal.signal(number, handler)
        for error in errors:
            print(f"清理未完成：{error}", file=sys.stderr)
    return 1 if errors else result


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--game", type=Path, default=Path("/opt/dwarffortress/dwarfort"),
                        help="原生游戏可执行文件；默认 /opt/dwarffortress/dwarfort")
    parser.add_argument("arguments", nargs=argparse.REMAINDER, help="-- 后的参数原样传给游戏")
    args = parser.parse_args()
    arguments = args.arguments[1:] if args.arguments[:1] == ["--"] else args.arguments
    try:
        return launch(args.game, arguments)
    except KeyboardInterrupt:
        return 130
    except (OSError, RuntimeError) as error:
        print(f"启动失败：{error}", file=sys.stderr)
        return 1


if __name__ == "__main__":
    sys.exit(main())
