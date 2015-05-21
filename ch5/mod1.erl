-module(mod1).
-export([clear_status/1, do_something/1]).
-include("records.hrl").

clear_status(#todo{status=S, who=W} = R)->
	R#todo{status=finished}.

do_something(X) when is_record(X, todo)->
	io:format("Yes, yse !!!!");
do_something(X)->
	io:format("Oh no!").
