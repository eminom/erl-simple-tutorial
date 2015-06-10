

% Some purpose

-module(k6).
-compile(export_all).
-purpose("Demo of something").

test()->
	protobuffs_compile:scan_file("k6.proto"),
	Bin = iolist_to_binary(k3_pb:encode({phone, "138",13, home})),
	k3_pb:decode_phone(Bin).
