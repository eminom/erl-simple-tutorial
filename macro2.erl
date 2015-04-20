-ifdef(DEBUG).
-define(show(X), io:format("The value of X is: ~w.~n",[X])).
-else.
-define(show(X), ok).
-endif.

-module(macro2).
-export([foo/1]).

foo(A)->
    ?show(A),
    io:format("Over~n")
    .
