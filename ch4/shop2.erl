-module(shop2).
-export([total/2]).

total([{What,N}|T], Sum)->
	total(T, Sum + shop:cost(What) * N);
total([], Sum)->
	Sum.
