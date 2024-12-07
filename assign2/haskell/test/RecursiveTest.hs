module Main where

import FibonacciTest ( testFib )
import Fibonacci.Recursive

main :: IO ()
main = testFib recursiveFib
