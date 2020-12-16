file = strip(read("input.txt", String))

sections = split(file, "\n\n")

rules = Dict{String, Tuple{UnitRange{Int64}, UnitRange{Int64}}}()

for rule in split(sections[1], '\n')
    field, aa, ab, ba, bb = match(r"(.+): (.+)-(.+) or (.+)-(.+)", rule).captures

    arange = parse(Int, aa):parse(Int, ab)
    brange = parse(Int, ba):parse(Int, bb)

    rules[field] = (arange, brange)
end

solution = 0

for ticket in split(sections[3], '\n')[begin + 1:end]
    numbers = parse.(Int, split(ticket, ','))
    result = 0

    for number in numbers
        invalidFields = 0

        for (field, (a, b)) in rules
            if number in a || number in b
                continue
            end

            invalidFields += 1
        end

        if invalidFields == length(rules)
            result += number
        end
    end

    global solution += result
end

println(solution)

