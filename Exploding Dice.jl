module Exploding_Dice
import Random
export explode

"""
explode(mad::Int)
Enter max sides on single die. Roll until result is not max, add all rolls together.
"""
function explode(max::Int)
    local sum=0
    if max<0
        throw(ArgumentError("This number on a n-sided die has to be greater than 0"))
    end
    check = max
    roll = rand(1:max)
    while roll == check
        sum += roll 
        roll = rand(1:max)
    end
    sum += roll
    return sum
end

"""
rolltrials(f::Function, trials::Int, max::Int)
Run trials on certain dice function. Returns vector of all results.
"""
function rolltrials(f::Function, trials::Int, max::Int)
    local results = Int[]
    for i in 1:trials 
        push!(results, f(max))
    end
    return results
end #Tyrian's code





end#Exploding Dice