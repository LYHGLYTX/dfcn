// Canonical English personality-facet clauses.  The paragraph translator
// replaces every grammatical pronoun (and the generic word "it") with {p}
// before looking up these entries.  Targets are short, natural Chinese
// predicates.  Runtime adds the subject to every facet and lays each one out
// on its own line, wrapping only when that individual sentence is too wide.
// Each facet also has the two "is currently" predicates emitted by the native
// current-state writer. Keep them here with the enduring trait vocabulary so
// every pronoun, text capture path and platform uses the same translation.

// LOVE_PROPENSITY
{"is currently more love-prone", "目前更容易爱上别人"},
{"is currently less love-prone", "目前更不容易爱上别人"},
{"is always in love with somebody and easily develops positive feelings", "心里总有喜欢的人，也很容易对人或事产生好感"},
{"very easily falls into love and develops positive feelings", "很容易爱上别人，也很容易喜欢上某件事"},
{"can easily fall in love or develop positive sentiments", "容易爱上别人，也容易对事物产生好感"},
{"does not easily fall in love and rarely develops positive sentiments", "不容易爱上谁，也很少对什么产生好感"},
{"is not the type to fall in love or even develop positive feelings", "几乎不会爱上谁，也很难真正喜欢什么"},
{"never falls in love or develops positive feelings toward anything", "从没爱上过谁，也不会真正喜欢什么"},

// HATE_PROPENSITY
{"is currently more hate-prone", "目前更容易讨厌别人或事物"},
{"is currently less hate-prone", "目前更不容易讨厌别人或事物"},
{"is often inflamed by hatred and easily develops hatred toward things", "心里总有怨气，很容易讨厌身边的人和事"},
{"is prone to hatreds and often develops negative feelings", "很容易记恨别人，也常对事情感到不满"},
{"is quick to form negative views about things", "很容易看人或事情不顺眼"},
{"does not easily hate or develop negative feelings", "不容易讨厌谁，也很少对事情不满"},
{"very rarely develops negative feelings toward things", "很少讨厌身边的人和事"},
{"never feels hatred toward anyone or anything", "从不恨任何人，也不恨任何事"},

// ENVY_PROPENSITY
{"is currently more envy-prone", "目前更容易嫉妒别人"},
{"is currently less envy-prone", "目前更不容易嫉妒别人"},
{"is consumed by overpowering feelings of jealousy", "嫉妒心强得几乎控制不住"},
{"is prone to strong feelings of jealousy", "很容易嫉妒别人"},
{"often feels envious of others", "经常羡慕别人，有时也会眼红"},
{"doesn't often feel envious of others", "不太会嫉妒别人"},
{"is rarely jealous", "很少嫉妒别人"},
{"never envies others their status, situation or possessions", "从不眼红别人的地位、生活或财物"},

// CHEER_PROPENSITY
{"is currently more prone to cheerfulness", "目前更容易感到开心"},
{"is currently less prone to cheerfulness", "目前更不容易感到开心"},
{"often feels filled with joy", "心情总是很好"},
{"can be very happy and optimistic", "通常很开心，也很乐观"},
{"is often cheerful", "大多时候都挺高兴"},
{"is rarely happy or enthusiastic", "很少开心，也很少对什么提得起兴趣"},
{"is dour as a rule", "总是一副闷闷不乐的样子"},
{"is never the slightest bit cheerful about anything", "不管遇到什么都高兴不起来"},

// DEPRESSION_PROPENSITY
{"is currently more depression-prone", "目前更容易情绪低落"},
{"is currently less depression-prone", "目前更不容易情绪低落"},
{"is frequently depressed", "经常情绪低落"},
{"is often sad and dejected", "经常难过，打不起精神"},
{"often feels discouraged", "很容易灰心"},
{"rarely feels discouraged", "不太容易灰心"},
{"almost never feels discouraged", "几乎不会气馁"},
{"never feels discouraged", "从来不会气馁"},

// ANGER_PROPENSITY
{"is currently more anger-prone", "目前更容易生气"},
{"is currently less anger-prone", "目前更不容易生气"},
{"is in a constant state of internal rage", "心里总憋着一股火"},
{"is very quick to anger", "脾气一点就着"},
{"is quick to anger", "很容易生气"},
{"is slow to anger", "不太容易生气"},
{"is very slow to anger", "很难被人惹火"},
{"never becomes angry", "从来不会生气"},

// ANXIETY_PROPENSITY
{"is currently more anxiety-prone", "目前更容易感到紧张"},
{"is currently less anxiety-prone", "目前更不容易感到紧张"},
{"is a nervous wreck", "总是紧张得快要崩溃"},
{"is always tense and jittery", "总是提心吊胆，坐立不安"},
{"is often nervous", "经常感到紧张"},
{"has a calm demeanor", "一般都很镇定"},
{"has a very calm demeanor", "遇事非常镇定"},
{"has an incredibly calm demeanor", "几乎从来不会慌张"},

// LUST_PROPENSITY
{"is currently more lust-prone", "目前更容易产生性欲"},
{"is currently less lust-prone", "目前更不容易产生性欲"},
{"is constantly ablaze with feelings of lust", "总是欲火难耐"},
{"is prone to strong feelings of lust", "很容易产生强烈的性欲"},
{"often feels lustful", "经常有性冲动"},
{"does not often feel lustful", "很少有性冲动"},
{"rarely looks on others with lust", "几乎不会对别人产生性欲"},
{"never feels lustful passions", "完全没有性欲"},

// STRESS_VULNERABILITY
{"is currently more vulnerable", "目前更难应付压力"},
{"is currently less vulnerable", "目前更能应付压力"},
{"becomes completely helpless in stressful situations", "一有压力就完全不知道该怎么办"},
{"cracks easily under pressure", "很容易被压力压垮"},
{"doesn't handle stress well", "不太能应付压力"},
{"can handle stress", "面对压力时还算应付得来"},
{"is confident under pressure", "压力越大，反而越沉得住气"},
{"is impervious to the effects of stress", "完全不受压力影响"},

// GREED
{"is currently more greedy", "目前更贪财"},
{"is currently less greedy", "目前没那么贪财"},
{"is as avaricious as they come, obsessed with acquiring wealth", "贪得无厌，满脑子都想着发财"},
{"is very greedy", "非常贪财"},
{"has a greedy streak", "有点贪财"},
{"doesn't focus on material goods", "不太看重钱财"},
{"desires little for {p} in the way of possessions", "对拥有钱财没什么兴趣"},
{"often neglects {p} own wellbeing, having no interest in material goods", "完全不在乎钱财，甚至常忘了照顾好自己"},

// IMMODERATION
{"is currently more intemperant", "目前更容易放纵自己"},
{"is currently less intemperant", "目前更能克制自己的欲望和冲动"},
{"is ruled by irresistible cravings and urges", "完全管不住自己的欲望和冲动"},
{"feels strong urges and seeks short-term rewards", "冲动很强，做事只图眼前痛快"},
{"occasionally overindulges", "偶尔会放纵过头"},
{"doesn't often experience strong cravings or urges", "不太会被欲望或冲动牵着走"},
{"only rarely feels strong cravings or urges", "很少有难以控制的欲望或冲动"},
{"never feels tempted to overindulge in anything", "不管遇到什么诱惑都不会放纵自己"},

// VIOLENT
{"is currently more violent", "目前更喜欢跟人打架"},
{"is currently less violent", "目前更不喜欢跟人打架"},
{"is given to rough-and-tumble brawling, even to the point of starting fights for no reason", "非常爱打架，甚至会没事找事地动手"},
{"would never pass up a chance for a good fistfight", "只要有架可打就不会错过"},
{"likes to brawl", "喜欢跟人打架"},
{"tends to avoid any physical confrontations", "一般都会躲开肢体冲突"},
{"does not enjoy participating in physical confrontations", "很不喜欢跟人动手"},
{"would flee even the most necessary battle to avoid any form of physical confrontation", "只要能避免动手，哪怕必须打也会逃走"},

// PERSEVERANCE
{"is currently more stubborn", "目前更固执，认准了就更不肯放弃"},
{"is currently less stubborn", "目前没那么固执，也更容易放弃"},
{"is unbelievably stubborn and will stick with even the most futile action once {p} mind is made up", "固执得吓人，一旦认准了就绝不回头，哪怕明知没用也一样"},
{"is very stubborn", "非常固执，认准了就不肯放弃"},
{"is stubborn", "有些固执，不会轻易放弃"},
{"has a noticeable lack of perseverance", "做事缺少耐心和毅力"},
{"doesn't stick with things if even minor difficulties arise", "遇到一点困难就坚持不下去"},
{"drops any activity at the slightest hint of difficulty or even the suggestion of effort being required", "只要事情有点难，或者看起来要费力，就会马上放弃"},

// WASTEFULNESS
{"is currently more wasteful", "目前做事更容易浪费材料和力气"},
{"is currently less wasteful", "目前做事更注意节省材料和力气"},
{"is completely careless with resources when completing projects and invariable wastes a lot of time and effort", "做事完全不算成本，总会浪费很多材料、时间和力气"},
{"is not careful with resources when working on projects and often spends unnecessary effort", "做事不太注意节省，常会白白浪费材料和力气"},
{"tends to be a little wasteful when working on projects", "做事时有点浪费"},
{"tends to be a little tight with resources when working on projects", "做事时有点舍不得用材料"},
{"is stingy with resources on projects and refuses to expend any extra effort", "做事很省材料，也不愿多花一点力气"},
{"cuts any corners possible when working on a project, regardless of the consequences, rather than wasting effort or resources", "做事只顾省材料和力气，哪怕偷工减料会出问题也不在乎"},

// DISCORD
{"is currently more discordant", "目前更喜欢挑起争吵和混乱"},
{"is currently more harmonious", "目前更希望大家和睦相处"},
{"revels in chaos and discord, and {p} encourages {p} whenever possible", "唯恐天下不乱，一有机会就会挑事"},
{"finds a chaotic mess preferable to the boredom of harmonious living", "宁可把日子过得鸡飞狗跳，也受不了一团和气的无聊"},
{"doesn't mind a little tumult and discord in day-to-day living", "不介意生活中有些争吵和混乱"},
{"prefers that everyone live as harmoniously as possible", "希望大家尽量和睦相处"},
{"feels best when everyone gets along without any strife or contention", "喜欢大家和和气气、不吵不闹"},
{"would be deeply satisfied if everyone could live as one in complete harmony", "最希望所有人都能亲如一家、和睦生活"},

// FRIENDLINESS
{"is currently more friendly", "目前对人更友好"},
{"is currently more quarrelsome", "目前更爱跟人争吵"},
{"is quite a bold flatterer, extremely friendly but just a little insufferable", "热情得有些过头，总爱当面说好话，甚至让人觉得是在拍马屁"},
{"is very friendly and always tries to say nice things to others", "对人很友好，也总爱说些好听的话"},
{"is a friendly individual", "对人很友好"},
{"is somewhat quarrelsome", "有点爱跟人争"},
{"is unfriendly and disagreeable", "对人不太友好，也不好相处"},
{"is a dyed-in-the-wool quarreler, never missing a chance to lash out in verbal hostility", "特别爱吵架，逮到机会就会骂人"},

// POLITENESS
{"is currently more polite", "目前更有礼貌"},
{"is currently more rude", "目前更粗鲁"},
{"exhibits a refined politeness and is determined to keep the guiding rules of etiquette and decorum as if life {p} depended on {p}", "举止非常得体，把礼貌和规矩看得比什么都重要"},
{"is very polite and observes appropriate rules of decorum when possible", "很有礼貌，也总会尽量守规矩"},
{"is quite polite", "很有礼貌"},
{"could be considered rude", "有时候显得有点粗鲁"},
{"is very impolite and inconsiderate of propriety", "很没礼貌，也不在乎这样是否得体"},
{"is a vulgar being who does not care a lick for even the most basic rules of civilized living", "十分粗俗，连最基本的礼貌和规矩都不在乎"},

// DISDAIN_ADVICE
{"is currently more disdainful", "目前更不愿听取别人的建议"},
{"is currently more prudent", "目前更愿意听取别人的建议"},
{"disdains even the best advice of associates and family, relying strictly on {p} own counsel", "谁的话都听不进去，哪怕亲友说得再有道理也只相信自己"},
{"dislikes receiving advice, preferring to keep {p} own counsel", "不喜欢别人给自己出主意，什么都想自己决定"},
{"has a tendency to go {p} alone, without considering the advice of others", "习惯自己做决定，很少考虑别人的意见"},
{"tends to ask others for help with difficult decisions", "遇到难做的决定时，通常会找别人商量"},
{"relies on the advice of others during decision making", "做决定时很依赖别人的意见"},
{"is unable to make decisions without a great deal of input from others", "要是没人反复帮着出主意，就根本拿不定主意"},

// BRAVERY
{"is currently more fearless", "目前更不怕危险"},
{"is currently more fearful", "目前更容易害怕危险"},
{"is utterly fearless when confronted with danger, to the point of lacking common sense", "遇到危险也完全不知道害怕，勇敢得有点不知死活"},
{"is incredibly brave in the face of looming danger, perhaps a bit foolhardy", "遇到危险时勇气惊人，有时甚至有些莽撞"},
{"is brave in the face of imminent danger", "遇到危险时很勇敢"},
{"is somewhat fearful in the face of imminent danger", "遇到危险时会有点害怕"},
{"has great trouble mastering fear when confronted by danger", "一遇到危险就很难克服恐惧"},
{"is a coward, completely overwhelmed by fear when confronted with danger", "非常胆小，一遇到危险就会吓得什么都做不了"},

// CONFIDENCE
{"is currently more confident", "目前更自信"},
{"is currently less confident", "目前没那么自信"},
{"presupposes success in any venture requiring {p} skills with what could be called blind overconfidence", "凡是要靠本事的事，都觉得自己一定能成，自信得有些过头"},
{"is extremely confident of {p} in situations requiring {p} skills", "对自己的本事非常有信心"},
{"is generally quite confident of {p} abilities when undertaking specific ventures", "做事时通常很相信自己的能力"},
{"sometimes acts with little determination and confidence", "做事有时不够果断，也不太自信"},
{"lacks confidence in {p} abilities", "对自己的能力没什么信心"},
{"has no confidence at all in {p} talent and abilities", "完全不相信自己的能力和天分"},

// VANITY
{"is currently more vain", "目前更在意自己的长相和才华"},
{"is currently less vain", "目前没那么在意自己的长相和才华"},
{"is completely wrapped up in {p} own appearance, abilities and other personal matters", "只关心自己的长相、本事和个人得失"},
{"is greatly pleased by {p} own looks and accomplishments", "对自己的长相和成就非常得意"},
{"is pleased by {p} own appearance and talents", "很满意自己的长相和才华"},
{"is not inherently proud of {p} talents and accomplishments", "不太会为自己的才华和成就感到骄傲"},
{"takes no pleasure in {p} talents and appearance", "不会因为自己的才华或长相而觉得得意"},
{"could not care less about {p} appearance, talents or other personal vanities", "根本不在乎自己的长相、才华和那些虚荣的东西"},

// AMBITION
{"is currently more ambitious", "目前更有上进心"},
{"is currently less ambitious", "目前没那么有上进心"},
{"has a relentless drive, completely consumed by ambition", "野心极大，一心只想不断往上爬"},
{"is very ambitious, always looking for a way to better {p} situation", "很有野心，总想让自己过得更好、地位更高"},
{"is quite ambitious", "很有上进心"},
{"isn't particularly ambitious", "没什么野心"},
{"is not driven and rarely feels the need to pursue even a modest success", "不求上进，连一点小成就都懒得去争"},
{"has no ambition whatsoever", "完全没有上进心，也不想做出什么成绩"},

// GRATITUDE
{"is currently more grateful", "目前更懂得感激别人的帮助"},
{"is currently less grateful", "目前没那么懂得感激别人的帮助"},
{"unerringly returns favors and has a profound sense of gratitude for the kind actions of others", "会把别人的好一直记在心里，而且一定会想办法回报"},
{"feels a strong need to reciprocate any favor done for {p}", "总想着找机会报答每一个帮过自己的人"},
{"is grateful when others help {p} out and tries to return favors", "受了别人的帮助就会感激，也会尽量回报"},
{"takes offered help and gifts without feeling particularly grateful", "接受别人的帮助和礼物时不会特别感激"},
{"accepts favors without developing a sense of obligation, preferring to act as the current situation demands", "受了别人好处也不觉得欠了人情，以后还是照自己的需要做事"},
{"does not feel the slightest need to reciprocate favors that others do for {p}, no matter how major the help or how much {p} needed {p}", "从来不想回报别人的帮助，哪怕对方帮过天大的忙也一样"},

// IMMODESTY
{"is currently more extravagant", "目前更喜欢打扮得华丽抢眼"},
{"is currently more austere", "目前更喜欢打扮得朴素得体"},
{"always presents {p} as extravagantly as possible, displaying a magnificent image to the world", "总要把自己打扮得非常华丽，生怕别人注意不到"},
{"likes to present {p} boldly, even if {p} would offend an average sense of modesty", "喜欢打扮得大胆抢眼，哪怕别人觉得不得体也不在乎"},
{"doesn't mind wearing something special now and again", "偶尔也喜欢穿点特别的东西"},
{"prefers to present {p} modestly", "更喜欢穿得朴素得体"},
{"presents {p} modestly and frowns on any flashy accoutrements", "穿着很朴素，也不喜欢花哨的装饰"},
{"cleaves to an austere lifestyle, disdaining even minor immodesties in appearance", "生活非常简朴，连稍微张扬一点的打扮都看不惯"},

// HUMOR
{"is currently more zany", "目前更爱开玩笑"},
{"is currently more humorless", "目前更缺乏幽默感"},
{"finds something humorous in everything, no matter how serious or inappropriate", "什么事都能拿来开玩笑，完全不管场合合不合适"},
{"finds the humor in most situations", "不管遇到什么，大多都能找到好笑的地方"},
{"has an active sense of humor", "很有幽默感，也爱开玩笑"},
{"has little interest in joking around", "不太喜欢开玩笑"},
{"does not find most jokes humorous", "觉得大多数笑话都不好笑"},
{"is utterly humorless", "一点幽默感都没有，什么玩笑都觉得无聊"},

// VENGEFUL
{"is currently more vengeful", "目前更容易记仇"},
{"is currently less vengeful", "目前更不容易记仇"},
{"is vengeful and never forgets or forgives past grievances", "有仇一定会报，过去的怨从来不会忘"},
{"has little time for forgiveness and will generally seek retribution", "很少原谅得罪过自己的人，通常都会报复"},
{"tends to hang on to grievances", "很容易记仇"},
{"doesn't tend to hold on to grievances", "不太记仇"},
{"does not generally seek retribution for past wrongs", "受了委屈通常也不会报复"},
{"has no sense of vengeance or retribution", "完全没有报复心"},

// PRIDE
{"is currently more proud", "目前更觉得自己了不起"},
{"is currently more humble", "目前更谦虚"},
{"is absorbed in delusions of self-importance", "自以为了不起，觉得自己是个大人物"},
{"has an overinflated sense of self-worth", "把自己看得太重要"},
{"thinks {p} is fairly important in the grand scheme of things", "觉得自己挺重要"},
{"is very humble", "很谦虚，从不把自己看得太重"},
{"has a low sense of self-esteem", "不太看得起自己"},
{"is completely convinced of {p} own worthlessness", "觉得自己一无是处，完全没有价值"},

// CRUELTY
{"is currently more cruel", "目前更残忍"},
{"is currently more merciful", "目前更容易心软"},
{"is deliberately cruel to those unfortunate enough to be subject to {p} sadism", "喜欢故意折磨落到自己手里的人"},
{"is sometimes cruel", "有时候很残忍"},
{"generally acts impartially and is rarely moved to mercy", "通常一视同仁，很少因为同情谁而手软"},
{"often acts with compassion", "经常会为别人着想"},
{"is easily moved to mercy", "很容易心软"},
{"always acts with mercy and compassion at the forefront of {p} considerations", "不管做什么都会先替别人着想，尽量不去伤害谁"},

// SINGLEMINDED
{"is currently more singleminded", "目前更专注于手头的事"},
{"is currently more scatterbrained", "目前更容易走神"},
{"pursues matters with a single-minded focus, often overlooking other matters", "一做起事来就只顾眼前这件，常常忘了其他事情"},
{"can be very single-minded", "专心起来时眼里就只剩一件事"},
{"generally acts with a narrow focus on the current activity", "做事时一般只盯着手头的事"},
{"can occasionally lose focus on the matter at hand", "偶尔会走神"},
{"is somewhat scatterbrained", "有点心不在焉，容易走神"},
{"is a complete scatterbrain, unable to focus on a single matter for more than a passing moment", "完全没法集中注意力，做什么都会马上走神"},

// HOPEFUL
{"is currently more presumptious", "目前对未来更乐观"},
{"is currently more despairing", "目前对未来更不抱希望"},
{"has such a developed sense of optimism that {p} always assumes the best outcome will eventually occur, no matter what", "乐观得有些过头，不管情况多糟都相信最后会有最好的结果"},
{"is an optimist", "很乐观，凡事都往好处想"},
{"generally finds {p} quite hopeful about the future", "对未来抱有希望"},
{"tends to assume the worst of two outcomes will be the one that comes to pass", "遇到两种可能时，总觉得更糟的那个会发生"},
{"is a pessimist", "很悲观，凡事都往坏处想"},
{"despairs of anything positive happening in the future and lives without feelings of hope", "觉得以后不会再有任何好事，已经完全不抱希望"},

// CURIOUS
{"is currently more curious", "目前好奇心更强"},
{"is currently less curious", "目前好奇心没那么强"},
{"is implacably curious, without any respect for propriety or privacy", "好奇心强得拦不住，为了弄清楚一件事根本不管礼貌和隐私"},
{"is very curious, sometimes to {p} detriment", "好奇心很强，有时会因此给自己惹麻烦"},
{"is curious and eager to learn", "对很多事情都好奇，也很想学新东西"},
{"isn't particularly curious about the world", "对周围的世界没多少好奇心"},
{"is very rarely moved by curiosity", "很少会好奇"},
{"is incurious and never seeks out knowledge or information to satisfy {p}", "对什么都不好奇，也从不主动了解新东西"},

// BASHFUL
{"is currently more bashful", "目前更害羞"},
{"is currently more shameless", "目前更不在乎别人的眼光"},
{"is gripped by a crippling shyness", "害羞得什么都不敢做"},
{"is bashful", "很害羞"},
{"tends to consider what others think of {p}", "经常在意别人怎么看自己"},
{"is not particularly interested in what others think of {p}", "不太在意别人怎么看自己"},
{"is generally unhindered by the thoughts of others concerning {p} actions", "通常不会因为别人的眼光而不敢做事"},
{"is shameless, absolutely unfazed by the thoughts of others", "完全不觉得害臊，也根本不在乎别人怎么看"},

// PRIVACY
{"is currently more private", "目前更看重隐私"},
{"is currently less private", "目前没那么看重隐私"},
{"is private to the point of paranoia, unwilling to reveal even basic information about {p}", "特别怕别人知道自己的事，连最基本的情况都不肯说"},
{"has a strong tendency toward privacy", "非常看重隐私"},
{"tends not to reveal personal information", "一般不愿谈自己的私事"},
{"tends to share {p} own experiences and thoughts with others", "喜欢跟别人分享自己的经历和想法"},
{"is not a private person and freely shares details of {p} life", "不太在乎隐私，生活中的很多细节都会告诉别人"},
{"shares intimate details of {p} life without sparing a thought to repercussions or propriety", "连很私密的生活细节都会随便告诉别人，完全不管后果或是否合适"},

// PERFECTIONIST
{"is currently more attentive", "目前做事更注意细节"},
{"is currently less attentive", "目前做事没那么注意细节"},
{"is obsessed with details and will often take a great deal of extra time to make sure things are done the right way", "特别在意细节，宁愿多花很多时间也要把事情做对"},
{"is a perfectionist", "做什么都想做到完美"},
{"tries to do things correctly each time", "每次都会尽量把事情做好"},
{"doesn't try to get things done perfectly", "不要求每件事都做到完美"},
{"is inattentive to detail in {p} own work", "做事不太注意细节"},
{"is frustratingly sloppy and careless with every task {p} sets to carry out", "做什么都马虎大意，粗心得让人受不了"},

// CLOSEMINDED
{"is currently less open-minded", "目前更不愿改变自己的想法"},
{"is currently more acquiescing", "目前更容易接受别人的看法"},
{"is completely closed-minded and never changes {p} mind after forming an initial idea", "特别认死理，一旦有了想法就绝不会改"},
{"is intellectually stubborn, rarely changing {p} mind during a debate regardless of the merits", "想法很固执，争论时就算对方有道理也很少改变意见"},
{"tends to be a bit stubborn in changing {p} mind about things", "有点认死理，不太愿意改变想法"},
{"doesn't cling tightly to ideas and is open to changing {p} mind", "不太坚持原来的看法，愿意听取不同意见"},
{"often finds {p} changing {p} mind to agree with somebody else", "经常听了别人的话就改变想法"},
{"easily changes {p} mind and will generally go with the prevailing view on anything", "很容易改变想法，通常大家怎么说就怎么想"},

// TOLERANT
{"is currently more tolerant", "目前更能接受与自己不同的人"},
{"is currently less tolerant", "目前更难接受与自己不同的人"},
{"is not bothered in the slightest by deviations from the norm or even extreme differences in lifestyle or appearance", "什么样的人都能接受，再奇怪的长相或生活方式也不会介意"},
{"is very comfortable around others that are different from {p}", "跟自己完全不同的人也能相处得很好"},
{"is quite comfortable with others that have a different appearance or culture", "跟长相或文化不同的人相处时也很自在"},
{"is somewhat uncomfortable around those that appear unusual or live differently from {p}", "跟长相奇怪或生活方式不同的人相处时会有些不自在"},
{"is made deeply uncomfortable by differences in culture or appearance", "很难接受文化或长相上的差别"},
{"cannot tolerate differences in culture, lifestyle or appearance", "完全不能容忍不同的文化、生活方式或长相"},

// EMOTIONALLY_OBSESSIVE
{"is currently more obsessive", "目前更容易与别人建立深厚的感情"},
{"is currently less obsessive", "目前更不容易与别人建立深厚的感情"},
{"is emotionally obsessive, forming life-long attachments even if they aren't reciprocated", "对感情特别执着，哪怕对方没有回应也会惦记一辈子"},
{"forms strong emotional bonds with others, at times to {p} detriment", "很容易跟别人产生很深的感情，有时还会因此伤到自己"},
{"has a tendency toward forming deep emotional bonds with others", "很容易跟别人建立深厚的感情"},
{"tends to form only tenuous emotional bonds with others", "跟别人的感情通常比较淡"},
{"forms only fleeting and rare emotional bonds with others", "很少对谁产生感情，就算有也不会长久"},
{"does not have feelings of emotional attachment and has never felt even a moment's connection with another being", "从不依恋谁，也从没跟任何人真正亲近过"},

// SWAYED_BY_EMOTIONS
{"is currently more sensitive", "目前更容易受别人情绪的影响"},
{"is currently less sensitive", "目前更不容易受别人情绪的影响"},
{"is buffeted by others' emotions and can't help but to respond to them", "很容易被别人的情绪带着走，想不受影响都做不到"},
{"is swayed by emotional appeals", "很容易被感情打动"},
{"tends to be swayed by the emotions of others", "常会受别人情绪的影响"},
{"tends not to be swayed by emotional appeals", "不太会因为感情而改变想法"},
{"does not generally respond to emotional appeals", "就算别人打感情牌，通常也不会动摇"},
{"is never moved by the emotions of others", "完全不会被别人的情绪和感情影响"},

// ALTRUISM
{"is currently more altruistic", "目前更愿意帮助别人"},
{"is currently less altruistic", "目前没那么愿意帮助别人"},
{"is truly fulfilled by assisting those in need", "很愿意帮助有困难的人，因为这样会觉得生活很有意义"},
{"finds helping others very emotionally rewarding", "很喜欢帮助别人，也会从中得到很大的满足"},
{"finds helping others emotionally rewarding", "喜欢帮助别人，也会因此觉得开心"},
{"does not go out of {p} way to help others", "不会特意费心去帮助别人"},
{"dislikes helping others", "不喜欢帮助别人"},
{"feels helping others is an imposition on {p} time", "觉得帮助别人是在浪费自己的时间"},

// DUTIFULNESS
{"is currently more dutiful", "目前责任心更强"},
{"is currently less dutiful", "目前责任心没那么强"},
{"has a profound sense of duty and obligation", "把责任看得比什么都重"},
{"has a strong sense of duty", "责任心很强"},
{"has a sense of duty", "很有责任感"},
{"finds obligations confining", "觉得责任是一种束缚"},
{"dislikes obligations and will try to avoid being bound by them", "不喜欢承担责任，总想躲开这些束缚"},
{"hates vows, obligations, promises and other binding elements that could restrict {p} life", "讨厌誓言、责任和承诺，凡是会限制自己的事都不愿沾"},

// THOUGHTLESSNESS
{"is currently more thoughtless", "目前做事更欠考虑"},
{"is currently more deliberate", "目前做事会想得更周全"},
{"never deliberates before acting, to the point of being considered thoughtless", "做事从不过脑子，鲁莽得让人受不了"},
{"doesn't generally think before acting", "做事通常不先想清楚"},
{"can sometimes act without deliberation", "有时没想清楚就会行动"},
{"tends to think before acting", "做事前一般会先想一想"},
{"can get caught up in internal deliberations when action is necessary", "需要行动时容易想得太多，迟迟下不了决定"},
{"never acts without prolonged deliberation, even to {p} own detriment and the harm of those around {p}", "不管什么事都要想很久才肯行动，哪怕拖下去会害到自己和身边的人"},

// ORDERLINESS
{"is currently more orderly", "目前更注意保持整洁"},
{"is currently more sloppy", "目前更不注意保持整洁"},
{"is obsessed with order and structure in {p} own life, with everything kept in {p} proper place", "特别在意整齐，所有东西都必须放在该放的位置"},
{"lives an orderly life, organized and neat", "生活很有条理，东西也收拾得很整齐"},
{"tries to keep {p} things orderly", "会尽量把自己的东西收拾整齐"},
{"tends to make a small mess with {p} own possessions", "自己的东西经常有点乱"},
{"is sloppy with {p} living space", "住的地方总是很乱"},
{"is completely oblivious to any conception of neatness and will just leave things strewn about without a care", "完全没有整洁的概念，东西总是随手乱扔"},

// TRUST
{"is currently more trusting", "目前更容易相信别人"},
{"is currently more distrustful", "目前更不容易相信别人"},
{"is naturally trustful of everybody", "天生没有戒心，谁都相信"},
{"is very trusting", "很容易相信别人"},
{"is trusting", "一般愿意相信别人"},
{"is slow to trust others", "不会轻易相信别人"},
{"does not trust others", "不相信别人"},
{"sees others as selfish and conniving", "觉得别人都很自私，而且总在算计自己"},

// GREGARIOUSNESS
{"is currently more gregarious", "目前更喜欢与人相处"},
{"is currently more of a loner", "目前更喜欢独处"},
{"truly treasures the company of others", "特别喜欢有人陪着，很怕孤单"},
{"enjoys being in crowds", "很喜欢待在人群里"},
{"enjoys the company of others", "喜欢和别人在一起"},
{"tends to avoid crowds", "一般会躲开人多的地方"},
{"prefers to be alone", "更喜欢一个人待着"},
{"considers spending time alone much more important than associating with others", "觉得独处比跟别人来往重要得多"},

// ASSERTIVENESS
{"is currently more overbearing", "目前说话更强势"},
{"is currently less assertive", "目前说话时没那么坚持自己的意见"},
{"is assertive to the point of aggression, unwilling to let others get a word in edgewise when {p} has something to say", "说话特别强势，自己一开口就不让别人插嘴"},
{"has an overbearing personality", "很强势，总想压过别人"},
{"is assertive", "敢说出自己的想法，也会坚持自己的意见"},
{"tends to be passive in discussions", "讨论时比较被动，不太主动说话"},
{"only rarely tries to assert {p} in conversation", "说话时很少坚持自己的意见"},
{"would never under any circumstances speak up or otherwise put forth {p} point of view in a discussion", "不管什么情况都不会在讨论中说出自己的想法"},

// ACTIVITY_LEVEL
{"is currently more frenetic", "目前生活节奏更快"},
{"is currently more leisurely", "目前生活节奏更悠闲"},
{"is driven by a bouncing frenetic energy", "精力多得用不完，一刻也闲不住"},
{"lives at a high-energy kinetic pace", "精力非常旺盛，做什么都风风火火"},
{"lives a fast-paced life", "生活节奏很快，总在忙个不停"},
{"likes to take {p} easy", "喜欢放慢节奏，轻轻松松地过日子"},
{"lives at a slow-going and leisurely pace", "生活节奏很慢，也很悠闲"},
{"has an utterly languid pace of easy living, calm and slow", "过得非常懒散，做什么都慢吞吞的"},

// EXCITEMENT_SEEKING
{"is currently more of a thrill seeker", "目前更喜欢寻求刺激"},
{"is currently less of a thrill seeker", "目前没那么喜欢寻求刺激"},
{"never fails to seek out the most stressful and even dangerous situations", "总爱找最紧张、最危险的事做"},
{"seeks out exciting and adventurous situations", "喜欢主动寻找刺激和冒险"},
{"likes a little excitement now and then", "偶尔想找点刺激"},
{"doesn't seek out excitement", "不会主动找刺激"},
{"actively avoids exciting or stressful situations", "会主动躲开刺激或压力大的事情"},
{"does everything in {p} power to avoid excitement and stress", "会想尽办法避开刺激和压力"},

// IMAGINATION
{"is currently more prone to flights of fancy", "目前更容易沉浸在幻想中"},
{"is currently more fact-oriented", "目前更关注现实"},
{"is bored by reality and would rather disappear utterly and forever into a world of made-up fantasy", "厌倦现实，只想永远躲进幻想的世界里"},
{"is given to flights of fancy to the point of distraction", "总爱胡思乱想，常常忘了眼前的事"},
{"has an active imagination", "想象力很丰富"},
{"isn't given to flights of fancy", "不太爱幻想"},
{"is grounded in reality", "很现实，也很踏实"},
{"is interested only in facts and the real world", "只关心事实和现实，对幻想完全没兴趣"},

// ABSTRACT_INCLINED
{"is currently more inclined to the abstract", "目前更喜欢琢磨抽象问题"},
{"is currently more inclined to the practical", "目前更关心实际问题"},
{"eschews practical concerns for philosophical discussion, puzzles, riddles and the world of ideas", "不爱管现实问题，只爱聊哲学、解谜题、琢磨各种想法"},
{"strongly prefers discussions of ideas and abstract concepts over handling specific practical issues", "比起解决实际问题，更喜欢聊想法和抽象概念"},
{"has a tendency to consider ideas and abstractions over practical applications", "更喜欢琢磨抽象问题，不太在意实际用途"},
{"likes to keep things practical, without delving too deeply into the abstract", "更关心实际问题，不太喜欢抽象讨论"},
{"dislikes abstract discussions and would much rather focus on practical examples", "不喜欢抽象讨论，更愿意看实际例子"},
{"is concerned only with matters practical to the situation at hand, with absolutely no inclination toward abstract discussion", "只关心眼前的实际问题，对抽象讨论完全没兴趣"},

// ART_INCLINED
{"is currently more inclined to create", "目前更有创作的兴致"},
{"is currently less inclined to create", "目前没那么有创作的兴致"},
{"can easily become absorbed in art and the beauty of the natural world", "很容易沉浸在艺术和自然风景里"},
{"is greatly moved by art and natural beauty", "很容易被艺术和自然风景打动"},
{"is moved by art and natural beauty", "喜欢艺术和自然风景，也会被它们打动"},
{"does not have a great aesthetic sensitivity", "对美没那么敏感"},
{"is not readily moved by art or natural beauty", "不太会被艺术或自然风景打动"},
{"is completely unmoved by art or the beauty of nature", "对艺术和自然风景完全没感觉"},

// Other stable sentences appended to the same personality description.
{"needs alcohol to get through the working day", "需要靠酒精撑过一天的工作"},
{"likes working outdoors and grumbles only mildly at inclement weather", "喜欢在户外工作，天气不好时也只会抱怨几句"},
{"does not mind being outdoors, at least for a time", "不介意在户外待一阵子"},
{"is getting used to tragedy", "已经开始习惯一次次悲剧"},
{"is a hardened individual", "经历太多，已经变得麻木"},
{"doesn't really care about anything anymore", "已经什么都不在乎了"},
