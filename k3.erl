%% Nothing
-module(k3).
-export([area/1]).

area(Shape) ->
	case Shape of
		{circle, Radius}->
			Radius * Radius * math:pi();
		{square, Side}->
			Side * Side;
		{rectangle, Width, Height}->
			Width * Height
	end.

