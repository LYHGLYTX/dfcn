// Linux 53.16 binding only; callbacks, snapshots, ownership and teardown are
// shared with the other native adapters. Addresses are ELF virtual addresses.
    profile.base = anchor - 0x400000;
    const auto bytes_match = [&](uintptr_t va, const std::vector<uint8_t> &expected) {
        auto relocated = expected;
        if (!native_reference_bytes(va, relocated)) return false;
        std::vector<uint8_t> observed(relocated.size());
        return native_history_copy_bytes(native_elf_history_address(va), observed.data(), observed.size()) &&
            observed == relocated;
    };
    // The producer owns the event in r14 and passes the live string/context
    // in rsi/rdx, true/false in ecx/r8d. ELF subtype fields start at +0x24.
    if (!bytes_match(0xd2b7f5, {0x41,0x8b,0x46,0x20,0x66,0x0f,0xef,0xc0,0x45,0x31,0xc0}) ||
        !bytes_match(0xd2b942, {0xff,0x90,0xd0,0,0,0}) ||
        !bytes_match(0x1dea8da, {0x83,0xf8,0x09,0x7e,0xe3,0x83,0xf8,0x13}) ||
        !bytes_match(0x1cffeef, {0xc6,0x40,0x10,0x00}) ||
        !bytes_match(0x1d00d6b, {0xbf,0x0c,0x00,0x00,0x00})) {
        log_line("ERROR", "Native ELF history producer/word/viewport ABI validation failed");
        return false;
    }
    profile.box = reinterpret_cast<NativeHistoryRichBox *>(native_elf_history_address(0x281e4c8));
    profile.sentence_slot = 0xd0;
    profile.append = reinterpret_cast<NativeHistoryAppendFn>(native_elf_history_address(0x1d000b0));
    profile.layout = reinterpret_cast<NativeHistoryLayoutFn>(native_elf_history_address(0x1cffc30));
    profile.draw = reinterpret_cast<NativeHistoryDrawFn>(native_elf_history_address(0x425170));
    profile.legends_render = native_elf_history_address(0x1ceb400);
    profile.calls = {
        {0xd2b942, 0, reinterpret_cast<const void *>(&capture_native_history_sentence),
            {}, {0xff,0x90,0xd0,0,0,0}},
        {0xd2b9bc, 0x1d000b0, reinterpret_cast<const void *>(&capture_native_history_append)},
        {0xd2b9d7, 0x1cffc30, reinterpret_cast<const void *>(&capture_native_history_layout)},
        {0x1dea8bd, 0x425170, reinterpret_cast<const void *>(&capture_native_history_draw)},
    };

    // Legends has a separate producer and renderer from worldgen. Validate
    // its screen selection, source ABI and scroll transform before binding.
    if (!bytes_match(0x1cebeac, {0x48,0x63,0x90,0x60,0x04,0,0}) ||
        !bytes_match(0xa5c340, {0xf3,0x0f,0x1e,0xfa,0x55,0x48,0x89,0xe5}) ||
        !bytes_match(0x1cee51e, {0x8b,0x41,0x2c,0x83,0xc0,0x09,0x44,0x29,0xe8}) ||
        !bytes_match(0xa13255, {0x48,0x8b,0x74,0x24,0x28,0x31,0xc9,0x31,0xd2})) {
        log_line("ERROR", "Native ELF Legends screen/producer/viewport ABI validation failed");
        return false;
    }
    g_real_native_history_describe = reinterpret_cast<NativeHistoryDescribeFn>(native_elf_history_address(0xa5c340));
    g_real_native_history_collection = reinterpret_cast<NativeHistoryCollectionFn>(native_elf_history_address(0x1cf12b0));
    g_real_native_history_links = reinterpret_cast<NativeHistoryLinksFn>(native_elf_history_address(0x1ce0190));
    profile.calls.push_back({0xa5c873, 0, reinterpret_cast<const void *>(&capture_native_history_legends_sentence),
        {}, {0xff,0x90,0xd0,0,0,0}});
    profile.calls.push_back({0x1cf2072, 0, reinterpret_cast<const void *>(&capture_native_history_inline_collection_sentence),
        {}, {0xff,0x90,0xd0,0,0,0}});
    profile.calls.push_back({0x1cebf56, 0x1cffc30, reinterpret_cast<const void *>(&capture_native_history_layout)});
    profile.calls.push_back({0x1cee5bd, 0x425170, reinterpret_cast<const void *>(&capture_native_history_draw)});
    for (uintptr_t call : {uintptr_t(0x1ce3675), uintptr_t(0x1ce5917), uintptr_t(0x1ce632d),
            uintptr_t(0x1ce6e45), uintptr_t(0x1ce87a6), uintptr_t(0x1ce9145),
            uintptr_t(0x1ce9ab5), uintptr_t(0x1cea5dc), uintptr_t(0x1ceaf4b)})
        profile.calls.push_back({call, 0xa5c340, reinterpret_cast<const void *>(&capture_native_history_describe)});
    for (uintptr_t call : {uintptr_t(0x1cf4060), uintptr_t(0x1cf8a2b)})
        profile.calls.push_back({call, 0x1cf12b0, reinterpret_cast<const void *>(&capture_native_history_collection)});
    for (uintptr_t call : {uintptr_t(0x1ce3689), uintptr_t(0x1ce592b), uintptr_t(0x1ce6341),
            uintptr_t(0x1ce6e59), uintptr_t(0x1ce87ba), uintptr_t(0x1ce9159),
            uintptr_t(0x1ce9ac9), uintptr_t(0x1cea5f0), uintptr_t(0x1ceaf5f),
            uintptr_t(0x1cf4076), uintptr_t(0x1cf8a3f)})
        profile.calls.push_back({call, 0x1d000b0, reinterpret_cast<const void *>(&capture_native_history_legends_append)});
    for (uintptr_t call : {uintptr_t(0x1ce3694), uintptr_t(0x1ce5936), uintptr_t(0x1ce634c),
            uintptr_t(0x1ce6e64), uintptr_t(0x1ce87c5), uintptr_t(0x1ce9164),
            uintptr_t(0x1ce9ad4), uintptr_t(0x1cea5fb), uintptr_t(0x1ceaf6a),
            uintptr_t(0x1cf4081), uintptr_t(0x1cf8a4a)})
        profile.calls.push_back({call, 0x1ce0190, reinterpret_cast<const void *>(&capture_native_history_legends_links)});
    profile.calls.push_back({0xa5e75c, 0xa12140, reinterpret_cast<const void *>(&capture_native_history_page_biography)});
    profile.calls.push_back({0xa1325e, 0x1503cd0, reinterpret_cast<const void *>(&capture_native_history_child_relation)});
    profile.calls.push_back({0xa5f46a, 0x8377e0, reinterpret_cast<const void *>(&capture_native_elf_page_end)});
    profile.calls.push_back({0xa5d274, 0x8377e0, reinterpret_cast<const void *>(&capture_native_elf_section_heading<1>)});
    profile.calls.push_back({0xa5d289, 0xa27ae0, reinterpret_cast<const void *>(&capture_native_elf_related_entity)});
    profile.calls.push_back({0xa5d2ea, 0x8377e0, reinterpret_cast<const void *>(&capture_native_elf_page_end)});
    profile.calls.push_back({0xa5d99b, 0xa5b420, reinterpret_cast<const void *>(&capture_native_history_kill_summary)});
    profile.calls.push_back({0xa12ff1, 0x12c58d0, reinterpret_cast<const void *>(&capture_native_history_biography_region)});

    // The same typed page producers, including argument-elided native clones.
    for (uintptr_t call : {uintptr_t(0xa5cdc5), uintptr_t(0xa5d6c5)})
        profile.calls.push_back({call, 0xa2bc30, reinterpret_cast<const void *>(&capture_native_history_relationship)});
    profile.calls.push_back({0xa5cf81, 0x8377e0, reinterpret_cast<const void *>(&capture_native_history_battle_begin)});
    profile.calls.push_back({0xa5d05f, 0x12c58d0, reinterpret_cast<const void *>(&capture_native_history_battle_name)});
    profile.calls.push_back({0xa5d0d7, 0x8377e0, reinterpret_cast<const void *>(&capture_native_history_page_end)});
    profile.calls.push_back({0xa5cd39, 0xa136b0, reinterpret_cast<const void *>(&capture_native_elf_related_figure)});
    // Own the counted name append, not the following comma literal at
    // a5cd63. Starting at that comma leaves the figure link outside the
    // snapshot and fails the shared whole-paragraph boundary check.
    profile.calls.push_back({0xa5cd58, 0x837660, reinterpret_cast<const void *>(&capture_native_history_related_figure_begin)});
    profile.calls.push_back({0xa5dc7a, 0x1503cd0, reinterpret_cast<const void *>(&capture_native_history_child_relation)});
    profile.calls.push_back({0xa5d1b9, 0x8377e0, reinterpret_cast<const void *>(&capture_native_elf_page_end)});
    profile.calls.push_back({0xa5ccfa, 0x8377e0, reinterpret_cast<const void *>(&capture_native_elf_section_heading<0>)});
    for (uintptr_t call : {uintptr_t(0xa5d489), uintptr_t(0xa60097), uintptr_t(0xa5ec1a)})
        profile.calls.push_back({call, 0x8377e0, reinterpret_cast<const void *>(&capture_native_elf_section_heading<1>)});
    profile.calls.push_back({0xa5d83c, 0x8377e0, reinterpret_cast<const void *>(&capture_native_elf_section_heading<2>)});
    profile.calls.push_back({0xa5d4a4, 0xa27ae0, reinterpret_cast<const void *>(&capture_native_elf_related_extra<0>)});
    profile.calls.push_back({0xa600b5, 0xa27ae0, reinterpret_cast<const void *>(&capture_native_elf_related_extra<1>)});
    profile.calls.push_back({0xa5ec30, 0xa27ae0, reinterpret_cast<const void *>(&capture_native_elf_related_extra<2>)});
    profile.calls.push_back({0xa5d854, 0xa27ee0, reinterpret_cast<const void *>(&capture_native_elf_related_extra<3>)});
    for (uintptr_t call : {uintptr_t(0xa5d50c), uintptr_t(0xa600dc), uintptr_t(0xa600f1),
                          uintptr_t(0xa60102), uintptr_t(0xa5ec8a), uintptr_t(0xa5d932)})
        profile.calls.push_back({call, 0x8377e0, reinterpret_cast<const void *>(&capture_native_elf_page_end)});
    profile.calls.push_back({0xa5eadb, 0xa0d8c0, reinterpret_cast<const void *>(&capture_native_history_artifact_name)});
    profile.calls.push_back({0xa5f123, 0xb05af0, reinterpret_cast<const void *>(&capture_native_history_artifact_unnamed)});
    profile.calls.push_back({0xa5eb2c, 0x8377e0, reinterpret_cast<const void *>(&capture_native_history_artifact_introduction_end)});
    profile.calls.push_back({0xa5eb4f, 0xe76ce0, reinterpret_cast<const void *>(&capture_native_history_artifact_description)});
    profile.calls.push_back({0xa5e896, 0x8377e0, reinterpret_cast<const void *>(&capture_native_elf_page_end)});
    // Observe the actual selected array offset AFTER the game's RNG/index
    // calculation. Replay the replaced RBX load; return RAX/RDX unchanged.
    profile.calls.push_back({0x1cf52fe, 0, reinterpret_cast<const void *>(&capture_native_elf_war_choice),
        {0x48,0x89,0xd1, 0x4c,0x89,0xff, 0x48,0x89,0xee, 0x48,0x89,0xc2,
         0x48,0x8b,0x9d,0x70,0xfe,0xff,0xff},
        {0x48,0x8b,0x9d,0x70,0xfe,0xff,0xff}});
    // Replay the string-length initialization before its virtual name call.
    // The relay's return address accounts for the +8 stack displacement.
    const std::vector<uint8_t> marker_original{0x48,0xc7,0x84,0x24,0xd8,0x02,0,0,0,0,0,0,0xff,0x50,0x30};
    const std::vector<uint8_t> marker_setup{0x48,0xc7,0x84,0x24,0xe0,0x02,0,0,0,0,0,0};
    profile.calls.push_back({0x1cf372e, 0, reinterpret_cast<const void *>(&capture_native_history_collection_marker<1>), marker_setup, marker_original});
    profile.calls.push_back({0x1cf2498, 0, reinterpret_cast<const void *>(&capture_native_history_collection_marker<2>), marker_setup, marker_original});
    profile.calls.push_back({0x1cf1b41, 0, reinterpret_cast<const void *>(&capture_native_history_collection_marker<3>), marker_setup, marker_original});
    for (uintptr_t call : {uintptr_t(0x1cf19ce), uintptr_t(0x1cf2323)})
        profile.calls.push_back({call, 0xa603a0, reinterpret_cast<const void *>(&capture_native_history_collection_date)});
    for (uintptr_t call : {uintptr_t(0x1ce3a39), uintptr_t(0xa58939), uintptr_t(0xa58f30)})
        profile.calls.push_back({call, 0, reinterpret_cast<const void *>(&capture_native_history_nested_title),
            {}, {0xff,0x90,0xd8,0,0,0}});

    g_real_native_history_item = reinterpret_cast<NativeHistoryItemFn>(native_history_page_address(NativeHistoryPageSymbol::Item));
    g_real_native_history_artifact_item = reinterpret_cast<NativeHistoryArtifactItemFn>(native_history_page_address(NativeHistoryPageSymbol::ArtifactItem));
    // Each role binds the shared callback, including both compiler-emitted
    // copies of the body-abuse item branch and the independently built titles.
    struct ItemCall { uintptr_t address; size_t role; };
    static constexpr ItemCall item_calls[] = {
        {0xa2c5c3,0}, {0xa2c835,1}, {0xa608eb,2},
        {0xa3bbd6,3}, {0xa3ba42,4}, {0xa513fb,5}, {0xa517a3,5},
        {0xa5785c,6}, {0xa59758,7}, {0xa2d350,8}, {0xa2d5b8,9}, {0xa2da53,10},
        {0x1ce3d48,11}, {0x1ce3c8f,12}, {0xa3ee07,13}, {0xa3ec3e,14},
        {0xa51b89,15}, {0xa52001,15}, {0xa57ba2,16}, {0xa5a022,17}, {0xa11b95,18}
    };
    for (const auto &entry : item_calls)
        profile.calls.push_back({entry.address, 0x12b6a70, native_history_item_callback(entry.role)});
    for (uintptr_t call : {uintptr_t(0xa566f7), uintptr_t(0xa568ba), uintptr_t(0xa14811)})
        profile.calls.push_back({call, 0xe68020, reinterpret_cast<const void *>(&capture_native_history_artifact_item)});
    g_real_native_history_building_label = reinterpret_cast<NativeHistoryBuildingLabelFn>(native_elf_history_address(0x1957df0));
    for (uintptr_t call : {uintptr_t(0xa2c2d1), uintptr_t(0xa2d054)})
        profile.calls.push_back({call, 0x1957df0, reinterpret_cast<const void *>(&capture_native_history_building_label)});

    if (!native_reference_calls(profile.calls, 0)) return false;
