-module(mod2).
-export([count_chars/1]).

count_chars(Str)->
	count_chars(Str, #{}).

count_chars([H|T], #{H=>N}=X)->
	count_chars(T, X#{H:=N+1});
count_chars([H|T], X)->
	count_chars(T, X#{H=>1});
count_chars([], X)->
	X.
