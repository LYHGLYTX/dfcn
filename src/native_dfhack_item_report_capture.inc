// Provenance only: the silent stream is never changed or dereferenced later.
// All Lua/debug/native values below are copied during the short GetOutput
// callback; only owned bytes and integer identities survive it.
struct NativeDfhackSilentItemReportProof {
    std::string parser_command;
    uint64_t entry_epoch = 0;
};

struct NativeDfhackSilentItemReport {
    enum class Stage { descriptions, separator, footer, table, table_done };
    uint32_t thread_identity = 0;
    uint64_t nonce = 0, invocation = 0, entry_epoch = 0;
    uintptr_t buffer_identity = 0, echo_identity = 0, ambient_out_identity = 0;
    uint64_t ambient_invocation = 0, description_sum = 0, total = 0;
    size_t prints = 0, descriptions = 0, table_rows = 0;
    unsigned metadata_step = 0;
    Stage stage = Stage::descriptions;
    bool dry_run = false, by_type = false;
    std::string command, action, body;
};
static std::unordered_map<std::thread::id, NativeDfhackSilentItemReport>
    g_native_dfhack_silent_item_reports;

static void native_dfhack_drop_silent_item_report() noexcept {
    try {
        std::lock_guard<std::mutex> lock(g_native_dfhack_item_print_mutex);
        g_native_dfhack_silent_item_reports.erase(std::this_thread::get_id());
    } catch (...) {}
}

static void native_dfhack_clear_silent_item_reports() noexcept {
    try {
        std::lock_guard<std::mutex> lock(g_native_dfhack_item_print_mutex);
        g_native_dfhack_silent_item_reports.clear();
    } catch (...) {}
}

static std::optional<NativeDfhackSilentItemReportProof>
native_dfhack_observe_silent_item_report(NativeDfhackLuaState *state, void *out,
        int top, const NativeDfhackLuaDebug &caller, std::string_view source_key) noexcept {
    constexpr size_t maximum_body = 1048576, maximum_prints = 16384;
    constexpr size_t maximum_threads = 512, maximum_cache_bytes = 33554432;
    try {
        const auto &api = g_native_dfhack_lua_output_api;
        if (!state || !out || !api.query_v2 || !g_overlay.translation_enabled()) {
            native_dfhack_drop_silent_item_report();
            return std::nullopt;
        }
        struct RestoreStack {
            NativeDfhackLuaState *state;
            int top;
            void (*settop)(NativeDfhackLuaState *, int);
            ~RestoreStack() { settop(state, top); }
        } restore{state, top, api.settop};
        const bool execute = source_key == api.item_source && !caller.isvararg &&
            caller.linedefined == 241 && caller.lastlinedefined == 335 &&
            caller.nparams == 4 && caller.currentline == 331;
        const bool printing = source_key == api.item_source && !caller.isvararg &&
            caller.linedefined == 340 && caller.lastlinedefined == 364 && caller.nparams == 3;
        const bool launcher = source_key == api.launcher_source && !caller.isvararg &&
            caller.linedefined == 1126 && caller.lastlinedefined == 1182 && caller.nparams == 3 &&
            caller.currentline >= 1152 && caller.currentline <= 1155;
        const int line = caller.currentline;
        if ((!execute && !printing && !launcher) ||
                (printing && line != 343 && line != 346 && line != 348 &&
                    line != 350 && line != 358 && line != 360 && line != 362)) {
            native_dfhack_drop_silent_item_report();
            return std::nullopt;
        }
        DfcnDfhackCommandContextV2 context{};
        context.size = sizeof(context);
        context.version = DFCN_DFHACK_COMMAND_CONTEXT_VERSION_V2;
        if (!api.query_v2(nullptr, &context) || !context.thread_identity || !context.entry_epoch ||
                (launcher ? context.invocation &&
                    !(context.flags & DFCN_DFHACK_COMMAND_LOCAL_CONSOLE)
                    : !context.invocation || context.out != out ||
                        (context.flags & DFCN_DFHACK_COMMAND_LOCAL_CONSOLE))) {
            native_dfhack_drop_silent_item_report();
            return std::nullopt;
        }

        const auto argument = [&](int index, size_t maximum) -> std::optional<std::string> {
            if (api.type(state, index) != 4) return std::nullopt;
            size_t length = 0;
            const char *bytes = api.tolstring(state, index, &length);
            if (!bytes || length > maximum || std::memchr(bytes, 0, length)) return std::nullopt;
            return std::string(bytes, length);
        };
        const auto local_string = [&](const NativeDfhackLuaDebug &frame, int index,
                const char *expected, size_t maximum) -> std::optional<std::string> {
            api.settop(state, top);
            const char *name = api.getlocal(state, &frame, index);
            std::optional<std::string> result;
            if (name && !std::strcmp(name, expected)) result = argument(-1, maximum);
            api.settop(state, top);
            return result;
        };
        std::optional<std::string> command;
        std::string action, original;
        uint64_t numeric_count = 0;
        if (launcher) {
            command = local_string(caller, 3, "command", 65536);
        } else {
            // Silent runLuaScript uses the same Core state as GUI input. The
            // exact installation's non-tail launcher frame must still be at
            // its hideGuard call; a command name/alias is not producer proof.
            for (int depth = 2; depth <= 64; ++depth) {
                NativeDfhackLuaDebug ancestor{};
                if (!api.getstack(state, depth, &ancestor)) break;
                if (!api.getinfo(state, "Slu", &ancestor) || ancestor.isvararg ||
                        ancestor.currentline != 1148 || ancestor.linedefined != 1126 ||
                        ancestor.lastlinedefined != 1182 || ancestor.nparams != 3) continue;
                const auto file = native_dfhack_lua_text(ancestor.source, 32768);
                if (!file || file->empty() || file->front() != '@' ||
                        native_dfhack_lua_source_key(*file) != api.launcher_source) continue;
                command = local_string(ancestor, 3, "command", 65536);
                break;
            }
            const auto actual_action = local_string(caller, 1, "action", 32);
            constexpr std::string_view actions[] = {
                "forbid", "unforbid", "dump", "undump", "melt", "unmelt", "count", "hide", "unhide"
            };
            if (!actual_action || std::find(std::begin(actions), std::end(actions),
                    std::string_view(*actual_action)) == std::end(actions)) {
                native_dfhack_drop_silent_item_report();
                return std::nullopt;
            }
            action = *actual_action;
        }
        if (!command || command->empty() || std::any_of(command->begin(), command->end(),
                [](unsigned char ch) { return ch < ' ' && ch != '\t'; })) {
            native_dfhack_drop_silent_item_report();
            return std::nullopt;
        }
        const bool blank = (!launcher && (line == 343 || line == 362)) ||
            (launcher && line == 1154);
        const bool footer = !launcher && (line == 346 || line == 348 || line == 350);
        if (blank) {
            if (top != 1) {
                native_dfhack_drop_silent_item_report();
                return std::nullopt;
            }
        } else if (footer) {
            if (top != 3 || !api.isinteger || !api.tointegerx || !api.isinteger(state, 1)) {
                native_dfhack_drop_silent_item_report();
                return std::nullopt;
            }
            int is_integer = 0;
            const int64_t count = api.tointegerx(state, 1, &is_integer);
            const auto suffix = argument(2, 64);
            const std::string_view expected = line == 346 ? "items matched the filter options"
                : line == 348 ? "items would be modified" : "items were modified";
            if (!is_integer || count < 0 || !suffix || *suffix != expected ||
                    (line == 346 ? action != "count" : action == "count")) {
                native_dfhack_drop_silent_item_report();
                return std::nullopt;
            }
            numeric_count = static_cast<uint64_t>(count);
            original = std::to_string(count) + '\t' + *suffix;
        } else {
            const auto text = top == 2 ? argument(1, maximum_body) : std::nullopt;
            if (!text) {
                native_dfhack_drop_silent_item_report();
                return std::nullopt;
            }
            original = *text;
        }
        if (execute) {
            size_t begin = 0;
            while (begin < original.size() && original[begin] == ' ') ++begin;
            size_t end = begin;
            constexpr uint64_t maximum_count = static_cast<uint64_t>(INT64_MAX);
            while (end < original.size() && original[end] >= '0' && original[end] <= '9') {
                const unsigned digit = static_cast<unsigned>(original[end] - '0');
                if (numeric_count > (maximum_count - digit) / 10) {
                    native_dfhack_drop_silent_item_report();
                    return std::nullopt;
                }
                numeric_count = numeric_count * 10 + digit;
                ++end;
            }
            const size_t digits = end - begin;
            if (!digits || !numeric_count || original[begin] == '0' ||
                    begin != (digits < 4 ? 4 - digits : 0) ||
                    end + 1 >= original.size() || original[end] != ' ' ||
                    std::any_of(original.begin(), original.end(), [](unsigned char ch) {
                        return ch < ' ' || ch == 0x7f;
                    })) {
                native_dfhack_drop_silent_item_report();
                return std::nullopt;
            }
        } else if (!launcher && line == 358) {
            if (original != "\nTYPE           COUNT\n") {
                native_dfhack_drop_silent_item_report();
                return std::nullopt;
            }
        } else if (!launcher && line == 360 && (original.empty() ||
                std::any_of(original.begin(), original.end(), [](unsigned char ch) {
                    return ch < ' ' || ch == 0x7f;
                }))) {
            native_dfhack_drop_silent_item_report();
            return std::nullopt;
        }

        const auto thread = std::this_thread::get_id();
        std::lock_guard<std::mutex> lock(g_native_dfhack_item_print_mutex);
        auto found = g_native_dfhack_silent_item_reports.find(thread);
        if (found == g_native_dfhack_silent_item_reports.end()) {
            if (launcher || (!execute && !footer)) return std::nullopt;
            if (g_native_dfhack_silent_item_reports.size() >= maximum_threads) {
                const auto oldest = std::min_element(g_native_dfhack_silent_item_reports.begin(),
                    g_native_dfhack_silent_item_reports.end(), [](const auto &left, const auto &right) {
                        return left.second.nonce < right.second.nonce;
                    });
                if (oldest != g_native_dfhack_silent_item_reports.end())
                    g_native_dfhack_silent_item_reports.erase(oldest);
            }
            NativeDfhackSilentItemReport fresh;
            fresh.thread_identity = context.thread_identity;
            fresh.invocation = context.invocation;
            fresh.entry_epoch = context.entry_epoch;
            fresh.buffer_identity = reinterpret_cast<uintptr_t>(out);
            fresh.nonce = g_native_dfhack_item_print_sequence.fetch_add(1, std::memory_order_relaxed) + 1;
            if (!fresh.nonce) return std::nullopt;
            fresh.command = *command;
            fresh.action = action;
            found = g_native_dfhack_silent_item_reports.emplace(thread, std::move(fresh)).first;
        }
        auto &report = found->second;
        const auto deny = [&]() -> std::optional<NativeDfhackSilentItemReportProof> {
            g_native_dfhack_silent_item_reports.erase(found);
            return std::nullopt;
        };
        if (!report.nonce || report.thread_identity != context.thread_identity ||
                report.entry_epoch != context.entry_epoch || report.command != *command) return deny();
        if (launcher) {
            const unsigned expected_step = static_cast<unsigned>(line - 1152);
            if (report.prints >= maximum_prints || report.metadata_step != expected_step ||
                    (report.stage != NativeDfhackSilentItemReport::Stage::footer &&
                        report.stage != NativeDfhackSilentItemReport::Stage::table_done)) return deny();
            if (!report.metadata_step) {
                report.echo_identity = reinterpret_cast<uintptr_t>(out);
                report.ambient_invocation = context.invocation;
                report.ambient_out_identity = reinterpret_cast<uintptr_t>(context.out);
            } else if (report.echo_identity != reinterpret_cast<uintptr_t>(out) ||
                    report.ambient_invocation != context.invocation ||
                    report.ambient_out_identity != reinterpret_cast<uintptr_t>(context.out)) return deny();
            if ((line == 1152 && original != "Output from command run from gui/launcher:") ||
                    (line == 1153 && original != "> " + report.command) ||
                    (line == 1155 && original != report.body)) return deny();
            ++report.prints;
            if (line != 1155) { ++report.metadata_step; return std::nullopt; }
            NativeDfhackSilentItemReportProof proof;
            proof.parser_command = "item " + report.action;
            if (report.descriptions || !report.total) proof.parser_command += " -v";
            if (report.dry_run) proof.parser_command += " --dry-run";
            if (report.by_type) proof.parser_command += " --by-type";
            proof.entry_epoch = report.entry_epoch;
            g_native_dfhack_silent_item_reports.erase(found);
            return proof;
        }
        if (report.metadata_step || report.invocation != context.invocation ||
                report.buffer_identity != reinterpret_cast<uintptr_t>(out) || report.action != action ||
                report.prints >= maximum_prints || original.size() >= maximum_body ||
                report.body.size() > maximum_body - original.size() - 1) return deny();
        using Stage = NativeDfhackSilentItemReport::Stage;
        if (execute) {
            if (report.stage != Stage::descriptions ||
                    numeric_count > static_cast<uint64_t>(INT64_MAX) - report.description_sum) return deny();
            report.description_sum += numeric_count;
            ++report.descriptions;
        } else if (line == 343) {
            if (!report.descriptions || report.stage != Stage::descriptions) return deny();
            report.stage = Stage::separator;
        } else if (footer) {
            if (report.stage != (report.descriptions ? Stage::separator : Stage::descriptions) ||
                    (report.descriptions && (!numeric_count || report.description_sum != numeric_count)))
                return deny();
            report.total = numeric_count;
            report.dry_run = line == 348;
            report.stage = Stage::footer;
        } else if (line == 358) {
            if (report.stage != Stage::footer || !report.total) return deny();
            report.by_type = true;
            report.stage = Stage::table;
        } else if (line == 360) {
            if (report.stage != Stage::table) return deny();
            // Exact padded RAW enum/count rows are proved by the complete
            // hard-report parser after the real launcher echo is bound.
            ++report.table_rows;
        } else if (line == 362) {
            if (report.stage != Stage::table || !report.table_rows) return deny();
            report.stage = Stage::table_done;
        } else return deny();
        report.body += original;
        report.body += '\n';
        ++report.prints;
        size_t owned_bytes = 0;
        for (const auto &[id, value] : g_native_dfhack_silent_item_reports)
            owned_bytes += value.command.capacity() + value.action.capacity() + value.body.capacity();
        while (owned_bytes > maximum_cache_bytes) {
            const auto oldest = std::min_element(g_native_dfhack_silent_item_reports.begin(),
                g_native_dfhack_silent_item_reports.end(), [](const auto &left, const auto &right) {
                    return left.second.nonce < right.second.nonce;
                });
            if (oldest == g_native_dfhack_silent_item_reports.end()) break;
            owned_bytes -= oldest->second.command.capacity() + oldest->second.action.capacity() +
                oldest->second.body.capacity();
            g_native_dfhack_silent_item_reports.erase(oldest);
        }
        return std::nullopt;
    } catch (...) {
        native_dfhack_drop_silent_item_report();
        return std::nullopt;
    }
}
