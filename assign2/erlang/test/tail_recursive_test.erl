-module(tail_recursive_test).
-export([tail_recursive_fib_test/0]).

tail_recursive_fib_test() ->
  fibonacci_test:test_fib(fun(N) -> tail_recursive:tailRecursiveFib(N) end).
