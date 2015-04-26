

-module(i).
-export([test/0]).

test()->
    io:format("~p~n", [?MODULE]),
    ok.
