#!/usr/bin/env escript

main(_) ->
  io:format("~p -> ~p~n", [[], sum_of_squares([])]),
  io:format("~p -> ~p~n", [[1], sum_of_squares([1])]),
  io:format("~p -> ~p~n", [[1, 2], sum_of_squares([1, 2])]),
  io:format("~p -> ~p~n", [[1, 2, 4, 7], sum_of_squares([1, 2, 4, 7])]).

sum_of_squares([]) ->
    0;
sum_of_squares([Head | Tail]) ->
    Head * Head + sum_of_squares(Tail).
