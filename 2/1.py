import re

with open('input.txt', 'r') as file:
    content = file.read()

solution = 0

for line in content.split('\n'):
    if len(line) == 0: continue
    pattern, letter, string = line.split()
    letter = letter[0:-1]
    minimum, maximum = map(int, pattern.split('-'))
    matched = len(re.findall(letter, string))
    if minimum <= matched <= maximum:
        solution += 1

print(solution)
