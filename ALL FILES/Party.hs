-- any imports go here
import Data.List

{-Begin Question 1.1-}

digits :: Int -> [Int]
digits 0 = []
digits x = digits (x `div` 10) ++ [x `mod` 10]

{-End Question 1.1-}

{-Begin Question 1.2-}

isPar :: Int -> Bool
isPar x = nonRepeating xs && nonZero xs && b `mod` a == 0
    where
        xs = digits x
        a = x `div` 100
        b = x `mod` 100

pars :: [Int]
pars = [x | x <- [ 999..9999 ], isPar x]

nonRepeating :: [Int] -> Bool
nonRepeating xs 
    = length (nub xs) == length xs

nonZero :: [Int] -> Bool
nonZero x
    = 0 `notElem` x

{-End Question 1.2-}

{-Begin Question 1.3-}

isParty :: (Int, Int) -> Bool
isParty (x, 0)
    = False
isParty (x, y)
    | nonRepeating xys && x `mod` missing == 0 && y `mod` missing == 0 = True
    | otherwise = False
    where
        xys = digits x ++ digits y
        missing = missingDigit xys

missingDigit :: [Int] -> Int
missingDigit p
    = head [x | x <- [1..9], x `notElem` p]

partys :: [(Int, Int)]
partys = [(x,y) | x <- pars, y <- pars, isParty (x,y)]

{-End Question 1.3-}

-- SOLUTION TO THE TEASER = YOUR PAR IS 1785 --
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