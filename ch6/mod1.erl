
-module(mod1).
-export([sqrt/1]).

sqrt(X) when X < 0 ->
	error({squareRootNegativeArgument, X});
sqrt(X)->
	math:sqrt(X).

