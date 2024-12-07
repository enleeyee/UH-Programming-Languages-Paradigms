-module(recursive).
-export([recursiveFib/1]).

recursiveFib(0) -> [1];
recursiveFib(1) -> [1, 1];
recursiveFib(Position) when Position >= 2 -> 
  Prev = recursiveFib(Position - 1),
  Prev ++ [lists:nth(Position, Prev) + lists:nth(Position - 1, Prev)].
