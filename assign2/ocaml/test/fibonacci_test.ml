open OUnit2

let fibonacci_test_cases = [
  (0, [1]);
  (1, [1; 1]);
  (2, [1; 1; 2]);
  (3, [1; 1; 2; 3]);
  (4, [1; 1; 2; 3; 5]);
  (5, [1; 1; 2; 3; 5; 8]);
  (8, [1; 1; 2; 3; 5; 8; 13; 21; 34]);
  (10, [1; 1; 2; 3; 5; 8; 13; 21; 34; 55; 89])
]

let create_test func (input, expected) =
  let name = Printf.sprintf "fibonacci(%d) should return %s" input
    (String.concat "; " (List.map string_of_int expected)) in
  name >:: (fun _ ->
    assert_equal expected (func input)
      ~printer:(fun l -> String.concat "; " (List.map string_of_int l))
  )

let run_fibonacci_tests func =
  "Fibonacci Test Suite" >::: List.map (create_test func) fibonacci_test_cases
