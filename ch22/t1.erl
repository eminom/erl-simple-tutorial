
-module(t1).
-compile(export_all).

test(Svr)->
	Svr:start(name_server, name_server),
	name_server:add(fuck, me),
	name_server:find(fuck).
