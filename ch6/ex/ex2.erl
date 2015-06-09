
-module(ex2).
-export([term_to_packet/1, packet_to_term/1]).

%%
%% io:format in test is not directed to stdout.
-include_lib("eunit/include/eunit.hrl").

term_to_packet(Term)->
	Bin = term_to_binary(Term),
	list_to_binary([<<(byte_size(Bin)):32/big>>, Bin]).

packet_to_term(Packet)->
	{<<_:32/big>>, Bin} = split_binary(Packet,4),
	binary_to_term(Bin).

one_test()->
	A = "hello",
	A = packet_to_term(term_to_packet(A)),
	%io:format("Test finished"),
	ok.
	
