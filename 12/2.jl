wx = 10
wy = 1

x = 0
y = 0

for line in eachline("input.txt")
    global angle, wx, wy, x, y

    instruction = line[begin]
    value = parse(Int, line[begin + 1:end])

    if instruction == 'N'
        wy += value
    elseif instruction == 'S'
        wy -= value
    elseif instruction == 'W'
        wx -= value
    elseif instruction == 'E'
        wx += value
    end

    if instruction == 'L' || instruction == 'R'
        rad = deg2rad(value)

        theta = atan(wy, wx)
       
        if instruction == 'L'
            theta += rad
        else
            theta -= rad
        end

        len = sqrt(wx^2 + wy^2)
        
        wx = len * cos(theta)
        wy = len * sin(theta)
    end

    if instruction == 'F'
        x += value * wx
        y += value * wy
    end
end

println(floor(Int, abs(x) + abs(y)))

