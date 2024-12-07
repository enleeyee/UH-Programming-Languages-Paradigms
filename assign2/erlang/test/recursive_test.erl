-module(recursive_test).
-export([recursive_fib_test/0]).

recursive_fib_test() ->
  fibonacci_test:test_fib(fun(N) -> recursive:recursiveFib(N) end).
