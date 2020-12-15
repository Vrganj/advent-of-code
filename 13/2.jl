buses = split(collect(eachline("input.txt"))[2], ",")

values = []
offsets = []

for index in keys(buses)
    if buses[index] != "x"
        push!(values, parse(Int, buses[index]))
        push!(offsets, index - 1)
    end
end

const z = zip(values, offsets)

function valid(timestamp)
    for (value, offset) in z
        if (timestamp + offset) % value != 0
            return false
        end
    end

    return true
end

using Dates

last = Dates.now()

j = 0

for i in 0:409:1000000000000
    global j
    j += 1
end

println(values)
println(offsets)

