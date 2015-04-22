
-module(my_module).
-export([sum/1]).

sum(0)->0;
sum(N)->sum(N-1) + N.

