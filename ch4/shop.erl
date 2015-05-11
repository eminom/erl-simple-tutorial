-module(shop).
-export([cost/1]).

cost(Thing)->
	case Thing of
		oranges->
			5;
		newspaper->
			8;
		apples->
			2;
		pears->
			9;
		milk->
			7
	end.


