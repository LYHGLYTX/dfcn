// The artifact trade reply constructor has an inline 68-column wrapper,
// outside curses_text_boxst::add_paragraph. Observe only its two local calls:
// copy the pristine sentence, then bind the actual appended native row strings.
#ifdef _WIN32
using NativeTradeReplyCopyFn = uintptr_t (*)(NativeString *, const char *, size_t);
using NativeTradeReplyRowsReleaseFn = uintptr_t (*)(void *);
static NativeTradeReplyCopyFn g_native_trade_reply_copy = nullptr;
static NativeTradeReplyRowsReleaseFn g_native_trade_reply_rows_release = nullptr;
static NativeCallHook g_native_trade_reply_calls;

struct NativeTradeReplyPending {
    uintptr_t owner = 0;
    size_t first_line = 0;
    std::string source;
};
struct NativeTradeReplyPendingTag {};
static NativeTradeReplyPending &native_trade_reply_pending() {
    return reloadable_thread_state<NativeTradeReplyPending, NativeTradeReplyPendingTag>();
}

static bool native_trade_reply_rows(uintptr_t owner,
        NativeBorrowedVector<NativeString *> &rows) {
    return native_history_copy(owner, rows) && rows.valid(16384);
}

static uintptr_t capture_native_trade_reply_copy(NativeString *destination,
        const char *source, size_t size, void *screen) {
    NativeInputCallbackScope callback;
    try {
        auto &pending = native_trade_reply_pending();
        pending = {};
        const uintptr_t address = reinterpret_cast<uintptr_t>(screen);
        if (address && address <= UINTPTR_MAX - 0x3c0 && size && size <= 262144) {
            const uintptr_t owner = address + 0x3c0;
            NativeBorrowedVector<NativeString *> rows;
            std::string text(size, '\0');
            if (native_trade_reply_rows(owner, rows) && native_history_copy_bytes(
                    reinterpret_cast<uintptr_t>(source), text.data(), size) &&
                    is_native_prose_source(text))
                pending = {owner, rows.size(), std::move(text)};
        }
    } catch (...) {}
    return callback.call_native([&] {
        return g_native_trade_reply_copy(destination, source, size);
    });
}

static uintptr_t capture_native_trade_reply_rows_release(void *temporary_rows, void *screen) {
    NativeInputCallbackScope callback;
    const uintptr_t result = callback.call_native([&] {
        return g_native_trade_reply_rows_release(temporary_rows);
    });
    try {
        auto pending = std::move(native_trade_reply_pending());
        native_trade_reply_pending() = {};
        const uintptr_t address = reinterpret_cast<uintptr_t>(screen);
        if (!address || address > UINTPTR_MAX - 0x3c0 ||
                pending.owner != address + 0x3c0 || pending.source.empty()) return result;
        NativeBorrowedVector<NativeString *> native_rows;
        if (!native_trade_reply_rows(pending.owner, native_rows) ||
                native_rows.size() <= pending.first_line) return result;
        const size_t count = native_rows.size() - pending.first_line;
        std::vector<NativeString *> pointers(count);
        if (!native_history_copy_bytes(reinterpret_cast<uintptr_t>(native_rows.begin) +
                pending.first_line * sizeof(NativeString *), pointers.data(),
                count * sizeof(NativeString *))) return result;
        std::vector<std::string> rows;
        std::vector<uintptr_t> addresses;
        rows.reserve(count);
        addresses.reserve(count);
        for (const auto *pointer : pointers) {
            std::string row;
            if (!native_history_copy_string(reinterpret_cast<uintptr_t>(pointer), row) ||
                    trim_view(row).empty()) return result;
            rows.push_back(std::move(row));
            addresses.push_back(reinterpret_cast<uintptr_t>(pointer));
        }
        // The constructor appends its separator BEFORE the source-copy call.
        // Each artifact therefore retains a separate complete source and row
        // interval, even when the screen's scroll vector contains many replies.
        remember_native_paragraph(pending.owner, 68, std::move(pending.source),
            std::move(rows), pending.first_line, std::move(addresses));
    } catch (...) {}
    return result;
}

static bool native_trade_paragraph_hooks_active() {
    return g_native_trade_reply_calls.active();
}
static void uninstall_native_trade_paragraph_hooks() {
    if (!native_callbacks_idle() ||
            !g_native_trade_reply_calls.uninstall("Native trade reply source")) return;
    g_native_trade_reply_copy = nullptr;
    g_native_trade_reply_rows_release = nullptr;
}
static bool install_native_trade_paragraph_hooks() {
    if (g_native_trade_reply_calls.installed) return true;
    if (native_trade_paragraph_hooks_active()) {
        uninstall_native_trade_paragraph_hooks();
        if (native_trade_paragraph_hooks_active()) return false;
    }
    const uintptr_t base = native_history_profile_base();
    if (!base) return false;
    g_native_trade_reply_copy = reinterpret_cast<NativeTradeReplyCopyFn>(
        native_pe_address(base, 0x6f8d0));
    g_native_trade_reply_rows_release = reinterpret_cast<NativeTradeReplyRowsReleaseFn>(
        native_pe_address(base, 0x66b70));
    struct InstallGuard {
        bool committed = false;
        ~InstallGuard() { if (!committed) uninstall_native_trade_paragraph_hooks(); }
    } guard;
    // Reference helper 36a9c0..36b0a8, classic 368580..368c68:
    // 36ad21 copies the untouched [rbp-1] message; R12 still owns the screen.
    // 36af9a restores R12 before 36b007 releases the wrapper's temporary vector.
    // Pass that preserved register as an extra callback argument; the original
    // functions retain all their own arguments and exact native return values.
    std::vector<NativeCall> calls{
        {0x36ad21, 0x6f8d0, reinterpret_cast<const void *>(&capture_native_trade_reply_copy),
            {0x4d, 0x89, 0xe1}}, // mov r9,r12
        {0x36b007, 0x66b70, reinterpret_cast<const void *>(&capture_native_trade_reply_rows_release),
            {0x4c, 0x89, 0xe2}}, // mov rdx,r12
    };
    if (!native_reference_calls(calls, 0) ||
            !g_native_trade_reply_calls.install(base, calls, "Native trade reply source")) return false;
    guard.committed = true;
    return true;
}
#else
static bool native_trade_paragraph_hooks_active() { return false; }
static void uninstall_native_trade_paragraph_hooks() {}
static bool install_native_trade_paragraph_hooks() { return true; }
#endif
