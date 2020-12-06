with open('input.txt', 'r') as file:
    text = file.read()
    numbers = list(map(int, filter(lambda x: len(x) > 0, text.split('\n'))))
    for i in numbers:
        for j in numbers:
            for k in numbers:
                if i + j + k == 2020:
                    print(i * j * k)
