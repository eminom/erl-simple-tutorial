
-module(mix_svr).
-export([start/0]).

-define(PORT, 2345).

start()->
	{ok, Listen} = gen_tcp:listen(?PORT,[binary,
		{packet,0},
		{reuseaddr, true},
		{active, once}
	]),
	{ok, Socket} = gen_tcp:accept(Listen),
	loop(Socket).

loop(Socket)->
	receive
		{tcp, Socket, Data} ->
			io:format("~p~n", [Data]),
			inet:setopts(Socket, [{active, once}]),
			loop(Socket);
		{tcp_closed, Socket}->
			io:format("Connection broken~n")
	end.
