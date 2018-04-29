path(X, Y) :- path(X, Y, []).
path(X, Y, _) :- edge(X, Y) -> writeln('Yes').
path(X, Y, V) :- \+ member(X, V), edge(X, Z), path(Z, Y, [X|V]).
path(X, Y, []) :- writeln('No.').

do_list(N, L) :-
        findall(Num, between(1, N, Num), L). 

loop_i([]).
loop_i([X|Y]) :-
        read(P1), read(P2),
        assert(edge(P1, P2)), X is X,
        loop_i(Y).

loop_o([]).
loop_o([X|Y]) :-
        read(P1), read(P2),
	path(P1, P2), X is X,
        loop_o(Y).
     
main :-
	read(NODE), NODE is NODE,
	read(EDGE),
        do_list(EDGE, List1),
        loop_i(List1),
	
	read(QUERYs),
        do_list(QUERYs, List2),
        loop_o(List2),

       halt.

:- initialization(main).
