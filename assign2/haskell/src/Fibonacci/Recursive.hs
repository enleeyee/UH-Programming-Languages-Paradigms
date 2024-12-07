module Fibonacci.Recursive ( recursiveFib ) where

recursiveFib :: Int -> [Int]

recursiveFib 0 = [1]
recursiveFib 1 = [1, 1]

recursiveFib position = series ++ [last series + last(init series)]
  where 
    series = recursiveFib(position - 1)
