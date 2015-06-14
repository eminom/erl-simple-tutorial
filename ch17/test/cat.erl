
-module(cat).
-vsn(100).
-author(eminem).
-compile(export_all).
-define(PORT, 11000).

start()->
	{ok, Listen} = gen_tcp:listen(?PORT,
		[binary,
			{packet,4},
			{active, true},
			{reuseaddr, true}
		]
	),
	par_serve(Listen),
	noon_loop().

noon_loop()->
	receive
		after 10000->
			noon_loop()
	end.

par_serve(Listen)->
	{ok, Sock} = gen_tcp:accept(Listen),
	spawn(fun()->par_serve(Listen) end),
	serve(Sock).

serve(Sock)->
	receive
		{tcp, Sock, Binary}->
			Back = process_now(Binary),
			gen_tcp:send(Sock, Back);
		{tcp_closed, Sock}->
			io:format("Connection closed~n")
	end.

%process_now(Binary)->
%	term_to_binary(reverse_b(binary_to_term(Binary))).

process_now(Binary)->
	reverse_b(Binary).

reverse_b(<<H:8/bits,T/bits>>)->
	<<(reverse_b(T))/bits, H:8/bits>>;

reverse_b(<<>>)->
	<<>>.
	
	



