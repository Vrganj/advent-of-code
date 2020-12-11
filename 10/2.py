with open('input.txt') as file:
    adapters = list(map(int, file.read().strip().split('\n')))

adapters.append(0)
adapters.sort()
adapters.append(adapters[-1] + 3)

cache = dict()
cache[len(adapters) - 1] = 1

def d(n):
    if n in cache: return cache[n]
    result = 0

    for i in (1, 2, 3):
        if n + i >= len(adapters): break
        if adapters[n + i] - adapters[n] <= 3:
            result += d(n + i)

    cache[n] = result
    return result

print(d(0))

print(cache)

