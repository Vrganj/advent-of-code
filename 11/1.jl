data = hcat(collect.(eachline("input.txt"))...)

width = size(data, 1)
height = size(data, 2)

function occupied(index)
    result = 0

    for i in -1:1
        for j in -1:1
            i == j == 0 && continue

            result += get(data, index + CartesianIndex(i, j), '.') == '#'
        end
    end

    result
end

while true
    global data

    clone = deepcopy(data)

    for index in CartesianIndices(data)
        data[index] == '.' && continue

        o = occupied(index)

        if data[index] == 'L'
            if o == 0
                clone[index] = '#'
            end
        else
            if o >= 4
                clone[index] = 'L'
            end
        end
    end

    data == clone ? break : data = clone
end

print(count(==('#'), data))

