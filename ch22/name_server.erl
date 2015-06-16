
%% Essence

-module(name_server).
-export([init/0, add/2, find/1, handle/2, server/0]).
-import(?SERVER,[rpc/2]).

server()->
	?SERVER.


add(Name, Place)-> rpc(name_server, {add, Name, Place}).
find(Name) -> rpc(name_server, {find, Name}).

init() -> dict:new().

handle({add, Name, Place}, Dict) -> {ok, dict:store(Name, Place, Dict)};

handle({find, Name}, Dict) -> {dict:find(Name,Dict), Dict}.
