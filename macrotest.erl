-module(macrotest).
-export([test/0]).

test()->
    [{module, ?MODULE}, {file, ?FILE}, {line, ?LINE}]
    .
