
-module(shuffle).
-export([do/1]).

do(L)->
	Len = length(L),
	L0  = lists:map(fun(X) -> {random:uniform(Len), X} end, L),
	L1  = lists:sort(L0),
	[ V || {_, V} <- L1 ].


