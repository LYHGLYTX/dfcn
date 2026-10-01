# 雕像／小塑像描述的原生生成语法

本文件是当前 Windows 游戏二进制的离线反汇编重建资料，不是截图文本清单或检查报告。所有地址均为 `Dwarf Fortress.exe` 的 RVA，映像标识为 `PE:6a70a6d9:02711000`。提取入口为 `tools/extract_statue_art_catalog.py`，机器可读来源为 `data/extracted/statue-art-sources.tsv`；历史事件与事件集合标题的递归来源另见 `data/extracted/statue-history-sources.tsv`。

范围修正：上述艺术图像生成链不包含纪念石板已保存的铭文。纪念碑是独立的 `cc23e0..cc5384` 生成链，先前不能据此文档宣称所有物品文字已处理；其完整原生分支另见 `data/extracted/memorial-inscription-sources.tsv` 及对应生成语法资料，翻译入口为 `data/runtime/memorial-inscription-grammar.tsv`。

雕像描述是一个生成器，不是一组有限的完整英文句子。人物姓名、玩家昵称、神器名、材料、数量、多个描绘对象及其动作、历史事件能够相互组合。完整处理的单位因此是下列全部原生分支、枚举表、动态字段和组合顺序，不能用若干截图例句代替。来源表保留函数边界、字符串引用指令、字面量地址、虚表槽、所有动作枚举跳转目标，以及共享物品描述函数的完整来源超集。

## 1. 实际入口及调用图

| 生成器 | RVA | 调用／数据来源 |
| --- | --- | --- |
| 雕像、小塑像标题 | `ca0b40..ca0bc2` | `item_statuest`、`item_figurinest` 的标题虚函数；先 `ca5bb0`，再按 `item+108` 的字符串长度追加 ` of ` 和 `item+f8` 的对象摘要 |
| 基础物品标题 | `ca5bb0..ca5d62` | 获取类型、子类型、材料、材料编号、数量和制作种族等字段，在 `ca5d45` 调用共享物品名 `a82c10` |
| 共享物品名 | `a82c10..a882fc` | 完整物品类型选择、材料前缀、数、RAW 名称、部位、品质／尺寸等；也是图像中的物品元素所用的名词路径 |
| 物品完整说明 | `c75000..c796aa` | 首句、工艺、作者、基础图像、所有装饰、附加图像、文字、材料状态、磨损、污染 |
| 图像完整段落 | `1451b10..145312c` | 位置、摹作、设计品质、元素列表、材料、创作者、动作列表、历史事件、组织关系 |
| 神器／书籍物品身份 | `c65450..c6571d` 及续段 `c6571d..c65f0a` | 图像物品元素的有名／无名神器分支；包含 `(copy)`；续段仍属于同一物品标题分派 |
| 材料名 | `14d1920..14d1d79` | 本地材料类型／编号的名词形式 |
| 生物／种姓名 | `aa3bd0..aa3d93` | RAW 种族、种姓、单复数 |
| 人名、生成名称 | `a94030..a946d1`、`a946e0..a94ea2` | 原生名字结构，包含昵称、名字、词根生成名及冠词 |

`1451b10` 的全部直接调用位置为：

* `1aa00b`：雕刻说明。
* `212648`、`21307b`：艺术图像预览。
* `5bf82f`、`5bf8d1`：硬币两面。
* `c75809`：物品自身图像，placement = 4。
* `c77443`、`c77650`：两类物品图像装饰，placement = 16。
* `d4c350`：艺术作品页面。

雕像的基础物品图像在 `c75758` 经物品虚表 `+230` 取图像引用；`c757b1` 解析引用，然后在 `c75809` 调用上述同一段落生成器。原版可能在引用尚未生成时调用 `cc84d0`／`cc83e0` 创建或更新图像，离线提取及翻译读取均不调用这些有副作用的生成函数。

## 2. 段落组合顺序

```text
完整物品描述 := 基础物品句 工艺句? 基础艺术图像? 装饰说明*
                附加艺术图像* 其它物品信息* 磨损句? 污染句*

艺术图像段落 := 来源位置句? 主图像句 动作句*
                历史事件句? 组织关系句?

主图像句 := 位置前缀 图像名词 ".  "

图像名词 := 原图名词
          | 摹作品质? 摹作作者? " rendition of " 原图标题? 原图名词

原图标题 := 生成名称 ", "
原图名词 := 冠词 设计品质? " image"
            (" of " 元素列表)? (" in " 材料)? (" by " 创作者)?

元素列表 := 元素 | 元素 " and " 元素
          | 元素 (", " 元素)* " and " 元素
```

`of` 是由元素向量是否非空决定的：`14526d3..14526e9` 在元素数量为零时跳到 `14527cd`，明确跳过 ` of `。材料在之后独立追加，因此 **`an image in MATERIAL` 是合法原生产物**，不能套入 `image of {empty} in MATERIAL`。

`14529c0..1452a1e` 按属性向量顺序追加动作。`1452a20` 的调用标志决定是否继续事件和组织关系；省略历史信息不省略主图像或动作。链接开关只控制 `[LPAGE:...]` 包装，不改变名词边界；`[P]`、`[R]`、`[B]` 也是排版标记。

### 位置前缀

| placement | 产生文本 | 决策位置 |
| --- | --- | --- |
| 4 | `The item is a...` | `1452250` → `1452315` |
| 16 | `On the item is a...` | `1452259` → `1452306` |
| 17 | `On the front of the coin is a...` | `1452262` → `14522f7` |
| 18 | `On the coin's back is a...` | `145226b` → `14522e8` |
| 19 | `Engraved [on the floor / on the wall] is a...` | `1452273` → `1452290`；仅来源类型 7 带墙／地面，地面标志值 `2b` |
| 其它 | `It is a...` | `145227e` |

需要显示物理来源时，`1451c14` 通过来源对象 `+10` 的类型分派：0 为神器／书籍，5 为原物品，6 为硬币正反面，7 为墙／地面雕刻，8 为组织图像。由此产生 `This artwork appears on...`、`This work of art is a...`、`This engraving appears...`、`This artwork is a...` 等句式。它们使用同一个后续图像名词，不是独立的“雕像特例”。未命名神器具有 `an unknown artifact` 分支；地点不可用具有 `somewhere` 分支。

### 两套品质、作者和标题

| 值 | 原图设计品质（`image+bc`） | 摹作工艺品质（调用参数） |
| --- | --- | --- |
| 1 | `well-designed` | `well-crafted` |
| 2 | `finely-designed` | `fine` |
| 3 | `superiorly designed` | `superior` |
| 4 | `exceptionally designed` | `exceptional` |
| 5 | `masterfully designed` | `masterful` |
| 0／其它 | 不加设计品质 | 不加摹作品质 |

品质分支分别是 `1452631..14526b9` 和 `1452360..14523c6`，必须保留两层，不能将摹作品质覆盖原图品质。`a`／`an` 在这些分支内分片构造，所以字面量中的 `n exceptionally designed` 与完整语法里的 `an exceptionally designed` 是同一分支。

仅来源类型 8 且未请求物理来源摘要时进入 `rendition of` 分支（`1452357`）。复制作者与原图创作者不同才单独显示复制作者；复制作者位于 `rendition of` 前，原图创作者位于整个原图名词的 `by` 后。原图有名时保留 `image+38` 的完整生成名称及逗号。创作者品质抑制参数同时影响原图品质和创作者；名字的存在由原生 name 结构决定，不能以是否包含拉丁字母判定姓名是否有效。

## 3. 全部描绘元素和动态边

主图像在 `145274a` 通过元素虚表 `+38` 渲染；动作主语／宾语在 `146805`、`14683b` 和 `146f4b` 通过同一槽渲染，只切换定指形式。

| 元素类 | 虚表槽 RVA | 实际 formatter | 完整语法／动态字段 |
| --- | --- | --- | --- |
| 基类 | `15fe048` | `72280` | 清空结果；无名词 |
| creature | `15fdcc8` | `148320..148ecf` | 普通种族／种姓、历史人物、有名／无名神灵 |
| item | `15fdfa0` | `147b60..148112` | 物品类型＋子类型＋材料；有名／无名神器；有标题书籍；复制品 |
| shape | `15fdc28` | `147640..14790b` | RAW `SHAPE` 的 `NAME` 单复数和可选 `ADJ` |
| plant | `15fdd48` | `149120..14931e` | RAW 植物的 `NAME` 单复数 |
| tree | `15fdf38` | `149120..14931e` | 与 plant 共用实现，仍从该植物 RAW 取名 |

数量语法：count = 1 使用单数及不定冠词；count >= 2 追加完整原生数词再用复数；count = 0 表示不编号复数组。动作使用定指名词；具名人物可以只显示名字。原生数词由 `52e360` 生成，翻译路径保留数量的数值，不将数词作为姓名或材料的一部分。

人物无名时使用物种／种姓名；普通具名人物为 `NAME the SPECIES`。姓名中的玩家昵称是原生 name 字段，不属于必须翻译的英文常量，必须保留原文及其边界，不能被其中的引号、逗号、句点或 `and` 拆开。

神灵为 `[NAME, ]the deity of SPHERES, depicted as a FORM`。`FORM` 按原版次序包含 `skeletal`（flag `10`）、`rotting`（`20`）、`ghostly`（`80`），以及必要时 `female`／`male` 和种族／种姓名；种姓名称已区分性别时不重复追加。领域按原生领域向量反向输出，以逗号及 `and` 连接。

领域不是自由文本：`756690` 用 `757174` 的 **0..129 完整跳转表**取名，`756500` 用 `756614`／`75661c` 的次级表决定冠词。dawn、moon、night、rain、seasons、sky、stars、sun、weather、wind 前有 `the`。来源表的 `sphere` 行逐项保留编号、真实分支目标、名词 RVA 和最终冠词；没有只列截图中的领域。RAW 形状的全部名称和允许的 adjective×noun 组合也保留为 `raw-shape` 行。

物品元素的 `item+1c` 存的是物品 ID，`147bca` 反向搜索神器记录所关联的真实物品 ID。找到具名神器后输出神器名和物品说明；无名神器使用完整品质／磨损包裹的物品说明；不能把任何大写短语都推断为名字。基本名词的材料、部位、尺寸、原生陷阱部件形容词、嵌套 `statue of`／`figurine of` 仍由共享物品语法负责。

剩余间接边具有明确的类型边界：

* 物品 `+5e8` 标题、`+5f0` 可选冠词及各类型的 getter，由 `data/extracted/item-info-title-sources.tsv`、`data/extracted/map-hover-item-sources.tsv`、`data/extracted/item-raw-title-sources.tsv` 保留已有物品类型绑定；雕像与小塑像的标题目标均为 `ca0b40`。类型／材料／质量／数量 getter 返回字段；冠词槽与完整标题槽分别处理。共享名词 `a880e0` 的全部 93 个物品类型跳转项目也保留在本次来源表。
* 生物、种姓和植物 RAW 名称经 `data/runtime/creature-name-vocabulary.tsv`、既有生物描述规则与植物词表解释；程序生成生物也走同一完整种族描述入口。
* 名称词根、昵称和材料通过既有名称／材料路径解释；其运行时组合不是固定英文表。
* 历史事件 `+d8` 与集合标题 `+30` 进入另一个完整类型分派图，见第 5 节及 `data/extracted/statue-history-sources.tsv`，不能只依据雕像截图选择几个事件。
* 字符串追加、复制、数值格式化、容器查询、内存释放和链接格式化只承担操作；来源表记录其调用位置，但不将这些通用函数称为另一套艺术描述语法。

## 4. 全部动作枚举

属性基类 `15fdda0 → 72280` 产生空文本。两种实际属性分别是 `15fddd8 → 146750`（及物）和 `15fde10 → 146eb0`（不及物），调用槽为 `+28`。

及物分派表为 `146dec`，索引是 verb − 1，覆盖 1..46；不及物分派表为 `147580`，直接覆盖 0..47。下表每格为空表示该 kind 的原生默认分支；**默认分支仍输出主语及句点**。

| verb | 及物谓语（`is/are ... OBJECT`） | 不及物谓语（默认 `is/are ...`） |
| --- | --- | --- |
| 0 | — | withering away |
| 1 | surrounded by | — |
| 2 | massacring | — |
| 3 | fighting with | — |
| 4 | — | laboring |
| 5 | greeting | — |
| 6 | refusing | — |
| 7 | speaking with | — |
| 8 | embracing | — |
| 9 | striking down | — |
| 10 | — | striking a menacing pose |
| 11 | — | traveling |
| 12 | raising | — |
| 13 | hiding | — |
| 14 | — | looks/look confused |
| 15 | — | looks/look terrified |
| 16 | devouring | — |
| 17 | admiring | — |
| 18 | burning | burning |
| 19 | — | weeping |
| 20 | — | looks/look dejected |
| 21 | — | cringing |
| 22 | — | screaming |
| 23 | — | making a submissive gesture |
| 24 | — | in a fetal position |
| 25 | — | smeared out into a spiral |
| 26 | — | falling |
| 27 | — | dead |
| 28 | — | laughing |
| 29 | — | looks/look offended |
| 30 | — | being shot |
| 31 | — | making a plaintive gesture |
| 32 | — | melting |
| 33 | shooting | — |
| 34 | torturing | being tortured |
| 35 | committing a depraved act upon | committing a depraved act |
| 36 | praying to | praying |
| 37 | contemplating | contemplating |
| 38 | cooking | cooking |
| 39 | engraving | engraving |
| 40 | prostrating itself/themselves before | — |
| 41 | — | suffering |
| 42 | impaled on | — |
| 43 | — | unnaturally contorted |
| 44 | being flayed by | being flayed |
| 45 | hanging from | — |
| 46 | being mutilated by | being mutilated |
| 47 | — | striking a triumphant pose |

count = 1 使用 `is`／`looks`／`itself`，count ≠ 1 使用 `are`／`look`／`themselves`，包括不编号复数组。来源表分别保存全部单数、复数生产式与表项目标，不能只翻译单数版本。

原生的空分支与无效引用必须区分：

1. 及物在 `14679b..1467d0` 同时检查主语和宾语索引。任意一个无效，直接返回空文本，甚至不进入空枚举分支。
2. 引用有效后先生成主语和宾语名词，再按 verb 分派。空枚举／越界枚举直接跳 `146ce8`，跳过谓语与宾语追加，输出 **`SUBJECT.  `**。
3. 不及物引用有效后的空／越界枚举跳 `1474c7`，同样输出 **`SUBJECT.  `**。
4. 正常及物在 `146cc0` 追加谓语，在 `146cdf` 追加宾语；两类尾部调用 `52d650` 进行句首大写。

## 5. 历史事件与组织关系

`image+30` 的事件 ID 有效时，`1452aaa` 调用该事件对象的 `+d8` formatter，生成 `The artwork relates to EVENT`。随后从最新的事件集合向前搜索，若包含该事件，则在 `1452b4d` 调用集合对象 `+30` 的标题 formatter，追加 ` during COLLECTION`。这是所有历史事件类型共享的入口，不能把 ascension 一条模板当成完整覆盖。全部事件和集合虚表分派来源由 `data/extracted/statue-history-sources.tsv` 保留，译文路径为既有 `history_events.inc`、`data/runtime/legends-events.tsv` 及其事件语法表。

组织关系要求 `image+b0 == 24` 及有效来源和组织引用。`1452c3e` 读取图像类别，0 为 `is the symbol of`，1 为 `was commissioned by`；随后保留组织名称（如果有）、可选族名和组织类型。当前 PE 在 `1452d86` 固定追加 `a `，具名为 `NAME, a DESCRIPTION`，无名为 `a DESCRIPTION`。词表还接受 `an` 形式属于解析兼容范围，不据此声称原生这处会输出 `an`。

`1453100` 的完整类型分派为：

| type | 修饰语 | 类型 |
| --- | --- | --- |
| 0 | — | civilization |
| 1 | local | government |
| 2 | — | vessel |
| 3 | migrating | group |
| 4 | nomadic | group |
| 5 | — | religion |
| 6 | — | military organization |
| 7 | outcast | group |
| 8 | — | performance troupe |
| 9 | — | merchant company |
| 10 | — | RAW profession + guild；无具体职业时 craft guild |

## 6. 雕像基础说明与所有共享装饰

`c75000` 的首句由物品数量、复数性质、束装、品质及物品标题共同决定，不属于图像句。普通制作品质 1..5 分别为 well-crafted、finely-crafted、superior quality、exceptional、masterful；最高品质还带 `created by NAME` 或 `created by an unknown artisan`。

神器另加 `All CRAFTSMANship is of the highest quality.`：`c75657` 从制作种族 RAW 的 `PROFESSION_NAME:CRAFTSMAN` 取单数职业，缺失则在 `c75676` 使用 craftsman。当前安装 RAW 的覆写只有 dwarf 的 craftsdwarf，所以当前词表的 craftsmanship／craftsdwarfship 两条对应本机数据；新增模组种族职业可能引入其它 CRAFTSMAN 值，不应凭英文词形猜姓名或把这条分支当成两个硬编码源句。

说明函数按装饰类型分派 encrusted、studded、decorated、glazed、bands、hanging rings、spikes、构件材料、图像／图像摹作、骰子各面、文字、染色。每件装饰仍包含材料、工艺品质和可选作者，并允许多个同类装饰以逗号及 and 列举。雕像可使用共享装饰；图像里的物品元素也可能是任何其它物品，因此来源表保留 **整个共享函数的来源超集**，同时不声称食物食材、书页、骰子等其它物品专属分支必然出现在一座雕像本体上。

共享说明的子生产器也保留完整指令引用，不能只截取 `c75000` 里的字符串：

| 子生产器 | RVA | 来源与动态边 |
| --- | --- | --- |
| 织物材质／织工 | `cacd70..cad269` | 品质、材料、cloth、woven by 作者 |
| 纺线染色 | `cad270..cadcac` | 颜色、染色品质、染料混合列表、作者 |
| 物品染色 | `cadcb0..cae6ec` | 与纺线共用材料输入，句首为 The object |
| 物品上的文字 | `cc6a10..cc7020` | 26 类著作形式、标题、作者及未命名／失去文字分支 |
| 著作篇幅 | `cc7020..cc75f8` | 26 类著作形式、页数、标题、作者 |
| 著作细述 | `cc5d50..cc6a0e` | 内容、主题、风格、品质；主题 general_ref 的 `+90` 是既有 written-content 类型语义边，不是图像元素 |
| 写作风格 | `cc5520..cc5d08` | 18 类风格的有限跳转表和强度；全部常量保留 |
| 骰面说明 | `85da20..85e1a8` | 数值、圆点、文字、缩写图像动作；完整物品名与生物名仍走共享路径 |
| 骰面生物名 | `b94ed0..b9501c` | 生物类型、单复数及 creature(s) 后备名词 |
| 宝石形状及材料 | `14e1ec0..14e2a28` | 玻璃种类、宝石形状、材料名及 gem(s) |
| 材料字段选择 | `14add70..14ade9f`、`14d16f0..14d1781`、`14d1790..14d1911` | 原生材料结构的状态名／形容词，最终由 RAW 与既有材料词表解释 |
| 种族职业 | `1bb330..1bb3fc` | RAW 种族职业名；神器工艺句使用 CRAFTSMAN |

书写细述的 general_ref 内容由 `history_written_content_semantics.inc` 和对应原生字段捕获处理，书名由 `legends_books.inc` 的完整标题语法处理。这里明确保留类型边界，不把历史事件来源表冒充为著作细述来源；`data/extracted/statue-history-sources.tsv` 管理的是事件 `+d8` 和事件集合 `+30`。

磨损输出 showing some wear、heavily worn、mangled，以及适用物品的 threadbare／in tatters；污染逐个输出 spattered with／coated with。材料的 solid/liquid/powder 等状态和颜色仍是材料字段，不是仅“雕像材质＋雕像名字”能够覆盖的内容。

## 7. 翻译落点和已确认的结构差异

| 语法类别 | 现有翻译落点 | 必须保留的边界 |
| --- | --- | --- |
| 基础雕像／小塑像标题 | `data/runtime/item-description-translations.tsv` 的 `{m} statue(s) of {a}`、`figurine(s)`；`fortress_item_captions.inc` | 整个描绘对象列表属于 `{a}`，材质属于 `{m}` |
| 原图品质／摹作／作者／材料 | 同 TSV 的 image、rendition、quality、by 规则；`history_item_extra_semantics.inc::item_art_image` | 两套品质、两个作者、无元素有材料、原图标题 |
| 人物／生物／植物／物品／形状 | `symbol_description.inc::translate_symbol_element(s)`、`native_history_item_extras.inc` 与 `item_art_element` | typed 名称、昵称、物种、RAW 形状、数量和真正的列表分隔 |
| 所有动作、情绪和姿态 | `data/runtime/local-overrides.tsv` 的全部 `X ... [Y]`；`translate_symbol_action`、`item_art_action` | 单复数、反身代词、定指对象及主语句默认分支 |
| 神灵与领域 | `translate_deity_spheres`、领域表、deity 模板、RAW 生物描述 | 全部 130 个领域及状态／性别／种姓组合 |
| 历史题材及事件集合 | `history_events.inc`、Legends 事件语法及历史来源表 | 完整事件 `+d8` 与集合 `+30`，保持各链接角色 |
| 象征／委托组织 | item TSV 的 symbol／commissioned、组织名词及修饰规则 | 有名／无名组织、种族、全部 11 类和 guild 动态职业 |
| 装饰／磨损／污染 | item TSV 的 predicate/term 规则；`history_item_base_semantics.inc` 和各 improvement/extras renderer | 逐项材料、作者、工艺、装饰种类及污染状态 |

本次按原生分支定位到的结构问题是：带原生昵称的人名被“剩余拉丁字母即未翻译”判定拒绝；合法空动作枚举被当作无输出而丢弃主语；无元素有材料的图像被套入含 `of` 的生产式。对应修复落在共享姓名可信边界、`translate_symbol_action`／`item_art_action` 默认分支，以及 `item_art_image` 的 `image in {i}` 分支。`The item {e}.` 加 `is {s}` 原本已是完整且正确的句首组合，不需截图专用替换。

类型化 `item_art_element` 同时把神灵的状态／性别／种姓形象交回共享 symbol 生物语法；count = 0 的普通生物使用既有 `Art image group: X`，同种但不同图像角色使用“两群”或“另一群”的已有语义。图像基类 element 没有文字内容，不能将其空结果当成一个待翻译的名字或缺词；它与“有有效主语、但动作枚举走默认分支”是不同状态。

物品模板使用归一化空白的匹配视图，并通过字节来源映射取回原文中的字段。这样原生句间双空格可以匹配多句铭文，而昵称内部的连续空格、撇号和标点仍完整保留；不猜测整段文字中哪一个撇号结束昵称。已经归一化的文本直接使用原视图。

来源资料记录的是游戏生成行为及翻译入口。它没有通过执行游戏观察当前页面，也不以编译结果推断游戏画面的最终显示。
