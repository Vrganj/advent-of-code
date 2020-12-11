data = collect.(eachline("input.txt"))

rowcount = length(data)
colcount = length(data[1])

isvalid(row, col) = 0 < row <= rowcount && 0 < col <= colcount

function iterate(row, col, vrow, vcol)
    global data

    for i in 1:100
        row += vrow
        col += vcol

        if isvalid(row, col)
            c = data[row][col]

            if c != '.'
                return c
            end
        end
    end

    return 'N'
end

function taken(row, col)
    result = 0

    result += iterate(row, col, 1, 0) == '#'
    result += iterate(row, col, 0, 1) == '#'
    result += iterate(row, col, -1, 0) == '#'
    result += iterate(row, col, 0, -1) == '#'

    result += iterate(row, col, 1, 1) == '#'
    result += iterate(row, col, 1, -1) == '#'
    result += iterate(row, col, -1, 1) == '#'
    result += iterate(row, col, -1, -1) == '#'

    return result
end

while true
    global data
    clone = deepcopy(data)

    for row in 1:rowcount
        for col in 1:colcount
            t = taken(row, col)

            if data[row][col] == '#'
                if t >= 5
                    clone[row][col] = 'L'
                end
            elseif data[row][col] == 'L'
                if t == 0
                    clone[row][col] = '#'
                end
            end
        end
    end

    if data == clone
        println()

        result = 0

        for row in data
            for col in row
                result += col == '#'
            end
        end

        println(result)

        break
    end

    data = clone
end

