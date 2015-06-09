

-module(shop).
-export([test/0]).

test()->
	[shop(I)|| I<-[apple, orange, banana]].

shop(apple)->10;
shop(orange)->20;
shop(banana)->"I Don't know".
