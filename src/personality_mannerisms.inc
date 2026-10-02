// Native Traits mannerism writer: PE:6a70a6d9:02711000,
// 0x1410e3280..0x1410e8145; 65 enum cases, 15 situation cases and defaults.
// Complete canonical sentences. {p} is the native grammatical pronoun;
// {s} is the translated subject; {b0}..{b16} retain caste MANNERISM slots.
// Dispatch/situation provenance and empty branches are recorded in
// data/extracted/personality-mannerism-sources.tsv.
// 0 TALKS_WHISPERS / NONE, WHEN_EXCITED, WHEN_SURPRISED, WHEN_EXASPERATED, WHEN_CONVERSATION_PAUSED, BEFORE_SPEAKING, WHEN_SPEAKING, WHEN_GREETING, WHEN_BORED, WHEN_ANNOYED, WHEN_SITTING, AFTER_STANDING
{"{p} usually speaks in a whisper", "{s}通常会低声耳语。"},
// 0 TALKS_WHISPERS / WHEN_ANGRY
{"{p} begins to talk in a hushed whisper when {p} is angry", "{s}生气时开始低声耳语。"},
// 0 TALKS_WHISPERS / WHEN_TRYING_TO_REMEMBER
{"{p} starts to whisper when {p} is trying to remember something", "{s}回想事情时开始低声耳语。"},
// 0 TALKS_WHISPERS / WHEN_NERVOUS
{"{p} whispers when {p}'s nervous", "{s}紧张时低声耳语。"},
// 0 TALKS_WHISPERS / WHEN_THINKING
{"{p} whispers when {p} is thinking hard about something", "{s}苦思时低声耳语。"},
// 1 TALKS_QUIETLY / NONE, WHEN_TRYING_TO_REMEMBER, WHEN_EXCITED, WHEN_SURPRISED, WHEN_THINKING, WHEN_EXASPERATED, WHEN_CONVERSATION_PAUSED, BEFORE_SPEAKING, WHEN_SPEAKING, WHEN_GREETING, WHEN_BORED, WHEN_ANNOYED, WHEN_SITTING, AFTER_STANDING
{"{p} speaks very quietly", "{s}轻声说话。"},
// 1 TALKS_QUIETLY / WHEN_ANGRY
{"{p} talks very quietly when {p} is angry", "{s}生气时轻声说话。"},
// 1 TALKS_QUIETLY / WHEN_NERVOUS
{"{p} keeps {p} voice very quiet when {p} is nervous", "{s}紧张时轻声说话。"},
// 2 TALKS_LOUDLY / NONE, WHEN_TRYING_TO_REMEMBER, WHEN_THINKING, WHEN_CONVERSATION_PAUSED, BEFORE_SPEAKING, WHEN_SPEAKING, WHEN_BORED, WHEN_SITTING, AFTER_STANDING
{"{p} speaks very loudly", "{s}大声说话。"},
// 2 TALKS_LOUDLY / WHEN_ANGRY
{"{p} starts yelling whenever {p} gets angry", "{s}生气时开始大声喊话。"},
// 2 TALKS_LOUDLY / WHEN_NERVOUS
{"{p} begins to talk louder when {p} is nervous", "{s}紧张时开始提高说话的声音。"},
// 2 TALKS_LOUDLY / WHEN_EXCITED
{"{p} talks very loudly when {p} is excited", "{s}兴奋时大声说话。"},
// 2 TALKS_LOUDLY / WHEN_SURPRISED
{"{p} shouts when {p} is {p} surprised", "{s}惊讶时大声喊话。"},
// 2 TALKS_LOUDLY / WHEN_EXASPERATED
{"{p} talks very loudly whenever {p} is exasperated", "{s}气恼时大声说话。"},
// 2 TALKS_LOUDLY / WHEN_GREETING
{"{p} greets others very loudly", "{s}问候别人时大声说话。"},
// 2 TALKS_LOUDLY / WHEN_ANNOYED
{"{p} talks very loudly whenever {p} is annoyed", "{s}烦躁时大声说话。"},
// 3 TALKS_MONOTONE / NONE, WHEN_TRYING_TO_REMEMBER, WHEN_NERVOUS, WHEN_EXCITED, WHEN_SURPRISED, WHEN_THINKING, WHEN_CONVERSATION_PAUSED, BEFORE_SPEAKING, WHEN_SPEAKING, WHEN_GREETING, WHEN_SITTING, AFTER_STANDING
{"{p} has a very monotonous way of speaking", "{s}说话的语气非常单调。"},
// 3 TALKS_MONOTONE / WHEN_ANGRY
{"{p} begins speaking in a monotone whenever {p} is angered", "{s}生气时开始用单调的语气说话。"},
// 3 TALKS_MONOTONE / WHEN_EXASPERATED
{"{p} starts to drone when {p} is exasperated", "{s}气恼时开始用单调的语气说话。"},
// 3 TALKS_MONOTONE / WHEN_BORED
{"{p} begins to talk in a monotone when {p} is bored", "{s}无聊时开始用单调的语气说话。"},
// 3 TALKS_MONOTONE / WHEN_ANNOYED
{"{p} speaks in a monotone when {p} is annoyed", "{s}烦躁时用单调的语气说话。"},
// 4 TALKS_TRAILS_OFF / NONE, WHEN_ANGRY, WHEN_NERVOUS, WHEN_EXCITED, WHEN_SURPRISED, WHEN_EXASPERATED, WHEN_CONVERSATION_PAUSED, BEFORE_SPEAKING, WHEN_SPEAKING, WHEN_GREETING, WHEN_BORED, WHEN_ANNOYED, WHEN_SITTING, AFTER_STANDING
{"{p} voice has a tendency to trail off when {p}'s speaking", "{s}说话时声音常会逐渐变小。"},
// 4 TALKS_TRAILS_OFF / WHEN_TRYING_TO_REMEMBER
{"{p} voice trails off whenever {p} tries to remember something", "{s}回想事情时说话的声音逐渐变小。"},
// 4 TALKS_TRAILS_OFF / WHEN_THINKING
{"{p} voice trails off when {p} is thinking about something", "{s}思考时说话的声音逐渐变小。"},
// 5 TALKS_SLOWLY / NONE, WHEN_TRYING_TO_REMEMBER, WHEN_NERVOUS, WHEN_EXCITED, WHEN_SURPRISED, WHEN_THINKING, WHEN_CONVERSATION_PAUSED, BEFORE_SPEAKING, WHEN_SPEAKING, WHEN_GREETING, WHEN_BORED, WHEN_SITTING, AFTER_STANDING
{"{p} generally speaks very slowly", "{s}说话通常很慢。"},
// 5 TALKS_SLOWLY / WHEN_ANGRY
{"{p} begins to talk more slowly when {p}'s angry", "{s}生气时开始放慢说话速度。"},
// 5 TALKS_SLOWLY / WHEN_EXASPERATED
{"{p} begins to talk much more slowly when {p}'s exasperated", "{s}气恼时开始以慢得多的速度说话。"},
// 5 TALKS_SLOWLY / WHEN_ANNOYED
{"When {p}'s annoyed, {p} starts to talk slowly", "{s}烦躁时开始慢慢说话。"},
// 6 TALKS_RAPIDLY / NONE, WHEN_TRYING_TO_REMEMBER, WHEN_THINKING, WHEN_EXASPERATED, WHEN_CONVERSATION_PAUSED, BEFORE_SPEAKING, WHEN_SPEAKING, WHEN_GREETING, WHEN_BORED, WHEN_ANNOYED, WHEN_SITTING, AFTER_STANDING
{"{p} usually talks very quickly", "{s}说话通常很快。"},
// 6 TALKS_RAPIDLY / WHEN_ANGRY
{"{p} begins to talk rapidly when {p} gets angry", "{s}生气时开始快速说话。"},
// 6 TALKS_RAPIDLY / WHEN_NERVOUS
{"{p} talks very quickly when {p}'s nervous", "{s}紧张时说话很快。"},
// 6 TALKS_RAPIDLY / WHEN_EXCITED
{"{p} speaks rapidly when {p}'s excited", "{s}兴奋时快速说话。"},
// 6 TALKS_RAPIDLY / WHEN_SURPRISED
{"{p} talks very rapidly after {p}'s been surprised", "{s}受到惊吓后说话很快。"},
// 7 TALKS_DELIBERATELY / NONE, WHEN_TRYING_TO_REMEMBER, WHEN_NERVOUS, WHEN_EXCITED, WHEN_SURPRISED, WHEN_THINKING, WHEN_CONVERSATION_PAUSED, BEFORE_SPEAKING, WHEN_SPEAKING, WHEN_GREETING, WHEN_BORED, WHEN_SITTING, AFTER_STANDING
{"{p} tends to speak very deliberately", "{s}往往会谨慎地吐字。"},
// 7 TALKS_DELIBERATELY / WHEN_ANGRY
{"{p} speaks very deliberately when {p}'s angry", "{s}生气时谨慎地吐字。"},
// 7 TALKS_DELIBERATELY / WHEN_EXASPERATED
{"When {p} becomes exasperated, {p} begins to speak very deliberately", "{s}气恼时开始谨慎地吐字。"},
// 7 TALKS_DELIBERATELY / WHEN_ANNOYED
{"{p} speaks very deliberately when {p}'s annoyed", "{s}烦躁时谨慎地吐字。"},
// 8 TALKS_MUTTERS_UNDER_BREATH / NONE, WHEN_SURPRISED, BEFORE_SPEAKING, WHEN_SPEAKING, WHEN_GREETING, WHEN_SITTING, AFTER_STANDING
{"{p} constantly mutters under {p} breath", "{s}不停地低声自语。"},
// 8 TALKS_MUTTERS_UNDER_BREATH / WHEN_ANGRY
{"{p} mutters under {p} breath when {p}'s angry", "{s}生气时低声自语。"},
// 8 TALKS_MUTTERS_UNDER_BREATH / WHEN_TRYING_TO_REMEMBER
{"{p} mutters under {p} breath when {p}'s trying to remember something", "{s}回想事情时低声自语。"},
// 8 TALKS_MUTTERS_UNDER_BREATH / WHEN_NERVOUS
{"{p} mutters under {p} breath when {p}'s nervous", "{s}紧张时低声自语。"},
// 8 TALKS_MUTTERS_UNDER_BREATH / WHEN_EXCITED
{"{p} starts to mutter under {p} breath when {p} gets excited", "{s}兴奋时开始低声自语。"},
// 8 TALKS_MUTTERS_UNDER_BREATH / WHEN_THINKING
{"{p} mutters under {p} breath when {p}'s thinking", "{s}思考时低声自语。"},
// 8 TALKS_MUTTERS_UNDER_BREATH / WHEN_EXASPERATED
{"When {p} becomes exasperated, {p} starts to mutter under {p} breath", "{s}气恼时开始低声自语。"},
// 8 TALKS_MUTTERS_UNDER_BREATH / WHEN_CONVERSATION_PAUSED
{"Whenever there's a pause in a conversation, {p} starts to mutter under {p} breath", "{s}交谈停顿时开始低声自语。"},
// 8 TALKS_MUTTERS_UNDER_BREATH / WHEN_BORED
{"{p} mutters under {p} breath when {p}'s bored", "{s}无聊时低声自语。"},
// 8 TALKS_MUTTERS_UNDER_BREATH / WHEN_ANNOYED
{"{p} mutters under {p} breath when {p}'s annoyed", "{s}烦躁时低声自语。"},
// 9 TALKS_STUTTERS / NONE, WHEN_TRYING_TO_REMEMBER, WHEN_THINKING, WHEN_CONVERSATION_PAUSED, BEFORE_SPEAKING, WHEN_SPEAKING, WHEN_GREETING, WHEN_BORED, WHEN_SITTING, AFTER_STANDING
{"{p} stutters occasionally", "{s}说话时偶尔会结巴。"},
// 9 TALKS_STUTTERS / WHEN_ANGRY
{"{p} starts to stutter when {p} gets angry", "{s}生气时开始结巴。"},
// 9 TALKS_STUTTERS / WHEN_NERVOUS
{"{p} always stutters when {p}'s nervous", "{s}紧张时总会结巴。"},
// 9 TALKS_STUTTERS / WHEN_EXCITED
{"{p} stammers when {p}'s excited", "{s}兴奋时结巴。"},
// 9 TALKS_STUTTERS / WHEN_SURPRISED
{"{p} starts to stutter when {p}'s surprised", "{s}惊讶时开始结巴。"},
// 9 TALKS_STUTTERS / WHEN_EXASPERATED
{"{p} begins to stammer when {p} becomes exasperated", "{s}气恼时开始结巴。"},
// 9 TALKS_STUTTERS / WHEN_ANNOYED
{"{p} stammers when {p}'s annoyed", "{s}烦躁时结巴。"},
// 10 TALKS_TO_INANIMATE_OBJECTS / NONE, WHEN_ANGRY, WHEN_EXCITED, WHEN_SURPRISED, WHEN_EXASPERATED, BEFORE_SPEAKING, WHEN_SPEAKING, WHEN_GREETING, WHEN_ANNOYED, WHEN_SITTING, AFTER_STANDING
{"{p} has a tendency to talk to inanimate objects", "{s}常会对没有生命的东西说话。"},
// 10 TALKS_TO_INANIMATE_OBJECTS / WHEN_TRYING_TO_REMEMBER
{"{p} talks to inanimate objects when {p}'s trying to remember something", "{s}回想事情时对没有生命的东西说话。"},
// 10 TALKS_TO_INANIMATE_OBJECTS / WHEN_NERVOUS
{"{p} often talks to inanimate objects when {p}'s nervous", "{s}紧张时经常对没有生命的东西说话。"},
// 10 TALKS_TO_INANIMATE_OBJECTS / WHEN_THINKING
{"{p} talks to inanimate objects when {p}'s thinking", "{s}思考时对没有生命的东西说话。"},
// 10 TALKS_TO_INANIMATE_OBJECTS / WHEN_CONVERSATION_PAUSED
{"{p} talks to inanimate objects when there is a lull in the conversation", "{s}交谈停顿时对没有生命的东西说话。"},
// 10 TALKS_TO_INANIMATE_OBJECTS / WHEN_BORED
{"When {p} gets bored, {p} starts talking to inanimate objects", "{s}无聊时开始对没有生命的东西说话。"},
// 11 TALKS_TO_SELF / NONE, WHEN_SURPRISED, BEFORE_SPEAKING, WHEN_SPEAKING, WHEN_GREETING, WHEN_SITTING, AFTER_STANDING
{"{p} talks to {p} all of the time", "{s}不停地自言自语。"},
// 11 TALKS_TO_SELF / WHEN_ANGRY
{"{p} talks to {p} when {p}'s angry", "{s}生气时自言自语。"},
// 11 TALKS_TO_SELF / WHEN_TRYING_TO_REMEMBER
{"{p} talks to {p} when {p}'s trying to remember something", "{s}回想事情时自言自语。"},
// 11 TALKS_TO_SELF / WHEN_NERVOUS
{"{p} talks to {p} when {p}'s nervous", "{s}紧张时自言自语。"},
// 11 TALKS_TO_SELF / WHEN_EXCITED
{"When {p} gets excited, {p} often starts talking to {p}", "{s}兴奋时经常开始自言自语。"},
// 11 TALKS_TO_SELF / WHEN_THINKING
{"{p} talks to {p} when {p}'s thinking", "{s}思考时自言自语。"},
// 11 TALKS_TO_SELF / WHEN_EXASPERATED
{"{p} starts talking to {p} when {p} becomes exasperated", "{s}气恼时开始自言自语。"},
// 11 TALKS_TO_SELF / WHEN_CONVERSATION_PAUSED
{"When there's a pause in a conversation, {p} often starts talking to {p}", "{s}交谈停顿时经常开始自言自语。"},
// 11 TALKS_TO_SELF / WHEN_BORED
{"{p} talks to {p} whenever {p} gets bored", "{s}无聊时自言自语。"},
// 11 TALKS_TO_SELF / WHEN_ANNOYED
{"{p} talks to {p} when {p}'s annoyed", "{s}烦躁时自言自语。"},
// 12 CONVERSATION_DISTRACTED_EASILY / NONE, WHEN_SURPRISED, WHEN_THINKING, WHEN_CONVERSATION_PAUSED, BEFORE_SPEAKING, WHEN_SPEAKING, WHEN_GREETING, WHEN_SITTING, AFTER_STANDING
{"{p} tends to be easily distracted during conversations", "{s}往往会在交谈中很容易走神。"},
// 12 CONVERSATION_DISTRACTED_EASILY / WHEN_ANGRY
{"{p} gets distracted from conversations easily when {p}'s angry", "{s}生气时在交谈中很容易走神。"},
// 12 CONVERSATION_DISTRACTED_EASILY / WHEN_TRYING_TO_REMEMBER
{"{p} is distracted from conversations easily when {p}'s trying to remember something", "{s}回想事情时在交谈中很容易走神。"},
// 12 CONVERSATION_DISTRACTED_EASILY / WHEN_NERVOUS
{"{p} gets distracted during conversations when {p}'s nervous", "{s}紧张时在交谈中走神。"},
// 12 CONVERSATION_DISTRACTED_EASILY / WHEN_EXCITED
{"{p} gets distracted during conversations when {p}'s excited", "{s}兴奋时在交谈中走神。"},
// 12 CONVERSATION_DISTRACTED_EASILY / WHEN_EXASPERATED
{"{p} gets distracted during conversations when {p}'s exasperated", "{s}气恼时在交谈中走神。"},
// 12 CONVERSATION_DISTRACTED_EASILY / WHEN_BORED
{"{p} is easily distracted during conversations when {p}'s bored", "{s}无聊时在交谈中很容易走神。"},
// 12 CONVERSATION_DISTRACTED_EASILY / WHEN_ANNOYED
{"{p} gets easily distracted during conversations when {p}'s annoyed", "{s}烦躁时在交谈中很容易走神。"},
// 13 CONVERSATION_POINTLESS_STORIES / NONE, WHEN_ANGRY, WHEN_TRYING_TO_REMEMBER, WHEN_SURPRISED, WHEN_THINKING, WHEN_EXASPERATED, WHEN_CONVERSATION_PAUSED, BEFORE_SPEAKING, WHEN_SPEAKING, WHEN_GREETING, WHEN_ANNOYED, WHEN_SITTING, AFTER_STANDING
{"{p} will frequently ramble on with stories that don't have any point or even conclusion", "{s}经常絮絮叨叨地讲没有重点、甚至没有结论的故事。"},
// 13 CONVERSATION_POINTLESS_STORIES / WHEN_NERVOUS
{"{p} often tells pointless stories when {p}'s nervous", "{s}紧张时经常讲没有重点的故事。"},
// 13 CONVERSATION_POINTLESS_STORIES / WHEN_EXCITED
{"When {p} gets excited, {p} often tells stories without any real point", "{s}兴奋时经常讲没有重点的故事。"},
// 13 CONVERSATION_POINTLESS_STORIES / WHEN_BORED
{"{p} quite often tells pointless stories when {p}'s bored", "{s}无聊时经常讲没有重点的故事。"},
// 14 CONVERSATION_VERY_FOCUSED / NONE, WHEN_NERVOUS, WHEN_EXCITED, WHEN_SURPRISED, WHEN_THINKING, WHEN_EXASPERATED, WHEN_CONVERSATION_PAUSED, BEFORE_SPEAKING, WHEN_SPEAKING, WHEN_GREETING, WHEN_BORED, WHEN_ANNOYED, WHEN_SITTING, AFTER_STANDING
{"{p} tends to be very focused during conversations", "{s}往往会在交谈中格外专注。"},
// 14 CONVERSATION_VERY_FOCUSED / WHEN_ANGRY
{"{p} becomes very focused during conversations when {p}'s angry", "{s}生气时在交谈中格外专注。"},
// 14 CONVERSATION_VERY_FOCUSED / WHEN_TRYING_TO_REMEMBER
{"{p} becomes very focused during conversations when {p}'s trying to remember something", "{s}回想事情时在交谈中格外专注。"},
// 15 CONVERSATION_LOOKS_FOR_RIGHT_WORD / NONE, WHEN_ANGRY, WHEN_TRYING_TO_REMEMBER, WHEN_NERVOUS, WHEN_EXCITED, WHEN_SURPRISED, WHEN_THINKING, WHEN_EXASPERATED, WHEN_CONVERSATION_PAUSED, BEFORE_SPEAKING, WHEN_SPEAKING, WHEN_GREETING, WHEN_BORED, WHEN_ANNOYED, WHEN_SITTING, AFTER_STANDING
{"{p} will often pause in conversation to look for the right word", "{s}交谈时经常停下来寻找合适的词语。"},
// 16 CONVERSATION_TOUCHES / NONE, WHEN_ANGRY, WHEN_TRYING_TO_REMEMBER, WHEN_SURPRISED, WHEN_THINKING, WHEN_EXASPERATED, WHEN_CONVERSATION_PAUSED, BEFORE_SPEAKING, WHEN_SPEAKING, WHEN_BORED, WHEN_ANNOYED, WHEN_SITTING, AFTER_STANDING
{"{p} often touches those to whom {p} is speaking", "{s}交谈时经常碰触对方。"},
// 16 CONVERSATION_TOUCHES / WHEN_NERVOUS
{"{p} often touches others during conversations when {p}'s nervous", "{s}紧张时经常在交谈中碰触对方。"},
// 16 CONVERSATION_TOUCHES / WHEN_EXCITED
{"{p} often touches others during conversations when {p}'s excited", "{s}兴奋时经常在交谈中碰触对方。"},
// 16 CONVERSATION_TOUCHES / WHEN_GREETING
{"{p} will often touch others when greeting them", "{s}问候别人时经常碰触对方。"},
// 17 CONVERSATION_ARGUES_IN_AGREEMENT / NONE, WHEN_ANGRY, WHEN_TRYING_TO_REMEMBER, WHEN_NERVOUS, WHEN_EXCITED, WHEN_SURPRISED, WHEN_THINKING, WHEN_EXASPERATED, WHEN_CONVERSATION_PAUSED, BEFORE_SPEAKING, WHEN_SPEAKING, WHEN_GREETING, WHEN_BORED, WHEN_ANNOYED, WHEN_SITTING, AFTER_STANDING
{"{p} has a way of arguing with those that are in agreement with {p}", "{s}常和对方争辩，即使双方意见相同。"},
// 18 CONVERSATION_FILLS_QUIET_PAUSES / NONE, WHEN_ANGRY, WHEN_TRYING_TO_REMEMBER, WHEN_EXCITED, WHEN_SURPRISED, WHEN_THINKING, WHEN_EXASPERATED, WHEN_CONVERSATION_PAUSED, BEFORE_SPEAKING, WHEN_SPEAKING, WHEN_GREETING, WHEN_BORED, WHEN_ANNOYED, WHEN_SITTING, AFTER_STANDING
{"{p} can't stand quiet pauses in conversations and always finds something to say", "{s}无法忍受交谈中的冷场，总会找话说。"},
// 18 CONVERSATION_FILLS_QUIET_PAUSES / WHEN_NERVOUS
{"When {p} is nervous, {p} never allows pauses to occur in conversation", "{s}紧张时从不让交谈冷场。"},
// 19 CONVERSATION_PAUSES_BEFORE_SPEAKING / NONE, WHEN_ANGRY, WHEN_TRYING_TO_REMEMBER, WHEN_NERVOUS, WHEN_EXCITED, WHEN_SURPRISED, WHEN_THINKING, WHEN_EXASPERATED, WHEN_CONVERSATION_PAUSED, BEFORE_SPEAKING, WHEN_SPEAKING, WHEN_GREETING, WHEN_BORED, WHEN_ANNOYED, WHEN_SITTING, AFTER_STANDING
{"{p} pauses before speaking", "{s}开口前先停顿一下。"},
// 20 CONVERSATION_TALKS_ABOUT_OTHERS_BEHIND_BACK / NONE, WHEN_ANGRY, WHEN_TRYING_TO_REMEMBER, WHEN_NERVOUS, WHEN_EXCITED, WHEN_SURPRISED, WHEN_THINKING, WHEN_EXASPERATED, WHEN_CONVERSATION_PAUSED, BEFORE_SPEAKING, WHEN_SPEAKING, WHEN_GREETING, WHEN_BORED, WHEN_ANNOYED, WHEN_SITTING, AFTER_STANDING
{"{p} talks about others behind their backs", "{s}在背后议论别人。"},
// 21 CONVERSATION_INTERRUPTS_OTHERS / NONE, WHEN_SURPRISED, WHEN_THINKING, WHEN_CONVERSATION_PAUSED, BEFORE_SPEAKING, WHEN_SPEAKING, WHEN_GREETING, WHEN_BORED, WHEN_SITTING, AFTER_STANDING
{"{p} has a habit of interrupting speakers", "{s}习惯打断说话的人。"},
// 21 CONVERSATION_INTERRUPTS_OTHERS / WHEN_ANGRY
{"{p} interrupts others during conversations when {p} is angry", "{s}生气时打断说话的人。"},
// 21 CONVERSATION_INTERRUPTS_OTHERS / WHEN_TRYING_TO_REMEMBER
{"{p} tends to interrupts others during conversations when {p} is trying to remember something", "{s}回想事情时往往会打断说话的人。"},
// 21 CONVERSATION_INTERRUPTS_OTHERS / WHEN_NERVOUS
{"When {p} is nervous, {p} often interrupts others during conversations", "{s}紧张时经常打断说话的人。"},
// 21 CONVERSATION_INTERRUPTS_OTHERS / WHEN_EXCITED
{"When {p} is excited during conversations, {p} often can't help interrupting others", "{s}交谈中兴奋起来时，经常忍不住打断别人。"},
// 21 CONVERSATION_INTERRUPTS_OTHERS / WHEN_EXASPERATED
{"{p} interrupts others during conversations when {p} is exasperated", "{s}气恼时打断说话的人。"},
// 21 CONVERSATION_INTERRUPTS_OTHERS / WHEN_ANNOYED
{"{p} interrupts others during conversations when {p} is annoyed", "{s}烦躁时打断说话的人。"},
// 22 CONVERSATION_VAGUE_ANSWERS / NONE, WHEN_ANGRY, WHEN_TRYING_TO_REMEMBER, WHEN_NERVOUS, WHEN_EXCITED, WHEN_SURPRISED, WHEN_THINKING, WHEN_EXASPERATED, WHEN_CONVERSATION_PAUSED, BEFORE_SPEAKING, WHEN_SPEAKING, WHEN_GREETING, WHEN_BORED, WHEN_ANNOYED, WHEN_SITTING, AFTER_STANDING
{"{p} gives incredibly vague answers to questions", "{s}回答问题时总是含糊其辞。"},
// 23 CONVERSATION_TURN_TO_SELF / NONE, WHEN_ANGRY, WHEN_TRYING_TO_REMEMBER, WHEN_NERVOUS, WHEN_EXCITED, WHEN_SURPRISED, WHEN_THINKING, WHEN_EXASPERATED, WHEN_CONVERSATION_PAUSED, BEFORE_SPEAKING, WHEN_SPEAKING, WHEN_GREETING, WHEN_BORED, WHEN_ANNOYED, WHEN_SITTING, AFTER_STANDING
{"{p} will without fail turn any conversation to {p}", "{s}每次都会把谈话的话题转到自己身上。"},
// 24 CONVERSATION_RARELY_SPEAKS / NONE, WHEN_TRYING_TO_REMEMBER, WHEN_SURPRISED, WHEN_THINKING, WHEN_CONVERSATION_PAUSED, BEFORE_SPEAKING, WHEN_SPEAKING, WHEN_GREETING, WHEN_BORED, WHEN_SITTING, AFTER_STANDING
{"{p} rarely speaks", "{s}很少说话。"},
// 24 CONVERSATION_RARELY_SPEAKS / WHEN_ANGRY
{"{p} rarely speaks when {p}'s angry", "{s}生气时很少说话。"},
// 24 CONVERSATION_RARELY_SPEAKS / WHEN_NERVOUS
{"When {p}'s nervous, {p} rarely talks", "{s}紧张时很少说话。"},
// 24 CONVERSATION_RARELY_SPEAKS / WHEN_EXCITED
{"{p} has trouble speaking when {p}'s excited", "{s}兴奋时难以开口说话。"},
// 24 CONVERSATION_RARELY_SPEAKS / WHEN_EXASPERATED
{"{p} rarely speaks when {p}'s exasperated", "{s}气恼时很少说话。"},
// 24 CONVERSATION_RARELY_SPEAKS / WHEN_ANNOYED
{"{p} rarely speaks when {p}'s annoyed", "{s}烦躁时很少说话。"},
// 25 CONVERSATION_RARELY_STARTS / NONE, WHEN_ANGRY, WHEN_TRYING_TO_REMEMBER, WHEN_NERVOUS, WHEN_EXCITED, WHEN_SURPRISED, WHEN_THINKING, WHEN_EXASPERATED, WHEN_CONVERSATION_PAUSED, BEFORE_SPEAKING, WHEN_SPEAKING, WHEN_GREETING, WHEN_BORED, WHEN_ANNOYED, WHEN_SITTING, AFTER_STANDING
{"{p} rarely starts conversations", "{s}很少主动发起交谈。"},
// 26 CONVERSATION_QUESTION_WITH_QUESTION / NONE, WHEN_ANGRY, WHEN_TRYING_TO_REMEMBER, WHEN_NERVOUS, WHEN_EXCITED, WHEN_SURPRISED, WHEN_THINKING, WHEN_EXASPERATED, WHEN_CONVERSATION_PAUSED, BEFORE_SPEAKING, WHEN_SPEAKING, WHEN_GREETING, WHEN_BORED, WHEN_ANNOYED, WHEN_SITTING, AFTER_STANDING
{"{p} has the habit of answering questions with questions", "{s}习惯用问题来回答问题。"},
// 27 FINGERS_SNAPS / NONE, WHEN_ANGRY, WHEN_SURPRISED, WHEN_THINKING, WHEN_EXASPERATED, WHEN_CONVERSATION_PAUSED, BEFORE_SPEAKING, WHEN_SPEAKING, WHEN_ANNOYED, WHEN_SITTING, AFTER_STANDING
{"{p} has a habit of snapping {p} {b1}", "{s}习惯用{b1}打响指。"},
// 27 FINGERS_SNAPS / WHEN_TRYING_TO_REMEMBER
{"{p} repeatedly snaps {p} {b1} when {p} is trying to remember something", "{s}回想事情时反复用{b1}打响指。"},
// 27 FINGERS_SNAPS / WHEN_NERVOUS
{"{p} often snaps {p} {b1} when {p}'s nervous", "{s}紧张时经常用{b1}打响指。"},
// 27 FINGERS_SNAPS / WHEN_EXCITED
{"{p} snaps {p} {b1} repeatedly when {p}'s excited", "{s}兴奋时反复用{b1}打响指。"},
// 27 FINGERS_SNAPS / WHEN_GREETING
{"{p} always snaps {p} {b1} when {p}'s greeting somebody", "{s}问候别人时总会用{b1}打响指。"},
// 27 FINGERS_SNAPS / WHEN_BORED
{"{p} often snaps {p} {b1} when {p}'s bored", "{s}无聊时经常用{b1}打响指。"},
// 28 FINGERS_DRUMS / NONE, WHEN_ANGRY, WHEN_SURPRISED, WHEN_EXASPERATED, WHEN_CONVERSATION_PAUSED, BEFORE_SPEAKING, WHEN_SPEAKING, WHEN_GREETING, WHEN_BORED, WHEN_ANNOYED, AFTER_STANDING
{"{p} has a habit of drumming {p} {b1}", "{s}习惯用{b1}敲打。"},
// 28 FINGERS_DRUMS / WHEN_TRYING_TO_REMEMBER
{"{p} drums {p} {b1} when {p}'s trying to remember something", "{s}回想事情时用{b1}敲打。"},
// 28 FINGERS_DRUMS / WHEN_NERVOUS
{"When {p}'s nervous, {p} often drums {p} {b1}", "{s}紧张时经常用{b1}敲打。"},
// 28 FINGERS_DRUMS / WHEN_EXCITED
{"When {p} gets excited, {p}'s easy to tell because {p} drums {p} {b1}", "{s}兴奋时很容易被看出来，因为会用{b1}敲打。"},
// 28 FINGERS_DRUMS / WHEN_THINKING
{"{p} drums {p} {b1} when {p}'s thinking", "{s}思考时用{b1}敲打。"},
// 28 FINGERS_DRUMS / WHEN_SITTING
{"{p} drums {p} {b1} whenever {p}'s sitting down", "{s}坐着时用{b1}敲打。"},
// 29 FINGERS_SCRATCHES_NOSE / NONE, WHEN_ANGRY, WHEN_EXCITED, WHEN_SURPRISED, WHEN_EXASPERATED, WHEN_CONVERSATION_PAUSED, BEFORE_SPEAKING, WHEN_SPEAKING, WHEN_GREETING, WHEN_ANNOYED, WHEN_SITTING, AFTER_STANDING
{"{p} has a habit of scratching {p} {b2}", "{s}习惯抓挠{b2}。"},
// 29 FINGERS_SCRATCHES_NOSE / WHEN_TRYING_TO_REMEMBER
{"{p} scratches {p} {b2} when {p}'s trying to remember something", "{s}回想事情时抓挠{b2}。"},
// 29 FINGERS_SCRATCHES_NOSE / WHEN_NERVOUS
{"{p} scratches {p} {b2} when {p}'s nervous", "{s}紧张时抓挠{b2}。"},
// 29 FINGERS_SCRATCHES_NOSE / WHEN_THINKING
{"{p} scratches {p} {b2} when {p}'s thinking", "{s}思考时抓挠{b2}。"},
// 29 FINGERS_SCRATCHES_NOSE / WHEN_BORED
{"When {p}'s bored, {p} often scratches {p} {b2}", "{s}无聊时经常抓挠{b2}。"},
// 30 FINGERS_SCRATCHES_EAR / NONE, WHEN_ANGRY, WHEN_EXCITED, WHEN_SURPRISED, WHEN_EXASPERATED, WHEN_CONVERSATION_PAUSED, BEFORE_SPEAKING, WHEN_SPEAKING, WHEN_GREETING, WHEN_ANNOYED, WHEN_SITTING, AFTER_STANDING
{"{p} tends to scratch {p} {b3} quite often", "{s}经常抓挠{b3}。"},
// 30 FINGERS_SCRATCHES_EAR / WHEN_TRYING_TO_REMEMBER
{"{p} scratches {p} {b3} when {p}'s trying to remember something", "{s}回想事情时抓挠{b3}。"},
// 30 FINGERS_SCRATCHES_EAR / WHEN_NERVOUS
{"{p} scratches {p} {b3} when {p}'s nervous", "{s}紧张时抓挠{b3}。"},
// 30 FINGERS_SCRATCHES_EAR / WHEN_THINKING
{"{p} scratches {p} {b3} when {p}'s thinking", "{s}思考时抓挠{b3}。"},
// 30 FINGERS_SCRATCHES_EAR / WHEN_BORED
{"{p} scratches {p} {b3} whenever {p}'s bored", "{s}无聊时抓挠{b3}。"},
// 31 FINGERS_SCRATCHES_HEAD / NONE, WHEN_ANGRY, WHEN_EXCITED, WHEN_SURPRISED, WHEN_EXASPERATED, WHEN_CONVERSATION_PAUSED, BEFORE_SPEAKING, WHEN_SPEAKING, WHEN_GREETING, WHEN_ANNOYED, WHEN_SITTING, AFTER_STANDING
{"{p} tends to scratch {p} {b4} a lot", "{s}经常抓挠{b4}。"},
// 31 FINGERS_SCRATCHES_HEAD / WHEN_TRYING_TO_REMEMBER
{"{p} always scratches {p} {b4} when {p}'s trying to remember something", "{s}回想事情时总会抓挠{b4}。"},
// 31 FINGERS_SCRATCHES_HEAD / WHEN_NERVOUS
{"{p} scratches {p} {b4} when {p}'s nervous", "{s}紧张时抓挠{b4}。"},
// 31 FINGERS_SCRATCHES_HEAD / WHEN_THINKING
{"{p} scratches {p} {b4} when {p}'s thinking", "{s}思考时抓挠{b4}。"},
// 31 FINGERS_SCRATCHES_HEAD / WHEN_BORED
{"{p} scratches {p} {b4} when {p}'s bored", "{s}无聊时抓挠{b4}。"},
// 32 FINGERS_RUBS_EYES / NONE, WHEN_ANGRY, WHEN_TRYING_TO_REMEMBER, WHEN_NERVOUS, WHEN_EXCITED, WHEN_SURPRISED, WHEN_THINKING, WHEN_EXASPERATED, WHEN_CONVERSATION_PAUSED, BEFORE_SPEAKING, WHEN_SPEAKING, WHEN_GREETING, WHEN_BORED, WHEN_ANNOYED, WHEN_SITTING, AFTER_STANDING
{"{p} often rubs {p} {b5}", "{s}经常揉{b5}。"},
// 33 FINGERS_POINT / WHEN_ANGRY
{"{p} points and shakes {p} {b0} when {p}'s angry", "{s}生气时指点并晃动{b0}。"},
// 33 FINGERS_POINT / WHEN_TRYING_TO_REMEMBER
{"{p} shakes {p} {b0} up and down when {p}'s trying to remember something", "{s}回想事情时上下晃动{b0}。"},
// 33 FINGERS_POINT / WHEN_EXCITED
{"{p} shakes {p} {b0} up and down when {p}'s excited", "{s}兴奋时上下晃动{b0}。"},
// 33 FINGERS_POINT / WHEN_EXASPERATED
{"When {p} gets exasperated, {p} often points and shakes {p} {b0}", "{s}气恼时经常指点并晃动{b0}。"},
// 33 FINGERS_POINT / WHEN_GREETING
{"{p} always points at others when greeting them", "{s}问候别人时总会指着别人。"},
// 34 FINGERS_THROUGH_HAIR / NONE, WHEN_ANGRY, WHEN_EXCITED, WHEN_SURPRISED, WHEN_CONVERSATION_PAUSED, BEFORE_SPEAKING, WHEN_SPEAKING, WHEN_GREETING, WHEN_SITTING, AFTER_STANDING
{"{p} has a habit of running {p} {b1} through {p} {b7}", "{s}习惯用{b1}梳理{b7}。"},
// 34 FINGERS_THROUGH_HAIR / WHEN_TRYING_TO_REMEMBER
{"{p} runs {p} {b1} through {p} {b7} when {p}'s trying to remember something", "{s}回想事情时用{b1}梳理{b7}。"},
// 34 FINGERS_THROUGH_HAIR / WHEN_NERVOUS
{"{p} runs {p} {b1} through {p} {b7} when {p}'s nervous", "{s}紧张时用{b1}梳理{b7}。"},
// 34 FINGERS_THROUGH_HAIR / WHEN_THINKING
{"{p} runs {p} {b1} through {p} {b7} when {p}'s thinking", "{s}思考时用{b1}梳理{b7}。"},
// 34 FINGERS_THROUGH_HAIR / WHEN_EXASPERATED
{"{p} runs {p} {b1} through {p} {b7} when {p} becomes exasperated", "{s}气恼时用{b1}梳理{b7}。"},
// 34 FINGERS_THROUGH_HAIR / WHEN_BORED
{"{p} runs {p} {b1} through {p} {b7} when {p}'s bored", "{s}无聊时用{b1}梳理{b7}。"},
// 34 FINGERS_THROUGH_HAIR / WHEN_ANNOYED
{"{p} runs {p} {b1} through {p} {b7} when {p}'s annoyed", "{s}烦躁时用{b1}梳理{b7}。"},
// 35 FINGERS_KNUCKLE_CRACKS / NONE, WHEN_TRYING_TO_REMEMBER, WHEN_EXCITED, WHEN_SURPRISED, WHEN_EXASPERATED, WHEN_CONVERSATION_PAUSED, BEFORE_SPEAKING, WHEN_SPEAKING, WHEN_GREETING, WHEN_ANNOYED, WHEN_SITTING, AFTER_STANDING
{"{p} occasionally cracks {p} {b8}", "{s}偶尔会活动{b8}并使其发出响声。"},
// 35 FINGERS_KNUCKLE_CRACKS / WHEN_ANGRY
{"{p} cracks {p} {b8} when {p}'s angry", "{s}生气时活动{b8}并使其发出响声。"},
// 35 FINGERS_KNUCKLE_CRACKS / WHEN_NERVOUS
{"When {p}'s nervous, {p} sometimes cracks {p} {b8}", "{s}紧张时有时会活动{b8}并使其发出响声。"},
// 35 FINGERS_KNUCKLE_CRACKS / WHEN_THINKING
{"{p} often gives {p} {b8} a good crack when {p}'s thinking hard", "{s}苦思时经常用力活动{b8}并使其发出响声。"},
// 35 FINGERS_KNUCKLE_CRACKS / WHEN_BORED
{"{p} cracks {p} {b8} when {p}'s bored", "{s}无聊时活动{b8}并使其发出响声。"},
// 36 LAUGHS_VERY_DISTINCTLY / NONE, WHEN_ANGRY, WHEN_TRYING_TO_REMEMBER, WHEN_THINKING, WHEN_CONVERSATION_PAUSED, BEFORE_SPEAKING, WHEN_SPEAKING, WHEN_GREETING, WHEN_BORED, WHEN_SITTING, AFTER_STANDING
{"{p} has a very distinct laugh", "{s}笑声很有特点。"},
// 36 LAUGHS_VERY_DISTINCTLY / WHEN_NERVOUS
{"{p} laughs in a unique way when {p}'s nervous", "{s}紧张时笑声很有特点。"},
// 36 LAUGHS_VERY_DISTINCTLY / WHEN_EXCITED
{"{p} has a very distinct laugh for when {p}'s excited", "{s}兴奋时笑声很有特点。"},
// 36 LAUGHS_VERY_DISTINCTLY / WHEN_SURPRISED
{"When {p}'s surprised, {p} has a very unique laugh", "{s}惊讶时笑声很有特点。"},
// 36 LAUGHS_VERY_DISTINCTLY / WHEN_EXASPERATED
{"{p} laughs in a distinct fashion when {p}'s exasperated", "{s}气恼时笑声很有特点。"},
// 36 LAUGHS_VERY_DISTINCTLY / WHEN_ANNOYED
{"{p} laughs in a unique way whenever {p}'s annoyed", "{s}烦躁时笑声很有特点。"},
// 37 LAUGHS_CACKLES / NONE, WHEN_ANGRY, WHEN_TRYING_TO_REMEMBER, WHEN_EXCITED, WHEN_SURPRISED, WHEN_THINKING, WHEN_EXASPERATED, WHEN_CONVERSATION_PAUSED, BEFORE_SPEAKING, WHEN_SPEAKING, WHEN_GREETING, WHEN_BORED, WHEN_ANNOYED, WHEN_SITTING, AFTER_STANDING
{"{p} has more a cackle than a laugh", "{s}笑起来更像是在发出咯咯的叫声。"},
// 37 LAUGHS_CACKLES / WHEN_NERVOUS
{"{p} cackles when {p}'s nervous", "{s}紧张时发出咯咯的笑声。"},
// 38 LAUGHS_LOUDLY / NONE, WHEN_ANGRY, WHEN_TRYING_TO_REMEMBER, WHEN_THINKING, WHEN_EXASPERATED, WHEN_CONVERSATION_PAUSED, BEFORE_SPEAKING, WHEN_SPEAKING, WHEN_GREETING, WHEN_BORED, WHEN_ANNOYED, WHEN_SITTING, AFTER_STANDING
{"{p} laughs very loudly", "{s}大声发笑。"},
// 38 LAUGHS_LOUDLY / WHEN_NERVOUS
{"{p} laughs very loudly whenever {p}'s nervous", "{s}紧张时大声发笑。"},
// 38 LAUGHS_LOUDLY / WHEN_EXCITED
{"{p} laughs loudly when {p}'s excited", "{s}兴奋时大声发笑。"},
// 38 LAUGHS_LOUDLY / WHEN_SURPRISED
{"{p} laughs very loudly whenever {p}'s surprised", "{s}惊讶时大声发笑。"},
// 39 LAUGHS_SILENTLY / NONE, WHEN_ANGRY, WHEN_TRYING_TO_REMEMBER, WHEN_NERVOUS, WHEN_EXCITED, WHEN_SURPRISED, WHEN_THINKING, WHEN_EXASPERATED, WHEN_CONVERSATION_PAUSED, BEFORE_SPEAKING, WHEN_SPEAKING, WHEN_GREETING, WHEN_BORED, WHEN_ANNOYED, WHEN_SITTING, AFTER_STANDING
{"{p} laughs silently", "{s}无声地笑。"},
// 40 LAUGHS_NERVOUSLY / NONE, WHEN_ANGRY, WHEN_TRYING_TO_REMEMBER, WHEN_NERVOUS, WHEN_EXCITED, WHEN_SURPRISED, WHEN_THINKING, WHEN_EXASPERATED, WHEN_CONVERSATION_PAUSED, BEFORE_SPEAKING, WHEN_SPEAKING, WHEN_GREETING, WHEN_BORED, WHEN_ANNOYED, WHEN_SITTING, AFTER_STANDING
{"{p} has a nervous laugh", "{s}笑声显得紧张。"},
// 41 LAUGHS_AT_OWN_JOKES / NONE, WHEN_ANGRY, WHEN_TRYING_TO_REMEMBER, WHEN_NERVOUS, WHEN_EXCITED, WHEN_SURPRISED, WHEN_THINKING, WHEN_EXASPERATED, WHEN_CONVERSATION_PAUSED, BEFORE_SPEAKING, WHEN_SPEAKING, WHEN_GREETING, WHEN_BORED, WHEN_ANNOYED, WHEN_SITTING, AFTER_STANDING
{"{p} laughs at {p} own jokes", "{s}被自己讲的笑话逗笑。"},
// 42 WALK_ALWAYS_HURRIES / NONE, WHEN_ANGRY, WHEN_TRYING_TO_REMEMBER, WHEN_NERVOUS, WHEN_EXCITED, WHEN_SURPRISED, WHEN_THINKING, WHEN_EXASPERATED, WHEN_CONVERSATION_PAUSED, BEFORE_SPEAKING, WHEN_SPEAKING, WHEN_GREETING, WHEN_BORED, WHEN_ANNOYED, WHEN_SITTING, AFTER_STANDING
{"{p} walks as if in a terrible hurry whenever {p} goes anywhere", "{s}无论去哪里都走得匆匆忙忙。"},
// 43 WALK_SKIPS / NONE, WHEN_ANGRY, WHEN_TRYING_TO_REMEMBER, WHEN_NERVOUS, WHEN_SURPRISED, WHEN_THINKING, WHEN_EXASPERATED, WHEN_CONVERSATION_PAUSED, BEFORE_SPEAKING, WHEN_SPEAKING, WHEN_BORED, WHEN_ANNOYED, WHEN_SITTING, AFTER_STANDING
{"{p} skips wherever {p} goes", "{s}走到哪里都蹦跳着前进。"},
// 43 WALK_SKIPS / WHEN_EXCITED
{"{p} skips around when {p}'s excited", "{s}兴奋时蹦跳着走路。"},
// 43 WALK_SKIPS / WHEN_GREETING
{"{p} skips over to others when {p} meets them", "{s}见到别人时蹦跳着走向对方。"},
// 44 WALK_CONFIDENT / NONE, WHEN_ANGRY, WHEN_TRYING_TO_REMEMBER, WHEN_NERVOUS, WHEN_EXCITED, WHEN_SURPRISED, WHEN_THINKING, WHEN_EXASPERATED, WHEN_CONVERSATION_PAUSED, BEFORE_SPEAKING, WHEN_SPEAKING, WHEN_GREETING, WHEN_BORED, WHEN_ANNOYED, WHEN_SITTING, AFTER_STANDING
{"{p} walks with a confident stride", "{s}行走时步伐显得很自信。"},
// 45 POSTURE_RIGID / NONE, WHEN_TRYING_TO_REMEMBER, WHEN_EXCITED, WHEN_EXASPERATED, WHEN_CONVERSATION_PAUSED, BEFORE_SPEAKING, WHEN_SPEAKING, WHEN_GREETING, WHEN_BORED, WHEN_ANNOYED, WHEN_SITTING, AFTER_STANDING
{"{p} holds {p} in a rigid posture", "{s}保持僵硬的姿势。"},
// 45 POSTURE_RIGID / WHEN_ANGRY
{"{p} becomes very rigid when {p}'s angry", "{s}生气时身体绷得很紧。"},
// 45 POSTURE_RIGID / WHEN_NERVOUS
{"{p} tenses up when {p}'s nervous", "{s}紧张时身体绷紧。"},
// 45 POSTURE_RIGID / WHEN_SURPRISED
{"{p} stiffens up when {p}'s surprised", "{s}惊讶时身体绷紧。"},
// 45 POSTURE_RIGID / WHEN_THINKING
{"When {p}'s thinking, {p} body becomes very still", "{s}思考时身体变得静止不动。"},
// 46 POSTURE_SLOUCH / NONE, WHEN_ANGRY, WHEN_TRYING_TO_REMEMBER, WHEN_NERVOUS, WHEN_EXCITED, WHEN_SURPRISED, WHEN_THINKING, WHEN_EXASPERATED, WHEN_CONVERSATION_PAUSED, BEFORE_SPEAKING, WHEN_SPEAKING, WHEN_GREETING, WHEN_ANNOYED, WHEN_SITTING, AFTER_STANDING
{"{p} has a slouching posture", "{s}含胸驼背。"},
// 46 POSTURE_SLOUCH / WHEN_BORED
{"{p} slouches when {p}'s bored", "{s}无聊时含胸驼背。"},
// 47 CHEWS_LIP / NONE, WHEN_SURPRISED, WHEN_EXASPERATED, WHEN_CONVERSATION_PAUSED, BEFORE_SPEAKING, WHEN_SPEAKING, WHEN_GREETING, WHEN_SITTING, AFTER_STANDING
{"{p} tends to chew {p} {b9}", "{s}往往会咬{b9}。"},
// 47 CHEWS_LIP / WHEN_ANGRY
{"{p} chews {p} {b9} when {p}'s angry", "{s}生气时咬{b9}。"},
// 47 CHEWS_LIP / WHEN_TRYING_TO_REMEMBER
{"When {p}'s trying to remember something, {p} often starts chewing on {p} {b9}", "{s}回想事情时经常开始咬{b9}。"},
// 47 CHEWS_LIP / WHEN_NERVOUS
{"{p} chews {p} {b9} when {p}'s nervous", "{s}紧张时咬{b9}。"},
// 47 CHEWS_LIP / WHEN_EXCITED
{"{p} chews {p} {b9} when {p} gets excited", "{s}兴奋时咬{b9}。"},
// 47 CHEWS_LIP / WHEN_THINKING
{"{p} chews {p} {b9} intently when {p}'s thinking", "{s}思考时专心地咬{b9}。"},
// 47 CHEWS_LIP / WHEN_BORED
{"{p} idly chews {p} {b9} when {p}'s bored", "{s}无聊时无意识地咬{b9}。"},
// 47 CHEWS_LIP / WHEN_ANNOYED
{"{p} gnaws {p} {b9} when {p}'s annoyed", "{s}烦躁时啃咬{b9}。"},
// 48 CHEWS_CHEEK / NONE, WHEN_SURPRISED, WHEN_EXASPERATED, WHEN_CONVERSATION_PAUSED, BEFORE_SPEAKING, WHEN_SPEAKING, WHEN_GREETING, WHEN_SITTING, AFTER_STANDING
{"{p} has a habit of chewing on {p} {b10}", "{s}习惯咬{b10}。"},
// 48 CHEWS_CHEEK / WHEN_ANGRY
{"{p} chews {p} {b10} when {p}'s angry", "{s}生气时咬{b10}。"},
// 48 CHEWS_CHEEK / WHEN_TRYING_TO_REMEMBER
{"When {p}'s nervous, {p} tends to chew on {p} {b10}", "{s}紧张时往往会咬{b10}。"},
// 48 CHEWS_CHEEK / WHEN_NERVOUS
{"When {p}'s nervous, {p} has a habit of chewing on {p} {b10}", "{s}紧张时习惯咬{b10}。"},
// 48 CHEWS_CHEEK / WHEN_EXCITED
{"{p} gnaws on {p} {b10} when {p}'s excited", "{s}兴奋时啃咬{b10}。"},
// 48 CHEWS_CHEEK / WHEN_THINKING
{"When {p}'s thinking, {p} has a tendency to chew on {p} {b10}", "{s}思考时常会咬{b10}。"},
// 48 CHEWS_CHEEK / WHEN_BORED
{"{p} chews {p} {b10} when {p}'s bored", "{s}无聊时咬{b10}。"},
// 48 CHEWS_CHEEK / WHEN_ANNOYED
{"{p} gnaws {p} {b10} when {p} is annoyed", "{s}烦躁时啃咬{b10}。"},
// 49 CHEWS_NAIL_BITING / NONE, WHEN_ANGRY, WHEN_EXCITED, WHEN_SURPRISED, WHEN_EXASPERATED, WHEN_CONVERSATION_PAUSED, BEFORE_SPEAKING, WHEN_SPEAKING, WHEN_GREETING, WHEN_SITTING, AFTER_STANDING
{"{p} bites {p} {b11}", "{s}咬{b11}。"},
// 49 CHEWS_NAIL_BITING / WHEN_TRYING_TO_REMEMBER
{"{p} often bites {p} {b11} when {p}'s trying to remember something", "{s}回想事情时经常咬{b11}。"},
// 49 CHEWS_NAIL_BITING / WHEN_NERVOUS
{"{p} bites {p} {b11} when {p}'s nervous", "{s}紧张时咬{b11}。"},
// 49 CHEWS_NAIL_BITING / WHEN_THINKING
{"{p} chews {p} {b11} when {p}'s thinking", "{s}思考时咬{b11}。"},
// 49 CHEWS_NAIL_BITING / WHEN_BORED
{"{p} bites {p} {b11} when {p} gets bored", "{s}无聊时咬{b11}。"},
// 49 CHEWS_NAIL_BITING / WHEN_ANNOYED
{"{p} bites {p} {b11} when {p}'s annoyed", "{s}烦躁时咬{b11}。"},
// 50 HUGS / NONE, WHEN_ANGRY, WHEN_TRYING_TO_REMEMBER, WHEN_NERVOUS, WHEN_EXCITED, WHEN_SURPRISED, WHEN_THINKING, WHEN_EXASPERATED, WHEN_CONVERSATION_PAUSED, BEFORE_SPEAKING, WHEN_SPEAKING, WHEN_BORED, WHEN_ANNOYED, WHEN_SITTING, AFTER_STANDING
{"{p} gives hugs out freely", "{s}很乐意主动拥抱别人。"},
// 50 HUGS / WHEN_GREETING
{"{p} often greets others with a hug", "{s}问候别人时经常拥抱别人。"},
// 51 SMILES_NERVOUSLY / NONE, WHEN_ANGRY, WHEN_TRYING_TO_REMEMBER, WHEN_NERVOUS, WHEN_EXCITED, WHEN_SURPRISED, WHEN_THINKING, WHEN_EXASPERATED, WHEN_CONVERSATION_PAUSED, BEFORE_SPEAKING, WHEN_SPEAKING, WHEN_BORED, WHEN_ANNOYED, WHEN_SITTING, AFTER_STANDING
{"{p} has a nervous smile", "{s}紧张地微笑。"},
// 51 SMILES_NERVOUSLY / WHEN_GREETING
{"When greeting others, {p} always smiles nervously", "{s}问候别人时总会紧张地微笑。"},
// 52 HANDS_MOVE / WHEN_ANGRY
{"{p} {b14} become animated when {p} gets angry", "{s}生气时{b14}动作变得活跃。"},
// 52 HANDS_MOVE / WHEN_TRYING_TO_REMEMBER
{"{p} {b14} move frantically when {p}'s trying to remember something", "{s}回想事情时{b14}急促地摆动。"},
// 52 HANDS_MOVE / WHEN_EXCITED
{"{p} {b14} jump all over the place when {p}'s excited", "{s}兴奋时{b14}四处摆动。"},
// 52 HANDS_MOVE / WHEN_SURPRISED
{"{p} {b14} are animated when {p}'s surprised", "{s}惊讶时{b14}动作变得活跃。"},
// 52 HANDS_MOVE / WHEN_EXASPERATED
{"{p} {b14} begin moving when {p} becomes exasperated", "{s}气恼时{b14}开始动起来。"},
// 52 HANDS_MOVE / WHEN_SPEAKING
{"{p} {b14} are animated when {p} speaks", "{s}说话时{b14}动作变得活跃。"},
// 53 FEET_TAP / NONE, WHEN_EXCITED, WHEN_SURPRISED, WHEN_THINKING, WHEN_EXASPERATED, BEFORE_SPEAKING, WHEN_SPEAKING, WHEN_GREETING, WHEN_BORED, AFTER_STANDING
{"{p} has a habit of tapping {p} {b12}", "{s}习惯用{b12}轻点地面。"},
// 53 FEET_TAP / WHEN_ANGRY
{"{p} stomps {p} {b12} repeatedly when {p}'s angry", "{s}生气时反复跺{b12}。"},
// 53 FEET_TAP / WHEN_TRYING_TO_REMEMBER
{"When {p}'s trying to remember something, {p} usually starts tapping {p} {b12}", "{s}回想事情时通常会开始用{b12}轻点地面。"},
// 53 FEET_TAP / WHEN_NERVOUS
{"{p} taps {p} {b12} constantly when {p}'s nervous", "{s}紧张时不停地用{b12}轻点地面。"},
// 53 FEET_TAP / WHEN_CONVERSATION_PAUSED
{"{p} taps {p} {b12} when there's a lull in conversation", "{s}交谈停顿时用{b12}轻点地面。"},
// 53 FEET_TAP / WHEN_ANNOYED
{"{p} taps {p} {b12} when {p}'s annoyed", "{s}烦躁时用{b12}轻点地面。"},
// 53 FEET_TAP / WHEN_SITTING
{"{p} taps {p} {b12} whenever {p}'s sitting down", "{s}坐着时用{b12}轻点地面。"},
// 54 EYES_LOWERS / NONE, WHEN_EXCITED, WHEN_SURPRISED, WHEN_EXASPERATED, WHEN_CONVERSATION_PAUSED, BEFORE_SPEAKING, WHEN_GREETING, WHEN_BORED, WHEN_SITTING, AFTER_STANDING
{"{p} often has {p} {b5} lowered to the ground", "{s}经常垂下{b5}看向地面。"},
// 54 EYES_LOWERS / WHEN_ANGRY
{"{p} lowers {p} {b5} when {p}'s angry", "{s}生气时垂下{b5}。"},
// 54 EYES_LOWERS / WHEN_TRYING_TO_REMEMBER
{"{p} lowers {p} {b5} when {p}'s trying to remember something", "{s}回想事情时垂下{b5}。"},
// 54 EYES_LOWERS / WHEN_NERVOUS
{"{p} lowers {p} {b5} when {p}'s nervous", "{s}紧张时垂下{b5}。"},
// 54 EYES_LOWERS / WHEN_THINKING
{"{p} often lowers {p} {b5} when {p}'s thinking", "{s}思考时经常垂下{b5}。"},
// 54 EYES_LOWERS / WHEN_SPEAKING
{"When {p} is speaking, {p} usually lowers {p} {b5}", "{s}通常会垂下{b5}。"},
// 54 EYES_LOWERS / WHEN_ANNOYED
{"{p} lowers {p} {b5} when {p}'s annoyed", "{s}烦躁时垂下{b5}。"},
// 55 EYES_STARES / NONE, WHEN_TRYING_TO_REMEMBER, WHEN_NERVOUS, WHEN_EXCITED, WHEN_SURPRISED, WHEN_EXASPERATED, WHEN_CONVERSATION_PAUSED, BEFORE_SPEAKING, WHEN_GREETING, WHEN_BORED, WHEN_SITTING, AFTER_STANDING
{"{p} has a habit of staring at others", "{s}习惯盯着别人看。"},
// 55 EYES_STARES / WHEN_ANGRY
{"{p} has a menacing stare when {p}'s angry", "{s}生气时目光带着威吓。"},
// 55 EYES_STARES / WHEN_THINKING
{"{p} stares intently when {p}'s thinking", "{s}思考时目光格外专注。"},
// 55 EYES_STARES / WHEN_SPEAKING
{"{p} tends to stare unwaveringly when {p}'s speaking to somebody", "{s}说话时往往会目不转睛地盯着对方。"},
// 55 EYES_STARES / WHEN_ANNOYED
{"{p} has a certain stare for when {p} gets annoyed", "{s}烦躁时会露出特有的眼神。"},
// 56 EYES_WINKS / NONE, WHEN_ANGRY, WHEN_TRYING_TO_REMEMBER, WHEN_EXCITED, WHEN_SURPRISED, WHEN_THINKING, WHEN_EXASPERATED, WHEN_CONVERSATION_PAUSED, BEFORE_SPEAKING, WHEN_BORED, WHEN_ANNOYED, WHEN_SITTING, AFTER_STANDING
{"{p} is quick to wink at others", "{s}动不动就向别人眨眼示意。"},
// 56 EYES_WINKS / WHEN_NERVOUS
{"{p} winks when {p} is nervous", "{s}紧张时向别人眨眼示意。"},
// 56 EYES_WINKS / WHEN_SPEAKING
{"{p} winks during conversations", "{s}交谈时向别人眨眼示意。"},
// 56 EYES_WINKS / WHEN_GREETING
{"{p} commonly winks as a form of greeting", "{s}问候别人时经常向别人眨眼示意。"},
// 57 EYES_ROLLS / NONE, WHEN_ANGRY, WHEN_TRYING_TO_REMEMBER, WHEN_NERVOUS, WHEN_EXCITED, WHEN_SURPRISED, WHEN_THINKING, WHEN_CONVERSATION_PAUSED, BEFORE_SPEAKING, WHEN_SPEAKING, WHEN_GREETING, WHEN_SITTING, AFTER_STANDING
{"{p} has a habit of rolling {p} {b5}", "{s}习惯转动{b5}。"},
// 57 EYES_ROLLS / WHEN_EXASPERATED
{"{p} rolls {p} {b5} when {p}'s exasperated", "{s}气恼时转动{b5}。"},
// 57 EYES_ROLLS / WHEN_BORED
{"When {p}'s bored, {p} constantly rolls {p} {b5}", "{s}无聊时不停地转动{b5}。"},
// 57 EYES_ROLLS / WHEN_ANNOYED
{"{p} rolls {p} {b5} when {p}'s annoyed", "{s}烦躁时转动{b5}。"},
// 58 BLOWS_BREATH_OUT / WHEN_ANGRY
{"{p} exhales sharply when {p} gets angry", "{s}生气时猛地呼气。"},
// 58 BLOWS_BREATH_OUT / WHEN_EXASPERATED
{"{p} exhales sharply when {p} becomes exasperated", "{s}气恼时猛地呼气。"},
// 58 BLOWS_BREATH_OUT / WHEN_BORED
{"{p} exhales slowly and deliberately when {p} starts getting bored", "{s}开始感到无聊时缓慢而刻意地呼气。"},
// 58 BLOWS_BREATH_OUT / WHEN_ANNOYED
{"{p} blows {p} breath out when {p}'s annoyed", "{s}烦躁时把气吐出来。"},
// 59 BREATHES_IN / WHEN_ANGRY
{"{p} inhales sharply when {p} is angry", "{s}生气时猛地吸气。"},
// 59 BREATHES_IN / WHEN_NERVOUS
{"{p} holds {p} breath when {p}'s nervous", "{s}紧张时屏住呼吸。"},
// 59 BREATHES_IN / WHEN_SURPRISED
{"{p} always takes a deep breath whenever {p} is surprised", "{s}惊讶时总会深吸一口气。"},
// 60 TONGUE_CLICKS / NONE, WHEN_ANGRY, WHEN_EXCITED, WHEN_SURPRISED, WHEN_CONVERSATION_PAUSED, BEFORE_SPEAKING, WHEN_SPEAKING, WHEN_GREETING, WHEN_SITTING, AFTER_STANDING
{"{p} has a habit of clicking {p} {b15}", "{s}习惯用{b15}发出轻响。"},
// 60 TONGUE_CLICKS / WHEN_TRYING_TO_REMEMBER
{"{p} clicks {p} {b15} constantly when {p}'s trying to remember something", "{s}回想事情时不停地用{b15}发出轻响。"},
// 60 TONGUE_CLICKS / WHEN_NERVOUS
{"When {p} is nervous, {p} clicks {p} {b15}", "{s}紧张时用{b15}发出轻响。"},
// 60 TONGUE_CLICKS / WHEN_THINKING
{"When {p}'s thinking, {p} clicks {p} {b15} repeatedly", "{s}思考时反复用{b15}发出轻响。"},
// 60 TONGUE_CLICKS / WHEN_EXASPERATED
{"When {p} becomes exasperated, {p} clicks {p} {b15}", "{s}气恼时用{b15}发出轻响。"},
// 60 TONGUE_CLICKS / WHEN_BORED
{"{p} clicks {p} {b15} occasionally when {p}'s bored", "{s}无聊时偶尔会用{b15}发出轻响。"},
// 60 TONGUE_CLICKS / WHEN_ANNOYED
{"{p} clicks {p} {b15} repeatedly when {p}'s annoyed", "{s}烦躁时反复用{b15}发出轻响。"},
// 61 TONGUE_STICKS_OUT / WHEN_TRYING_TO_REMEMBER
{"{p} {b15} sticks out when {p}'s trying to remember something", "{s}回想事情时伸出{b15}。"},
// 61 TONGUE_STICKS_OUT / WHEN_THINKING
{"{p} sticks out {p} {b15} when {p}'s thinking hard", "{s}苦思时伸出{b15}。"},
// 62 TONGUE_LICKS_LIPS / NONE, WHEN_ANGRY, WHEN_TRYING_TO_REMEMBER, WHEN_EXCITED, WHEN_SURPRISED, WHEN_EXASPERATED, WHEN_CONVERSATION_PAUSED, BEFORE_SPEAKING, WHEN_SPEAKING, WHEN_GREETING, WHEN_BORED, WHEN_ANNOYED, WHEN_SITTING, AFTER_STANDING
{"{p} licks {p} {b9} frequently", "{s}经常舔{b9}。"},
// 62 TONGUE_LICKS_LIPS / WHEN_NERVOUS
{"{p} licks {p} {b9} when {p}'s nervous", "{s}紧张时舔{b9}。"},
// 62 TONGUE_LICKS_LIPS / WHEN_THINKING
{"When {p}'s thinking hard, {p} has a habit of licking {p} {b9}", "{s}苦思时习惯舔{b9}。"},
// 63 STRETCHES / NONE, WHEN_ANGRY, WHEN_TRYING_TO_REMEMBER, WHEN_EXCITED, WHEN_SURPRISED, WHEN_EXASPERATED, BEFORE_SPEAKING, WHEN_SPEAKING, WHEN_GREETING, WHEN_ANNOYED, WHEN_SITTING
{"{p} likes to stretch {p} out frequently", "{s}喜欢经常伸展身体。"},
// 63 STRETCHES / WHEN_NERVOUS
{"When {p}'s nervous, {p} tends to stretch {p} body", "{s}紧张时往往会伸展身体。"},
// 63 STRETCHES / WHEN_THINKING
{"{p} tends to stretch {p} body when {p}'s thinking", "{s}思考时往往会伸展身体。"},
// 63 STRETCHES / WHEN_CONVERSATION_PAUSED
{"{p} has a habit of stretching {p} body during pauses in conversation", "{s}交谈停顿时习惯伸展身体。"},
// 63 STRETCHES / WHEN_BORED
{"{p} tends to stretch out when {p}'s bored", "{s}无聊时往往会伸展身体。"},
// 63 STRETCHES / AFTER_STANDING
{"{p} tends to stretch {p} body after {p} stands up", "{s}站起身后往往会伸展身体。"},
// 64 LEG_BOUNCES / NONE, WHEN_ANGRY, WHEN_TRYING_TO_REMEMBER, WHEN_NERVOUS, WHEN_EXCITED, WHEN_SURPRISED, WHEN_THINKING, WHEN_EXASPERATED, WHEN_CONVERSATION_PAUSED, BEFORE_SPEAKING, WHEN_SPEAKING, WHEN_GREETING, WHEN_BORED, WHEN_ANNOYED, WHEN_SITTING, AFTER_STANDING
{"{p} bounces {p} {b16} whenever {p} is sitting down", "{s}坐着时抖动{b16}。"},
