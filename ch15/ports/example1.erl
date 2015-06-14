
%%%%%%%%%%%%%%%%%%%%
%%%%%%%%% EXAMPLE
%%%%%%%%%%%%%%%%%%%%

-module(example1).
-export([start/0, stop/0]).
-export([twice/1, sum/2]).

% If the executable file is missing
% spawn would fail. 
% And we are prompted.

start()->
	register(?MODULE,
		spawn(fun()->
			process_flag(trap_exit, true),
			Port = open_port({spawn, "./example1"}, [{packet, 2}]),
			true = is_port(Port),  % Assertion 
			%io:format("OK, to loop now>>~n"),  % Now you see.
			loop(Port)
		end)).

stop()->
	?MODULE ! stop.

twice(X)->call_port({twice, X}).
sum(X,Y)->call_port({sum, X,Y}).

call_port(Msg)->
	?MODULE ! {call, self(), Msg},
	receive
		{?MODULE, Result}->
			Result
	end.

loop(Port)->
	receive
		{call, Caller, Msg}->
			Port ! {self(), {command, encode(Msg)}},
			%io:format("Sent ~n"),
			receive
				{Port, {data, Data}} ->
					%io:format("ok, told~n"),
					Caller ! {?MODULE, decode(Data)}
			end,
			loop(Port);
		stop->
			Port ! {self(), close},
			receive
				{Port, closed} ->
					exit(normal)
			end;
			% And the trapped signal is here>>
		{'EXIT', Port, Reason}->
			exit({port_terminated, Reason})
	end.

encode({sum, X, Y}) -> [1, X, Y];
encode({twice, X})  -> [2, X].

decode([Int]) -> Int.

