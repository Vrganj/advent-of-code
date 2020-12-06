with open('input.txt', 'r') as file:
    text = file.read()
    numbers = list(map(int, filter(lambda x: len(x) > 0, text.split('\n'))))
    for i in numbers:
        for j in numbers:
            if i + j == 2020:
                print(i * j)
