# 纪念碑存档铭文的原生生成语法

本资料由当前 Windows `Dwarf Fortress.exe` 的离线反汇编重建，映像标识为 `PE:6a70a6d9:02711000`。地址均为 RVA。机器来源表为 `data/extracted/memorial-inscription-sources.tsv`，提取入口为 `tools/extract_memorial_inscription_catalog.py`。来源表保留每条字面量引用、直接／间接调用、55 个死因表项和 12 个喜好表项；下文描述控制流与动态叶节点，不是游戏显示检查报告。

## 存储与显示入口

`cc23e0..cc5384` 是纪念铭文的创建函数，`cc2420` 写入 `item_slabst +108 = historical_figure_id`，`cc2426` 取得 `item +e8` 的存储字符串，`cc2445` 写入 `item +10c = 0`。实际指令截止 `cc5278`，余下分别为死因跳表 `cc5278..cc5354` 和喜好跳表 `cc5354..cc5384`。不能将跳表字节作为反汇编指令，也不能将此有写入及随机数副作用的函数当作只读翻译入口调用。

存储的铭文与页面外壳不同：共享物品说明在显示时添加 `The slab reads "`、引号与句号，铭文自身不由这个页面外壳产生。石板标题由 `ca0870..ca0b3e` 处理；标题已经翻译不代表 `item +e8` 的正文得到处理。石板的其他 subtype 是另外的生成链，不应凭字符串包含 `slab` 将所有内容视作纪念铭文。

## 全文组合

```text
铭文 := 开头 生卒段? 创作功绩? 职位? 击杀功绩? 家庭? 喜好?
开头 := "In memory of " 原语言姓名
      | "In memory of a " 种族或种姓单数
      | "In memory of..."                     # 找不到历史人物，立即返回

生卒段 := (" / Born " 出生年)? " / Went missing" (" in the year " 失踪年)?
        | (" / Born " 出生年)? " / " 死因 (" in " 事件集合标题)? (" in the year " 死亡年)?
        | " / " 出生年 " - " 死亡年
        | " / b." 出生年 " d." 死亡年
        | " / Died " 死亡年
        | " / d." 死亡年

创作功绩 := " / Creator of " 神器生成名称
职位 := " / " 首字母大写职位名称 " of " 组织或地点名称 任期?
任期 := " in " 年 | ", " 起始年 " to " 结束年
击杀功绩 := " / Slayer of" (" the " 首字母大写种族单数)? (" " 被杀者生成名称)?
          | " / Hunter of " 首字母大写种族复数
          | " / Slayer of " 首字母大写种族复数
家庭 := " / " ("Loving " | "Devoted ") 家庭身份
喜好 := " / " 选中的一个喜好
```

`cc2525` 根据 `hf +aa` 的 has-name 字节选择开头：有名时调用 `a94030(hf +38)`，没有名字调用 `aa3bd0(race=hf +2,caste=hf +4)`。这里原语言姓名与后面别处使用的英文生成名是不同原生函数。

`cc26a3..cc2844` 先由人物对应的 unit 找 incident。命中且 incident `+ec` 的位 1 未设置时选 `Went missing`，失踪年从 incident `+e4` 读取。出生年来自 `hf +10`。有值且 `>=1` 才追加对应年。

否则 `cc2852..cc28c6` 从历史事件向量末尾倒序找第一个 `virtual +30(hf_id)` 返回真的事件；该事件的类型 getter 必须等于 3（死亡事件），才读 `event +64` 的死因。若首个有关事件并非死亡事件、没有有关事件、或死因超出 0..54，使用生卒日期备选，不继续倒找另一个死亡事件。

成功生成非空死因后，`cc3442..cc3514` 按原顺序找第一个包含 `event +20` 事件 ID 的集合，调用集合虚表 `+30` 产生完整标题；标题非空才添加 ` in `。`cc351e` 使用 `hf +30` 的死亡年而非事件年份。未生成死因时：若出生及死亡年均 `>=1`，随机选 `B - D` 或 `b.B d.D`；出生年未知而死亡年 `>=1` 时随机选 `Died D` 或 `d.D`；只有出生年时不追加孤立的出生年。

## 55 个死因枚举

表中同一字符串出现多次是原生不同枚举，不可去重后假定同一分支。`plain` 无凶手／武器扩展；其他扩展定义在表后。具体跳表条目的地址和目标见来源 TSV。

| cause | 主文本 | 扩展 |
| --- | --- | --- |
| 0 | Died peacefully | plain |
| 1 | Starved to death | plain |
| 2 | Died of thirst | plain |
| 3 | Shot and killed | killer+weapons |
| 4 | Bled to death | slain+weapons |
| 5 | Drowned | plain |
| 6 | Suffocated | slain-by+weapons |
| 7 | Struck down | killer+weapons |
| 8 | Scuttled | plain |
| 9 | Died after colliding with an obstacle | slain |
| 10 | Burned up in magma | plain |
| 11 | Burned up in a magma mist | plain |
| 12 | Burned up in … | dragon-fire |
| 13 | Burned to death … | fire |
| 14 | Scalded to death | plain |
| 15 | Crushed under a collapsing ceiling | plain |
| 16 | Crushed by a drawbridge | plain |
| 17 | Killed by falling rocks | plain |
| 18 | Fell into a deep chasm | plain |
| 19 | Died in a cage | plain |
| 20 | Murdered | killer |
| 21 | Killed by a trap | plain |
| 22 | Vanished | plain |
| 23 | Starved to death | plain |
| 24 | Starved to death | plain |
| 25 | Died in the heat | plain |
| 26 | Froze to death | plain |
| 27 | Impaled on spikes | slain |
| 28 | Encased in cooling lava | plain |
| 29 | Encased in cooling magma | plain |
| 30 | Encased in ice | plain |
| 31 | Beheaded | killer |
| 32 | Crucified | killer |
| 33 | Buried alive | killer |
| 34 | Drowned | killer |
| 35 | Burned alive | killer |
| 36 | Fed to beasts | killer |
| 37 | Hacked to pieces | killer |
| 38 | Left out in the air | killer |
| 39 | Boiled | plain |
| 40 | Melted | plain |
| 41 | Condensed | plain |
| 42 | Solidified | plain |
| 43 | Succumbed to infection | slain |
| 44 | Put to rest | plain |
| 45 | Scared to death | killer |
| 46 | Died in the dark | plain |
| 47 | Collapsed | struck-down+weapons |
| 48 | Drained of blood | killer |
| 49 | Slaughtered | killer+weapons |
| 50 | Killed by a vehicle | plain |
| 51 | Killed by a flying object | plain |
| 52 | Leapt from a great height | plain |
| 53 | Drowned | plain |
| 54 | Executed | killer |

```text
killer := 空 | " by " 有名凶手 | " by a " 无名凶手种族单数
slain  := 空 | ", slain by " 有名凶手 | ", slain by a " 无名凶手种族单数
weapons := 空 | " with " 武器 | " with " 发射器 | " with " 武器 " from " 发射器

dragon-fire := "Burned up in " 有名凶手所有格 " dragon fire"
             | "Burned up in a " 无名凶手种族单数 "'s dragon fire"
             | "Burned up in dragon fire"
fire := "Burned to death by " 有名凶手所有格 " fire"
       | "Burned to death by a " 无名凶手种族单数 " fire"
       | "Burned to death"
```

凶手历史人物 `event +2c != -1` 优先于无名凶手的 race `+30` 和 caste `+34`。人物使用 `b92f10`：普通凶手调用 mode 1，龙焰／火焰调用 mode 2（所有格）；这条完整姓名路径可能带种族、身份名和称号，不是 `a94030` 的单纯原语言名。无名凶手使用 `b94ed0`，不凭截图里的一只 roc 限定种族。

两段武器文本分别由 `event +38..44`、`+48..54` 决定；若对应 item 有神器引用，则 `b94400` 输出神器身份，否则 `a82c10` 输出完整类型、子类型、材料名，通常前加 `a `，item type 69 是不加冠词的例外。第一项和第二项均存在时始终用 `with 第一项 from 第二项`，不存在第一项时可单独 `with 第二项`。

`slain+weapons` 在有凶手时输出 `slain` 扩展再接 `weapons`；无凶手而至少一段武器非空时先加 `, slain`。`slain-by+weapons` 同样处理，但无凶手时原版先加 `, slain by ` 再加以空格开头的 ` with `，会形成 `, slain by  with …`。`struck-down+weapons` 用 `, struck down by …`；无凶手且有武器时先加尾含空格的 `, struck down `，原版形成 `, struck down  with …`。这些是反汇编真实分支，保存文本的翻译需要容纳，不能因其语法不自然而丢弃。

## 功绩、任期和家庭

* `cc36a6..cc37b9`：人物有 unit 且 `unit +11c & 0x800`，追加 `Creator of`，名称来自 `unit +a08` 的生成名（`a946e0`）。
* `cc37b9..cc3b31`：遍历 `hf +e8` 实体关系，只考虑类型 10/11；读取职位定义的 `+2d0` 优先级，选择原代码决出的关系。职位称谓按 hf 性别选择女性 `+d8`／男性 `+118` 非空字符串，否则回退中性 `+98`，并在输出前首字母大写。`9bdfb0..9be0f8` 在职位需要领地、实体 site link 匹配时输出 ` of {site-name}`；失败或不需要领地则 `b92900` 输出 ` of {entity-name}`。任期通过关系虚表 `+40/+48` 取得，结束年 `-1` 回退人物死亡年；起始年 `-1` 不输出任期。
* `cc3b31..cc40a8`：人物 info 的 kills 数据存在时，先从击杀事件选被杀历史人物。`b99da0` 的分数最高者进入候选列表，同分候选随机挑一个。输出 `Slayer of`；被杀者种族和纪念人物不同才追加 ` the {Creature}`；世界中存在另一个相同种族的历史人物时才追加被杀者的生成名。没有候选历史人物时读无名击杀统计，只考虑 subtype 0，原生计数选择结果达到 5 才输出种族复数功绩；生物 flags 的 `byte[8]` 最高位决定 `Slayer of`，否则为 `Hunter of`。
* `cc40a8..cc4306`：遍历 `hf +118` 的人物关系，getter 类型 3 表示有子女，2 或 15 表示配偶关系。随机前缀为 `Loving ` 或 `Devoted `；sex=1 为 `father`／`husband`／`father and husband`，sex=0 为 `mother`／`wife`／`mother and wife`，其他值为 `parent`／`spouse`／`parent and spouse`。没有上述关系时不追加该段。

## 全部喜好选择

`cc4306..cc43dd` 需要 unit 和当前 soul，从 soul `+230` 的 preference 向量随机挑一个。只挑一次，挑到未输出类型不会改挑另一个。

| 类型 | 原生生产式 | 动态来源 |
| --- | --- | --- |
| 0 材料 | `United with {material}`／`At one with {material}`／`Lover of {material}` | preference `+c` 类型、`+10` 编号；三种开头随机 |
| 1 生物 | `Admirer of {creature-plural}`／`Friend of {creature-plural}` | creature RAW `+40` 复数名称；开头随机 |
| 2 食物 | 不追加 | 明确跳到结束 |
| 3 厌恶生物 | 不追加 | 明确跳到结束 |
| 4 物品 | `Lover of {item-plural}` | `a82c10`，preference `+4` 类型、`+8` 子类型；plural 参数 -1，无材料 |
| 5 植物 | `Admirer of {plant-plural}`／`Lover of {plant-plural}` | plant RAW `+70`；开头随机 |
| 6 树木 | 同类型 5 | 同一跳转目标 |
| 7 颜色 | `The color {color} made him happy`／`… her happy`／`… it happy` | color RAW `+50`；代词按 unit `+12e` 的 1/0/其他值 |
| 8 形状 | `Admirer of {shape-plural}` | shape RAW `+70` |
| 9 诗歌形式 | `Lover of {form-name}` | 世界 poetic form，全局 `24e7ec8`；对象有名才输出 |
| 10 音乐形式 | `Lover of {form-name}` | 世界 musical form，全局 `24e7ef8`；对象有名才输出 |
| 11 舞蹈形式 | `Lover of {form-name}` | 世界 dance form，全局 `24e7f28`；对象有名才输出 |
| 其他 | 不追加 | 明确跳到结束 |

材料名有独立内联生成逻辑 `cc4492..cc47ca`：类型在 219..418 且编号指向有名历史人物时，先输出人物当前身份名或本名的生成名加 `'s `。再取 `14add70` 返回的材料，若 `material +520` 前缀非空，先加前缀及空格，再加 `material +b8` 固态名；材料缺失则 `unknown material`。类型 419..618 是植物材料，还按材料 flags 追加 ` wood` 或 ` fabric`，木材优先。其余 RAW／自定义 mod 的材料和物品名由完整类型化叶节点处理，不能列举几种材质替代。

## 动态叶节点与边界

名字、RAW、职位名、神器名、诗歌／音乐／舞蹈名称及玩家可命名字段不是有限英文句子。完整提取指所有静态分支、枚举及组合式，并保留这些带类型的字段接口；不能声称枚举所有玩家可能输入的字符串。

事件集合通过与艺术图像相同的 `virtual +30` 入口，18 类根及其调用链已保存在 `data/extracted/statue-history-sources.tsv`。其中标题自身可含 ` of `、` by `、` in `，例如野兽袭击标题含肇事者和地点。死亡段外围再接 `in the year`，翻译需要区分嵌套结构。通用物品、材料、姓名等被共享的生成源另见 `data/extracted/statue-art-sources.tsv` 和本次来源表的各叶函数。

此函数的日期写法、同分击杀对象、家庭前缀、喜好项目及部分喜好前缀包含创建时随机选择。保存铭文是创建时结果，当前人物、关系、RAW、身份和偏好未必仍与创建时相同。翻译应保留存储铭文的具体含义和选择，不能重新调用创建函数覆盖文本，也不能按当前资料随机生成另一段“看似相同”的中文碑文。

## 翻译接入

`data/runtime/memorial-inscription-grammar.tsv` 将上述生产式置于独立的 `memorial-inscription` 域。物品说明中的 `The slab reads "{q}".`、原生石板的 `slab.saved_writing`、阅读物品的 `$inscription` 共用这一路径。` / `、` in `、所有格及句点仅提供候选分界，必须将完整的人物、事件集合、物品等字段解析成功才接受。

喜好名词复用角色偏好段落原有的完整解析器；材料使用材料域，文化形式使用生成标题域。这里没有建立截图专名词表，也没有重新读取当前喜好代替碑文保存的随机结果。通用域匹配使用规范空格视图；原生昵称捕获映射回原始字节，既容纳原版异常双空格，也保留昵称内的空格与标点。

本资料记录离线反编译及代码接入范围，不代表已经观察到游戏内最终显示。
