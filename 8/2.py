with open('input.txt') as file:
    instructions = file.read().strip().split('\n')

def emulate(instructions):
    accumulator = 0
    index = 0

    cache = set()

    while True:
        if index >= len(instructions): break

        if index in cache:
            return False, 0

        cache.add(index)

        instruction, value = instructions[index].split()
        value = int(value)

        if instruction == 'acc':
            accumulator += value
        elif instruction == 'jmp':
            index += value
            continue

        index += 1

    return True, accumulator

for i, instruction in enumerate(instructions):
    if instruction[:3] not in ['nop', 'jmp']: continue
    copy = [*instructions]

    if instruction == 'nop':
        copy[i] = 'jmp' + copy[i][3:]
    else:
        copy[i] = 'nop' + copy[i][3:]

    success, result = emulate(copy)

    if success:
        print(result)
        break

