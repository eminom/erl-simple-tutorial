

% THis is the example
% Without setting the required phone-type
% And the decoding result has no "phone-type"(required)

-module(k5).
-compile(export_all).

test()->
	protobuffs_compile:scan_file("k5.proto"),
	Bin = iolist_to_binary(k3_pb:encode({phone, "138",13})),
	k3_pb:decode_phone(Bin).
