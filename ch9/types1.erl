-module(types1).
-export([myand1/2]).

myand1(true,true)->true;
myand1(false, _)->false;
myand1(_, false)->false.

