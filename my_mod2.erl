-module(my_mod2).
-export([do_sum/2]).
do_sum(N, Total) when N =/= 0 -> do_sum(N-1, Total+N);
do_sum(0, Total)->Total.
