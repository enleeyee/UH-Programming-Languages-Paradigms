-module(tail_recursive).
-export([tailRecursiveFib/1]).

tailRecursiveFib(0) -> [1];
tailRecursiveFib(1) -> [1, 1];
tailRecursiveFib(Position) when Position > 1 -> tailRecursiveFib(Position - 1, [1, 1]).

tailRecursiveFib(0, Series) -> Series; 
tailRecursiveFib(StepsLeft, Series) ->
  tailRecursiveFib(StepsLeft - 1, Series ++ [lists:nth(length(Series), Series) + lists:nth(length(Series) - 1, Series)]).
