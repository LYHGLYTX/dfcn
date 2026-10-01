// Native argument marshalling only. Producer snapshots and span ownership
// live in page_hooks.inc and are independent of the game's calling ABI.
static void native_history_call_figure_name(void *history, NativeString *source,
        int32_t id, void *context, int16_t first, int16_t second) {
    const uintptr_t address = native_history_page_address(NativeHistoryPageSymbol::FigureName);
#ifdef _WIN32
    reinterpret_cast<void (*)(void *, NativeString *, int32_t, void *, int16_t, int16_t)>(address)(
        history, source, id, context, first, second);
#else
    (void)history;
    reinterpret_cast<void (*)(NativeString *, int32_t, void *, int16_t, int16_t)>(address)(
        source, id, context, first, second);
#endif
}

static void native_history_call_entity_name(bool site, void *history, NativeString *source,
        int32_t id, int32_t flags) {
    const uintptr_t address = native_history_page_address(site ? NativeHistoryPageSymbol::SiteName :
        NativeHistoryPageSymbol::EntityName);
#ifdef _WIN32
    reinterpret_cast<void (*)(void *, NativeString *, int32_t, int32_t)>(address)(history, source, id, flags);
#else
    (void)history;
    reinterpret_cast<void (*)(NativeString *, int32_t, int32_t)>(address)(source, id, flags);
#endif
}

static void native_history_call_collection_date(void *unused, NativeString *source,
        int32_t year, int32_t seconds) {
    const uintptr_t address = native_history_page_address(NativeHistoryPageSymbol::CollectionDate);
    reinterpret_cast<void (*)(void *, NativeString *, int32_t, int32_t)>(address)(unused, source, year, seconds);
}

