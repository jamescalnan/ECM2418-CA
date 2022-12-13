-- any imports go here
import Data.List

{-Begin Question 2.1-}
-- number is a function that takes a list of digits and returns the number they represent. It uses foldl' to iterate through the list of digits, multiplying the previous result by 10 and adding the next digit.
number :: [Int] -> Int
number =
  foldl' number 0
  where
    number num d = 10 * num + d

{-End Question 2.1-}

{-Begin Question 2.2-}
-- splits is a function that takes a list and returns a list of pairs, each containing a split of the original list at a given index. It uses splitAt to split the list at each index in the list [1..length xs - 1], and returns the list of resulting pairs.
splits :: [a] -> [([a], [a])]
splits xs =
  map (\x -> splitAt x xs) (take (length xs - 1) [1..])

-- possibles is a list of all possible splits of all permutations of the digits 1 through 9. It uses permutations to generate all permutations of the digits, splits to split each permutation into pairs, and concat to flatten the list of lists of pairs into a single list of pairs.
possibles :: [([Int], [Int])]
possibles = concat (map (\xs -> splits xs) (permutations [1..9]))

{-End Question 2.2-}

{-Begin Question 2.3-}
-- isAcceptable is a function that takes a pair of lists of digits and returns True if the pair is acceptable, and False otherwise. It first calculates the numbers represented by the two lists of digits, and then checks if several conditions are met: the product of the numbers equals the reverse of the digits of the product, the first digit of the product is 4, and the last digit of the smaller number is 3.
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

-- digits is a helper function used by isAcceptable to convert a number into a list of its digits. It uses div and mod to repeatedly divide the number by 10 and add the remainder to the list of digits.
digits :: Int -> [Int]
digits 0 = []
digits x = digits (x `div` 10) ++ [x `mod` 10]

-- acceptables is a list of all acceptable pairs of lists of digits. It uses filter to select only the pairs for which isAcceptable returns True.
acceptables :: [([Int], [Int])]
acceptables = filter isAcceptable possibles

{-End Question 2.3-}

-- main = do
--   -- Question 2.1
--     let x = number [9, 1, 2, 4]
--     print x
    
--     -- -- Question 2.2
--     let x = splits [1, 2, 3, 4]
--     print x
    
--     let x = length possibles
--     print x
    
--     -- Question 2.3
--     let x = isAcceptable ([7, 1, 6, 3], [5, 9, 2, 4, 8])
--     print x
    
--     let x = length acceptables
--     print x