import re
from collections import defaultdict

with open("input.txt") as file:
    rules = file.read().strip().split('\n')

holders = defaultdict(lambda: [])
cached = dict()

solution = 0

for rule in rules:
    match = re.search(r'(.+) bags contains? (.+)\.', rule)
    color, items = match.groups()

    items = [' '.join(item.strip().split(' ')[1:-1]) for item in items.split(', ')]

    for item in items:
        holders[item].append(color)

def rec(color):
    global solution

    cached[color] = True

    for key in holders[color]:
        if key in cached: continue
        solution += 1
        rec(key)

rec('shiny gold')

print(solution)


