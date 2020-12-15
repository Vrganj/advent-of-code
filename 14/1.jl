hask_zero = 0b111111111111111111111111111111111111
mask_one = 0
mask = ""

memory = Dict{Int64, Int64}()

for line in eachline("input.txt")
    global mask_zero, mask_one, mask

    left, right = split(line, " = ")

    if left == "mask"
        mask = right
        mask_zero = 0b111111111111111111111111111111111111
        mask_one = 0

        for (index, value) in enumerate(right)
            if value == '0'
                mask_zero -= 0b100000000000000000000000000000000000 >> (index - 1)
            elseif value == '1'
                mask_one += 0b100000000000000000000000000000000000 >> (index - 1)
            end
        end
    else
        address = parse(Int64, left[begin + 4:end - 1])
        value = parse(Int64, right)

        if !haskey(memory, address)
            memory[address] = 0
        end

        memory[address] = value
        memory[address] |= mask_one
        memory[address] &= mask_zero
   end
end

println(sum(values(memory)))

