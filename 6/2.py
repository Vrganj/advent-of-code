with open('input.txt') as file:
    groups = file.read().strip().split('\n\n')

solution = 0

for group in groups:
    people = group.strip().split('\n')
    cache = dict()

    for person in people:
        for char in person:
            if char in cache:
                cache[char] += 1
            else:
                cache[char] = 1

    for k in cache:
        if cache[k] == len(people):
            solution += 1

print(solution)

