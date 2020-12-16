file = strip(read("input.txt", String))

sections = split(file, "\n\n")

rules = Dict{String, Tuple{UnitRange{Int64}, UnitRange{Int64}}}()

for rule in split(sections[1], '\n')
    field, aa, ab, ba, bb = match(r"(.+): (.+)-(.+) or (.+)-(.+)", rule).captures

    arange = parse(Int, aa):parse(Int, ab)
    brange = parse(Int, ba):parse(Int, bb)

    rules[field] = (arange, brange)
end

validTickets = []

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
            result += 1
        end
    end
    
    if result == 0
        push!(validTickets, numbers)
    end
end

result = Dict{String, Array{Int, 1}}()

for (field, (a, b)) in rules
    for index in 1:size(validTickets[1], 1)
        valid = true

        for numbers in validTickets
            number = numbers[index]

            if number in a || number in b
                continue
            end

            valid = false

            break
        end

        if !(field in keys(result))
            result[field] = Array{Int, 1}()
        end

        if valid
            push!(result[field], index)
        end
    end
end

final = Dict{String, Int}()

while length(final) != length(rules)
    for (field, values) in result
        if length(values) == 1
            final[field] = values[begin]
            
            for (k, v) in result
                filter!(!=(final[field]), v)
            end
        end
    end
end

personal = parse.(Int, [match.match for match in eachmatch(r"(\d+)", sections[2])])

solution = 1

for (field, index) in final
    if !startswith(field, "departure")
        continue
    end

    global solution *= personal[index]
end

println(solution)

