-- any imports go here
import Data.List

{-Begin Question 1.1-}

-- This function returns the list of digits in an integer.
-- For example, the list of digits in 9124 is [9,1,2,4].
digits :: Int -> [Int]
-- If the input is 0, return an empty list.
digits 0 = []
-- Otherwise, recursively divide the input by 10 and append the result of the modulus 10 operation
-- to the end of the list.
digits x = digits (x `div` 10) ++ [x `mod` 10]

{-End Question 1.1-}

{-Begin Question 1.2-}

-- This function checks if a given integer is "par".
isPar :: Int -> Bool
isPar x = nonRepeating xs && nonZero xs && b `mod` a == 0
    where
        -- Get the list of digits in the input integer.
        xs = digits x
        -- Get the tens and hundreds digit by first dividing the input integer by 100,
        -- then taking the modulus 100 of the result.
        a = x `div` 100
        b = x `mod` 100

-- This function returns a list of all "par" integers between 999 and 9999 (inclusive).
pars :: [Int]
pars = [x | x <- [ 999..9999 ], isPar x]

-- This function checks if a given list of integers has no repeating elements.
nonRepeating :: [Int] -> Bool
nonRepeating xs 
    = length (nub xs) == length xs

-- This function checks if a given list of integers contains a 0.
nonZero :: [Int] -> Bool
nonZero x
    = 0 `notElem` x

{-End Question 1.2-}

{-Begin Question 1.3-}

-- This function checks if a given pair of integers is a "party".
isParty :: (Int, Int) -> Bool
isParty (x, 0)
    = False
isParty (x, y)
    | nonRepeating xys && x `mod` missing == 0 && y `mod` missing == 0 = True
    | otherwise = False
    where
        -- Get the list of digits in both integers.
        xys = digits x ++ digits y
        -- Get the missing digit from the combined list of digits.
        missing = missingDigit xys

-- This function returns the missing digit from a list of digits.
missingDigit :: [Int] -> Int
missingDigit p
    = head [x | x <- [1..9], x `notElem` p]

-- This function returns a list of all "party" pairs.
partys :: [(Int, Int)]
partys = [(x,y) | x <- pars, y <- pars, isParty (x,y)]

{-End Question 1.3-}

-- Solutions = (1785, 2496) AND (1785, 4692)

-- main = do
--     -- Question 1.1
--     let x = digits 9124
--     print x

--     -- Question 1.2
--     let x = isPar 2678
--     print x

--     let x = length pars
--     print x

--     -- Question 1,3
--     let x = isParty (2754, 1836)
--     print x

--     let x = length partys
--     print x