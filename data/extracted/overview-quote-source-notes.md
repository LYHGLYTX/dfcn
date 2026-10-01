# 人物概述自述的原生构造

来源为当前 Windows `Dwarf Fortress.exe`，PE 标识
`6a70a6d9:02711000`，ImageBase `0x140000000`。
以下地址是本文件中的虚拟地址，通过 PE unwind 函数边界、调用指令、
switch 跳转表和字符串操作还原；不是按截图关键词附近的字符串划定范围。

## 页面入口与分支

人物面板函数 `0x1401a5b70..0x1401a86e9` 在
`0x1401a6c7c..0x1401a705d` 构造带双引号的自述。
排除不能发言的状态后，婴儿进入普通自述构造器；其他人物先从记忆中选择
一个事件，没有合适事件时进入同一个普通自述构造器。

事件分支可还原为：

```text
event_text = format_event(unit, selected_event, event_parameters)
if event_text is not empty:
    append two spaces
intensity = min(selected_intensity, 100)
if intensity == 100 and selected_memory_special_flag:
    intensity = 101
append reaction(selected_emotion, intensity)
enclose the entire text in double quotes
```

事件构造器为 `0x14066fe50..0x140673bb8`，其事件描述辅助函数为
`0x14066ba00`。完整字符串、片段和语义字段见
[overview-event-sources.tsv](overview-event-sources.tsv)。固定句进入
`Overview sentence: ` 专用词表；动态句使用
`data/runtime/announcement-description-grammar.tsv` 的 `memory-sentence` 及其字段类型，
继续保留人物、物品、地点、作品和知识主题的实际内容。

事件 233 的 `It was …` 插入历史事件集合的 `getName` 标题，并非房间质量或
疾病名称。`src/native_overview_event_hooks.inc` 在页面调用事件构造器时保存
实际集合 ID 和完整字段，复用现有 18 类历史集合标题译法，包含序号、盗窃、
巨兽肆虐、比赛和庆典等标题。势力溃败句的两个字段分别是势力和地点。

情绪反应由页面入口直接选择以下五个函数，彼此独立于事件类型：

| 条件 | 调用指令 | 反应函数 |
| --- | --- | --- |
| 强度 101 | `0x1401a6f47` | `0x140667f50` |
| 强度 100 | `0x1401a6f54` | `0x1406681a0` |
| 强度大于 10 | `0x1401a6f61` | `0x1406691e0` |
| 强度大于 0 | `0x1401a6f6d` | `0x140669f40` |
| 强度不大于 0 | `0x1401a6f74` | `0x14066aca0` |

[overview-reaction-sources.tsv](overview-reaction-sources.tsv) 保留五个函数的
535 个引用和 534 条不同原文，包括强烈烦躁的五个随机措辞。
原生 `Things usually don't work out` 没有句末标点；解析以闭合引号确定
结尾，不能因缺少句点拒绝这一分支。多句反应仍作为完整词条匹配。

## 没有突出记忆的自述

`0x140666470..0x140667f50` 包含婴儿发声、性格、压力、状态、笑话和祈祷，
并调用 `0x140664be0..0x140666470` 构造价值观格言。
完整来源见 [overview-personality-sources.tsv](overview-personality-sources.tsv)。

- 固定格言、性格和压力自述使用带双引号的专用完整译文。
- 低压力状态由五种开头和各自的有限状态词组成，共 18 种原生组合。
- 笑话的两个生物字段各自使用生物描述语法。
- 祈祷与思考分别插入神域或神名。`praying` 的神名分支带 `to`，
  `considering`、`contemplating` 的神名分支直接跟神名。
- 神域构造器 `0x140756500` 调用 `0x140756690`，覆盖 130 种神域及缺省项，
  冠词由构造器选择。
- 婴儿先产生 1 至 3 个 `g/b/d/m + a` 音节，末音节可变成
  `as/is/us/er/in`，以感叹号或省略号收尾。

## 嘶声变体

普通自述和婴儿分支在种姓标志 `0x77` 成立时，分别通过
`0x1401a6d33`、`0x1401a700a` 调用 `0x14067b6c0..0x14067bc4d`。
每个 `S` 变成 `Ss/Sss/Ssss`，每个 `s` 变成 `ss/sss/ssss`；
最后才由人物面板加双引号。事件加情绪的分支不经过此函数。

`src/native_announcement_hooks.inc` 已在共用变声函数保留变声前后的完整原文。
概述翻译现复用其 `native_original_speech_source` 查询真实原文，不通过压缩
重复字母猜测神名或生物名称；中文沿用“（话音带着嘶嘶声）”提示。
缓存保存原文而非译文，词表更新后仍使用当前翻译；同一捕获机制已有
Windows 和 Linux 的原生绑定。

## 词表与排版入口

`data/runtime/local-overrides.tsv` 保存可维护的固定句，正常代码构建入口将其合入
运行时读取的 `data/runtime/translations.tsv`。动态字段在上述语法文件维护。
`translate_overview_quote` 必须译出整个引文才返回结果，保留事件、
情绪强度和否定关系；不把下方第三人称经历说明当成自述译文。
`character_overview_footer.inc` 继续负责原有换行、颜色和段落显示。
