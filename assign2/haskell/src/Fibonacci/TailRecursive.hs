module Fibonacci.TailRecursive ( tailRecursiveFib ) where

tailRecursiveFib :: Int -> [Int]
tailRecursiveFib position 
  | position == 0 = [1]
  | otherwise = go (position - 1) [1, 1]
    where
      go :: Int -> [Int] -> [Int]
      go 0 series = series  
      go position series = go (position - 1) (series ++ [last series + last(init series)])
