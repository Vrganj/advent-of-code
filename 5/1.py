from math import floor, ceil

with open("input.txt") as file:
    seats = file.read().strip().split('\n')

def row(position):
    left = 0
    right = 127

    for char in position:
        if char == 'F':
            right = floor((left + right) / 2)
        elif char == 'B':
            left = ceil((left + right) / 2)

    return left

def column(position):
    left = 0
    right = 7

    for char in position:
        if char == 'R':
            left = ceil((left + right) / 2)
        elif char == 'L':
            right = floor((left + right) / 2)

    return left

solution = 0

for seat in seats:
    id = row(seat) * 8 + column(seat)
    solution = max(solution, id)

print(solution)

