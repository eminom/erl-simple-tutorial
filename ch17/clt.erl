

-module(clt).
-export([connect/0]).


connect()->
	{ok, Socket} = gen_tcp:connect("localhost", 2345,
		[binary, 
		{packet, 0}]),
	ok = gen_tcp:send(Socket, term_to_binary("Fuck you!")),
	receive
		{tcp, Socket, Bin}->
			io:format("~p~n", [binary_to_term(Bin)]),
			gen_tcp:close(Socket)
	end.

