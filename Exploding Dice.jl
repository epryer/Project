module Exploding_Dice
import Random
export explode

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






end#Exploding Dice