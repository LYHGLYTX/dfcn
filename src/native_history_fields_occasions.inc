case 81: // performance b8bb50
case 82: // competition b8c990
case 83: // procession b8ddd0
case 84: // ceremony b8e6e0
    captured = field("entity", 0x28, 'p') && field("occasion", 0x2c) &&
        field("schedule", 0x30) && field("site", 0x34) &&
        field("region", 0x38) && field("layer", 0x3c);
    if (captured) {
        // The other location IDs remain in the snapshot, but only the first
        // non-sentinel location is actually referenced by getSentence.
        if (fields.at("site").front() != -1) reference('s', fields.at("site").front());
        else if (fields.at("region").front() != -1) reference('r', fields.at("region").front());
        else reference('u', fields.at("layer").front());
    }
    if (captured && result.native_type == 82)
        captured = list("competitors", 0x40, 'n') && list("winners", 0x58, 'n');
    if (captured) captured = capture_native_history_occasion(result, fields, references);
    break;
