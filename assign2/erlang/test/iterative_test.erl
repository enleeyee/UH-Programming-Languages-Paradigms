-module(iterative_test).
-export([iterative_fib_test/0]).

iterative_fib_test() ->
  fibonacci_test:test_fib(fun(N) -> iterative:iterativeFib(N) end).
