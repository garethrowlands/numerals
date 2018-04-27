module Numerals (numerals)
where

import Data.List (find)

numbersAndNumerals :: [(Integer,String)]
numbersAndNumerals = reverse
    [
        (1,"I"),
        (4,"IV"),
        (5,"V"),
        (9,"IX"),
        (10,"X"),
        (40,"XL"),
        (50,"L"),
        (90,"XC"),
        (100,"C"),
        (400,"CD"),
        (500,"D"),
        (900,"CM"),
        (1000,"M")
    ]

-- TODO: this function's really an unfolding from a seed to a list structure,
-- so refactor in terms of Data.List.unfoldr
numerals :: Integer -> String
numerals 0 = ""
numerals n =
    case find (numberLessThan n) numbersAndNumerals of
        Just (number,numeral) -> numeral ++ numerals (n - number)
        Nothing -> error ("Value " ++ show n ++ "must be 1..3999") 
    where
        numberLessThan n (number,_) = n >= number