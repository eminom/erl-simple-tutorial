
-include("m.erl").
-module(v).
-export([func1/0, func2/0]).

func1()->
	io:format("Hello, world~n").

func2()->
	io:format("This is func2~n").
%%	return ?PI.
