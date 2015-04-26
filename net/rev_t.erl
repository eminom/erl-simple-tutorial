
%% Do it this way.

-module(rev_t).
-export([rev/1,
	test/0]).

rev([])->
	[];
rev([Head |Rest])->
	rev(Rest) ++ [Head].

test()->
	io:format("Result:~w~n", [rev("abcdefg")]).
