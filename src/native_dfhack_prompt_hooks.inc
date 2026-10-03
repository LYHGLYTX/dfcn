// Console::lineedit renders its prompt directly with byte-based cursor
// accounting. Print a trusted translated question separately, then keep the
// native input editor, history and return value with the ASCII prompt "> ".
#ifdef _WIN32
static std::optional<std::string> translate_dfhack_console_prompt(std::string_view source);

// The terminal may wait indefinitely after this entry returns to DFHack.
// This small process-owned context and its executable relay deliberately
// outlive the reloadable core. A detached relay contains no core address.
struct alignas(8) NativeDfhackPromptContext {
    uintptr_t helper = 0;
    uint32_t active = 0;
    uint32_t reserved = 0;
    NativeDfhackConsoleTextFn add_text = nullptr;
    NativeString ascii{};
};
static_assert(offsetof(NativeDfhackPromptContext, helper) == 0);
static_assert(offsetof(NativeDfhackPromptContext, active) == 8);
static NativeDfhackPromptContext *g_native_dfhack_prompt_context = nullptr;
static NativeEntryHook g_native_dfhack_prompt_hook;
static std::mutex g_native_dfhack_prompt_mutex;

static const NativeString *native_dfhack_prepare_prompt(void *console,
        const NativeString *prompt, NativeDfhackPromptContext *context) noexcept {
    NativeInputCallbackScope callback;
    try {
        if (!context || !context->add_text || !g_overlay.translation_enabled()) return prompt;
        std::string_view source;
        if (!native_string_view(prompt, &source, 4096) || source.empty() ||
                source == "[DFHack]# " ||
                std::any_of(source.begin(), source.end(), [](unsigned char ch) {
                    return ch < ' ' && ch != '\n' && ch != '\t';
                })) return prompt;
        auto target = translate_dfhack_console_prompt(source);
        if (!target || target->empty()) return prompt;
        if (target->back() != '\n') target->push_back('\n');
        const auto borrowed = native_dfhack_console_borrow(*target);
        // Native add_text reads c_str() synchronously and never destroys this
        // borrowed MSVC string. It also owns Console's recursive write lock.
        callback.call_native([&] { context->add_text(console, -1, &borrowed); });
        return &context->ascii;
    } catch (...) {
        // Allocation/translation failure leaves the original input prompt.
        return prompt;
    }
}

static uint32_t native_dfhack_prompt_callbacks() {
    auto *context = g_native_dfhack_prompt_context;
    return context ? std::atomic_ref<uint32_t>(context->active).load(std::memory_order_seq_cst) : 0;
}

static bool native_dfhack_prompt_hook_active() {
    auto *context = g_native_dfhack_prompt_context;
    return g_native_dfhack_prompt_hook.installed ||
        native_code_patches_pending(g_native_dfhack_prompt_hook.patches) ||
        native_dfhack_prompt_callbacks() ||
        (context && std::atomic_ref<uintptr_t>(context->helper).load(std::memory_order_seq_cst));
}

static bool prepare_native_dfhack_prompt_hook(HMODULE module) {
    constexpr const char *label = "DFHack local input prompt translation";
    if (g_native_dfhack_prompt_hook.relay)
        return g_native_dfhack_prompt_hook.original && g_native_dfhack_prompt_context;
    auto *entry = reinterpret_cast<unsigned char *>(GetProcAddress(module,
        "?lineedit@Console@DFHack@@QEAAHAEBV?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAV34@AEAVCommandHistory@2@@Z"));
    const auto add_text = reinterpret_cast<NativeDfhackConsoleTextFn>(GetProcAddress(module,
        "?add_text@Console@DFHack@@MEAAXW4color_value@2@AEBV?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@@Z"));
    // The installed native entry begins with this complete five-byte store,
    // followed by the other saved registers and stack allocation. Only the
    // first store is relocated, with no relative operand or interior target.
    const std::vector<unsigned char> prefix{0x48, 0x89, 0x5c, 0x24, 0x10};
    constexpr std::array<unsigned char, 14> remainder{
        0x48, 0x89, 0x74, 0x24, 0x18, 0x57, 0x41,
        0x56, 0x41, 0x57, 0x48, 0x83, 0xec, 0x20};
    NativePatchPages pages;
    if (!entry || !add_text ||
            !collect_native_patch_pages(pages, reinterpret_cast<uintptr_t>(entry),
                prefix.size() + remainder.size(), native_patch_page_size(), true, label) ||
            !collect_native_patch_pages(pages, reinterpret_cast<uintptr_t>(add_text),
                1, native_patch_page_size(), true, label) ||
            std::memcmp(entry, prefix.data(), prefix.size()) ||
            std::memcmp(entry + prefix.size(), remainder.data(), remainder.size())) {
        report_native_patch_error("ERROR", label, "Console lineedit entry signature differs");
        return false;
    }
    using AddFunctionTableFn = BOOLEAN (WINAPI *)(PRUNTIME_FUNCTION, DWORD, DWORD64);
    const auto kernel = GetModuleHandleW(L"kernel32.dll");
    const auto add_function_table = kernel ? reinterpret_cast<AddFunctionTableFn>(
        GetProcAddress(kernel, "RtlAddFunctionTable")) : nullptr;
    if (!add_function_table) {
        report_native_patch_error("ERROR", label, "native unwind registration is unavailable");
        return false;
    }
    auto *context = static_cast<NativeDfhackPromptContext *>(
        HeapAlloc(GetProcessHeap(), HEAP_ZERO_MEMORY, sizeof(NativeDfhackPromptContext)));
    if (!context) {
        report_native_patch_error("ERROR", label, "process-owned prompt context allocation failed",
            GetLastError());
        return false;
    }
    NativeDfhackPromptContext initial{};
    initial.add_text = add_text;
    initial.ascii = native_empty_string();
    initial.ascii.size = 2;
    std::memcpy(initial.ascii.storage.small, "> ", 3);
    std::memcpy(context, &initial, sizeof(initial));
    NativeRelayRange range;
    range.include(reinterpret_cast<uintptr_t>(entry));
    range.include(reinterpret_cast<uintptr_t>(entry + prefix.size()));
    auto &hook = g_native_dfhack_prompt_hook;
    hook.relay = allocate_native_relay(range, 0x228, &hook.relay_size, label);
    if (!hook.relay) {
        HeapFree(GetProcessHeap(), 0, context);
        return false;
    }
    bool registered = false;
    struct UnpublishedPromptGuard {
        NativeEntryHook &hook;
        NativeDfhackPromptContext *context;
        bool &registered;
        const char *label;
        ~UnpublishedPromptGuard() {
            if (registered) return;
            release_native_relay(hook.relay, hook.relay_size, label);
            hook.original = nullptr;
            hook.patches.clear();
            HeapFree(GetProcessHeap(), 0, context);
        }
    } guard{hook, context, registered, label};
    auto *memory = static_cast<unsigned char *>(hook.relay);
    constexpr size_t trampoline_offset = 0x100;
    constexpr size_t table_offset = 0x200, unwind_offset = 0x220;
    std::vector<unsigned char> stub;
    const auto emit = [&](std::initializer_list<unsigned char> bytes) {
        stub.insert(stub.end(), bytes);
    };
    const auto load_context = [&] {
        emit({0x49, 0xba}); // mov r10, process-owned context
        const uintptr_t address = reinterpret_cast<uintptr_t>(context);
        const auto *bytes = reinterpret_cast<const unsigned char *>(&address);
        stub.insert(stub.end(), bytes, bytes + sizeof(address));
    };
    emit({0xf3, 0x0f, 0x1e, 0xfa}); // endbr64
    emit({0x48, 0x83, 0xec, 0x48}); // aligned stack + 32-byte helper shadow space
    emit({0x48, 0x89, 0x4c, 0x24, 0x20}); // save Console*
    emit({0x48, 0x89, 0x54, 0x24, 0x28}); // save const prompt&
    emit({0x4c, 0x89, 0x44, 0x24, 0x30}); // save native output&
    emit({0x4c, 0x89, 0x4c, 0x24, 0x38}); // save native CommandHistory&
    load_context();
    // Increment before loading the helper. Clearing the pointer then seeing
    // zero therefore proves that no relay can still enter or return to core.
    emit({0xf0, 0x41, 0xff, 0x42, 0x08}); // lock inc dword [r10+8]
    emit({0x49, 0x8b, 0x02});             // mov rax,[r10]
    emit({0x48, 0x85, 0xc0});             // test rax,rax
    emit({0x74, 0x0a});                   // null helper skips exactly ten bytes
    emit({0x4d, 0x8b, 0xc2});             // helper argument r8=context
    emit({0xff, 0xd0});                   // call rax, balanced CET call/return
    emit({0x48, 0x89, 0x44, 0x24, 0x28}); // retain chosen native prompt pointer
    load_context();
    emit({0xf0, 0x41, 0xff, 0x4a, 0x08}); // lock dec dword [r10+8]
    emit({0x48, 0x8b, 0x4c, 0x24, 0x20});
    emit({0x48, 0x8b, 0x54, 0x24, 0x28});
    emit({0x4c, 0x8b, 0x44, 0x24, 0x30});
    emit({0x4c, 0x8b, 0x4c, 0x24, 0x38});
    emit({0x48, 0x83, 0xc4, 0x48});
    const size_t tail_jump = stub.size();
    stub.resize(stub.size() + 14);
    // add rsp; jmp [rip+0] is a legal Windows unwind epilogue. The target
    // is a leaf relay which restores the first native instruction and jumps
    // into DFHack, keeping its caller's return address and shadow stack.
    emit_native_absolute_jump(stub.data() + tail_jump, memory + trampoline_offset);
    std::copy(stub.begin(), stub.end(), memory);
    auto *trampoline = memory + trampoline_offset;
    constexpr std::array<unsigned char, 4> endbr{0xf3, 0x0f, 0x1e, 0xfa};
    std::copy(endbr.begin(), endbr.end(), trampoline);
    std::copy(prefix.begin(), prefix.end(), trampoline + endbr.size());
    if (!native_relative_branch(trampoline + endbr.size() + prefix.size(),
            0xe9, entry + prefix.size())) return false;
    auto *table = reinterpret_cast<PRUNTIME_FUNCTION>(memory + table_offset);
    *table = RUNTIME_FUNCTION{};
    table->BeginAddress = 0;
    table->EndAddress = static_cast<DWORD>(stub.size());
    table->UnwindData = unwind_offset;
    // Version 1, prologue end 8, one UWOP_ALLOC_SMALL (72 bytes), no frame.
    constexpr std::array<unsigned char, 8> unwind{1, 8, 1, 0, 8, 0x82, 0, 0};
    std::copy(unwind.begin(), unwind.end(), memory + unwind_offset);
    NativeCodePatch patch{entry, prefix, std::vector<unsigned char>(prefix.size(), 0x90)};
    const intptr_t distance = reinterpret_cast<intptr_t>(memory) -
        reinterpret_cast<intptr_t>(entry + 5);
    if (distance < INT32_MIN || distance > INT32_MAX) return false;
    patch.replacement[0] = 0xe9;
    const auto relative = static_cast<int32_t>(distance);
    std::memcpy(patch.replacement.data() + 1, &relative, sizeof(relative));
    hook.patches.push_back(std::move(patch));
    hook.original = trampoline;
    if (!seal_native_relay(hook.relay, hook.relay_size, label) ||
            !add_function_table(table, 1, reinterpret_cast<DWORD64>(memory))) {
        report_native_patch_error("ERROR", label, "relay unwind registration/protection failed");
        return false;
    }
    registered = true;
    g_native_dfhack_prompt_context = context;
    // Never release this registered relay/table or process-owned ASCII SSO
    // string. A thread can be between its gate decrement and native jump
    // while the core unloads; none of those final instructions use the core.
    return true;
}

static bool install_native_dfhack_prompt_hook() {
    std::lock_guard<std::mutex> lock(g_native_dfhack_prompt_mutex);
    const auto module = GetModuleHandleW(L"dfhack.dll");
    if (!module) return true;
    constexpr const char *label = "DFHack local input prompt translation";
    if (!prepare_native_dfhack_prompt_hook(module)) return false;
    if (!g_native_dfhack_prompt_hook.install(label)) return false;
    std::atomic_ref<uintptr_t>(g_native_dfhack_prompt_context->helper).store(
        reinterpret_cast<uintptr_t>(&native_dfhack_prepare_prompt), std::memory_order_seq_cst);
    return true;
}

static void uninstall_native_dfhack_prompt_hook() {
    std::lock_guard<std::mutex> lock(g_native_dfhack_prompt_mutex);
    auto *context = g_native_dfhack_prompt_context;
    if (!context) return;
    // Stop new core dispatch before restoring the native entry. Calls which
    // already incremented the process-owned gate protect their whole helper
    // call, including its epilogue and return into the persistent relay.
    std::atomic_ref<uintptr_t>(context->helper).store(0, std::memory_order_seq_cst);
    auto &hook = g_native_dfhack_prompt_hook;
    constexpr const char *label = "DFHack local input prompt translation";
    if (hook.installed && !write_native_code_patches(hook.patches, false,
            label, &hook.installed)) return;
    if (!flush_native_code_patches(hook.patches, label)) return;
    if (native_dfhack_prompt_callbacks())
        report_native_patch_error("WARN", label,
            "core remains resident until the short prompt helper returns");
    // The dormant relay intentionally remains allocated and registered.
    // Native lineedit can block after the tail jump without owning this core.
}
#else
// Windows Console's MSVC input boundary is bound only on this host.
static bool native_dfhack_prompt_hook_active() { return false; }
static bool install_native_dfhack_prompt_hook() { return true; }
static void uninstall_native_dfhack_prompt_hook() {}
#endif
