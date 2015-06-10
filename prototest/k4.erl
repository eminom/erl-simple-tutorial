

-module(k4).
-compile(export_all).

test()->
	protobuffs_compile:scan_file("k4.proto"),
	k3_pb:encode({phone, "138",13}).
