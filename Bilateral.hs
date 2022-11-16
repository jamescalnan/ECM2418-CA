-- any imports go here
import Data.List

{-Begin Question 2.1-}
number :: [Int] -> Int
number =
  foldl number 0
  where
    number num d = 10 * num + d

{-End Question 2.1-}

{-Begin Question 2.2-}
splits :: [a] -> [([a], [a])]
splits xs =
  [x `splitAt` xs | x <- [1 .. length xs - 1]]

possibles :: [([Int], [Int])]
possibles = concatMap splits (permutations [1 .. 9])

{-End Question 2.2-}

{-Begin Question 2.3-}
isAcceptable :: ([Int], [Int]) -> Bool
isAcceptable (xs, ys) =
  p == r && head (digits p) == 4 && last (digits low) == 3
  where
    x = number xs
    y = number ys
    low = min x y
    p = x * y
    r = number (reverseList (digits p))

digits :: Int -> [Int]
digits 0 = []
digits x = digits (x `div` 10) ++ [x `mod` 10]

reverseList :: [Int] -> [Int]
reverseList = foldl (flip (:)) []

acceptables :: [([Int], [Int])]
acceptables = filter isAcceptable possibles

{-End Question 2.3-}

main = do
  -- Question 2.1
  let x = number [9, 1, 2, 4]
  print x

  -- Question 2.2
  let x = splits [1, 2, 3, 4]
  print x

  let x = length possibles
  print x

  -- Question 2.3
  let x = isAcceptable ([7, 1, 6, 3], [5, 9, 2, 4, 8])
  print x

  let x = length acceptables
  print x