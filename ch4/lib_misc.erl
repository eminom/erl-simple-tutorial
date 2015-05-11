


-module(lib_misc).
-export([for/3, for2/3, pythag/1, randseq/1, qsort/1]).

for(Start, End, F)->
	forImpl(Start, End, F).

forImpl(Now, End, F)->
	case End - Now of 
		0-> ok;
		_->F(Now),
			forImpl(Now+1, End, F)
	end.

for2(Max, Max, _)->[];
for2(Start, End, F)->[F(Start)] ++ for2(Start+1, End, F).


pythag(N)->
	[{A,B,C}|| A<- lists:seq(1,N),
	    B<- lists:seq(1,N),
			C <- lists:seq(1,N),
			A+B+C =< N,
			A*A + B*B =:= C*C].

randseq(0)->[];
randseq(N)->[random:uniform(100)] ++ randseq(N-1).

qsort([])->[];
qsort([Pivot|T])->qsort([X|| X<-T, X<Pivot])
  ++ [Pivot] ++
	qsort([X|| X<-T, X>=Pivot]).
	


	


	
