
%% Reverse the whole bits

-module(ex5).
-export([reverse_bits/1]).

reverse_bits(Bin) when is_binary(Bin)->
	r_bits_imp(Bin);

%% And the rest.
reverse_bits(_) ->
  error.

r_bits_imp(<<C:1/bits,T/bits>>)->
	<<(r_bits_imp(T))/bits, C/bits>>;

r_bits_imp(<<>>)->
	<<>>.
	
	
