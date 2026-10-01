# 雕像历史关联与组织来源

本文件记录本次对安装目录 `Dwarf Fortress.exe` 的离线反汇编来源，不是测试报告，也不表示观察过游戏内最终显示。配套的 `data/extracted/statue-history-sources.tsv` 保存实际指令、字面量地址、调用边与枚举分支；源映像 SHA-256 写在该表开头。

## “全部”的范围和依据

提取器 `tools/extract_statue_history_catalog.py` 从 PE 内全部 `history_event*st` 的 MSVC RTTI 类型描述符、Complete Object Locator 和实际 vtable 发现根函数，不以现有翻译词条或手工函数清单筛选。当前映像中有 133 个具体事件类、18 个具体事件集合类，以及返回类型 -1 的两个抽象基类。具体类的类型 getter、vtable、RTTI 描述符和 COL 地址全部保存在 `concrete_rtti` 行，抽象类保存在 `abstract_rtti` 行。

每个事件读取 vtable `+0xd8` 的事件主题生成器，每个集合读取 `+0x30` 的标题生成器。151 个根入口沿直接调用递归展开；共享实现只记一份函数，调用边保留其来源。事件/集合递归的间接调用重新指向这一完整根集合，不只选择截图里的事件。

本次来源中展开了 328 个函数，保存 3,274 处字面量引用。79 个编译器跳表均已恢复，共有 3,088 个 selector→目标地址条目，包括先经过 byte remap 的稀疏枚举。`switch` 行保留读取字段、范围判断、偏移/索引运算和表地址的反汇编上下文；`switch_case` 中 selector 是这些运算之后的表选择值，不冒充未经变换的游戏枚举。随后从函数入口沿实际条件分支和恢复的跳表遍历，避免把末尾嵌入的表数据反汇编成伪调用。没有把枚举 `jmp register` 留成未知分支。

`literal` 是指令引用的固定文本，包括空格、标点、LPAGE 标记和编译器分段复制的字符串尾部；不是把附近的字符串拼成假想句子。人物昵称、生成名称、RAW 中的材料/物种/职位和存档里的事件参数是动态字段，无法列成有限的完整成句清单。来源表完整保存它们进入哪一类生成器的边界。

## 原生总流程

艺术图像总描述函数为 RVA `0x1451b10..0x145312c`。历史分支位于 `0x1452a20..0x1452b99`：

1. 完整描述启用时，读取 `art_image.event`（`+0x30`）。事件 ID 有效且能找到对象，才输出 `The artwork relates to `。
2. `0x1452aaa` 调用事件 vtable `+0xd8`。这里输出名词性事件主题，使用共享的全部历史事件规则；不是调用独立的“雕像事件表”。
3. 原生集合列表逆序查找包含该事件 ID 的首个集合；命中时追加 ` during `，并在 `0x1452b4d` 调用集合 vtable `+0x30`。
4. 输出 `.  `。事件自身的位置、人物、物品、理由和日期由事件主题生成器及其共享 helper 提供。

既有代码在 `src/native_history_item_extras.inc` 采集事件和集合，在 `src/history_item_extra_semantics.inc` 通过 `story(event_id)`、`collection_title` 组合成相同结构。文本入口复用 `data/runtime/legends-events.tsv` 中 `The artwork relates to {e}.`，事件主题及日期由 `src/legends_detail.inc` 的 `translate_legends_event` 处理。`tools/legends_grammar.py` 为事件主题生成地点、荒野、年份和集合修饰的组合。

日期共享生成器为 `0xb92640`；人物 `0xb92f10`、组织 `0xb92900`、地点 `0xb93930`、地表工程 `0xb93a90`、抽象建筑 `0xb94090`、造物/著作 `0xb94400`、生成名字 `0xa946e0`。这些 helper 的直接调用和固定文本均在表内展开，名称与材料字段继续复用原有词汇及结构化语义入口。

## 全部集合标题入口

| 集合类型 | RVA | 生成内容 |
|---|---:|---|
| war、battle | `0xbc56b0` | 原生名称，可附带英文释义 |
| duel | `0xbc57f0` | Duel of 与相关对象 |
| site_conquered | `0xbc59a0` | Pillaging、Conquest、Surrender、Destruction |
| entity_overthrown | `0xbc5bc0` | Overthrow of |
| persecution | `0xbc5d10` | Persecution of |
| purge | `0xbc5e60` | Purge in |
| insurrection | `0xbc5fc0` | Insurrection in |
| abduction | `0xbc60f0` | Abduction，可带 Attempted、荒野或地点 |
| raid | `0xbc63a0` | Raid of，地点或荒野 |
| theft | `0xbc6520` | Theft，可带 Attempted、荒野或地点 |
| beast_attack | `0xbc6880` | Monster、Rampage 与地点/荒野 |
| journey | `0xbc6ba0` | Journey |
| occasion | `0xbc6da0` | Occasion of 或 The Occasion |
| performance | `0xbc6fd0` | Storytelling、Poetry Recital、Musical/Dance Performance、Performance |
| competition | `0xbc7270` | 舞蹈、音乐、诗歌、陆空/物种赛跑、摔跤、投掷、角斗及默认 Competition |
| procession | `0xbc7780` | Procession |
| ceremony | `0xbc79b0` | Opening、Closing、Main 或默认 Ceremony |

重复举行的集合序号、命名集合、活动名称及地点仍由集合自己的字段和共用标题规则提供，不能从表内相邻词语猜测次序。

## 象征与委托分支

`0x1452ba5..0x14530bb` 仅在 `specific_ref_type=24`、组织引用和索引有效时追加。组织 `resources.art_image_types[index]` 为 0 时输出 `The image is the symbol of`，为 1 时输出 `The image was commissioned by`。有名称的组织先输出名字和逗号；随后原生固定输出 `a `，再拼类别修饰、可选物种形容词和组织类型。

| type | 类型文本 | 类别修饰 |
|---:|---|---|
| 0 | civilization | 无 |
| 1 | government | local |
| 2 | vessel | 无 |
| 3 | group | migrating |
| 4 | group | nomadic |
| 5 | religion | 无 |
| 6 | military organization | 无 |
| 7 | group | outcast |
| 8 | performance troupe | 无 |
| 9 | merchant company | 无 |
| 10 | 职业名称 + guild，缺省 craft guild | 无 |

职业标签调用 `0x132cc10`；采用组织职业记录的首个 type=0 项，并使用玩家种族的职位词形。既有 `data/runtime/item-description-translations.tsv`、`src/native_history_item_extras.inc` 和 `src/history_item_extra_semantics.inc` 已提供上述全体类别及有名/无名组合，本次不重复增加同义词条。

## 间接调用边界

来源表的 324 个间接 call 均保留调用地址和原始操作数，并按下述来源分类。分类不意味着运行了这些调用。

- `import`：由 PE 导入表恢复实际 DLL/符号，包含 `_invalid_parameter_noinfo_noreturn` 等运行库和文件接口；它们不提供正常艺术描述句式。
- `history-event-subject`：`0xb65093`（杰作损毁回指创建事件）及 `0xb8c43b`（讲述历史故事）再次分派全部事件 `+0xd8`。
- `history-collection-title`：`0xb5b576` 的历史理由引用集合 `+0x30`，指向全部18个集合根。
- `typed-reference-getter`、`typed-reference-kind`：对象引用的类型/造物指针、复活或部队引用类别；返回结构字段或枚举，文字分支已在调用者展开。
- `abstract-building-kind`、`world-construction-kind`：建筑及工程类别，分别由 `src/native_history_structures.inc`、`src/native_history_geography.inc` 提供对应结构语义。
- `artifact-book-identity`：造物的物品类型、工具用途决定著作或物品名称入口，沿用 `src/native_history_items.inc`、`src/legends_books.inc`。
- `item-description-boundary`：`0xa82c10`、`0xc65450` 的物品名称/品质/磨损等虚函数。物品标题的各类实际目标已有 `data/extracted/item-info-title-sources.tsv`，RAW 名称见 `data/extracted/item-raw-title-sources.tsv`；完整雕像/小塑像与其他艺术物品分支由同次的艺术来源表记录。这里不把所有物品 getter 声称为已展开的历史事件函数。
- `source-storage-dispatch`、`runtime-dispatch`：艺术图像 chunk、压缩文件/资源加载和 MSVC 异常处理。只保留离线调用来源，不加载存档、不调用游戏函数。

本次的翻译修复仍使用共同的名称、物品、动作、事件和集合解析入口；不收录某个世界的完整雕像描述，也不以字面量数量或编译结果替代游戏内实际效果。
