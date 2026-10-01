# DFCN · 矮人要塞简体中文汉化

[![License: CC BY-NC-SA 4.0](https://img.shields.io/badge/License-CC_BY--NC--SA_4.0-lightgrey.svg)](https://creativecommons.org/licenses/by-nc-sa/4.0/)

DFCN 是 **Byayoi 同人社区**的《Dwarf Fortress（矮人要塞）》汉化作品，结合社区译文与本地修订，让中文玩家更方便地阅读游戏界面、人物信息、物品描述和传说故事。

社区官网：[byayoi.org](https://byayoi.org/)

项目在游戏渲染阶段捕获英文文本，通过词表与语法规则生成中文，再进行字形测量、换行和覆盖绘制，不修改游戏 RAW 或存档。提供 Windows 与 Linux 原生适配，当前适配版本为 **53.16**；Windows 支持 Steam 版与官网免费版。

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
