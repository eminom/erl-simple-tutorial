%%
-module(k4).
-export([testfunc/0]).

testfunc()->
	try
		throw(oops)
	catch
		oops -> io:format("Caught oops~n");
		throw:Other ->io:format("throw:Other~n");
		exit:Reason->io:format("exit:Reason~n");
		error:Reason->io:format("error:Reason~n")
	end
.

%% in Py2
%% print "Caught oops"
%% print "ok"
