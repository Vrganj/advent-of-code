with open('input.txt') as file:
    groups = file.read().strip().split('\n\n')

solution = 0

for group in groups:
    solution += len(set(group.replace('\n', '')))

print(solution)

