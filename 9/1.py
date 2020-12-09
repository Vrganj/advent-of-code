with open('input.txt') as file:
    numbers = list(map(int, file.read().strip().split('\n')))

for i, number in enumerate(numbers[25:]):
    values = set(numbers[i:i + 25])
    success = False

    for x in values:
        k = number - x
        if x == k: continue
        if k in values:
            success = True
            break

    if not success:
        print(number)
        break
