#!/usr/bin/env escript

main(_) ->
  io:format("~p -> ~p~n", [[], sum_of_squares([])]),
  io:format("~p -> ~p~n", [[1], sum_of_squares([1])]),
  io:format("~p -> ~p~n", [[1, 2], sum_of_squares([1, 2])]),
  io:format("~p -> ~p~n", [[1, 2, 4, 7], sum_of_squares([1, 2, 4, 7])]).

sum_of_squares(List) ->                   
    sum_of_squares(List, 0).

sum_of_squares([], Acc) ->
    Acc;
sum_of_squares([Head | Tail], Acc) ->
    sum_of_squares(Tail, Acc + Head * Head).
