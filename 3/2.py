with open('input.txt', 'r') as file:
    content = file.read().split('\n')

width = len(content[0])
height = len(content)

def slope(right, down):
    x = 0
    y = 0

    solution = 0

    while True:
        x += right
        y += down

        if y >= height or len(content[y]) == 0:
            break

        current = content[y][x % width]

        if current == '#':
            solution += 1

    return solution

print(slope(1, 1) * slope(3, 1) * slope(5, 1) * slope(7, 1) * slope(1, 2))

