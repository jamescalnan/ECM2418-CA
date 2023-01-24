-- any imports go here
import Data.List

{-Begin Question 2.1-}
-- This function takes in a list of integers and returns a single integer
-- It does this by folding the list from left to right and multiplying each value by 10
number :: [Int] -> Int
number =
    foldl' number 0
    where
        number num d = 10 * num + d

{-End Question 2.1-}

{-Begin Question 2.2-}
-- This function takes in a list and returns a list of pairs with two different splits of the list
splits :: [a] -> [([a], [a])]
splits xs =
    map (\x -> splitAt x xs) (take (length xs - 1) [1..])

-- This function creates all possible splits of the list 1..9
possibles :: [([Int], [Int])]
possibles = concat (map (\xs -> splits xs) (permutations [1..9]))

{-End Question 2.2-}

{-Begin Question 2.3-}
-- This function takes in the split (x,y) of a list and returns true if the conditions have been met
isAcceptable :: ([Int], [Int]) -> Bool
isAcceptable (xs, ys) =
  and [p == r, head digitsP == 4, last digitsLow == 3]
  where
    x = number xs
    y = number ys
    low = min x y
    p = x * y
    digitsP = digits p
    digitsLow = digits low
    r = number (reverse digitsP)

-- This is a helper function that takes in an integer and returns a list of the individual digits in the integer
digits :: Int -> [Int]
digits 0 = []
digits x = digits (x `div` 10) ++ [x `mod` 10]

-- This function filters the possibles list based on the conditions in isAcceptable
acceptables :: [([Int], [Int])]
acceptables = filter isAcceptable possibles

{-End Question 2.3-}


-- main = do
--   -- Question 2.1
--     let x = number [9, 1, 2, 4] -- x is equal to 9124 
--     print x
    
--     -- -- Question 2.2
--     let x = splits [1, 2, 3, 4] -- x is equal to [([1], [2,3,4]), ([1,2], [3,4]),([1,2,3],[4])]
--     print x
    
--     let x = length possibles -- x is equal to 2903040
--     print x
    
--     -- Question 2.3
--     let x = isAcceptable ([7, 1, 6, 3], [5, 9, 2, 4, 8]) -- x is equal to True
--     print x
    
--     let x = length acceptables -- x is equal to 6
--     print x