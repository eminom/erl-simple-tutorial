
-module(k1_a).
-export([either_or_both/2]).

either_or_both(A,B)->
	case {A,B} of
		{true,_}->true;
		{_,true}->true;
		{false,false}->false
	end.
