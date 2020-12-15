mask = ""

memory = Dict{String, Int64}()

function recurse(floating, array, index, value)
    for i in '0':'1'
        array[floating[index]] = i

        if index == length(floating)
            memory[join(array)] = value
        else
            recurse(floating, array, index + 1, value)
        end
    end
end

for line in eachline("input.txt")
    global mask, solution

    left, right = split(line, " = ")

    if left == "mask"
        mask = right
    else
        address = lpad(string(parse(Int64, left[begin + 4:end - 1]), base = 2), 36, '0')
        value = parse(Int64, right)

        tmp = collect(address)
        floating = []

        for (index, char) in enumerate(mask)
            if char == '1'
                tmp[index] = '1'
            elseif char == 'X'
                tmp[index] = 'X'
                push!(floating, index)
            end
        end

        recurse(floating, tmp, 1, value)
   end
end

println(sum(values(memory)))

