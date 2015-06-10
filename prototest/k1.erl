
-module(k1).
-compile(export_all).

test()->
	protobuffs_compile:scan_file("k1.proto"),
	k1_pb:encode([{phone,<<"13882251245">>}]).

