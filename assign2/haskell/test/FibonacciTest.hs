module FibonacciTest ( testFib ) where

import Test.HUnit

fibonacciTest :: (Int -> [Int]) -> [Test]
fibonacciTest func = do 
  (pos, expectedFib) <-
    [
      (0, [1]),
      (1, [1, 1]),
      (2, [1, 1, 2]),
      (3, [1, 1, 2, 3]),
      (4, [1, 1, 2, 3, 5]),
      (5, [1, 1, 2, 3, 5, 8]),
      (8, [1, 1, 2, 3, 5, 8, 13, 21, 34]),
      (10, [1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89])
    ]

  let actual = func pos

  return (expectedFib ~=? actual)

testFib :: (Int -> [Int]) -> IO ()
testFib func = runTestTTAndExit $ TestList ["Test Fibonacci Implementation" ~: fibonacciTest $ func]

