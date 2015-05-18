
-module(blocking_svr).
-export([start/0]).

-define(PORT, 2345).

start()->
	{ok, Listen} = gen_tcp:listen(?PORT, [binary,
		{reuseaddr,true},
		{packet, 0},
		{active, false}
	]),
	{ok, Socket} = gen_tcp:accept(Listen),
	{ok, {IPAddr, Port}} = inet:peername(Socket),
	io:format("Request from ~p:~p~n",[IPAddr, Port]),
	loop(Socket).

loop(Socket)->
	case gen_tcp:recv(Socket, 0) of 
		{ok, B}->
			io:format("~p~n", [B]),
			loop(Socket);
		{error, closed}->
			io:format("connection broken")
	end.

