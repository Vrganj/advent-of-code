numbers = parse.(Int, split(collect(eachline("input.txt"))[begin], ','))

const cache = Dict{Int, Int}()
turn = 0

for number in numbers
    global turn += 1
    cache[number] = turn
end

function next(number::Int)::Int
    global cache, turn
    turn += 1

    if turn == 30000001
        println(number)
        exit(0)
    end

    if number in keys(cache)
        n = turn - 1 - cache[number]
        cache[number] = turn - 1
        return n
    else
        cache[number] = turn - 1
        return 0
    end
end

last = numbers[end]

while true
    global last
    last = next(last)
end

