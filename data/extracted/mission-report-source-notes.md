# 任务报告原生文本来源

`data/extracted/mission-report-sources.tsv` 是当前 Windows `Dwarf Fortress.exe` 的离线反汇编源目录。它记录原生函数、指令、字面量、调用边、跳表和既有翻译源文件之间的关系，不是测试结果，也不表示已经观察到游戏内显示。映像 SHA-256 写在表头；地址均为 RVA，加载基址为 `0x140000000`。

## 正文范围

任务报告没有按事件类型过滤正文。正常播放入口的函数范围为 `0x1bf520..0x1c17dc`，在 `0x1bff9d`、`0x1c09f6` 调用事件的 vtable `+0xd0`。跳过播放入口为 `0x1d3ac0..0x1d84e4`，从 campaign 的 `+0x404` 事件 ID 数组和 `+0x704` 数量取事件，经 `0x7da30` 查找后在 `0x1d3cfb` 调用同一个 `getSentence` 槽位。随后在 `0x1d3d38` 调用 `0x8e7310`，按原生宽度 53 包装文本。正文绘制调用在 `0x1d0622`。

这些入口使用 `0x72080` 构造的默认事件上下文：`flags=0`、第四参数为真、第五参数为假。这里必须保留报告自己的上下文，不能直接套用传说页 `flags=2` 的上下文。

目录从 PE 的 MSVC RTTI、Complete Object Locator 和实际 vtable 发现全部具体类，而非从截图句子或现有词条选择类型：

- 133 个具体事件类的 `+0xd0` 完整句子入口，对应原生类型 `0..132`。
- 133 个 `+0xd8` 事件主题入口，供杰作损毁、讲述历史和其他嵌套事件引用使用。
- 18 个 `+0x30` 事件集合标题入口，供战争、战斗、劫掠、旅程、节庆等嵌套历史背景使用。
- 两个抽象基类单独保留 RTTI 来源，不冒充具体事件。

这 284 个根及标题、月份 helper 展开为 470 个函数。目录保留 5,886 处固定字面量引用、135 个函数内跳表、4,257 个选择值条目（含报告动作及日期后缀的两个专用表），以及全部直接和间接调用来源。这些数字描述静态源数据的规模，不是翻译通过率。

函数字段采用 PE unwind 的原始 owner，并包含 chained unwind 的后续区域。反汇编后沿条件分支及恢复的跳表遍历；表中的选择值是原生归一化、偏移或 byte remap 之后的值，不能直接当成未经变换的游戏枚举。`literal` 行保留标点、空格、LPAGE 标记及编译器分段复制的字符串尾部，不将相邻字面量拼成假想句子。

## 标题及日期

标题生成函数为 `0x9df530`，报告专用文本范围为 `0x9df8dc..0x9dfb98`。原生结构为 `Mission Report: `、动作与对象、` (Set out `、季节、年份、`)`。动作按 goal 分派：

| goal | 原生标题分支 | 对象来源 |
|---:|---|---|
| 2 | Raid、Explore、Pillage、Demand tribute from、Raze、Take over、Seize | 地点 `0xb93930`；Raid 同时是 raid type 的默认分支 |
| 17 | Recover | 神器/著作 `0xb94400` |
| 18 | Rescue | 历史人物 `0xb92f10`，默认事件上下文 |
| 19 | Request workers from | 地点 `0xb93930` |
| 25 | 外交提案标题、` at `、地点 | `0x1bb400` 与 `0xb93930` |
| 其他 | 无动作文字，继续追加出发时间 | 原生默认分支 |

`0x1bb400` 完整包含 Demand surrender、Make peace、Declare war、Seek alliance、Make contact、Improve trade，以及默认 Diplomacy。出发季节包含 Spring、Summer、Autumn、Winter；该源目录保存各自指令及字符串地址。

报告标题从 `report+0x28` 绘制。其下独立日期来自 `viewscreen_worldst+0x83b8` 年份和 `+0x83bc` tick，按每月 28 日换算。`0x1cfe0b..0x1cff24` 保存日期组合来源，`0x773390` 保存全部 12 月名称；st、nd、rd、th 的选择表与标点也单独记录。

## 翻译源与动态文本边界

每个事件的 `semantic_binding` 行指向该类型对应的字段采集和中文组合源码。类型 18、64、73 分别由 `ArtifactCreated`、`CreateEntityPosition`、`HfGainsSecretGoal` 专用分支处理；其余类型位于 `history_semantics_early/middle/late/late_aux/justice/occasions.inc`。它们共用 `data/runtime/legends-events.tsv`、历史名称和历史附属分句，不另建截图专用句表。

本次定位到类型 103（`entity_searched_site`）错误进入类型 105 的人物行为组合，而原生 103 的字段是组织、地点和搜索结果。完整正文接入仍以全部事件根为范围；该语义错误在共有事件组合中修正。标题源另外揭示 Rescue 和 Recover 的人物/神器对象分支，不能只按地点标题解析。

有限字面量不能列尽存档中的人物姓名、组织名、地名、书名、昵称、材料、物种或用户自写文字。目录明确记录这些字段的原生边界：日期 `0xb92640`、组织 `0xb92900`、人物 `0xb92f10`、地点 `0xb93930`、工程 `0xb93a90`、建筑 `0xb94090`、神器 `0xb94400`、程序名称 `0xa946e0`。中文继续使用既有的结构化名称、物品、材料、RAW 和著作翻译入口，不枚举本世界的成句。

间接调用分别标注为嵌套事件/集合、类型 getter、建筑名称、神器身份、物品描述、存储接口或运行库。物品虚函数边界还关联 `data/extracted/item-info-title-sources.tsv`、`data/extracted/item-raw-title-sources.tsv`、`data/extracted/statue-art-sources.tsv`、`data/extracted/statue-history-sources.tsv`。存储、分配及异常支持只保留来源边，不把它们作为正常报告词汇，也没有执行游戏函数或加载存档。
