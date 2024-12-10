module Exploding_Dice
import Random
export explode, rolltrials

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

"""
reg_die_expect(max::Int)
Input max number of sides on single die. Returns the expected value you would get if die is rolled multiple times.
"""
function reg_die_expect(max::Int) #expectation of a regular n-sided die
    (max+1)/2
end

"""
explode_expectation(max::Int)
Input max number of sides on single die. Returns expected value when rolling a die multiple times, dealing with explosions.
"""
function explode_expectation(max::Int) #expectation of exploding die 
    if max<0 
        throw(ArgumentError("This number on a n-sided die has to be greater than 0"))
    end
    exp = (max/(max-1))*((max+1)/2)
    return exp
end

"""
difference(ex::Real,reg::Real)
Input expected value for explosions and regular die. Returns difference.
"""
function difference(ex::Real,reg::Real)
    return ex - reg
end

"""
atleast_explode(max::Int,n::Int)
Input max number of sides on single die and n number of explosions. Returns probability of getting at least n explosions.
"""

function atleast_explode(max::Int,n::Int) #need to fix!
    if max<0
        throw(ArgumentError("This number on a n-sided die has to be greater than 0"))
    end
    k_explosions =@. 1-((max-1)/max)^n
    return 100*k_explosions
end 




end#Exploding Dice