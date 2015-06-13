
-module(libm).
-export([sleep/1]).
-vsn(100).
-author('eminem@163.com').

sleep(T)->
	receive
		after T*1000->
			ok
	end.

flush_buffer()->
	receive
		_Any->	
			flush_buffer()
		after 0 ->
			true
	end.

priority_receive()->
	receive
		{alarm, X}->
			{alarm, X}
		after 0->
			receive
				Any->
					Any
			end
	end.
