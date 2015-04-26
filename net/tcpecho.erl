
-module(tcpecho).

-behavior(gen_server).

-include_lib("eunit/include/eunit.hrl").

-export([start_link/1,
    start_link/0,
    get_count/0,
    stop/0,
    test/0]).

-export([init/1, 
    handle_call/3,
    handle_cast/2,
    handle_info/2,
    terminate/2,
    code_change/3]).

%% Set the record for state. 
%% request count default to 0
-record(state, {port, lsock, request_count=0}).

-define(SERVER, ?MODULE).
-define(DEFAULT_PORT, 3000).

start_link(Port)->
    io:format("OK, starting tco-echo server on port ~p...~n",[Port]),
    gen_server:start_link({local, ?SERVER}, ?MODULE, [Port], []).

start_link()->
    io:format("default port set~n"),
    start_link(?DEFAULT_PORT).

get_count()->
    gen_server:call(?SERVER, get_count).

stop()->
    gen_server:cast(?SERVER, stop).


%%%%%%%%%%%%%%%%%%%%%%%%%%
%% gen_server callbacks
%%%%%%%%%%%%%%%%%%%%%%%%%%

init([Port])->
    io:format("init/0~n"),
    {ok, LSock} = gen_tcp:listen(Port, [{active, true}]),
    {ok, #state{port = Port, lsock = LSock}, 0}.

handle_call(get_count, _From, State)->
    {reply, {ok, State#state.request_count}, State}.

handle_info({tcp, Socket, RawData}, State)->
    io:format("incoming message~n"),
    do_echo(Socket, RawData),
    RequestCount = State#state.request_count,
    {noreply, State#state{request_count=RequestCount+1}};
handle_info(timeout, #state{lsock=LSock} = State)->
    {ok, _Sock} = gen_tcp:accept(LSock),
    io:format("New connection is established~n"),
    {noreply, State}.

handle_cast(stop, State)->
    {stop, normal,  State}.

terminate(_Reason, _State)->
    ok.

code_change(_OldVsn, State, _Extra)->
    {ok, State}.

do_echo(Socket, RawData)->
    try 
        io:format("Sending back:~p ~n", [RawData]),
        gen_tcp:send(Socket, io_lib:fwrite("~p~n", [RawData]))
    catch 
        _Class:Err->
        gen_tcp:send(Socket, io_lib:fwrite("~p~n", [Err]))
    end.

test()->
    {ok, _} = start_link().

%% TODO    




