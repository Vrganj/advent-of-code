data = collect.(eachline("input.txt"))

rowcount = length(data)
colcount = length(data[1])

isvalid(row, col) = 0 < row <= rowcount && 0 < col <= colcount

function neighbors(row, col)
    global data

    result = 0

    for i in -1:1
        for j in -1:1
            if i == j == 0
                continue
            end

            if isvalid(row + i, col + j) && data[row + i][col + j] == '#'
                result += 1
            end
        end
    end

    return result
end

while true
    clone = deepcopy(data)

    for row in 1:rowcount
        for col in 1:colcount
            n = neighbors(row, col)

            if data[row][col] == '#'
                if n >= 4
                    clone[row][col] = 'L'
                end
            elseif data[row][col] == 'L'
                if n == 0
                    clone[row][col] = '#'
                end
            end
        end
    end

    if data == clone
        break
    end

    global data = clone
end

print(count(c -> c === '#', join(collect(join(line, "") for line in data), "\n")))

