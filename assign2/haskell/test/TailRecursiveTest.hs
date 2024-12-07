module Main where

import FibonacciTest ( testFib )
import Fibonacci.TailRecursive

main :: IO ()
main = testFib tailRecursiveFib

