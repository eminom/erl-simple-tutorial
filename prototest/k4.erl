

-module(k4).
-compile(export_all).

test()->
	protobuffs_compile:scan_file("k4.proto"),
	k4_pb:encode({phone, "138",13}).
