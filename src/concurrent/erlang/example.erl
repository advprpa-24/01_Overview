% Counter example
-module(example). 
-export([start/0,counter/1,runner/2, value/1]). 


%% Launch a counter and two runners
%% In the terminal:
%% `Cnt = example:start().`
%% `example:value(Cnt).`
start() ->
   Cnt = spawn(example, counter, [0]),
   spawn(example, runner,[Cnt,10]),
   spawn(example, runner,[Cnt,10]),
   Cnt.

% runner actor
runner(_       ,0) -> 
   io:format("done~n",[]);
runner(Counter, N) ->
   Counter ! increment,
   runner(Counter, N-1).

% counter actor
counter(Cnt) ->
   receive
      increment ->
         io:format("increment~n",[]),
         counter(Cnt + 1);
      {From,value} ->
         From ! Cnt,
         counter(Cnt);
      _ -> % All other messages
         counter(Cnt)
   end.


value(Counter) ->
   % sends a pair of self and an identifier of the desired operation)
   Counter ! {self(),value}, 
   receive
      Value ->
         Value
   end.

