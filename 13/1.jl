estimate, buses = eachline("input.txt")

estimate = parse(Int, estimate)
buses = parse.(Int, filter(!=("x"), split(buses, ",")))

earliest = buses[begin]

arrives(bus) = ceil(estimate / bus) * bus

for bus in buses
    if arrives(bus) < arrives(earliest)
        global earliest = bus
    end
end

println(round(Int, (arrives(earliest) - estimate) * earliest))

