%% Nothing to be done here.
-module(k6).
-export([test/1, test1/1]).


test(L)->
    [ X || <<X:3>> <= L ]
    .

test1(L)->
    [ <<X:8>> || <<X:3>> <= L ]
    .
    
