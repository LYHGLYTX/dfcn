// One capture/input policy and one hook lifecycle. Native adapters only bind
// symbols, ABI layouts, call sites and operating-system interfaces.
#include "native_text_abi.h"
#include "native_text_capture.inc"
#include "native_text_input.inc"
#include "native_arena_adapter.inc"
#include "native_code_patch.inc"
#include "native_image_adapter.inc"
#include "native_stone_use_guard.inc"
#include "native_mouse_click.inc"
static bool capture_native_history_page_event(int32_t id, NativeHistoryEventData &parent);
static bool capture_native_history_page_program(uintptr_t program, NativeHistoryEventData &data, int32_t mode = 2);
static bool capture_native_history_page_item(const std::vector<int32_t> &tuple,
    NativeHistoryEventData &data, std::string_view role, int32_t count = 1, int32_t item_id = -1);
static bool capture_native_history_subject_item_labels(NativeHistoryEventData &data);
static bool native_history_site_type(uintptr_t site, NativeHistoryEventData &out,
    const std::string &prefix);
static bool native_history_war_selection(uintptr_t collection, int32_t &category,
    int32_t &index, int32_t &count);
#include "native_history_names.inc"
#include "native_world_artifact_cache.inc"
#include "native_announcement_history.inc"
#include "native_history_page_adapter.inc"
#include "native_character_kinship.inc"
#include "native_history_event.inc"
#include "native_performance_choice.inc"
#include "native_history_relationships.inc"
#include "native_history_page.inc"
#include "native_history_collection_page.inc"
#include "native_history_capture.inc"
#include "native_history_hooks.inc"
#include "native_embark_reclaim_history.inc"
#include "native_ime_adapter.inc"
#include "native_input_hooks.inc"
#include "native_search_binding.inc"
#ifdef _WIN32
#include "native_arena_tree_search_hooks.inc"
#endif
#include "name_editor_search.inc"
#include "native_item_search_hooks.inc"
#include "native_stocks_search_hooks.inc"
#include "native_unit_search_hooks.inc"
#include "native_unit_identity_hooks.inc"
#include "native_adventure_charge_hooks.inc"
#include "native_adventure_introduction.inc"
#include "native_overview_event_hooks.inc"
#include "native_legends_search_hooks.inc"
#include "native_workshop_search_hooks.inc"
#include "native_material_search_hooks.inc"
#include "native_stockpile_search_hooks.inc"
#include "native_symbol_search_hooks.inc"
#include "native_conversation_search_hooks.inc"
#ifndef _WIN32
#include "native_journal_search_hooks.inc"
#endif
#include "native_caption_hooks.inc"
#include "native_character_relations.inc"
#include "native_paragraph_hooks.inc"
#include "native_workshop_recipe_hooks.inc"
#include "native_rich_hooks.inc"
#include "native_adventure_hover_hooks.inc"
#include "native_announcement_hooks.inc"
#include "native_dfhack_capture_hooks.inc"

static NativeProcessGuard g_process_instance_guard{NativeGuardRole::Core};
static bool acquire_process_instance_guard() { return g_process_instance_guard.acquire(log_line); }
static void release_process_instance_guard() { g_process_instance_guard.release(); }

static std::array<NativeImportHook, 3> g_render_hooks;
#include "native_render_profile.inc"

static bool install_sdl_hooks() {
    const std::pair<const char *, bool (*)()> stages[] = {
        {"SDL binding discovery", native_prepare_render_bindings},
        {"Stone economic-use bounds guard", install_native_stone_use_guard},
        {"Native left-click delivery", install_native_mouse_click_hook},
        {"Unicode input and search", install_native_input_hooks},
#ifdef _WIN32
        {"Translated Arena tree search", install_native_arena_tree_search_hook},
#endif
        {"Translated item search", install_native_item_search_hook},
        {"Translated Stocks search", install_native_stocks_search_hook},
        {"Translated unit search", install_native_unit_search_hook},
        {"Native unit identity fields", install_native_unit_identity_hooks},
        {"Native adventure charge fields", install_native_adventure_charge_hooks},
        {"Native adventure introduction error text", install_native_adventure_introduction_hooks},
        {"Native overview event source", install_native_overview_event_hooks},
        {"Translated Legends search", install_native_legends_search_hook},
        {"Translated workshop search", install_native_workshop_search_hook},
        {"Translated task and work-order material search", install_native_material_search_hook},
        {"Translated stockpile search", install_native_stockpile_search_hook},
        {"Translated image creator search", install_native_symbol_search_hook},
        {"Conversation keyword search", install_native_conversation_search_hook},
#ifndef _WIN32
        {"Adventure journal search", install_native_journal_search_hook},
#endif
        {"Complete caption capture", install_native_caption_hooks},
        {"Character kinship captions", install_native_character_relations_hook},
        {"Complete paragraph capture", install_native_paragraph_hook},
        {"Complete workshop requirement capture", install_native_workshop_recipe_hooks},
        {"Rich-text capture", install_native_rich_hooks},
        {"Adventure hover background capture", install_native_adventure_hover_hook},
        {"Complete announcement capture", install_native_announcement_hook},
        {"Native history event capture", install_native_history_hooks},
    };
    for (const auto &[label, install] : stages) {
        if (!install()) {
            report_native_patch_error("ERROR", label, "core initialization stopped at this stage");
            return false;
        }
    }
    // DFHack may be loaded after this core. Present retries this optional
    // observer until its exported tile hook is available.
    (void)install_native_dfhack_capture_hook();
    for (auto &hook : g_render_hooks) {
        if (!hook.install("SDL render/mouse binding")) return false;
    }
    g_copy_hook_active = true;
    g_legends_mouse_hook_active = true;
    log_line("INFO", "Enabled shared text capture, Unicode search, glyph suppression and mouse mapping");
    return true;
}

static void uninstall_sdl_hooks() {
    uninstall_native_dfhack_capture_hook();
    g_legends_mouse_hook_active = false;
    for (auto it = g_render_hooks.rbegin(); it != g_render_hooks.rend(); ++it)
        it->uninstall("SDL render/mouse binding");
    g_copy_hook_active = g_render_hooks[0].active();
    uninstall_native_history_hooks();
    uninstall_native_announcement_hook();
    uninstall_native_adventure_hover_hook();
    uninstall_native_rich_hooks();
    uninstall_native_workshop_recipe_hooks();
    uninstall_native_paragraph_hook();
    uninstall_native_character_relations_hook();
    uninstall_native_caption_hooks();
    uninstall_native_conversation_search_hook();
#ifndef _WIN32
    uninstall_native_journal_search_hook();
#endif
    uninstall_native_symbol_search_hook();
    uninstall_native_stockpile_search_hook();
    uninstall_native_material_search_hook();
    uninstall_native_workshop_search_hook();
    uninstall_native_legends_search_hook();
    uninstall_native_unit_search_hook();
    uninstall_native_overview_event_hooks();
    uninstall_native_adventure_introduction_hooks();
    uninstall_native_adventure_charge_hooks();
    uninstall_native_unit_identity_hooks();
    clear_native_unit_identities();
    uninstall_native_stocks_search_hook();
    uninstall_native_item_search_hook();
#ifdef _WIN32
    uninstall_native_arena_tree_search_hook();
#endif
    uninstall_native_input_hooks();
    g_native_mouse_click_hook.uninstall();
    g_native_stone_use_guard.uninstall();
}

static bool native_hooks_detached() {
    return std::none_of(g_render_hooks.begin(), g_render_hooks.end(),
                       [](const auto &hook) { return hook.active(); }) &&
        !native_dfhack_capture_hook_active() &&
        !g_native_stone_use_guard.active() &&
        !g_native_mouse_click_hook.active() &&
        !native_history_hooks_active() && !native_announcement_hook_active() && !native_adventure_hover_hook_active() &&
        !native_rich_hooks_active() && !native_paragraph_hooks_active() &&
        !native_workshop_recipe_hooks_active() &&
        !native_caption_hooks_active() && !native_conversation_search_hook_active() &&
        !native_character_relations_hook_active() &&
#ifndef _WIN32
        !native_journal_search_hook_active() &&
#endif
        !native_item_search_hook_active() &&
        !native_stocks_search_hook_active() &&
        !native_unit_search_hook_active() &&
        !native_unit_identity_hooks_active() &&
        !native_adventure_charge_hooks_active() &&
        !native_adventure_introduction_hooks_active() &&
        !native_overview_event_hooks_active() &&
        !native_legends_search_hook_active() &&
        !native_workshop_search_hook_active() &&
        !native_material_search_hook_active() &&
        !native_stockpile_search_hook_active() &&
        !native_symbol_search_hook_active() &&
#ifdef _WIN32
        !native_arena_tree_search_hook_active() &&
#endif
        !native_input_hooks_active();
}

static bool native_can_shutdown() {
    if (g_native_hook_thread != std::thread::id{} &&
        g_native_hook_thread != std::this_thread::get_id()) {
        log_line("ERROR", "Core shutdown must run on its SDL thread");
        return false;
    }
    return true;
}

static bool stop_reloadable_core() {
    if (!native_can_shutdown()) return false;
    uninstall_sdl_hooks();
    if (!native_hooks_detached() || !native_callbacks_idle()) {
        log_line("ERROR", "Core remains resident because callbacks could not be detached");
        return false;
    }
    if (g_plugin_active.load()) {
        g_overlay.shutdown();
        g_plugin_active.store(false);
    }
    {
        std::lock_guard<std::mutex> lock(g_ime_popup_mutex);
        g_ime_popup_snapshot = {};
    }
    native_cleanup();
    g_native_hook_thread = {};
    g_real_present = nullptr;
    g_real_copy = nullptr;
    g_real_get_mouse_state = nullptr;
    release_process_instance_guard();
    return true;
}
