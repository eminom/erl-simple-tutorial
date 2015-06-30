

-module(tcpecho_fun).
-export([serve/1]).

serve(Socket)->
	io:format("Finally~n"),
	case gen_tcp:recv(Socket, 0) of
		{ok, Bin}->
			gen_tcp:send(Socket, Bin),  % Echo back
			serve(Socket);
		{error, _Reason}->
			io:format("Tcp closed~n"),
			ok
	end.





