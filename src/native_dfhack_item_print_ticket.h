#pragma once
// Included inside dfcn before the Console adapter; no catalog dependency.
struct NativeDfhackItemPrintTicket {
    std::string prefix, caption, ending;
    std::string launcher_command;
    std::string literal_scope;
    // The visible command can be an alias. This owned parser input is derived
    // from the actual producer only; it is never displayed or executed.
    std::string report_command;
};
static std::optional<NativeDfhackItemPrintTicket> native_dfhack_take_item_print_ticket(
    void *console, std::string_view source);
static std::optional<NativeDfhackItemPrintTicket> native_dfhack_take_launcher_echo_ticket(
    void *console, std::string_view source);
static bool native_dfhack_console_nonlocal_command();
