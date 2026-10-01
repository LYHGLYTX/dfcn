// Linux 53.16 Codices category (4 in the Legends list switch at 0x1cee83a).
// The title draw is 0x1cf03ef; its optional resize is 0x1cf0d64. The type is
// produced by item::getDescription at 0x1cf042a, capitalized, then shortened
// to 19 bytes at 0x1cf044c and drawn at 0x1cf0472. Read both pre-resize values;
// do not reconstruct "Giant Red Pa..." or "Bituminous Coal ..." from a prefix.
static LinuxGameStringResizeFn g_real_linux_book_resize = nullptr;
static LinuxGameDrawStringFn g_real_linux_book_draw = nullptr;
static std::array<unsigned char *, 4> g_linux_book_calls{};
static std::array<std::array<unsigned char, 5>, 4> g_linux_book_original{}, g_linux_book_patches{};
static void *g_linux_book_relay = nullptr;
static size_t g_linux_book_relay_size = 0;

struct PendingLinuxBookField {
    const std::string *owner = nullptr;
    uint64_t epoch = 0;
    std::string visible, complete;
};
static PendingLinuxBookField &pending_linux_book() {
    return reloadable_thread_state<PendingLinuxBookField, struct LegendsBookTag>();
}

static void dfcn_capture_linux_book_resize(std::string *source, size_t width, char fill) {
    try {
        pending_linux_book() = {};
        if (source && source->size() > width && source->size() <= 4096) {
            PendingLinuxBookField capture;
            capture.owner = source;
            capture.epoch = g_embark_item_capture_epoch.load(std::memory_order_acquire);
            capture.complete = *source;
            capture.visible = source->substr(0, width);
            if (width > 3) capture.visible.replace(width - 3, 3, "...");
            pending_linux_book() = std::move(capture);
        }
    } catch (...) {}
    if (g_real_linux_book_resize) g_real_linux_book_resize(source, width, fill);
}

template<bool ItemType>
static void dfcn_capture_linux_book_draw(graphicst *graphics, const std::string *source,
        justification just, int space) {
    auto pending = std::move(pending_linux_book());
    pending_linux_book() = {};
    try {
        if (graphics && source && !source->empty() && source->size() <= 4096) {
            const auto epoch = g_embark_item_capture_epoch.load(std::memory_order_acquire);
            std::string complete = *source;
            if (pending.owner == source && pending.epoch == epoch && pending.visible == *source)
                complete = std::move(pending.complete);
            NativeLegendsBookField capture{
                graphics->screenx, graphics->screeny, ItemType, *source, std::move(complete)};
            std::lock_guard<std::mutex> lock(g_legends_book_mutex);
            if (g_legends_book_epoch != epoch) {
                g_legends_book_fields.clear();
                g_legends_book_epoch = epoch;
            }
            std::erase_if(g_legends_book_fields, [&](const NativeLegendsBookField &previous) {
                return previous.x == capture.x && previous.y == capture.y &&
                    previous.item_type == ItemType;
            });
            if (g_legends_book_fields.size() < 1024)
                g_legends_book_fields.push_back(std::move(capture));
        }
    } catch (...) {}
    if (g_real_linux_book_draw) g_real_linux_book_draw(graphics, source, just, space);
}

static bool install_linux_legends_book_hooks() {
    if (g_linux_book_relay) return true;
    ModuleBuildId module;
    dl_iterate_phdr(find_main_build_id, &module);
    if (!module.found || module.value != "bcc6789e6fb477b785a2b02be80b8b1b054ff88c") return false;
    static constexpr std::array<uintptr_t, 4> addresses{{
        0x1cf0d64, 0x1cf044c, 0x1cf03ef, 0x1cf0472}};
    static constexpr std::array<std::array<unsigned char, 5>, 4> originals{{
        {{0xe8, 0x97, 0x69, 0xb4, 0xfe}}, {{0xe8, 0xaf, 0x72, 0xb4, 0xfe}},
        {{0xe8, 0x7c, 0x4d, 0x73, 0xfe}}, {{0xe8, 0xf9, 0x4c, 0x73, 0xfe}},
    }};
    std::array<unsigned char *, 4> calls{};
    for (size_t i = 0; i < calls.size(); ++i) {
        calls[i] = reinterpret_cast<unsigned char *>(module.base + addresses[i]);
        if (std::memcmp(calls[i], originals[i].data(), 5) != 0) return false;
    }
    void *draw = dlsym(RTLD_DEFAULT,
        "_ZN9graphicst5addstERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE13justificationi");
    if (!draw) return false;
    size_t size = 0;
    auto *relay = static_cast<unsigned char *>(allocate_linux_low_relay(96, &size));
    if (!relay) return false;
    emit_linux_absolute_jump(relay, reinterpret_cast<const void *>(&dfcn_capture_linux_book_resize));
    emit_linux_absolute_jump(relay + 32, reinterpret_cast<const void *>(&dfcn_capture_linux_book_draw<false>));
    emit_linux_absolute_jump(relay + 64, reinterpret_cast<const void *>(&dfcn_capture_linux_book_draw<true>));
    std::array<std::array<unsigned char, 5>, 4> patches{};
    for (size_t i = 0; i < calls.size(); ++i) {
        const int offset = i < 2 ? 0 : (i == 2 ? 32 : 64);
        const intptr_t distance = reinterpret_cast<intptr_t>(relay + offset) -
            reinterpret_cast<intptr_t>(calls[i] + 5);
        if (distance < INT32_MIN || distance > INT32_MAX) { munmap(relay, size); return false; }
        patches[i][0] = 0xe8;
        const int32_t displacement = static_cast<int32_t>(distance);
        std::memcpy(patches[i].data() + 1, &displacement, sizeof(displacement));
    }
    if (mprotect(relay, size, PROT_READ | PROT_EXEC) != 0) { munmap(relay, size); return false; }
    g_real_linux_book_resize = reinterpret_cast<LinuxGameStringResizeFn>(module.base + 0x837700);
    g_real_linux_book_draw = reinterpret_cast<LinuxGameDrawStringFn>(draw);
    if (!write_linux_call_bytes(calls, patches, "Legends book calls")) {
        g_real_linux_book_resize = nullptr;
        g_real_linux_book_draw = nullptr;
        munmap(relay, size);
        return false;
    }
    g_linux_book_calls = calls;
    g_linux_book_original = originals;
    g_linux_book_patches = patches;
    g_linux_book_relay = relay;
    g_linux_book_relay_size = size;
    log_line("INFO", "Enabled complete in-memory Legends book title/type capture");
    return true;
}

static void uninstall_linux_legends_book_hooks() {
    if (g_linux_book_relay) {
        for (size_t i = 0; i < g_linux_book_calls.size(); ++i) {
            if (std::memcmp(g_linux_book_calls[i], g_linux_book_patches[i].data(), 5) != 0) {
                log_line("ERROR", "Legends book hook changed; retaining the core");
                return;
            }
        }
        if (!write_linux_call_bytes(g_linux_book_calls, g_linux_book_original,
                                    "Legends book restore")) return;
        munmap(g_linux_book_relay, g_linux_book_relay_size);
    }
    g_linux_book_relay = nullptr;
    g_linux_book_relay_size = 0;
    g_linux_book_calls.fill(nullptr);
    g_real_linux_book_resize = nullptr;
    g_real_linux_book_draw = nullptr;
    pending_linux_book() = {};
    std::lock_guard<std::mutex> lock(g_legends_book_mutex);
    g_legends_book_fields.clear();
    g_legends_book_epoch = 0;
}
