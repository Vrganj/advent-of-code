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
        result = number
        break

sums = []

for i, number in enumerate(numbers):
    if i == 0:
        sums.append(number)
    else:
        sums.append(number + sums[i - 1])

for i in range(len(numbers)):
    for j in range(i + 2, len(numbers)):
        if sums[j] - sums[i] == result:
            r = numbers[i + 1:j + 1]
            print(max(r) + min(r))
            break
