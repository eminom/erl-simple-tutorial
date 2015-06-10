

-module(mod1).
-compile(export_all).
-vsn(100).
-author(eminem).  %% doesn't matter
-purpose("PURE DEMO").

doFunc1()->
	io:format("Exported yes").

