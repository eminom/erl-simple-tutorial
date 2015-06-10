

% Some purpose

-module(k7).
-compile(export_all).
-purpose("Demo of something").

test()->
	protobuffs_compile:scan_file("k7.proto"),
	Bin = iolist_to_binary(k7_pb:encode({phone, "138",13, 'HOME'})),  %You must specify one enum(no default from Erlang)
	k7_pb:decode_phone(Bin).
