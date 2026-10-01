# 居民活动／状态原生来源目录

## 范围与证据

本目录针对当前安装的 DF 53.16 本机游戏，而非截图词条集合。
被分析文件为游戏目录的 `dwarfort`，ELF x86-64，Build ID 为
`bcc6789e6fb477b785a2b02be80b8b1b054ff88c`。地址为镜像内地址，
不是运行时 ASLR 地址。通过反汇编、`.eh_frame` 函数边界、RTTI 与虚表
追踪完整状态生成链；没有运行游戏、翻译器或测试程序。

状态不是单个 `job_type` 枚举：有工作时调用工作格式化器；活动事件通过
虚函数生成描述；军令有另一组虚函数；外交、身份、拘束和失败原因还会
在外层直接生成或附加文字。原先仅提取普通工作格式化器，因此无法覆盖
`Conduct Meeting`。该文字位于 `0x20f3873`，两个状态入口分别在
`0xb7127c`、`0xb7a38c` 引用它。

永久维护文件：

| 文件 | 内容 |
| --- | --- |
| `data/extracted/unit-activity-native-bindings.tsv` | 52 条格式化器绑定，包含镜像身份、函数边界、虚表槽地址及原生类型 |
| `data/extracted/unit-activity-sources.tsv` | 1112 条带文字地址、指令引用和来源类型的记录，保留片段首尾空格 |
| `data/extracted/task-sources.tsv` | 普通工作及已安装原版 RAW 反应名称的来源目录 |
| `data/runtime/local-overrides.tsv` 的 `Fortress activity: ` | 活动专用固定文字、动作和后缀译义 |
| `data/runtime/rulesets/zh-Hans/activities.toml` | 活动组合语法、33 个价值观名词、294 个研究课题简写 |
| 既有 `data/runtime/rulesets/zh-Hans/tasks.toml`、菜单、物品、材料及名称词表 | 工作对象及动态名称，不另设第二套翻译 |

1112 是**来源记录数，不是独立完整状态数**。同一文字可被不同函数引用，
同一虚函数可被多个类继承；动态姓名、物品和自定义地点也不能穷举成有限表。
因此完整目录由“固定输入＋有限枚举＋组合规则＋类型明确的动态对象”组成。

| 来源类别 | 记录数 | 说明 |
| --- | ---: | --- |
| `status` | 96 | 两个状态入口各 48 种文字输入，包括连接片段 |
| `roster` | 37 | 生物列表身份、活动包装及训练状态，也含非状态的栏目／符号输入 |
| `job` | 291 | 普通工作格式化器及当前工作／手术细分包装 |
| `activity` | 98 | 29 个活动类型绑定，包括继承的基础实现；共 89 种文字输入 |
| `order` | 27 | 12 个军令类型绑定及两个击杀对象辅助函数 |
| `skill` | 137 | 技能示范所用动作名词 |
| `topic` | 294 | 研究活动使用的课题简写，不是历史界面的长描述 |
| `sphere` | 131 | 130 个神域及 `no sphere` |
| `sphere-wrapper` | 1 | 神域名称的定冠词包装 |

## 入口与分支

| 原生函数 | 用途 |
| --- | --- |
| `0xb70720..0xb71aab` | 居民活动及原生颜色 |
| `0xb79d40..0xb7b0da` | 居民活动文字 |
| `0xb71ab0..0xb71b95` | 调用带颜色入口的薄包装，本身没有新增文字 |
| `0x204bab0..0x204e526` | 生物列表身份／活动显示 |
| `0x1cab560..0x1cb2754` | 普通工作标题及详细对象 |
| `0x1cb2760..0x1cb2a56` | 当前工作；另分 Surgery、Stop Bleeding、Repair Compound Fracture、Remove Rotten Tissue |

下列是输出结构摘要，并非替换游戏行为的伪实现：

```text
unit activity
  ├─ current job → ordinary job / surgery subtype
  ├─ current activity → activity_event vtable + 0xb8
  ├─ squad order → squad_order vtable + 0x70
  ├─ meeting / diplomatic mission / resident role / idle caption
  └─ failure reason / caged / chained / event exclamation

creature roster
  ├─ role or creature status
  └─ [Diplomat / | Guest / ] + unit activity
```

原生无文字分支使用空串（`0x20dc2d4`），不是一个需要补写的状态。
编译器有把短串用立即数或 SIMD 写入的快速路径，不能只凭相邻 `strings`
输出推断完整性；已沿控制流检查其分配／扩容路径的同值文字引用。
例如会面、个人训练、`/Resting`、新抵达状态和部分技能名均有此类路径。
目录提取器保留可引用的同值字符串；不会把任意机器码字节猜成新状态。

### 直接状态及外交

会面／身份／空闲分支的完整固定输入为：
`Attend Meeting`、`Conduct Meeting`、`Attend Parley`、`Return Treasure`、
`New Arrival`、`Soldier`、`Mercenary`、`Monster Slayer`、`Noble`、
`No job`、`No activity`、`Caged`、`Chained`。

外交分支是 `Make Request of <site>`，或以下动作与 ` at <site>` 组合：
`Diplomacy`、`Demand surrender`、`Make contact`、`Improve trade`、
`Make peace`、`Declare war`、`Seek alliance`。对象经原生据点名称格式化器
`0xa27cd0` 生成，不能把 `Make Request of` 后的对象误判成人名。

### 活动虚函数

29 个绑定包含基础类型和全部派生类型；逐项槽地址见绑定 TSV。

| 活动类型后缀 | 完整输出族 |
| --- | --- |
| 基础类型、harassment、encounter、reunion、conversation、guard、conflict、store_object | `Activity`，这些类继承同一输出方法 |
| training_session | `Training Session` |
| combat_training | `Go to / Organize / Lead / Wait for Combat Training` |
| skill_demonstration | `Go to / Organize / Wait for / Lead / Watch <skill> Demonstration` |
| fill_service_order | `Serve Customer` 或 `Serve <material/item>` |
| individual_skill_drill | `[Go to ]Individual Combat Drill[/Resting]` |
| sparring | `Spar`、`Go to Sparring Match`、`Go to Sparring Practice`、`Watch Sparring Practice` |
| ranged_practice | `[Go to ]Archery Practice` |
| prayer | `Pray to <historical figure>` 或 `Meditate on [the ]<sphere>` |
| research、play、worship、socialize | `Research`、`Play`、`Worship`、`Socialize` |
| ponder_topic、discuss_topic、teach_topic | `Ponder / Discuss / Teach / Learn <short topic>` |
| read、copy_written_content | `Read / Copy`，可追加完整物品说明 |
| write | `Write` 或 `Write about <short topic>` |
| make_believe | `Play Make Believe` |
| play_with_toy | `Play with Toy` 或 `Play with <item>` |
| performance | 见下表 |

表演类型 `0x1784e90..0x1785b7c` 的完整输出族：

| 类型 | 输出 |
| --- | --- |
| 听众 | `Listen to Sermon / Story / Poetry / Music`、`Watch Dance` |
| 演出 | `Tell Story`、`Recite Poetry`、`Perform Music / Dance`、`Sing`、`Chant` |
| 乐器 | `Play / Simulate <generated instrument>` |
| 布道 | `Preach on <historical figure or sphere>` |
| 价值观 | `Promote / Inveigh Against <value>`，33 个名词全部收录于 `activities::value` |

技能动作名词函数为 `0x1502f40..0x1503ccc`；译名读取既有共同
`translate_skill_name`／`Skill name: `，与技能列表、TOML 和悬停说明一致。
`Pike` 是长枪，不是鱼；`Music` 是音乐演奏；`Armor` 是盔甲使用技能，
不会覆盖库存的“躯干装备”。职业称谓不作全局删改。

研究课题简写函数为 `0x1edc6d0..0x1ede8be`。294 个简写逐项维护于
`activities::topic`，术语遵循既有 `data/runtime/legends-events.tsv` 的知识描述；
例如数学 `exhaustion` 为“穷竭法”、`powers` 为“幂”，不是情绪或力量。
此文件不参与全局字典的字面量扁平化，也不加入全局通用语法入口，避免词义串用。

神域函数为 `0x14e7b20..0x14e82f3`，定冠词包装为
`0x14f0240..0x14f047a`，全部沿用已有神域表与 `translate_deity_spheres`。
阅读、抄写和玩具调用原生完整物品说明 `0xe68020`，不是只显示书名；
服务活动调用材料／物品格式化器 `0x12b6a70`。因此共享活动入口先把完整
对象交给物品解析器，再组合动作，不能仅把余下文字按书名音译。

### 军令虚函数

12 种命令类型全部从虚表槽 `+0x70` 追踪：

| 类型后缀 | 输出族 |
| --- | --- |
| move | `Station[ at <point>]` |
| train | `Train` |
| defend_burrows | `Defend <burrow>[ etc.]` |
| patrol_routes | `Patrol <route>` |
| retrieve_artifact | `Retrieve <artifact>` |
| rescue_hf | `Rescue <historical figure>` |
| raid_site | `Raid / Pillage / Explore / Demand Tribute from / Seize / Take Over / Raze <site>` |
| kill_list、kill_hf | `Kill[ various / <creature or person>]` |
| drive_armies_from_site | `Drive any members of <entity> out of <site>` |
| drive_entity_off_site | `Drive <entity> from <site>` |
| cause_trouble_for_entity | `Cause trouble for <entity>` |

击杀对象的辅助函数为 `0x2033380..0x2033952` 和
`0x2031660..0x20318d5`。造物、人物、物种、势力和据点分别复用既有
完整解析器，不能把动作或未知整句送入名称解析器。
地点、路线、活动区属于玩家可编辑名称，允许在这个明确类型的槽位中保留
自定义文字；默认 `Point N`、`Route N`、`Burrow N` 读取作用域词表，保留数字。

### 后缀与外层包装

23 个失败原因全部来自状态入口的分支：

```text
activity cancelled       no barracks               improper barracks
no activity              cannot individually drill does not exist
no archery target        improper building         unreachable location
invalid location         no reachable valid target no burrow
not in squad             no patrol route           no reachable point on route
not following order      invalid order             no temple
no library               no item                   cannot leave site
location no longer in zone                          cannot follow order
```

这些文字只作为原生括号后缀读取 `Fortress activity: suffix `，不会全局
替换普通说明；` (Caged)`、` (Chained)` 复用已有拘束状态词义。
`/Resting`、`!` 及 `Diplomat / `、`Guest / ` 也在共享入口按完整边界组合。
多个包装递归解析，不能吞掉失败原因、活动对象或未知前半句。

列表的独立身份、访客／囚犯状态、野生／躁动状态和驯化等级同时收录于
`roster` 目录。`Job` 是栏目名、`\#` 是显示符号，不当作新活动；
既有死亡／失踪、商人、野生和驯化译文继续沿用。

## 维护与发布

读取本机匹配镜像，重新生成来源目录：

```sh
python -B tools/extract_unit_activity_catalog.py
python -B tools/extract_task_catalog.py
```

需要查看某函数的标注反汇编时：

```sh
python -B tools/native_caption_image.py ../dwarfort 0xb70720
```

镜像布局、地址、调用约定及展开信息仅由本机二进制适配层和声明式绑定表达；
文字提取与分类只有一套实现。镜像身份不匹配时明确停止，要求重新追踪，
不能静默套用其他版本地址。绑定目录是维护证据，**不参与运行时 Hook**；
活动翻译也不按操作系统分叉。

运行时唯一外层入口为 `Overlay::translate_fortress_activity`，居民列表、
任务页、人物当前活动、贸易站经纪人状态和搜索共用。优先读取活动专用完整
词条，再解码包装和物品对象，最后进入 `activities`、`tasks`、`menu` 语法。
未知对象保持整句未解析，不能用音译或部分翻译掩盖遗漏。

用统一入口 `python tools/build.py` 生成翻译数据、构建并原子发布本机核心。
本次没有改变驻留加载器 ABI。开启汉化时按 `Shift+F10` 关闭再开启即可加载
新核心；已经关闭时按一次。本目录是静态来源与实现说明，不是测试用例或
游戏内通过报告；最终显示、原生颜色和排版由人工验收。
