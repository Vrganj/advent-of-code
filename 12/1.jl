angle = 90
x = 0
y = 0

for line in eachline("input.txt")
    global angle, x, y

    instruction = line[begin]
    value = parse(Int, line[begin + 1:end])

    if instruction == 'N'
        y += value
    elseif instruction == 'S'
        y -= value
    elseif instruction == 'W'
        x -= value
    elseif instruction == 'E'
        x += value
    end

    if instruction == 'L'
        angle -= value
        angle = mod(angle, 360)
    elseif instruction == 'R'
        angle += value
        angle = mod(angle, 360)
    end

    if instruction == 'F'
        if angle == 0
            y += value
        elseif angle == 90
            x += value
        elseif angle == 180
            y -= value
        elseif angle == 270
            x -= value
        end
    end
end

println(abs(x) + abs(y))

