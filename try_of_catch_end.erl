
-module(try_of_catch_end).
-export([test/1]).

test(F)->
	try
		F()
	of
		0 ->io:format("Return zero~n");
		N ->io:format("Return ~p.~n", [N])
	catch
		_:_ ->io:format("Some problem~n")
	end.

