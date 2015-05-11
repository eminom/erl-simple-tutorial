-module(gen1).
-export([number/1]).

number(N)->
	case N of 
		0->[];
		_->number(N-1) ++ [N]
	end.

