with open('input.txt') as file:
    adapters = list(map(int, file.read().strip().split('\n')))

adapters.sort()
adapters.append(adapters[-1] + 3)

last = 0

one = 0
three = 0

for adapter in adapters:
    difference = adapter - last

    if difference == 1:
        one += 1
    elif difference == 3:
        three += 1

    last = adapter

print(one * three)

