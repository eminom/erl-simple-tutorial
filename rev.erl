
-module(rev).
-export([rev/1]).


rev([X|Rest])->
	rev(Rest) ++ [X];
rev([])->[].
