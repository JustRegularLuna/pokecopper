#!/usr/bin/env python3
# vim:set tabstop=4 shiftwidth=4 expandtab smarttab

# Parse functions
functions = []
reading = False
for line in open("engine/items/item_effects.asm"):
    if line.startswith("ItemEffects:"):
        reading = True
        continue

    if not reading:
        continue
    if line == "\n":
        break

    if line.startswith("\tdw "):
        functions.append(line.split()[1])

# Parse attributes
attributes = []
reading = False
for line in open("data/items/attributes.asm"):
    if line.startswith("ItemAttributes:"):
        reading = True
        continue

    if not reading:
        continue
    if line == "\n":
        break

    if line.startswith("\titem_attribute "):
        field = line.split()[6][:-1]
        battle = line.split()[7]
        attributes.append((field, battle))

# Print the unused ones
for x in range(len(functions)):
    if functions[x] == "NoEffect":
        continue

    if (attributes[x][0] != "ITEMMENU_NOUSE" or
            attributes[x][1] != "ITEMMENU_NOUSE"):
        continue

    print(functions[x])
