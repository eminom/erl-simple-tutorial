
%%%%%% This is the new gen.

-module(tcpecho_gen).
-behavior(gen_server).
-vsn(1002).
-author({eminem, yes}).

-export([start/0,
	get_accept_count/0,
	accept_loop/3
	]
).

-export([init/1,
  code_change/3,  % VSN, OldState, Extra
	handle_info/2,
	handle_cast/2,
	handle_call/3,
	terminate/2]
).

-define(PORT, 1055).
-define(SERVER, ?MODULE).

-record(server_state, 
	{ 
		port     = ?PORT,   %% Default to macro defnitions
		accepted = 0,        %% served accption.
		lsocket  = null,
		loop                 %% The routine.
	}
).
	
start()->
	State = #server_state{port=?PORT, accepted = 0, loop={tcpecho_fun, serve}},
	gen_server:start_link({local, ?SERVER}, ?MODULE, State, []).

get_accept_count()->
	{ok, Count} = gen_server:call(?SERVER, accepted_count),
	Count.
									
init(State=#server_state{})->
	case gen_tcp:listen(?PORT, [
		binary,
			{packet, 0},
			{reuseaddr, true},
			{active, false}
		]) of
		{ok, LSock}->
			{ok, accept(State#server_state{lsocket=LSock})};
		{error, Reason}->
			{stop, Reason}
	end.

accept_loop(Server, LSock, {M, F}) ->
	{ok, Socket} = gen_tcp:accept(LSock),
	gen_server:cast(Server, accepted),
	M:F(Socket).

%%%%%%%%
accept(State = #server_state{lsocket = LSocket, loop = Loop, accepted = Accepted}) ->
  proc_lib:spawn(?MODULE, accept_loop, [self(), LSocket, Loop]),
	io:format("spawn done~n"),
	State#server_state{accepted = 1 + Accepted}.

handle_info(_Request, State)->
	{noreply, State}.

handle_cast(accepted, State)->
	io:format("handle-cast~n"),
	{noreply, accept(State)}.

handle_call(accepted_count, _From, State)->
	io:format("Yes, i am handling it  now ! accepted_count~n"),
	{reply, {ok, State#server_state.accepted}, State}.

%handle_call(Request, From, State)->
%	{noreply, State}.

terminate(_Reason, _State)->
	io:format("Server stopped~n"),
	ok.

%% Keep 
code_change(_OldVsn, State, _Extra)->
	{ok, State}.


