
-module(dog).
-vsn(100).
-author(eminem).
-export([test/0]).

-define(HOST, "localhost").
-define(PORT, 11000).

test()->
	{ok, Socket} = gen_tcp:connect(?HOST, ?PORT,
		[binary, {packet, 4}]),
	%ok = gen_tcp:send(Socket, term_to_binary(<<3,1,7,5,1,1,11>>)),
	ok = gen_tcp:send(Socket, <<"Hello, world">>),
	receive
		{tcp, Socket, Bin}->
			%io:format("~p~n", [binary_to_term(Bin)]),
			io:format("~p~n",[Bin]),
			gen_tcp:close(Socket)
	end.
	

