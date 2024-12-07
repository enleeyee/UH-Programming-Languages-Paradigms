-module(iterative).
-export([iterativeFib/1]).

iterativeFib(0) -> [1];
iterativeFib(1) -> [1, 1];
iterativeFib(Position) when Position >= 2 ->
    {Series, _} = lists:foldl(
        fun(_, {Series, {Prev, Cur}}) ->
            {Series ++ [Cur], {Cur, Prev + Cur}}
        end,
        {[1, 1], {1, 2}},
        lists:seq(2, Position)
    ),

    Series.
