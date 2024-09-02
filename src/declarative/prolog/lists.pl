/*
Lists in Prolog:
Empty list = []
List with head H and tail T = [H|T]
*/

/* 
?- len([1,2,3],N).
N = 3.
*/

memb(X,[X|_]).
memb(X,[_|L]) :- memb(X,L).

/*
?- memb(2,[1,2]).
true .
*/

/*
len([],0).
len([_|T], N) :-
  len(T, M), N is M + 1.
*/

len([], 0).
len([_|T], N) :-
  N #> 0,
  N #= M + 1,
  len(T, M).



app([],X,X).
app([H|T], X, [H|R]) :- app(T, X, R).
/*
`is` only unifies numbers. the following does not work.
app([H|T], X, Y) :- app(T, X, R), Y is [H|R].
*/


/*
?- app([1,2],[3,4,5], X).
*/