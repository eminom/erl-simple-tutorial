
-module(mod1).
-export([start/0, port/0, str/0]).

-ifdef(DEBUG_FLAG).
-define(PORT, 11000).
-else.
-define(PORT, 12000).
-endif.

-define(xx, "hello").


str()->
    ?xx.

port()->
    ?PORT.

start()->
    lists:map(fun multi/1, [2,3,5]).

multi(X)->2*X.