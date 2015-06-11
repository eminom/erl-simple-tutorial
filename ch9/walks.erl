
-module(walks).
-export([plan_route/2]).
-include_lib("eunit/include/eunit.hrl").

-spec plan_route(From::point(), To::point())->route().
-type direction() ::north|south|east|west.
-type point() ::{integer(), integer()}.
-type route() ::[{go, direction(), integer()}].
-type angle() ::{Degrees::0..360, Minutes::0..360, Seconds::0..360}.
-type position ::{ longitude|latitude, angle() }.

plan_route({X0,Y0},{X1,Y1})->
    [{go, south, {X0+X1,Y0+Y1}}].

start_test()->
    io:format("<~p>~n",[plan_route({11,13},{5,7})]),
    ok.