"""Package the existing Linux runtime without building or deploying code."""

from pathlib import Path
import os
import sys
import tempfile
import zipfile


ROOT = Path(__file__).resolve().parents[1]
RUNTIME_FILES = (
    "libdfcn_core.so", "libdfhooks.so", "LICENSE", "data/runtime/config.ini",
    "data/runtime/translations.tsv", "data/runtime/name-editor.tsv",
    "data/runtime/instrument-translations.tsv", "data/runtime/adventure-target-translations.tsv",
    "data/runtime/procedural-terms.tsv", "data/runtime/procedural-word-senses.tsv",
    "data/runtime/dfhack-help-translations.tsv", "data/runtime/dfhack-help-overrides.tsv",
    "data/runtime/dfhack-help-command-overrides.tsv", "data/runtime/dfhack-output-core.tsv",
    "data/runtime/dfhack-output-translations.tsv", "data/runtime/dfhack-output-stonesense.tsv",
)
LICENSE_FILES = (
    "data/upstream/licenses/dfi18n-data.LICENSE.md", "data/upstream/licenses/dfzh-data.LICENSE.md",
    "third_party/dfzh-rules-engine.LICENSE", "third_party/tomlplusplus/LICENSE",
    "third_party/dfhooks.LICENSE", "data/upstream/licenses/ECDICT.LICENSE",
    "third_party/dfhack-help.LICENSE", "third_party/lua-output.LICENSE",
)
INSTALLATION = """DFCN Linux x64 / Dwarf Fortress 53.16

此包同时提供 Steam 版与官网免费版的地址绑定，由核心自动选择。
将 libdfhooks.so 和整个 dfcn 文件夹解压到包含 dwarfort 的游戏根目录。
保留游戏原有文件、RAW、存档和设置。无需 DFHack。

这是使用维护者当前 Linux 原生环境构建的运行包，依赖系统的 SDL2、
FreeType、Fontconfig、C++ 运行库及 glibc；不包含这些系统依赖。
未内置字体时，Fontconfig 选择系统已安装的中文无衬线字体。
汉化配置位于 dfcn/data/runtime/config.ini。
运行包不包含游戏程序、源码、本机路径配置或生成工具。
"""


def notices() -> str:
    parts = ["# Minimal runtime: third-party attribution and licenses\n",
             (ROOT / "THIRD_PARTY_NOTICES.md").read_text(encoding="utf-8")]
    for relative in LICENSE_FILES:
        parts.extend([f"\n## {relative}\n", (ROOT / relative).read_text(encoding="utf-8")])
    parts.append("\n## data/upstream/objects.zh-Hans.po translator credits\n")
    with (ROOT / "data/upstream/objects.zh-Hans.po").open(encoding="utf-8") as source:
        for line in source:
            if not line.startswith("#"):
                break
            parts.append(line.rstrip("\n"))
    return "\n".join(parts)


def package() -> None:
    if sys.platform != "linux" or len(sys.argv) != 1:
        raise RuntimeError("Use package-linux.sh on Linux without arguments.")
    output = ROOT / "DFCN-Linux-x64-minimal.zip"
    descriptor, name = tempfile.mkstemp(prefix="DFCN-Linux-x64-minimal.", suffix=".tmp", dir=ROOT)
    os.close(descriptor)
    candidate = Path(name)
    try:
        with zipfile.ZipFile(candidate, "w", compression=zipfile.ZIP_DEFLATED, compresslevel=9) as archive:
            archive.write(ROOT / "libdfhooks.so", "libdfhooks.so")
            for relative in RUNTIME_FILES:
                archive.write(ROOT / relative, "dfcn/" + relative)
            for source in sorted((ROOT / "data/runtime/rulesets").rglob("*.toml")):
                archive.write(source, "dfcn/" + source.relative_to(ROOT).as_posix())
            for name in ("font.ttf", "font.otf", "font.ttc"):
                source = ROOT / "data/runtime" / name
                if source.is_file():
                    archive.write(source, "dfcn/data/runtime/" + name)
                    break
            for name in ("dfhack-help.LICENSE", "lua-output.LICENSE"):
                archive.write(ROOT / "third_party" / name, "dfcn/data/runtime/" + name)
            archive.writestr("dfcn/THIRD_PARTY_NOTICES.md", notices())
            archive.writestr("INSTALL.txt", INSTALLATION)
        os.replace(candidate, output)
        print(f"Created: {output}\nSize: {output.stat().st_size / 1024 / 1024:.2f} MiB", flush=True)
    finally:
        candidate.unlink(missing_ok=True)


if __name__ == "__main__":
    try:
        package()
    except (OSError, RuntimeError, zipfile.BadZipFile) as error:
        print(f"Packaging failed: {error}", file=sys.stderr)
        raise SystemExit(1)
