// The native recipe formatter wraps requirement strings inline. Capture its
// complete, case-normalized input and the exact rows it appends; translation
// and matching remain in the shared workshop tooltip compositor.
using NativeWorkshopRecipeStringFn = void (*)(NativeString *);
struct NativeWorkshopRecipeProfile {
    uintptr_t base = 0;
    uintptr_t begin_site = 0, begin_target = 0;
    uintptr_t end_site = 0, end_target = 0;
    int paragraph_width = 0;
    NativeWorkshopRecipeStringFn normalize = nullptr, destroy = nullptr;
    std::vector<unsigned char> begin_arguments, end_arguments;
};
#include "native_workshop_recipe_profile.inc"

struct NativeWorkshopRecipeHooks {
    NativeCallHook code;
    NativeWorkshopRecipeStringFn normalize = nullptr, destroy = nullptr;
    int paragraph_width = 0;
};
static NativeWorkshopRecipeHooks g_native_workshop_recipe_hooks;

static int native_workshop_recipe_paragraph_width() {
    return g_native_workshop_recipe_hooks.paragraph_width;
}

struct NativeWorkshopRequirementPending {
    const NativeString *source_owner = nullptr;
    const void *paragraph_owner = nullptr;
    size_t first_line = 0;
    std::string source;
};
struct NativeWorkshopRecipeThreadState {
    std::vector<NativeWorkshopRequirementPending> pending;
};
static NativeWorkshopRecipeThreadState &native_workshop_recipe_thread_state() {
    return reloadable_thread_state<NativeWorkshopRecipeThreadState,
        struct WorkshopRecipeCaptureTag>();
}

static std::mutex g_native_workshop_requirement_mutex;
static std::deque<NativeParagraphCapture> g_native_workshop_requirements;
static uint64_t g_native_workshop_requirement_sequence = 0;

static std::vector<NativeParagraphCapture> captured_native_workshop_requirements() {
    std::lock_guard<std::mutex> lock(g_native_workshop_requirement_mutex);
    return {g_native_workshop_requirements.begin(), g_native_workshop_requirements.end()};
}

static void clear_native_workshop_requirements() {
    std::lock_guard<std::mutex> lock(g_native_workshop_requirement_mutex);
    g_native_workshop_requirements.clear();
    g_native_workshop_requirement_sequence = 0;
    native_workshop_recipe_thread_state().pending.clear();
}

static void capture_native_workshop_requirement_begin(NativeString *source,
        const void *paragraph) {
    // Keep the native operation and its string ownership entirely intact.
    g_native_workshop_recipe_hooks.normalize(source);
    try {
        auto &pending = native_workshop_recipe_thread_state().pending;
        // Stack locals may be reused on the next recipe. A failed capture
        // must not leave an older record that its matching end could consume.
        std::erase_if(pending, [&](const NativeWorkshopRequirementPending &entry) {
            return entry.source_owner == source && entry.paragraph_owner == paragraph;
        });
        const size_t first_line = native_paragraph_row_count(paragraph);
        if (!paragraph || first_line > 4096) return;
        {
            std::lock_guard<std::mutex> lock(g_native_workshop_requirement_mutex);
            std::erase_if(g_native_workshop_requirements,
                [&](const NativeParagraphCapture &capture) {
                    return capture.owner == reinterpret_cast<uintptr_t>(paragraph) &&
                        capture.first_line >= first_line;
                });
        }
        std::string_view text;
        if (pending.size() >= 32 || !native_string_view(source, &text, 65536) ||
            text.empty() || text.find('\0') != std::string_view::npos) return;
        pending.push_back({source, paragraph, first_line, std::string(text)});
    } catch (...) {
        // Native rendering must continue even if the owned copy cannot be made.
    }
}

static void capture_native_workshop_requirement_end(NativeString *last_line,
        const void *paragraph, const NativeString *source_owner) {
    g_native_workshop_recipe_hooks.destroy(last_line);
    try {
        auto &pending = native_workshop_recipe_thread_state().pending;
        // The adapter passes both the original source local and destination
        // box, so nested captures cannot consume one another's records.
        const auto found = std::find_if(pending.rbegin(), pending.rend(),
            [&](const NativeWorkshopRequirementPending &entry) {
                return entry.source_owner == source_owner &&
                    entry.paragraph_owner == paragraph;
            });
        if (found == pending.rend()) return;
        auto captured = std::move(*found);
        pending.erase(std::next(found).base());
        const size_t count = native_paragraph_row_count(paragraph);
        if (count <= captured.first_line || count > 4096) return;
        std::vector<std::string> lines;
        lines.reserve(count - captured.first_line);
        for (size_t index = captured.first_line; index < count; ++index) {
            std::string_view line;
            if (!native_string_view(native_paragraph_row(paragraph, index), &line, 65536) ||
                line.find('\0') != std::string_view::npos) return;
            lines.emplace_back(line);
        }
        std::lock_guard<std::mutex> lock(g_native_workshop_requirement_mutex);
        g_native_workshop_requirements.push_back({
            reinterpret_cast<uintptr_t>(paragraph),
            g_native_workshop_recipe_hooks.paragraph_width,
            std::move(captured.source), std::move(lines),
            ++g_native_workshop_requirement_sequence, captured.first_line,
        });
        // Retain actual wrap results across native redraws of a cached card.
        // Consumers must match every visible source row before using them.
        while (g_native_workshop_requirements.size() > 512)
            g_native_workshop_requirements.pop_front();
    } catch (...) {}
}

static bool native_workshop_recipe_hooks_active() {
    return g_native_workshop_recipe_hooks.code.active();
}

static bool uninstall_native_workshop_recipe_hooks() {
    auto &hook = g_native_workshop_recipe_hooks;
    if (!hook.code.uninstall("Workshop requirement capture restore")) return false;
    hook.normalize = nullptr;
    hook.destroy = nullptr;
    hook.paragraph_width = 0;
    clear_native_workshop_requirements();
    return true;
}

static bool install_native_workshop_recipe_hooks() {
    auto &hook = g_native_workshop_recipe_hooks;
    if (hook.code.installed) return true;
    if (native_workshop_recipe_hooks_active() &&
        !uninstall_native_workshop_recipe_hooks()) return false;
    struct InstallGuard {
        bool committed = false;
        ~InstallGuard() {
            if (!committed) {
                try { uninstall_native_workshop_recipe_hooks(); } catch (...) {}
            }
        }
    } guard;
    NativeWorkshopRecipeProfile profile;
    if (!resolve_native_workshop_recipe_profile(profile)) {
        log_line("ERROR", "Cannot resolve native workshop requirement capture profile");
        return false;
    }
    if (!profile.normalize && !profile.destroy) {
        log_line("INFO", "Native workshop requirement capture is unavailable on this host; "
            "using shared complete-text tooltip recovery");
        guard.committed = true;
        return true;
    }
    if (!profile.normalize || !profile.destroy || profile.paragraph_width <= 0) return false;
    hook.normalize = profile.normalize;
    hook.destroy = profile.destroy;
    hook.paragraph_width = profile.paragraph_width;
    if (!hook.code.install(profile.base, {
            {profile.begin_site, profile.begin_target,
                reinterpret_cast<const void *>(&capture_native_workshop_requirement_begin),
                profile.begin_arguments},
            {profile.end_site, profile.end_target,
                reinterpret_cast<const void *>(&capture_native_workshop_requirement_end),
                profile.end_arguments},
        }, "Workshop requirement capture")) return false;
    guard.committed = true;
    log_line("INFO", "Enabled complete native workshop requirement and wrapped-row capture");
    return true;
}
