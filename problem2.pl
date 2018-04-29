ancestor(A, B) :- parent(A, B).
ancestor(A, B) :- parent(X, B), ancestor(A, X).
lca(A, B) :- 
	A == B -> writeln(A);
	ancestor(A, B) -> writeln(A);
	parent(X, A), lca(X, B).

do_list(N, L) :-
        findall(Num, between(1, N, Num), L). 

loop_i([]).
loop_i([X|Y]) :-
       	read(P1), read(P2),
	assert(parent(P1, P2)), X is X,
        loop_i(Y).

loop_o([]).
loop_o([X|Y]) :-
	read(P1), read(P2),
	lca(P1, P2), X is X,
	loop_o(Y).
	
main :-
	read(X),
	N1 is X - 1,
	do_list(N1, List1),
	loop_i(List1),

	read(N2),
	do_list(N2, List2),
	loop_o(List2),

	halt.

:- initialization(main).
