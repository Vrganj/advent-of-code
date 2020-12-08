with open('input.txt') as file:
    instructions = file.read().strip().split('\n')

accumulator = 0
index = 0

cache = set()

while True:
    if index >= len(instructions): break

    if index in cache: break
    cache.add(index)

    instruction, value = instructions[index].split()
    value = int(value)

    if instruction == 'acc':
        accumulator += value
    elif instruction == 'jmp':
        index += value
        continue

    index += 1

print(accumulator)

