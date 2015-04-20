
-module(k5_b).
-export([test/1]).


test(F)->
	try
		F()
	of
		0 -> io:format("Return Zero~n")
	catch
		_:_ -> io:format("Some problem~n")
	after
		io:format("Quit any way")
	end.

