
-module(error_test).
-export([error_test/0]).

error_test()->
	spawn(fun()-> error_test_server() end),
	timer:sleep(2000),
	{ok, Socket} = gen_tcp:connect("localhost", 4321,[
		binary,
		{packet,2}]
	),
	io:format("connected to:~p~n", [Socket]),
	gen_tcp:send(Socket, <<"123">>),
	receive
		Any->
			io:format("Any = ~p~n", [Any])
	end.

error_test_server()->
	{ok, Listen} = gen_tcp:listen(4321, [binary,
		{packet,2}]),
	{ok, Socket } = gen_tcp:accept(Listen),
	error_test_server_loop(Socket).

error_test_server_loop(Socket)->
	receive
		{tcp, Socket, Data}->
			io:format("received: ~p~n", [Data]),
			_ = atom_to_list(Data),
			error_test_server_loop(Socket)
	end.


