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

cache = dict()

for seat in seats:
    cache[f'{row(seat)} {column(seat)}'] = True 

for r in range(0, 128):
    for c in range(0, 8):
        if f'{r} {c}' not in cache:
            print(r, c, r * 8 + c)


