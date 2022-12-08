-- any imports go here
import Data.List

{-Begin Question 2.1-}
number :: [Int] -> Int
number =
  foldl' number 0
  where
    number num d = 10 * num + d

{-End Question 2.1-}

{-Begin Question 2.2-}
splits :: [a] -> [([a], [a])]
splits xs =
  map (\x -> splitAt x xs) (take (length xs - 1) [1..])

possibles :: [([Int], [Int])]
possibles = concat (map (\xs -> splits xs) (permutations [1..9]))

{-End Question 2.2-}

{-Begin Question 2.3-}
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

digits :: Int -> [Int]
digits x = reverse (digits' x)
  where
    digits' 0 = []
    digits' x = d : digits' x'
      where
        (x', d) = x `divMod` 10

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
