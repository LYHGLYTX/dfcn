# 要塞区域术语设计

适用范围：要塞的 `Zones` 菜单及其区域类型、默认名称和相关说明。以本机 53.16 的原生界面文字与提示为主要依据，参考 Dwarf Fortress Wiki 当前版本资料。中文名称是本项目的翻译选择，不是官方中文名称。

## 命名原则

按区域实际用途命名。已有自然、准确的房间和设施名称直接保留；以动作或材料命名的英文按钮，译成能表达用途的区域名。不强行给所有房间加“区”，也不把所有名称压成同样字数。

游戏中的区域是用途指定，不会因为划定区域就自动修筑围栏、挖坑或造水池。材料、工作、技能、世界地点和房间价值等级有各自语义，不能用区域译名全局替换。

## 18 类名称

下表按截图左右两列的顺序列出。

| 英文类型 | 截图旧译 | 采用名称 | 选择理由 |
| --- | --- | --- | --- |
| Meeting Area | 集会区 | 集会区 | 闲暇聚集与社交；避免教程另称“会议区域”。 |
| Office | 办公室 | 办公室 | 公务用途明确，保留。 |
| Bedroom | 卧室 | 卧室 | 与公共宿舍区分，保留。 |
| Dormitory | 宿舍 | 公共宿舍 | 强调公共床位，不属于特定居民。 |
| Dining Hall | 餐厅 | 餐厅 | 可供公共用餐，也可分配个人，不限定为“公共食堂”。 |
| Barracks | 兵营 | 兵营 | 包含小队训练、睡眠与装备存放，不缩成“训练场”。 |
| Pen/Pasture | 围栏／牧场 | 畜栏／牧场 | Pen 指安置动物的圈养区域，不是围栏建筑。 |
| Archery Range | 射箭场 | 射箭场 | 远程武器训练用语，包含弩；保留惯用名称。 |
| Pit/Pond | 深坑／池塘 | 坑洞／池塘 | 保留投放动物和提桶注水两种模式，不添加深度限定。 |
| Garbage Dump | 垃圾倾倒场 | 物品倾倒区 | 接收标记为倾倒的物品，不局限于垃圾。 |
| Water Source | 水源 | 取水区 | 表达划区用途，不误解为创建自然水源。 |
| Animal Training | 驯兽 | 驯兽区 | 从活动名变为区域名。 |
| Dungeon | 地牢 | 监牢 | 此处是司法关押用途，不限定地下位置。 |
| Tomb | 陵墓 | 墓地 | 中性的安葬区域名，不预设宏伟建筑或房间等级。 |
| Fishing | 捕鱼 | 捕鱼区 | 从劳动名变为区域名。 |
| Gather Fruit | 采集果实 | 植物采集区 | 包含树上果实、地面落果与灌木采集。 |
| Sand | 沙 | 采沙区 | 供玻璃生产采集沙，沿用项目材料名“沙”。 |
| Clay | 黏土 | 黏土采集区 | 指定制陶黏土的采集位置，避免“采土区”泛化为所有土壤。 |

## 语义依据

游戏自带说明保存在 `data/runtime/tooltip-translations.tsv` 的英文源文中：水源条目明确饮水与提桶取水；采沙和采集黏土的任务分别在玻璃窑、窑炉发起；动物区域明确无需围栏；监牢说明直接关联司法拘押。原生默认名 `Unnamed plant gathering area` 也说明 `Gather Fruit` 对应植物采集区域。原文定位记录见 `data/extracted/tooltip-sources.tsv`，教程与界面源文见 `data/extracted/help-sources.tsv`、`data/extracted/ui-message-sources.tsv`。

“物品倾倒区”与垃圾储物堆必须区分：前者根据物品的倾倒标记接收物品，后者按物品类别收纳。原生提示没有“只能倾倒垃圾”的限制；[Garbage dump](https://dwarffortresswiki.org/index.php/Garbage_dump) 也明确说明其可以接收有价值的物品。

“植物采集区”不缩成“采果区”：游戏提供树上采果、灌木采集和拾取落果三个开关。[Herbalist — Gathering plants](https://dwarffortresswiki.org/index.php/Herbalist#Gathering_plants) 说明了这些采集来源。

“畜栏／牧场”保留圈养和放牧两个含义。区域指定本身不建造围栏，是否需要草取决于动物；参见 [Pasture](https://dwarffortresswiki.org/index.php/Pasture)。

“坑洞／池塘”保留双名称，因为池塘模式会追加提桶注水工作，坑洞模式则不会；原生提示还说明被投入的动物若找到出路便能离开。这是对已有空间的用途指定，参见 [Zone — Pit/Pond](https://dwarffortresswiki.org/index.php/Zone#Pit.2FPond)。

“墓地”指可分配的安葬区域，不要求译成封闭的“墓室”，也不等于一个区域可容纳多名矮人的公墓。普通区域名与 `Grave`、`Fine Tomb`、`Mausoleum` 等价值等级分开处理。参见 [Tomb](https://dwarffortresswiki.org/index.php/Tomb#Fortress_mode) 与 [Zone — Quality and value](https://dwarffortresswiki.org/index.php/Zone#Quality_and_value)。

其余区域功能可参照 [Zone](https://dwarffortresswiki.org/index.php/Zone)；发生资料版本差异时，以当前游戏实际源文和行为为准。

## 翻译归属

`data/runtime/local-overrides.tsv` 中的 `Zone type:` 词条保存这 18 个区域译名，由创建菜单与未关联场所的详情类型控件选择。通用 `Sand`、`Clay`、`Fishing`、`Animal Training`、`Dungeon`、`Tomb` 保留其材料、活动或其他既有含义。

默认区域名按完整的 `Unnamed …` 源文维护；悬浮说明、关联界面句子和教程同步采用本表术语。玩家自命名、已关联的酒馆等场所名称不作为区域类型替换。`data/runtime/translations.tsv` 及运行缓存由项目统一编译部署入口生成，不直接编辑生成结果。

“地点 → 区域”列表的名称栏有一处不同：本机原生代码在名称为空时显示类型，在名称非空时显示玩家名称，两者共用绘制位置。现有画面捕获不能证明这个分支，因此不对该名称栏的裸 `Sand`、`Tomb` 等套用区域专用替换；正常的完整 `Unnamed …` 默认名称已采用新译名。若玩家将名称清空，列表回退类型仍沿用通用翻译，创建菜单和上述详情类型使用新术语。
