

-module(k3).
-compile(export_all).

test()->
	protobuffs_compile:scan_file("k3.proto"),
	k3_pb:encode({phone, "138",13}).
