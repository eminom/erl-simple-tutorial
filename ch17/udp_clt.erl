

-module(udp_clt).
-export([start/0]).

start()->
	client(<<"Fuck you">>).

client(Request)->
	{ok, Socket} = gen_udp:open(0, [binary]),
	ok = gen_udp:send(Socket, "localhost", 2345, Request),
	Value = receive
		{udp, Socket, _, _, Bin} ->
			{ok, Bin}
		after 2000 ->
			error
		end,
	gen_udp:close(Socket),
	Value.
