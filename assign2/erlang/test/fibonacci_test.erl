-module(fibonacci_test).
-include_lib("eunit/include/eunit.hrl").
-export([test_fib/1]).

test_fib (Implementation) ->
  TestCases = [
               {0, [1]},
               {1, [1, 1]},
               {2, [1, 1, 2]},
               {3, [1, 1, 2, 3]},
               {4, [1, 1, 2, 3, 5]},
               {5, [1, 1, 2, 3, 5, 8]},
               {8, [1, 1, 2, 3, 5, 8, 13, 21, 34]},
               {10, [1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89]}
              ],

  lists:map(fun({Position, Expected}) ->
                ?assertEqual(Expected, Implementation(Position))
            end, TestCases).
