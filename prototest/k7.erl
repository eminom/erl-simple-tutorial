

% Some purpose

-module(k7).
-compile(export_all).
-purpose("Demo of something").

test()->
	protobuffs_compile:scan_file("k7.proto"),
	Bin = iolist_to_binary(k3_pb:encode({phone, "138",13, cell})),
	k3_pb:decode_phone(Bin).
