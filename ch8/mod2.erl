-module(mod2).
-vsn(100).
-compile(export_all).

list(X)->
	case X() of
		true->"TRUE";
		false->"FALSE"
	end.
	
