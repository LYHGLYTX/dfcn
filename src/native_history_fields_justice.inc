case 121: { // hf_perform_entity_action: persecution b7b7f0.
    captured = field("persecutor", 0x28, 'n') && field("persecutor_entity", 0x2c, 'p') &&
        field("target_entity", 0x30, 'p') && field("site", 0x34, 's') &&
        list("confiscated", 0x38, 'n') && list("destroyed", 0x50) &&
        field("shrines", 0x68) && list("expelled", 0x70, 'n') && list("expelled_counts", 0xb8);
    if (captured && fields.at("destroyed").size() <= 2)
        for (int32_t id : fields.at("destroyed"))
            if (!native_history_structure_reference(result, fields.at("site").front(), id)) {
                captured = false; break;
            }
    break;
}
case 130: // hf_convicted: RVA b7da60; all plot and punishment branches.
    captured = field("convicted", 0x28, 'n') && field("convicter", 0x2c, 'p') &&
        field("recognized_by", 0x30, 'p') && list("implicated", 0x38, 'n') &&
        field("corrupt", 0x50, 'n') && field("behest", 0x54, 'n') &&
        field("fooled", 0x58, 'n') && field("framer", 0x5c, 'n') &&
        field("contact", 0x60, 'n') && field("coconspirator", 0x64, 'n') &&
        field("target", 0x68, 'n') && field("crime", 0x6c) &&
        field("hammerstrokes", 0x70) && field("prison_months", 0x74) &&
        field("punishment_flags", 0x78) && field("plot_flags", 0x7c);
    break;
case 131: // failed_frame_attempt: RVA b7d410.
    captured = field("target", 0x28, 'n') && field("convicter", 0x2c, 'p') &&
        field("behest", 0x30, 'n') && field("fooled", 0x34, 'n') &&
        field("framer", 0x38, 'n') && field("crime", 0x3c);
    break;
