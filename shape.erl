
-include("shape.hrl").   % PI is defined in here.
-module(shape).
-export([area/1]).

%% -define(PI, 3.141592653).

area(S)->
    case S of
        {circle, Radius}->
        Radius * Radius * ?PI;
        {square, Side}->
        Side * Side;
        {rectangle, Width, Height}->
        Width * Height
    end.




