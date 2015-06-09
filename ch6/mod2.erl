-module(mod2).
-export([myread/1]).

myread(F)->
	case file:read_file(F) of
		{ok, Content} -> Content;
		{error, _} -> throw(noSuchFile)
	end.
	
