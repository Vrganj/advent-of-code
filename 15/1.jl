numbers = parse.(Int, split(collect(eachline("input.txt"))[begin], ','))

cache = Dict{Int, Int}()
turn = 0

for number in numbers
    global turn += 1
    cache[number] = turn
end

function next(number)
    global cache, turn
    turn += 1

    if turn == 2020
        println(number)
        return
    end

    if number in keys(cache)
        n = turn - 1 - cache[number]
        cache[number] = turn - 1
        next(n)
    else
        cache[number] = turn - 1
        next(0)
    end
end

next(numbers[end])

