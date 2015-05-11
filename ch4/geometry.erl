
-module(geometry).
-export([area/1]).

area({rectangle, Width, Height})->
	Width * Height;
area({circle, Radius})->
	math:pi() * Radius * Radius.

