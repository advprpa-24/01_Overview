% https://www.swi-prolog.org/man/clpfd.html
:- use_module(library(clpfd)).

sum(0,0).
sum(N,R) :- 
  N #> 0 ,
  N1 #= N - 1 ,
  sum(N1,R1) ,
  R #= N + R1
  . 

% sum1(X,55).
sum1(0,0).
sum1(N,R) :- 
  N > 0 ,
  N1 is N - 1 ,
  sum1(N1,R1) ,
  R is N + R1
  . 


