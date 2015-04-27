-module(tcpecho_sup).
-behavior(supervisor).

-export([start_link/0]).

-export([init/1]).

-define(SERVER, ?MODULE).

start_link()->
	supervisor:start_link({local, ?SERVER}, ?MODULE, []).

init([])->
	Server = {tcpecho_svr, {tcpecho_svr, start_link, []},
		permanent, 2000, worker, [tcpecho_svr]},
	Children = [Server],
	RestartStrategy = {one_for_one, 0, 1},
	{ok, {RestartStrategy, Children}}.
