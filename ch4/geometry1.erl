
-module(geometry1).
-export([test/0, area/1]).

test()->
	12 = area({rectangle, 3, 4}),
	144= area({square, 12}),
	tests_worked.

area(Shape)->
	case Shape of
		{rectangle, Width, Height}->
			Width * Height;
		{square, Side}->
			Side * Side
	end.

