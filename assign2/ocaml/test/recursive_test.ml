open OUnit2
open Fibonacci_test
open Recursive 

let () =
  let suite = run_fibonacci_tests recursiveFib in
  run_test_tt_main suite
