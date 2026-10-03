// The terminal is a separate sink from run_command_silent's buffered stream.
// Hook only Console's own color_ostream vtable. DFHack retains its native
// console mutex, batch bookkeeping, UTF-8 output and prompt refresh policy.
#ifdef _WIN32
static std::optional<std::string> translate_dfhack_console_output(std::string_view source);
static std::optional<std::string> translate_dfhack_console_item_caption(std::string_view source);
static std::optional<std::string> translate_dfhack_console_owned_literal(
    std::string_view scope, std::string_view source);
static std::optional<std::string> translate_dfhack_console_item_report(
    std::string_view command, std::string_view source);

using NativeDfhackConsoleTextFn = void (*)(void *, int, const NativeString *);
using NativeDfhackConsoleBatchFn = void (*)(void *);
static std::atomic<NativeDfhackConsoleTextFn> g_native_dfhack_console_text{nullptr};
static std::atomic<NativeDfhackConsoleBatchFn> g_native_dfhack_console_begin{nullptr};
static std::atomic<NativeDfhackConsoleBatchFn> g_native_dfhack_console_end{nullptr};
static std::atomic<NativeDfhackConsoleBatchFn> g_native_dfhack_console_flush{nullptr};
static std::atomic_bool g_native_dfhack_console_buffering{false};
static std::atomic_uint g_native_dfhack_console_callbacks{0};
static std::atomic_bool g_native_dfhack_console_tracking_failed{false};
static std::mutex g_native_dfhack_console_hook_mutex;
static std::mutex g_native_dfhack_console_pending_mutex;

struct NativeDfhackConsoleCall {
    NativeInputCallbackScope callback;
    NativeDfhackConsoleCall() {
        g_native_dfhack_console_callbacks.fetch_add(1, std::memory_order_acq_rel);
    }
    ~NativeDfhackConsoleCall() {
        g_native_dfhack_console_callbacks.fetch_sub(1, std::memory_order_acq_rel);
    }
};

struct NativeDfhackConsoleFragment {
    int color = -1;
    std::string text;
};
using NativeDfhackConsoleFragments = std::vector<NativeDfhackConsoleFragment>;
struct NativeDfhackConsoleThread {
    void *console = nullptr;
    std::thread::id thread;
    bool operator==(const NativeDfhackConsoleThread &) const = default;
};
struct NativeDfhackConsoleThreadHash {
    size_t operator()(const NativeDfhackConsoleThread &key) const noexcept {
        return std::hash<void *>{}(key.console) ^
            (std::hash<std::thread::id>{}(key.thread) << 1);
    }
};
struct NativeDfhackConsolePending {
    unsigned batch_depth = 0;
    size_t bytes = 0;
    NativeDfhackConsoleFragments fragments;
};
static std::unordered_map<NativeDfhackConsoleThread, NativeDfhackConsolePending,
    NativeDfhackConsoleThreadHash> g_native_dfhack_console_pending;
// instruments.lua writes its placement prefix and recipe with separate
// print calls. Keep only the owned prefix until this console/thread's next
// actual output; no native print is delayed and no game pointer is retained.
static std::unordered_map<NativeDfhackConsoleThread, std::string,
    NativeDfhackConsoleThreadHash> g_native_dfhack_console_instrument_prefixes;

static std::string native_dfhack_console_take_instrument_prefix(void *console) {
    std::lock_guard<std::mutex> lock(g_native_dfhack_console_pending_mutex);
    const NativeDfhackConsoleThread key{console, std::this_thread::get_id()};
    const auto found = g_native_dfhack_console_instrument_prefixes.find(key);
    if (found == g_native_dfhack_console_instrument_prefixes.end()) return {};
    auto prefix = std::move(found->second);
    g_native_dfhack_console_instrument_prefixes.erase(found);
    return prefix;
}

static NativeDfhackConsoleThread native_dfhack_console_thread(void *console) {
    return {console, std::this_thread::get_id()};
}

static NativeString native_dfhack_console_borrow(const std::string &text) {
    NativeString result = native_empty_string();
    result.size = text.size();
    if (text.size() <= 15) {
        std::memcpy(result.storage.small, text.c_str(), text.size() + 1);
    } else {
        // Console::add_text and Private::print_text only read this const
        // string's c_str(). Its buffer remains owned by this core and is
        // never copied, resized or destroyed by the native MSVC runtime.
        result.storage.heap = const_cast<char *>(text.c_str());
        result.capacity = text.size();
    }
    return result;
}

static void native_dfhack_console_forward(NativeDfhackConsoleCall &call,
        void *console, int color, const std::string &text) {
    const auto original = g_native_dfhack_console_text.load(std::memory_order_acquire);
    if (!original) return;
    const auto borrowed = native_dfhack_console_borrow(text);
    call.callback.call_native([&] { original(console, color, &borrowed); });
}

#include "native_dfhack_console_colors.inc"

static void native_dfhack_console_emit(NativeDfhackConsoleCall &call, void *console,
        const NativeDfhackConsoleFragments &fragments, bool translate,
        size_t begin = 0, size_t end = SIZE_MAX, bool structured_colors = true,
        bool launcher_batch = false) {
    end = std::min(end, fragments.size());
    if (begin >= end) return;
    if (launcher_batch && translate &&
            g_native_dfhack_console_buffering.load(std::memory_order_acquire) &&
            g_overlay.translation_enabled()) {
        try {
            std::string source;
            for (size_t at = begin; at < end; ++at) source += fragments[at].text;
            if (auto ticket = native_dfhack_take_launcher_echo_ticket(console, source)) {
                const bool same_color = std::all_of(fragments.begin() + begin, fragments.begin() + end,
                    [&](const auto &fragment) { return fragment.color == fragments[begin].color; });
                auto body = same_color ? translate_dfhack_console_item_report(
                    ticket->report_command.empty() ? ticket->launcher_command : ticket->report_command,
                    ticket->caption) : std::nullopt;
                if (body && contains_cjk_utf8(*body) &&
                        std::none_of(body->begin(), body->end(), [](unsigned char ch) {
                            return (ch < ' ' && ch != '\n' && ch != '\t') || ch == 0x7f;
                        })) {
                    const auto header = translate_dfhack_console_output(ticket->prefix);
                    native_dfhack_console_forward(call, console, fragments[begin].color,
                        (header ? *header : ticket->prefix) + *body + ticket->ending);
                    return;
                }
                // The exact producer family remains owned even when no
                // caption is known. Do not reinterpret its numeric/enum rows.
                for (size_t at = begin; at < end; ++at)
                    native_dfhack_console_forward(call, console, fragments[at].color, fragments[at].text);
                return;
            }
        } catch (...) {}
    }
    // A plugs/error batch can contain several native colors. Keep each run's
    // color, including separately colored command names and diagnostics.
    // Translation cannot recolor the whole batch from its first message.
    if (translate && std::any_of(fragments.begin() + begin, fragments.begin() + end,
            [&](const auto &fragment) { return fragment.color != fragments[begin].color; })) {
        if (structured_colors && g_native_dfhack_console_buffering.load(std::memory_order_acquire) &&
                g_overlay.translation_enabled()) {
            struct Operation { bool translated; NativeDfhackConsoleFragments fragments; };
            std::vector<Operation> operations;
            bool changed = false;
            try {
                NativeDfhackConsoleFragments record, pending;
                const auto finish = [&]() {
                    if (record.empty()) return;
                    const bool mixed = std::any_of(record.begin(), record.end(),
                        [&](const auto &part) { return part.color != record.front().color; });
                    auto target = mixed ? native_dfhack_console_color_record(record) : std::nullopt;
                    if (target) {
                        if (!pending.empty()) operations.push_back({false, std::move(pending)});
                        pending.clear();
                        operations.push_back({true, std::move(*target)});
                        changed = true;
                    } else {
                        for (auto &part : record) pending.push_back(std::move(part));
                    }
                    record.clear();
                };
                for (size_t at = begin; at < end; ++at) {
                    const auto &part = fragments[at];
                    for (size_t cursor = 0; cursor < part.text.size();) {
                        const size_t newline = part.text.find('\n', cursor);
                        const size_t last = newline == std::string::npos ? part.text.size() : newline + 1;
                        record.push_back({part.color, part.text.substr(cursor, last - cursor)});
                        cursor = last;
                        if (newline != std::string::npos) finish();
                    }
                }
                finish();
                if (changed && !pending.empty()) operations.push_back({false, std::move(pending)});
            } catch (...) {
                // No native output has been written while records are prepared.
                // Allocation/translation failure retains the original color runs.
                changed = false;
            }
            if (changed) {
                for (const auto &operation : operations) {
                    if (operation.translated)
                        for (const auto &part : operation.fragments)
                            native_dfhack_console_forward(call, console, part.color, part.text);
                    else native_dfhack_console_emit(call, console, operation.fragments,
                        true, 0, SIZE_MAX, false);
                }
                return;
            }
        }
        for (size_t at = begin; at < end;) {
            size_t next = at + 1;
            while (next < end && fragments[next].color == fragments[at].color) ++next;
            native_dfhack_console_emit(call, console, fragments, true, at, next, false);
            at = next;
        }
        return;
    }
    if (translate && g_native_dfhack_console_buffering.load(std::memory_order_acquire) &&
            g_overlay.translation_enabled()) {
        try {
            std::string source;
            size_t bytes = 0;
            for (size_t at = begin; at < end; ++at) bytes += fragments[at].text.size();
            source.reserve(bytes);
            for (size_t at = begin; at < end; ++at) source += fragments[at].text;
            if (auto target = translate_dfhack_console_output(source); target && !target->empty()) {
                // A trusted message translation cannot swallow the terminal's
                // final newline(s), including a blank separator after a block.
                size_t source_newlines = 0, target_newlines = 0;
                for (size_t at = source.size(); at > 0 && source[at - 1] == '\n'; --at)
                    ++source_newlines;
                for (size_t at = target->size(); at > 0 && (*target)[at - 1] == '\n'; --at)
                    ++target_newlines;
                if (source_newlines > target_newlines)
                    target->append(source_newlines - target_newlines, '\n');
                int color = fragments[begin].color;
                for (size_t at = begin; at < end; ++at) {
                    const auto &fragment = fragments[at];
                    if (!trim_view(fragment.text).empty()) { color = fragment.color; break; }
                }
                native_dfhack_console_forward(call, console, color, *target);
                return;
            }
        } catch (...) {
            // Keep every original fragment and color if translation fails.
        }
    }
    for (size_t at = begin; at < end; ++at) {
        const auto &fragment = fragments[at];
        native_dfhack_console_forward(call, console, fragment.color, fragment.text);
    }
}

static NativeDfhackConsoleFragments native_dfhack_console_take(void *console,
        bool end_batch = false) {
    std::lock_guard<std::mutex> lock(g_native_dfhack_console_pending_mutex);
    const auto found = g_native_dfhack_console_pending.find(native_dfhack_console_thread(console));
    if (found == g_native_dfhack_console_pending.end()) return {};
    auto &pending = found->second;
    auto fragments = std::move(pending.fragments);
    pending.fragments.clear();
    pending.bytes = 0;
    if (end_batch && pending.batch_depth > 0) --pending.batch_depth;
    if (!pending.batch_depth) g_native_dfhack_console_pending.erase(found);
    return fragments;
}

static void native_dfhack_console_add_text(void *console, int color,
        const NativeString *text) {
    NativeDfhackConsoleCall call;
    const auto original = g_native_dfhack_console_text.load(std::memory_order_acquire);
    if (!original) return;
    std::string_view source;
    if (!native_string_view(text, &source, SIZE_MAX)) {
        try { native_dfhack_console_take_instrument_prefix(console); } catch (...) {}
        call.callback.call_native([&] { original(console, color, text); });
        return;
    }
    const bool enabled = g_native_dfhack_console_buffering.load(std::memory_order_acquire) &&
        g_overlay.translation_enabled();
    // The Lua boundary owns actual item prints, container-child captions,
    // or a local launcher's complete item-report echo. Consume that proof
    // before generic numeric/terminal handling; unknown fields stay immediate.
    std::optional<NativeDfhackItemPrintTicket> item_ticket;
    try { item_ticket = native_dfhack_take_item_print_ticket(console, source); }
    catch (...) {}
    if (item_ticket) {
        try { native_dfhack_console_take_instrument_prefix(console); } catch (...) {}
        try { native_dfhack_console_emit(call, console, native_dfhack_console_take(console), enabled); }
        catch (...) {}
        if (enabled && !item_ticket->caption.empty()) {
            try {
                const bool report = !item_ticket->launcher_command.empty();
                auto target = report ? translate_dfhack_console_item_report(
                    item_ticket->report_command.empty() ? item_ticket->launcher_command : item_ticket->report_command,
                    item_ticket->caption) :
                    !item_ticket->literal_scope.empty() ? translate_dfhack_console_owned_literal(
                        item_ticket->literal_scope, item_ticket->caption) :
                        translate_dfhack_console_item_caption(item_ticket->caption);
                if (target && contains_cjk_utf8(*target) &&
                        std::none_of(target->begin(), target->end(), [report](unsigned char ch) {
                            return (ch < ' ' && !(report && (ch == '\n' || ch == '\t'))) || ch == 0x7f;
                        })) {
                    native_dfhack_console_forward(call, console, color,
                        item_ticket->prefix + *target + item_ticket->ending);
                    return;
                }
            } catch (...) {}
        }
        call.callback.call_native([&] { original(console, color, text); });
        return;
    }
    if (native_dfhack_console_nonlocal_command()) {
        try { native_dfhack_console_take_instrument_prefix(console); } catch (...) {}
        try { native_dfhack_console_emit(call, console, native_dfhack_console_take(console), enabled); }
        catch (...) {}
        call.callback.call_native([&] { original(console, color, text); });
        return;
    }
    // Carriage-return progress, embedded NULs and terminal controls retain
    // their immediate native behavior. An unfinished ANSI sequence is never
    // queued behind a later translated sentence.
    const auto terminal_control = [](unsigned char ch) {
        return ch < ' ' && ch != '\n' && ch != '\t';
    };
    const bool ordinary = std::none_of(source.begin(), source.end(), terminal_control);
    constexpr size_t maximum_bytes = 262144, maximum_fragments = 1024;
    try {
        const auto prefix = source.empty() ? std::string{} :
            native_dfhack_console_take_instrument_prefix(console);
        if (enabled && ordinary && !source.empty() && source.size() <= maximum_bytes)
            if (const auto catalog = g_dfhack_output_snapshot.load(std::memory_order_acquire)) {
                if (!prefix.empty()) {
                    if (auto target = translate_dfhack_instruments_output_continuation(
                            *catalog, prefix, source, true)) {
                        native_dfhack_console_emit(call, console,
                            native_dfhack_console_take(console), true);
                        native_dfhack_console_forward(call, console, color, *target);
                        return;
                    }
                    // A valid recipe with only RAW reagent codes has no
                    // human field to translate. Keep it outside word rules.
                    std::vector<DfhackInstrumentOutputReplacement> fields;
                    const auto end = dfhack_instruments_output_record_end(source);
                    if (end && dfhack_instruments_output_suffix(*catalog, source,
                            0, *end, true, fields)) {
                        native_dfhack_console_emit(call, console,
                            native_dfhack_console_take(console), true);
                        call.callback.call_native([&] { original(console, color, text); });
                        return;
                    }
                }
                if (auto target = translate_dfhack_instruments_output_prefix(*catalog, source, true)) {
                    {
                        std::lock_guard<std::mutex> lock(g_native_dfhack_console_pending_mutex);
                        if (g_native_dfhack_console_instrument_prefixes.size() >= 512)
                            g_native_dfhack_console_instrument_prefixes.clear();
                        g_native_dfhack_console_instrument_prefixes.insert_or_assign(
                            native_dfhack_console_thread(console), std::string(source));
                    }
                    native_dfhack_console_emit(call, console,
                        native_dfhack_console_take(console), true);
                    native_dfhack_console_forward(call, console, color, *target);
                    return;
                }
            }
    } catch (...) {
        try { native_dfhack_console_take_instrument_prefix(console); } catch (...) {}
    }
    if (enabled && !ordinary && source.size() <= maximum_bytes &&
            std::none_of(source.begin(), source.end(), [&](unsigned char ch) {
                return terminal_control(ch) && ch != 0x0b && ch != 0x0c &&
                    ch != 0x0f && ch != 0x10 && ch != 0x11 && ch != 0x13;
            })) {
        try {
            // Silent echoes and several scripts retain painted CP437 sex,
            // quality, magic and fire glyphs. Only owned human fields convert
            // them; unknown records retain their native control behavior.
            // Never queue such input behind another terminal message.
            if (auto target = translate_dfhack_console_output(source);
                    target && !target->empty() &&
                    std::none_of(target->begin(), target->end(), terminal_control)) {
                native_dfhack_console_emit(call, console,
                    native_dfhack_console_take(console), false);
                native_dfhack_console_forward(call, console, color, *target);
                return;
            }
        } catch (...) {}
    }
    if (!enabled || !ordinary || source.size() > maximum_bytes || source.empty()) {
        try { native_dfhack_console_emit(call, console, native_dfhack_console_take(console), false); }
        catch (...) {}
        call.callback.call_native([&] { original(console, color, text); });
        return;
    }
    NativeDfhackConsoleFragments preceding, immediate;
    bool queued = false;
    try {
        immediate.push_back({color, std::string(source)});
        auto &fragment = immediate.front();
        {
            std::lock_guard<std::mutex> lock(g_native_dfhack_console_pending_mutex);
            const auto found = g_native_dfhack_console_pending.find(native_dfhack_console_thread(console));
            if (found != g_native_dfhack_console_pending.end() && found->second.batch_depth) {
                auto &pending = found->second;
                if (pending.bytes > maximum_bytes - fragment.text.size() ||
                        pending.fragments.size() >= maximum_fragments) {
                    // Allocate the replacement before moving owned output.
                    // An allocation failure keeps the old fallback intact.
                    NativeDfhackConsoleFragments replacement;
                    replacement.reserve(1);
                    preceding = std::move(pending.fragments);
                    pending.fragments = std::move(replacement);
                    pending.bytes = 0;
                } else pending.fragments.reserve(pending.fragments.size() + 1);
                pending.bytes += fragment.text.size();
                pending.fragments.push_back(std::move(fragment));
                queued = true;
            }
        }
    } catch (...) {
        try { native_dfhack_console_emit(call, console, native_dfhack_console_take(console), false); }
        catch (...) {}
        call.callback.call_native([&] { original(console, color, text); });
        return;
    }
    native_dfhack_console_emit(call, console, preceding, true);
    // Unbatched print() can be an interactive prompt/progress update without
    // a newline or flush. Never delay that native output.
    if (!queued) native_dfhack_console_emit(call, console, immediate, true);
}

static void native_dfhack_console_begin_batch(void *console) {
    NativeDfhackConsoleCall call;
    const auto original = g_native_dfhack_console_begin.load(std::memory_order_acquire);
    if (!original) return;
    // The native begin acquires Console's recursive mutex. Our queue mutex
    // is acquired only afterwards, and is never held during a native call.
    call.callback.call_native([&] { original(console); });
    try {
        std::lock_guard<std::mutex> lock(g_native_dfhack_console_pending_mutex);
        ++g_native_dfhack_console_pending[native_dfhack_console_thread(console)].batch_depth;
    } catch (...) {
        // Losing batch ownership prevents safe teardown. Keep this core
        // resident rather than detach an untracked native mutex pairing.
        g_native_dfhack_console_tracking_failed.store(true, std::memory_order_release);
    }
}

static void native_dfhack_console_end_batch(void *console) {
    NativeDfhackConsoleCall call;
    const auto original = g_native_dfhack_console_end.load(std::memory_order_acquire);
    if (!original) return;
    try { native_dfhack_console_emit(call, console, native_dfhack_console_take(console, true),
        true, 0, SIZE_MAX, true, true); }
    catch (...) {}
    // Flush fragments while DFHack still owns the batch mutex; its original
    // end then flushes the terminal, refreshes the prompt and releases it.
    call.callback.call_native([&] { original(console); });
}

static void native_dfhack_console_flush_proxy(void *console) {
    NativeDfhackConsoleCall call;
    const auto original = g_native_dfhack_console_flush.load(std::memory_order_acquire);
    if (!original) return;
    try { native_dfhack_console_emit(call, console, native_dfhack_console_take(console), true); }
    catch (...) {}
    call.callback.call_native([&] { original(console); });
}

struct NativeDfhackConsoleSlot {
    uintptr_t *slot = nullptr;
    uintptr_t original = 0, replacement = 0;
    std::atomic_bool installed{false};
    NativePatchProtection restore_protection = 0;
    std::atomic_bool protection_pending{false};
};
static std::array<NativeDfhackConsoleSlot, 4> g_native_dfhack_console_slots;

static bool native_dfhack_console_hook_active() {
    return std::any_of(g_native_dfhack_console_slots.begin(), g_native_dfhack_console_slots.end(),
        [](const auto &entry) {
            return entry.installed.load(std::memory_order_acquire) ||
                entry.protection_pending.load(std::memory_order_acquire);
        });
}

static bool native_dfhack_console_exchange(NativeDfhackConsoleSlot &entry, bool install) {
    constexpr const char *label = "DFHack console translation";
    if (!entry.slot || reinterpret_cast<uintptr_t>(entry.slot) %
            std::atomic_ref<uintptr_t>::required_alignment) return false;
    NativePatchProtection protection = 0;
    unsigned long error = 0;
    if (entry.protection_pending.load(std::memory_order_acquire)) {
        if (!native_patch_protect(entry.slot, sizeof(uintptr_t), entry.restore_protection, error)) {
            report_native_patch_error("ERROR", label, "pending vtable protection restore failed", error);
            return false;
        }
        entry.protection_pending.store(false, std::memory_order_release);
    }
    if (entry.installed.load(std::memory_order_acquire) == install) return true;
    if (!native_patch_page_protection(reinterpret_cast<uintptr_t>(entry.slot),
            sizeof(uintptr_t), protection, error) || !native_patch_readable(protection) ||
            !native_patch_protect(entry.slot, sizeof(uintptr_t), native_patch_writable(protection), error)) {
        report_native_patch_error("ERROR", label, "vtable protection change failed", error);
        return false;
    }
    entry.restore_protection = protection;
    entry.protection_pending.store(true, std::memory_order_release);
    std::atomic_ref<uintptr_t> field(*entry.slot);
    uintptr_t expected = install ? entry.original : entry.replacement;
    const bool exchanged = field.compare_exchange_strong(expected,
        install ? entry.replacement : entry.original, std::memory_order_acq_rel, std::memory_order_acquire);
    if (exchanged) entry.installed.store(install, std::memory_order_release);
    const bool restored = native_patch_protect(entry.slot, sizeof(uintptr_t), protection, error);
    if (restored) entry.protection_pending.store(false, std::memory_order_release);
    if (!restored) report_native_patch_error("ERROR", label, "vtable protection restore failed", error);
    if (!exchanged) report_native_patch_error("ERROR", label, "vtable slot ownership changed");
    return exchanged && restored;
}

static bool install_native_dfhack_console_hook() {
    std::lock_guard<std::mutex> lock(g_native_dfhack_console_hook_mutex);
    if (native_dfhack_console_hook_active()) {
        const bool complete = std::all_of(g_native_dfhack_console_slots.begin(), g_native_dfhack_console_slots.end(),
            [](const auto &entry) {
                return entry.installed.load(std::memory_order_acquire) &&
                    !entry.protection_pending.load(std::memory_order_acquire);
            });
        // A deferred shutdown leaves every observer installed. Resume its
        // translation when the still-resident core is enabled again.
        if (complete) g_native_dfhack_console_buffering.store(true, std::memory_order_release);
        return complete;
    }
    const auto module = GetModuleHandleW(L"dfhack.dll");
    if (!module) return true; // Optional DFHack may appear after core startup.
    constexpr const char *label = "DFHack console translation";
    static constexpr std::array<const char *, 4> symbols{
        "?begin_batch@Console@DFHack@@MEAAXXZ",
        "?add_text@Console@DFHack@@MEAAXW4color_value@2@AEBV?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@@Z",
        "?end_batch@Console@DFHack@@MEAAXXZ",
        "?flush_proxy@Console@DFHack@@MEAAXXZ"};
    const std::array<uintptr_t, 4> replacements{
        reinterpret_cast<uintptr_t>(&native_dfhack_console_begin_batch),
        reinterpret_cast<uintptr_t>(&native_dfhack_console_add_text),
        reinterpret_cast<uintptr_t>(&native_dfhack_console_end_batch),
        reinterpret_cast<uintptr_t>(&native_dfhack_console_flush_proxy)};
    auto *vtable = reinterpret_cast<uintptr_t *>(GetProcAddress(module,
        "??_7Console@DFHack@@6Bcolor_ostream@1@@"));
    NativePatchProtection protection = 0;
    unsigned long error = 0;
    constexpr size_t slots = 16;
    if (!vtable || !native_patch_page_protection(reinterpret_cast<uintptr_t>(vtable),
            slots * sizeof(uintptr_t), protection, error) || !native_patch_readable(protection)) {
        report_native_patch_error("ERROR", label, "Console vtable export is unavailable", error);
        return false;
    }
    for (size_t function = 0; function < symbols.size(); ++function) {
        const uintptr_t original = reinterpret_cast<uintptr_t>(GetProcAddress(module, symbols[function]));
        if (!original || !native_patch_page_protection(original, 1, protection, error) ||
                !native_patch_executable(protection)) {
            report_native_patch_error("ERROR", label, "Console method export is unavailable", error);
            return false;
        }
        uintptr_t *selected = nullptr;
        for (size_t index = 0; index < slots; ++index)
            if (vtable[index] == original) {
                if (selected) {
                    report_native_patch_error("ERROR", label, "Console vtable method is ambiguous");
                    return false;
                }
                selected = vtable + index;
            }
        if (!selected) {
            report_native_patch_error("ERROR", label, "Console vtable method is missing");
            return false;
        }
        auto &entry = g_native_dfhack_console_slots[function];
        entry.slot = selected;
        entry.original = original;
        entry.replacement = replacements[function];
    }
    // All forwarding targets precede the first callable replacement.
    g_native_dfhack_console_begin.store(reinterpret_cast<NativeDfhackConsoleBatchFn>(
        g_native_dfhack_console_slots[0].original), std::memory_order_release);
    g_native_dfhack_console_text.store(reinterpret_cast<NativeDfhackConsoleTextFn>(
        g_native_dfhack_console_slots[1].original), std::memory_order_release);
    g_native_dfhack_console_end.store(reinterpret_cast<NativeDfhackConsoleBatchFn>(
        g_native_dfhack_console_slots[2].original), std::memory_order_release);
    g_native_dfhack_console_flush.store(reinterpret_cast<NativeDfhackConsoleBatchFn>(
        g_native_dfhack_console_slots[3].original), std::memory_order_release);
    // Publish the end/flush observers before any begin can create tracked
    // ownership. Reverse teardown removes begin first, so no new batch is
    // stranded behind an already restored native end callback.
    constexpr std::array<size_t, 4> install_order{2, 3, 1, 0};
    for (size_t index : install_order)
        if (!native_dfhack_console_exchange(g_native_dfhack_console_slots[index], true)) {
            for (auto it = install_order.rbegin(); it != install_order.rend(); ++it) {
                auto &entry = g_native_dfhack_console_slots[*it];
                if (entry.installed.load(std::memory_order_acquire) ||
                        entry.protection_pending.load(std::memory_order_acquire))
                    native_dfhack_console_exchange(entry, false);
            }
            return false;
        }
    g_native_dfhack_console_buffering.store(true, std::memory_order_release);
    return true;
}

static void uninstall_native_dfhack_console_hook() {
    std::lock_guard<std::mutex> lock(g_native_dfhack_console_hook_mutex);
    if (!native_dfhack_console_hook_active()) return;
    g_native_dfhack_console_buffering.store(false, std::memory_order_release);
    constexpr const char *label = "DFHack console translation";
    if (g_native_dfhack_console_callbacks.load(std::memory_order_acquire) ||
            g_native_dfhack_console_tracking_failed.load(std::memory_order_acquire)) {
        report_native_patch_error("WARN", label, "core remains resident while Console callbacks/batch ownership are active");
        g_native_dfhack_console_buffering.store(true, std::memory_order_release);
        return;
    }
    {
        std::lock_guard<std::mutex> pending_lock(g_native_dfhack_console_pending_mutex);
        if (std::any_of(g_native_dfhack_console_pending.begin(), g_native_dfhack_console_pending.end(),
                [](const auto &item) { return item.second.batch_depth != 0; })) {
            report_native_patch_error("WARN", label, "core remains resident until the native Console batch ends");
            g_native_dfhack_console_buffering.store(true, std::memory_order_release);
            return;
        }
        g_native_dfhack_console_instrument_prefixes.clear();
    }
    constexpr std::array<size_t, 4> uninstall_order{0, 1, 3, 2};
    for (size_t index : uninstall_order) {
        auto &entry = g_native_dfhack_console_slots[index];
        if (entry.installed.load(std::memory_order_acquire) ||
                entry.protection_pending.load(std::memory_order_acquire))
            native_dfhack_console_exchange(entry, false);
    }
    // Originals remain published for wrappers already fetched by a worker.
    // Common callback accounting prevents unloading their return addresses.
}
#else
// The MSVC Console boundary is specific to the current Windows host. Linux
// retains its native console until its own concrete ABI is bound separately.
static bool native_dfhack_console_hook_active() { return false; }
static bool install_native_dfhack_console_hook() { return true; }
static void uninstall_native_dfhack_console_hook() {}
#endif
