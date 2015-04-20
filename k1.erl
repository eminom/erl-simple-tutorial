%%
-module(k1).
-export([either_or_both/2]).


either_or_both(true, _)->
	true;
either_or_both(_, true)->
	true;
either_or_both(false, false)->
	false.
