// One producer binding. Record snapshots/control-boundary binding are shared
// with the native ELF; no platform-specific per-row translation hooks.
profile.calls.push_back({0xb92378, 0xbba250, reinterpret_cast<const void *>(&capture_native_history_kill_summary)});
