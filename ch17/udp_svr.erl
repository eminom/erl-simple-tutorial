
-module(udp_svr).
-export([start/0]).

-define(PORT, 2345).

start()->
	server(?PORT).

server(Port)->
	{ok, Socket} = gen_udp:open(Port, [binary]),
	loop(Socket).


loop(Socket)->
	receive
		{udp, Socket, Host, Port, Bin} ->
			%{ok, {FromIP, FromPort}} = inet:peername(Socket),
			io:format("~p from ~p:~p~n",[Bin, Host, Port]),
			%io:format("~p from client~n",[Bin]),
			gen_udp:send(Socket, Host, Port, <<"123!">>),
			loop(Socket)
	end.


