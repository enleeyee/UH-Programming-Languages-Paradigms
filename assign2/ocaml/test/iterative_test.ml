open OUnit2
open Fibonacci_test
open Iterative

let () =
  let suite = run_fibonacci_tests iterativeFib in
  run_test_tt_main suite
