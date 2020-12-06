x = 0
y = 0

with open('input.txt', 'r') as file:
    content = file.read().split('\n')

width = len(content[0])
height = len(content)

solution = 0

while True:
    x += 3
    y += 1

    if y >= height or len(content[y]) == 0:
        break

    current = content[y][x % width]

    if current == '#':
        solution += 1

print(solution)

