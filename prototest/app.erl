
%%%%
%%
%% Inpiration
%%

-module(app).
-export([start/0]).
-include_lib("eunit/include/eunit.hrl").

start()->
	run(1).

run(N)->
	case N of
		_ when N < 6 ->
			F = list_to_atom([$k, N + $1 - 1]),
			F:test(),   % This is great.
			run(N+1);
		_ ->
			ok
	end.

start_test()->
	start().
