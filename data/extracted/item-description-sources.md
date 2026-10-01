# 物品描述的原生来源与组合语法

这份资料记录已安装 Windows `Dwarf Fortress.exe` 的离线反汇编来源，映像为 `PE:6a70a6d9:02711000`。机器可读目录是 `data/extracted/item-description-sources.tsv`，提取入口是 `tools/extract_item_description_catalog.py`。目录读取 PE、RTTI、虚表、展开信息、原生指令、已安装 RAW 和原生 Lua 文件；不运行游戏，不生成翻译数据，也不是检查报告。所有地址均为 RVA。

完整英文描述不能穷举成一张有限句子表。物品类型、材料、染料列表、品质、数量、名字、装饰、图像、书写和历史事件会相互组合；存档与模组还可以提供新名字和自由文本。这里提取的是生成这些描述的分派、字面量、动态字段和组合规则，不能用某个截图的完整句子代替生成语法。

## 1. 根集合与提取边界

物品类型由实际 MSVC RTTI `TypeDescriptor → CompleteObjectLocator → vtable` 枚举，不以现有翻译词表作为类型全集：

- **98 个物品 owner**：93 个具体类型，原生 `getType` 恰为 `0..92`；另有 `itemst`、`item_constructedst`、`item_actualst`、`item_body_componentst`、`item_critterst` 五个 `getType=-1` 基类。
- **16 个装饰 owner**：具体 `itemimprovement` 类型 `0..14` 和 `-1` 基类。类型 10 是页内插图；不能把它当作缺失的普通装饰句。
- **69 个 `general_ref` owner**：除类型、神器指针槽外，实际读取并跟随 `+90` 主题说明、`+98` 简称。书写详情 `cc5d50` 的主题是这些虚函数的产物，不能停在引用编号或几条样例上。
- **12 个 interaction source owner**：物品正文只对原生 kind 10 的 `item_description` 字段追加正文，其它 kind 不产生这段文字。

提取器明确列出 12 个共享/存储期生产入口，并从所有物品标题、冠词/图案虚槽及全部引用说明虚槽继续追踪直接调用和尾跳。当前目录保留 282 个函数正文、70 张选择表、3481 个选择器分支、4639 条原生字符串引用；这些是**来源记录数量**，不是翻译通过率。内嵌选择表按分支目标解码，不把表数据当指令。三个不使用普通 `cmp` 上界的乐器名称随机分派也单独解码，保留全部 6、6、41 个分支。

已有独立完整来源继续承担其子图，目录用 `external-catalog` 行记录文件与摘要：

| 子图 | 来源 |
| --- | --- |
| 图像元素、动作、神灵领域、共享名词 | `data/extracted/statue-art-sources.tsv`、`data/runtime/statue-description-grammar.md` |
| 艺术关联历史事件及事件集合标题 | `data/extracted/statue-history-sources.tsv` |
| 石板保存铭文的生成器、死亡原因、偏好、随机措辞 | `data/extracted/memorial-inscription-sources.tsv`、`data/runtime/memorial-inscription-grammar.md` |
| 所有物品标题 owner、共享材料/尸体标题 | `data/extracted/item-info-title-sources.tsv`、`data/extracted/map-hover-item-sources.tsv`、`data/extracted/corpse-caption-sources.tsv` |
| 物品子类型 RAW 的单复数及形容词 | `data/extracted/item-raw-title-sources.tsv` |

`bound-virtual-edge` 是已经由具体 owner 集合或明确槽来源绑定的边；`external-graph` 进入上表已有子图；`stored-art-boundary` 是可能创建图像的原生数据读取，不由提取器或翻译器调用。`import-edge` 保存实际 PE 导入 DLL/符号。直接调用闭包包含资源、存储及运行库依赖，其函数/字符串不能一概视为物品句子。

初次保留操作数的 181 条辅助间接边已继续逐类追踪：91 条绑定物品/引用虚槽、12 条返回结构数据、4 条进入已有完整文本子图、6 条提交 RAW 给加载器、50 条管理 RAW 错误弹窗/UI 生命周期、18 条文件/存储操作。最终目录保存 222 条 `bound-virtual-edge`、6 条 `external-graph`、340 条真实导入边；没有留作未归类的 `indirect-edge`。非正文调用的具体依赖仍保留，不把它们称为英文描述生产式。

其中四条辅助文本调用明确为 `eedda1 → history_event +d8`、`beb822 → history_event_collection +30`（`data/extracted/statue-history-sources.tsv` 完整类型图），以及 `145274a → art_image_element +38`、`14529da → art_image_property +28`（`data/extracted/statue-art-sources.tsv` 完整元素/属性图）。`eed42c` 的抽象建筑 `+10` 返回名称结构指针，文本由已提取的调用者生成。

主正文 `c75000` 和标题包装器 `c65450` 的间接边已区分物品 getter、装饰 kind、神器引用、power source kind、寄存器加载的品质 getter和可能创建艺术图像的调用。比如 `c7543c/c75487` 的 `call rdx` 实际由 `c7542c` 从物品虚槽 `+508` 读取，不是未知句子生成器。

## 2. 整段组合顺序与翻译入口

共享完整正文是 `c75000..c796aa`，名词分派为 `a82c10..a882fc`，标题包装为 `c65450..c65f0a`。标题包装含神器身份、品质、数量、磨损和抄本；不能把其中的名字、冠词、材料边界并入后面的正文。

| 原生家族 | 主要来源 | 实际翻译处理入口与数据 |
| --- | --- | --- |
| 基础物品句、数量、品质、作者、合身对象 | `c752f6..c7573a`，标题 `c65450`，名词 `a82c10` | `src/item_descriptions.inc` 的 source/term 解析；`data/runtime/item-description-translations.tsv`；标题 `src/fortress_item_captions.inc`；typed 路径 `src/history_item_base_semantics.inc` |
| 神器工艺 | `c755f0..c7569c`，职业选择 `1bb2e0/1bb330` | 同表职业捕获与 `src/history_item_base_semantics.inc` 的独立 craftsmanship 职业字段；种族职业词汇 |
| 食物所有原料、切碎/烹煮及品质 | `c75879..c75a0a` | `src/item_descriptions.inc` 食材叶子和组合；`src/history_item_base_semantics.inc`；原料共享物品名词 |
| 包覆、上釉、镶嵌、环带、垂环、尖刺 | `c75cd7..c765c6`、`c76e50..c77331` | `data/runtime/item-description-translations.tsv` 的 predicate/term；`src/history_item_improvement_semantics.inc` |
| 布料装饰及工艺、线/物体染色 | `cacd70`、`cad270`、`cadcb0` | 同表颜色/工艺/材质组合；`src/native_history_item_improvements.inc` 捕获，`src/history_item_improvement_semantics.inc` 构造 |
| 乐器部件、链/绳/滚轴/柄 | `c768fd..c76de9` | 同表部件名与材料组合；`src/history_item_improvement_semantics.inc`；`data/runtime/instrument-translations.tsv` 部件词汇 |
| 基础艺术图像、艺术装饰、缝制图像 | `c75809/c77443/c77650 → 1451b10` | `src/symbol_description.inc`、`src/item_descriptions.inc`；typed 图像 `src/history_item_extra_semantics.inc`；艺术及历史独立来源子图 |
| 骰子面集合、范围、朝上面 | `c778b2..c77d65`，`85da20` | 同表完整 face/series/number/WORD/图像组合；`src/history_item_extra_semantics.inc` |
| 表面文字、书页文字、体裁、风格和主题 | `cc6a10`、`cc7020`、`cc5d50`、`cc5520`，`general_ref +90` | `src/item_descriptions.inc` 书写句入口；`src/announcement_combat.inc` 的 work-sentence/work-reference；`src/legends_detail.inc`、`src/legends_books.inc` 的内容/标题解析；`src/history_item_writing_semantics.inc`；`data/runtime/legends-events.tsv`、`data/runtime/announcement-combat-grammar.tsv`、`data/runtime/announcement-reference-grammar.tsv` |
| 基础线及鞣革染色、未染色物品的材质图案 | `c77fd5`、`c782ab..c78c77` | 同表颜色句；`src/native_history_item_improvements.inc`、`src/history_item_improvement_semantics.inc` |
| 硬币、王权、年份、正反面图像 | `c78cf2 → 5beeb0` | 硬币 identity 和物品语法；`src/history_item_extra_semantics.inc`；正反面艺术共用 `1451b10` |
| 染料可产生的图案 | `c78d8b..c78df2` | `When used as a dye...` 句和 descriptor/material 叶子；typed extra 路径 |
| 石板、可读性、保存的铭文/著作 | `c78e24..c79129` | `src/history_item_slab_semantics.inc`；`data/runtime/memorial-inscription-grammar.tsv`；written-work 路径 |
| 磨损、软/硬材料及污染 | `c7913d..c7942f` | 同表磨损/污染句；`src/history_item_base_semantics.inc`、`src/history_item_extra_semantics.inc`；污染量 `>=100` 为 coated，较少为 spattered |
| 神秘能力的自带描述 | `c7943c..c794e0`，source kind 10 `+408` | 完整 item sentence/exact 语法；typed extra；RAW/Lua `IS_DESCRIPTION` |
| 工具自带说明 | `c79547/c7957c`，itemdef_tool `+188` | 工具描述完整句及乐器部件说明；`src/item_descriptions.inc`、`src/instrument_descriptions.inc`；typed extra |
| 乐器自带说明 | `c795e4/c79619`，itemdef_instrument `+278` | `src/instrument_descriptions.inc`、`data/runtime/instrument-translations.tsv`；同段乐器上下文与 typed extra |

地图/物品页面的正文收集与段落拼接仍在 `src/fortress_item_descriptions.inc`。翻译必须保留整段来源所属的物品上下文，再按句子、谓词、动态叶子处理；不能以屏幕某一行或某个英文单词当作唯一入口。

## 3. 染色不是一条固定完整句

截图中的句子来自共享原生染色组合，并不要求字符串表中存在整句：

```text
subject := The thread is | The material is | The object is
description := subject + descriptor_name
               + (quality > 0 ? ", " + quality_adverb + "colored" : "")
               + optional(" with " + dye_or_mixture)
               + optional(" by " + masterwork_maker) + "."
```

`descriptor_name` 是 **`descriptor_handler.colors`（全局 `24f70b8`）中颜色对象 `+50` 的 NAME**，可为多词颜色名；它不是材料名，也不是 `descriptor_handler.patterns`（`24f70e8`）中的图案描述。优先用染色 profile 保存的颜色编号，否则用材料的染料颜色；不存在时为 `gray`。未染色材质先取 BASE_COLOR 图案的首个颜色，再读取同一个颜色表。混合染料向量的数量只决定是否追加 `a mixture of` 和连接符，与颜色编号没有等同关系。

品质为 0 时没有逗号和 `colored`。因此 `The thread is pearl with a mixture of ...` 是正常原生产物。品质 1..5 分别是 `well-`、`finely `、`superbly `、`exceptionally `、`masterfully ` 加 `colored`；品质与染料是否存在独立，因此也有只含图案和 `, well-colored` 等品质、不含 `with` 的句子。

主要路径如下：

- `THREAD=57`：已染基础线在 `c78336..c78759` 以 `The thread is` 开头。
- `SKIN_TANNED=55`：已染鞣革在 `c7882a..c78c77` 以 `The material is` 开头。
- `CLOTH=58`：在 `c77fd5` 使用 `+6b0` 的未染色基本材质图案。线/鞣革的未染色回退也用 `The material is`。
- 装饰线 `cad270` 和物体着色 `cadcb0` 是独立辅助函数，品质为 0 时同样不生成 `colored`。

必须分别保留材料状态：基础线/鞣革的混合和直接单染料都经 `14d1920` 取 **POWDER**；装饰染色辅助函数的混合分量取 POWDER，直接单染料分支取 **SOLID**。不能因截图都是 `dye` 就混用。向量以 `(material type, material index)` 去重并保留顺序；两个分量用 `and`，三个以上带原生逗号/`and`。人名来源材料还具有原生所有格和材料前缀，不能仅按空格切词。

## 4. 存储期乐器生成器和原生覆盖缺陷

只追踪 `c75000` 的运行时调用会漏掉乐器说明：正文只复制 `itemdef_instrument +278`。其原生写入源是 **`ebe8a0..ecc30c`**，音域说明为 **`eb6fe0..eb757b`**。本目录追踪整个 writer 和所有直接子生产函数，也包括为工具部件写入的 `[DESCRIPTION:...]`。

完整乐器家族包括空气/水驱动结构、弦乐结构、吹管/簧管、打击乐、部件/材料、演奏动作、调音、音域、音色、音区。起句后许多句子没有 `instrument` 一词，例如 `The musician...`、`Tuning...`。不能每句重新用 `instrument` 关键词裁定所属语法；已由起句语法确立的同段上下文需要延续。

起句主要来源为 `ec03d4`、`ec3f4a`、`ec73aa`、`ec9d46`。它们分别组合 `The `、原生生成名称、` is a `、体型/材料/乐器家族以及后续结构。不能把“看起来像名字的任意英文”作为接受条件。

另有必须保留的**原版字符串覆盖行为**：

- `ec4777` 取 `the` 后，`ec477e` 调用的是字符串 **assign `6f580`**，随后 `ec4783` 追加 ` string by stopping it against the neck.  `。
- `ec47d4/ec47db` 同样 assign `the`，随后 `ec47e0` 追加 ` string by stopping it against the body.  `。

单弦分支因此会覆盖已生成的前文，最终保存说明可以直接从这两个残缺句子开始。它们是明确原生产物，应在物品描述的乐器语法中处理，不能要求一个已被原版覆盖的乐器起句存在。

## 5. 从来源追踪得到的处理修正

本轮处理针对生成家族而非截图完整字符串：

1. 染色保留无品质、五档品质、有/无染料、单染/混染、制作人、三种主语及基础/装饰材料状态差异；混合数量与 descriptor pattern 独立。
2. 神器工艺从 `All ` + **种族 CRAFTSMAN 职业单数** + `ship is of the highest quality.` 组合。typed 数据保留独立职业字段，文本语法使用职业捕获，避免只处理 `craftsmanship`。
3. 乐器后续句共享已建立的段落上下文；同时保留上述两个可独立出现的原生残缺句分支。
4. 书写句接入完整 written-work/reference 语法；家系主题使用著作引用语法；`general_ref_item_type +90` 的 `a ` + 完整物品词组接入 `$item`，保留物品名内部的原生标点；含引号的问号句界仍保持为完整书写句。
5. 石板绑定描述同时处理有神名与无神名的原生分支，不能因神名缺失而丢弃整段。

这些源码和数据修正没有使来源目录变成游戏显示结果。目录不记录游戏内观察；任意未来模组作者新增的自由 `DESCRIPTION` 也不是当前有限原生常量集合，必须继续按它的实际 RAW 或生成器来源处理。

## 6. 动态数据资料

`raw-token` 行保留已安装 vanilla 和 installed_mods 的 owner、token、文件与行号，包含材料状态/前缀与模板继承、物品子类型、种族/种姓、descriptor NAME、形状、职业及程序名称词形。`lua-production` 保留描述模板所在的原生 Lua 表达式；`lua-source-file` 链接完整的 materials、divine、evil、item_power 生成器及文件摘要，不执行生成过程。

运行提取器只更新来源目录，不修改翻译表或进行构建：

```powershell
& 'C:\Users\WIN11\.cache\codex-runtimes\codex-primary-runtime\dependencies\python\python.exe' 'D:\program\steam\steamapps\common\Dwarf Fortress\dfcn\tools\extract_item_description_catalog.py'
```

这个命令是离线反编译资料提取入口，不能替代项目规定的唯一代码编译部署入口。
