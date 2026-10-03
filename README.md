# DFCN · 矮人要塞简体中文汉化

[![License: CC BY-NC-SA 4.0](https://img.shields.io/badge/License-CC_BY--NC--SA_4.0-lightgrey.svg)](https://creativecommons.org/licenses/by-nc-sa/4.0/)

DFCN 是 **Byayoi 同人社区**的《Dwarf Fortress（矮人要塞）》汉化作品，结合社区译文与本地修订，让中文玩家更方便地阅读游戏界面、人物信息、物品描述和传说故事。

社区官网：[byayoi.org](https://byayoi.org/)

项目在游戏渲染阶段捕获英文文本，通过词表与语法规则生成中文，再进行字形测量、换行和覆盖绘制，不修改游戏 RAW 或存档。提供 Windows 与 Linux 原生适配，当前适配版本为 **53.16**；Windows 支持 Steam 版与官网免费版。

## Windows 安装与使用

当前运行包适用于 **Dwarf Fortress 53.16 / Windows x64**，无需编译，也无需安装 DFHack 或其他外部 Mod。

**Steam 创意工坊：**订阅 [DFCN 汉化](https://steamcommunity.com/sharedfiles/filedetails/?id=3811193379) 后，运行文件位于 `你的 Steam 库目录/steamapps/workshop/content/975370/3811193379/DFCN/`。仅将其中的 `dfhooks.dll` 和 `dfhooks_dfcn.ini` 复制到包含 `Dwarf Fortress.exe` 的游戏根目录，其余文件留在订阅目录。游戏与订阅内容位于同一 Steam 库时，游戏目录中 `dfhooks_dfcn.ini` 的第一行使用：

```text
../../workshop/content/975370/3811193379/DFCN/dfcn/dfhooks_dfcn.dll
```

如果位于不同 Steam 库，将第一行改为该 DLL 的实际绝对路径；只写路径，不加引号或 `key=value`，保存为 UTF-8 无 BOM。汉化设置 `config.ini` 留在订阅目录的 `DFCN/dfcn/data/runtime/` 中。完整路径示例、旧版迁移与卸载方法见 [工坊详细说明](https://steamcommunity.com/sharedfiles/filedetails/?id=3811193379)。

**GitHub Release：**从 [v53.16-20261003](https://github.com/pokemonchw/dfcn/releases/tag/v53.16-20261003) 下载 `DFCN-Windows-x64-minimal.zip`，解压后将全部内容按原有目录结构复制到游戏根目录，包括 `dfhooks.dll`、`dfhooks_dfcn.ini` 和整个 `dfcn` 文件夹。此方式的汉化设置位于游戏目录的 `dfcn/data/runtime/config.ini`。

汉化核心、配置与翻译数据按汉化模块所在目录定位，因此支持将运行文件保留在工坊目录。游戏中按 **Shift+F10** 开启或关闭汉化。安装仅添加汉化自身文件，不改写磁盘上的游戏本体、RAW 或存档；取消订阅不会删除已复制的入口文件，卸载时需手动移除自己安装的汉化文件。

Windows 同时安装 **DFHack 53.16-r2** 时，可按 **Shift+F11** 关闭 DFHack，再按一次恢复。开关独立于汉化：关闭时暂停插件更新、界面 hook、热键、命令与 Lua 定时回调，保留驻留核心、插件配置、存档数据和世界卸载清理。已打开的 DFHack 界面会关闭；已执行的游戏或存档修改不会回滚。

## 技术栈

- **C++20**：原生加载器、汉化核心、文本捕获与界面排版。
- **SDL2 与字体渲染**：中文绘制；Linux 使用 FreeType / Fontconfig，Windows 使用 GDI。
- **TSV / TOML + [toml++](https://github.com/marzer/tomlplusplus)**：维护词表、配置和递归翻译规则，处理动态名称与组合句式。
- **Python**：原文提取、翻译数据整理、原生绑定生成及构建部署工具。

## 上游参考与致谢

- [DFHack / dfhooks](https://github.com/DFHack/dfhooks) 与 [df-structures](https://github.com/DFHack/df-structures)：加载入口与游戏结构定义参考。
- [DFI18n 简体中文数据](https://github.com/DFI18n/dfi18n-data-zh-hans) 与 [dfint 翻译数据](https://github.com/dfint/translations-backup)：基础译文及生物、动植物等文本。
- [dfzh](https://github.com/wodzys/dwarf-fortress-chinese)：词表、TOML 规则及递归翻译引擎。
- [ECDICT](https://github.com/skywind3000/ECDICT)：程序生成词汇的英汉释义参考。

感谢矮人要塞中文维基翻译组及各上游项目的贡献者。第三方代码与数据遵循各自许可，翻译数据署名及许可详情见 [THIRD_PARTY_NOTICES.md](THIRD_PARTY_NOTICES.md)。

## Codex 的贡献

本项目使用 **OpenAI Codex** 协助开发与维护，参与代码编写、跨平台适配、翻译规则整理、中文渲染与排版修复，以及构建部署工具和文档编写；开发工作结合社区译文、维护者需求与玩家反馈持续推进。

## 许可

本项目原创内容采用 [CC BY-NC-SA 4.0（署名—非商业性使用—相同方式共享）](https://creativecommons.org/licenses/by-nc-sa/4.0/)，完整条款见 [LICENSE](LICENSE)。使用时须保留署名、遵守非商业限制，分享改编成果时采用相同许可。

第三方代码、译文及其他上游资源保留各自许可与署名，详见 [THIRD_PARTY_NOTICES.md](THIRD_PARTY_NOTICES.md) 及对应许可文件。

更多技术与使用说明见 [README.zh-CN.md](README.zh-CN.md)。
