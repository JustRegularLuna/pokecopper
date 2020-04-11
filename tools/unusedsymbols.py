#!/usr/bin/env python3
# vim:set tabstop=4 shiftwidth=4 expandtab smarttab

from sys import argv, exit, stderr
from struct import unpack, calcsize
from enum import Enum

class symtype(Enum):
    LOCAL = 0
    IMPORT = 1
    EXPORT = 2

class sectype(Enum):
    WRAM0 = 0
    VRAM = 1
    ROMX = 2
    ROM0 = 3
    HRAM = 4
    WRAMX = 5
    SRAM = 6
    OAM = 7

def unpack_file(fmt, file):
    size = calcsize(fmt)
    return unpack(fmt, file.read(size))

def read_string(file):
    buf = bytearray()
    while True:
        b = file.read(1)
        if b is None or b == b'\0':
            return buf.decode()
        else:
            buf += b

def parse_object(file):
    obj = {
        "symbols": [],
        "sections": []
    }

    num_symbols, num_sections = unpack_file("<II", file)

    for x in range(num_symbols):
        symbol = {}

        symbol["name"] = read_string(file)
        symbol["type"] = symtype(unpack_file("<B", file)[0])
        if symbol["type"] != symtype.IMPORT:
            symbol["filename"] = read_string(file)
            symbol["line_num"], symbol["section"], symbol["value"] = unpack_file("<III", file)

        obj["symbols"].append(symbol)

    for x in range(num_sections):
        section = {}

        section["name"] = read_string(file)
        size, type, section["org"], section["bank"], section["align"] = unpack_file("<IBIII", file)
        section["type"] = sectype(type)

        if section["type"] == sectype.ROMX or section["type"] == sectype.ROM0:
            section["data"] = file.read(size)

            section["patches"] = []
            num_patches = unpack_file("<I", file)[0]
            for x in range(num_patches):
                patch = {}

                patch["filename"] = read_string(file)
                patch["line"], patch["offset"], patch["type"], rpn_size = unpack_file("<IIBI", file)
                patch["rpn"] = file.read(rpn_size)

                section["patches"].append(patch)

        obj["sections"].append(section)

    return obj


if len(argv) <= 1:
    print("Usage: %s [-D] <objects.o...>" % argv[0], file=stderr)
    exit(1)

argi = 1

just_dump = False
if argv[argi] == "-D":
    just_dump = True
    argi += 1
elif argv[argi] == "--":
    argi += 1

globalsyms = {}

for filename in argv[argi:]:
    print(filename, file=stderr)

    file = open(filename, "rb")

    id = unpack_file("4s", file)[0]
    if id != b'RGB6':
        print("File %s is of an unknown format." % filename, file=stderr)
        exit(1)

    if just_dump:
        num_symbols = unpack_file("<I", file)[0]
        file.seek(4, 1)
        for x in range(num_symbols):
            print(read_string(file))

            type = unpack_file("<B", file)[0]
            if type != 1:
                read_string(file)
                file.seek(4 * 3, 1)

        continue

    obj = parse_object(file)

    localsyms = {}

    imports = 0
    exports = 0
    for symbol in obj["symbols"]:
        if symbol["type"] == symtype.LOCAL:
            if symbol["name"] not in localsyms:
                localsyms[symbol["name"]] = 0
        elif symbol["type"] == symtype.IMPORT:
            imports += 1
            if symbol["name"] not in globalsyms:
                globalsyms[symbol["name"]] = 0
        elif symbol["type"] == symtype.EXPORT:
            exports += 1
            if symbol["name"] not in globalsyms:
                globalsyms[symbol["name"]] = 0

    print("Locals:", len(localsyms), file=stderr)
    print("Imports:", imports, file=stderr)
    print("Exports:", exports, file=stderr)

    for section in obj["sections"]:
        if section["type"] == sectype.ROMX or section["type"] == sectype.ROM0:
            for patch in section["patches"]:
                rpn = patch["rpn"]

                pos = 0
                while pos < len(rpn):
                    if rpn[pos] == 0x51:
                        pos += 1
                        while rpn[pos] != 0:
                            pos += 1
                    elif rpn[pos] == 0x80:
                        pos += 5
                    elif rpn[pos] == 0x50 or rpn[pos] == 0x81:
                        symbol_id = unpack("<I", rpn[pos + 1:pos + 5])[0]
                        symbol = obj["symbols"][symbol_id]
                        if symbol["type"] == symtype.LOCAL:
                            localsyms[symbol["name"]] += 1
                        else:
                            globalsyms[symbol["name"]] += 1
                        pos += 5
                    else:
                        pos += 1

    print(file=stderr)

if just_dump:
    exit()

print("Unreferenced globals:", file=stderr)
for symbol in globalsyms:
    if globalsyms[symbol] == 0:
        print(symbol)
