module Fibonacci.Iterative ( iterativeFib ) where

iterativeFib :: Int -> [Int]
iterativeFib position = take (position + 1) $ map fst $ iterate (\(prev, cur) -> (cur, prev + cur)) (1, 1)
