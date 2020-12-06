import re

with open('input.txt', 'r') as file:
    content = file.read()

solution = 0

for line in content.split('\n'):
    if len(line) == 0: continue
    pattern, letter, string = line.split()
    letter = letter[0:-1]
    first, second = map(int, pattern.split('-'))
    if string[first - 1] == letter or string[second - 1] == letter:
        if string[first - 1] == letter and string[second - 1] == letter:
            continue
        solution += 1

print(solution)
