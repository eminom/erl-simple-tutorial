

-module(lib_misc).
-export([for/3, for2/3, pythag/1, randseq/1, qsort/1,max/2,typename/1, tname/1, tname2/1, filter/2
	, odds_and_evens1/1
	, odds_and_evens2/1
]).

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

% If else
max(X,Y) when X > Y -> X;
max(_,Y) -> Y.
	
typename(X) when erlang:is_boolean(X) -> "Boolean";
typename(X) when erlang:is_integer(X) -> "Integer";
typename(X) when erlang:is_float(X)   -> "Float";
typename(_) -> "Others".

tname(X)->
	case X of 
	 _ when erlang:is_boolean(X) -> "Boolean";
	 _ when erlang:is_integer(X) -> "Integer";
	 _ when erlang:is_tuple(X)   -> "Tuple";
	 _ when erlang:is_list(X)    -> "List";
	 _ when erlang:is_atom(X)    -> "Atom";
	 _ when erlang:is_float(X) -> "Float";
	 _ -> "Others"
	end.

tname2(X)->
	if
		erlang:is_boolean(X) -> "Boolean";
		erlang:is_integer(X) -> "Integer";
		true -> "Else"
	end.


filter(P, [H|T])->
	case P(H) of
		true -> [H|filter(P, T)];
		false-> filter(P,T)
	end;
filter(_, [])->[].

odds_and_evens1(L)->
	Odds = [X|| X <- L, (X rem 2) =:= 1 ],
	Evens= [X|| X <- L, (X rem 2) =:= 0 ],
	{Odds, Evens}.


odds_and_evens2(L)->
	odds_and_evens_acc(L, [], []).

odds_and_evens_acc([H|T], Odds, Evens)->
	case (H rem 2) of
		1-> odds_and_evens_acc(T, [H|Odds], Evens);
		0-> odds_and_evens_acc(T, Odds, [H|Evens])
	end;
odds_and_evens_acc([], Odds, Evens)->
	{lists:reverse(Odds), lists:reverse(Evens)}.



	


	
