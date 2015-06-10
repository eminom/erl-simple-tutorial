
-module(k2).
-compile(export_all).

test()->
	protobuffs_compile:scan_file("k2.proto"),
	k2_pb:encode({phone,<<"123">>, 12}).
