#!/usr/bin/env escript

main(_) ->
    io:format("~p~n", [count_first_letters([])]),
    io:format("~p~n", [count_first_letters(["Tom", "Jerry"])]),
    io:format("~p~n", [count_first_letters(["Dory", "Jack", "Theo", "Darla", "Bruce", "Marlin", "Bob", "Jacques", "Bill", "Zack"])]),
    io:format("~p~n", [count_first_letters(["Jim", "Jorge", "Jill", "Jim", "John", "Joe"])]).
    
count_first_letters(Names) ->
    FirstLetters = [string:to_upper(string:substr(Name, 1, 1)) || Name <- Names],

    GroupedLetters = lists:foldl(fun(Letter, Acc) ->
        case lists:keyfind(Letter, 1, Acc) of
            false -> [{Letter, 1} | Acc];
            {Letter, Count} -> [{Letter, Count + 1} | lists:keydelete(Letter, 1, Acc)]
        end
    end, [], FirstLetters),

    lists:sort(GroupedLetters).
