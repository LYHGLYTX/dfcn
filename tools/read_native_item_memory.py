"""Read original 53.16 artifact/item/work records; never run game or translation code."""
import argparse
from collections import Counter
import ctypes as C
from ctypes import wintypes as W
import json
import struct

p = argparse.ArgumentParser(description=__doc__)
p.add_argument("pid", type=int)
p.add_argument("--artifact", type=int)
p.add_argument("--limit", type=int, default=12)
p.add_argument("--modules", action="store_true", help="Show mapped DFCN files only.")
args = p.parse_args()
k = C.WinDLL("kernel32", use_last_error=True)
k.OpenProcess.argtypes = [W.DWORD, W.BOOL, W.DWORD]
k.OpenProcess.restype = W.HANDLE
k.CloseHandle.argtypes = [W.HANDLE]
k.ReadProcessMemory.argtypes = [W.HANDLE, C.c_void_p, C.c_void_p, C.c_size_t, C.POINTER(C.c_size_t)]
ps = C.WinDLL("psapi", use_last_error=True)
ps.EnumProcessModules.argtypes = [W.HANDLE, C.POINTER(C.c_void_p), W.DWORD, C.POINTER(W.DWORD)]
handle = k.OpenProcess(0x410, False, args.pid)
if not handle:
    raise C.WinError(C.get_last_error())
def read(address, size):
    if size < 0 or size > 1024 * 1024:
        raise ValueError("unbounded read")
    out = C.create_string_buffer(size)
    done = C.c_size_t()
    if not k.ReadProcessMemory(handle, address, out, size, C.byref(done)) or done.value != size:
        raise C.WinError(C.get_last_error())
    return out.raw
def scalar(address, fmt="Q"):
    return struct.unpack("<" + fmt, read(address, struct.calcsize("<" + fmt)))[0]
def vector(address, fmt="Q"):
    begin, end, capacity = struct.unpack("<3Q", read(address, 24))
    width = struct.calcsize("<" + fmt)
    if not (begin <= end <= capacity) or (end - begin) % width:
        raise ValueError("invalid vector")
    return [x[0] for x in struct.iter_unpack("<" + fmt, read(begin, end - begin))] if end > begin else []
def string(address):
    data = read(address, 32)
    size, capacity = struct.unpack_from("<2Q", data, 16)
    if size > capacity or size > 262144:
        raise ValueError("invalid string")
    return (data[:size] if capacity < 16 else read(struct.unpack_from("<Q", data)[0], size)).decode("cp437")
def constant_getter(object, slot):
    code = read(scalar(scalar(object) + slot), 8)
    if code[0] == 0xb8 and code[5] == 0xc3:
        return struct.unpack_from("<i", code, 1)[0]
    if code[:2] == b"\x66\xb8" and code[4] == 0xc3:
        return struct.unpack_from("<h", code, 2)[0]
    if code[:3] in (b"\x33\xc0\xc3", b"\x32\xc0\xc3"):
        return 0
    if code[0] == 0xb0 and code[2] == 0xc3:
        return code[1]
    raise ValueError("not a constant getter " + code.hex())
try:
    modules = (C.c_void_p * 1024)()
    needed = W.DWORD()
    if not ps.EnumProcessModules(handle, modules, C.sizeof(modules), C.byref(needed)):
        raise C.WinError(C.get_last_error())
    base = modules[0]
    if args.modules:
        ps.GetMappedFileNameW.argtypes = [W.HANDLE, C.c_void_p, W.LPWSTR, W.DWORD]
        for module in modules[:min(1024, needed.value // C.sizeof(C.c_void_p))]:
            name = C.create_unicode_buffer(32768)
            if ps.GetMappedFileNameW(handle, module, name, len(name)) and "dfcn" in name.value.lower():
                print(json.dumps({"base": hex(module), "mapped_file": name.value}, ensure_ascii=False))
        raise SystemExit(0)
    artifacts = vector(base + 0x23e6180)
    works = {scalar(work, "i"): work for work in vector(base + 0x24e7cb8)}
    counts = Counter()
    shown = 0
    for artifact in artifacts:
        id = scalar(artifact, "i")
        item = scalar(artifact + 0x90)
        if not item:
            continue
        kind = constant_getter(item, 0)
        counts[kind] += 1
        if shown >= args.limit:
            continue
        if args.artifact is not None and id != args.artifact:
            continue
        row = {"artifact": id, "item_type": kind, "item_vtable": hex(scalar(item) - base),
               "raw_title": string(artifact + 8), "stack": scalar(item + 0x80, "i")}
        entries = []
        # Every constructed item class shares item_constructedst's vector.
        for improvement in vector(item + 0xd0) if constant_getter(item, 0x5a8) else []:
            type = constant_getter(improvement, 0x28)
            entry = {"type": type, "material": scalar(improvement + 8, "h"),
                     "index": scalar(improvement + 12, "i")}
            if type in (9, 12):
                ids = vector(improvement + (0x30 if type == 9 else 0x28), "i")
                entry["work_ids"] = ids
                entry["works"] = []
                for work_id in ids:
                    work = works.get(work_id)
                    if not work:
                        continue
                    entry["works"].append({"id": work_id, "title": string(work + 8),
                        "type": scalar(work + 0x68, "i"), "author": scalar(work + 0xa0, "i"),
                        "quality": scalar(work + 0xa4, "i"), "styles": vector(work + 0x70, "i"),
                        "strengths": vector(work + 0x88, "i"), "purposes": vector(work + 0x48, "i")})
            entries.append(entry)
        row["improvements"] = entries
        if kind == 87:
            row["inscription_type"] = scalar(item + 0x10c, "h")
            row["inscription"] = string(item + 0xe8)
        print(json.dumps(row, ensure_ascii=False))
        shown += 1
    print(json.dumps({"artifact_item_counts": dict(counts)}, ensure_ascii=False))
finally:
    k.CloseHandle(handle)
