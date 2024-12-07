module Main where

import FibonacciTest ( testFib )
import Fibonacci.Iterative

main :: IO ()
main = testFib iterativeFib
