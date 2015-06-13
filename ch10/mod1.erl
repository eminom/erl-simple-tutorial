
%
%%
%%%%
%%%%%%
%%%%%%%%
%%%%%%%%%%
% I shall do this once again.

-module(mod1).
-vsn(100).
-export([list_memo/0]).
-import(erlang, [memory/0]).
%-import({erlang,memory}).

list_memo()->
	%L = erlang:memory(),
	L = memory(),
	list_memo_impl(L).

list_memo_impl([H|T])->
	{Type, Consumed} = H,
	io:format("<~p>: ~p~n", [Type, Consumed]),
	list_memo_impl(T);

list_memo_impl([])->
	ok.
