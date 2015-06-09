
-module(ex1).
-export([reverse_bin/1]).

reverse_bin(Bin)->
	list_to_binary(reverse(binary_to_list(Bin))).

reverse([H|T])->
	reverse(T)++[H];

reverse([])->[].

	
