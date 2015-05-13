
%% OK. More test on tcp_gen
-module(svr).
-export([start/0]).

start()->
	{ok, Listen} = gen_tcp:listen(2345, [binary,
		{packet, 0},
		{reuseaddr, true},
		{active, once}
	]),
	{ok, Socket} = gen_tcp:accept(Listen),
	inet:setopts(Socket, [binary, {active, once}]),
	loop(Socket, Listen).

loop(Socket, Listen)->
	receive
		{tcp, Socket, Data}->
			io:format("Incming some buffers~n"),
			io:format("~p~n", [erlang:is_binary(Data)]),
			Str = binary_to_term(Data),
			io:format("~p~n",[Str]), %% binary_to_term(Data)
			inet:setopts(Socket, [{active, once}]),
			gen_tcp:send(Socket,term_to_binary("Fuck you too!")),
			loop(Socket, Listen);
		{tcp_closed, Socket}->
			io:format("Bye~n"),
			{ok, S2} = gen_tcp:accept(Listen),
			io:format("New connection established~n"),
			inet:setopts(S2, [{active, once}]),
			loop(S2, Listen)
	end.

