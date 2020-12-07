import re
from collections import defaultdict

with open("input.txt") as file:
    rules = file.read().strip().split('\n')

holders = defaultdict(lambda: [])

solution = 0

for rule in rules:
    match = re.search(r'(.+) bags contains? (.+)\.', rule)
    color, items = match.groups()

    if items == 'no other bags': continue

    items = [' '.join(item.strip().split(' ')[:-1]) for item in items.split(', ')]

    for item in items:
        item_quantity, *item_color = item.split(' ')
        item_quantity = int(item_quantity)
        item_color = ' '.join(item_color)
        holders[color].append([item_quantity, item_color])

def rec(color):
    result = 0

    for item_quantity, item_color in holders[color]:
        result += item_quantity + item_quantity * rec(item_color)

    return result

print(rec('shiny gold'))

