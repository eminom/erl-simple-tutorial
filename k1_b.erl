%%
-module(k1_b).
-export([either_or_both/2]).

either_or_both(A,B)->
	case {A,B} of
		{true, B} when is_boolean(B)->
			true;
		{A, true} when is_boolean(A)->
			true;
		{false,false}->
			false
	end.
