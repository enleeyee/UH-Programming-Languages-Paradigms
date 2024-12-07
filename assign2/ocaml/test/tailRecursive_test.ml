open OUnit2
open Fibonacci_test
open TailRecursive 

let () =
  let suite = run_fibonacci_tests tailRecursiveFib in
  run_test_tt_main suite
