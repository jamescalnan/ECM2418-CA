/*Begin Question 3.1*/
indices([], _, []).
indices([I|Is], L, [E|Es]) :- 
  nth0(I, L, E),
  indices(Is, L, Es).


/*End Question 3.1*/

/*Begin Question 3.2*/
possible( GRID )
  :- perm([1,2,3,4,5,6,7,8,9], GRID).

leave(X,[X|R],R).
    
leave(X,[F|R],[F|S]) :-
    leave(X,R,S).

perm([],[]).

perm([X|Y],Z) :-
    perm(Y,W),
    leave(X,Z,W).


/*End Question 3.2*/

/*Begin Question 3.3*/
sum(List, Sum) :-
    sum_acc(List, Sum, 0).

sum_acc([], Sum, Sum).
sum_acc([H|T], Sum, Acc) :-
    NewAcc is Acc + H,
    sum_acc(T, Sum, NewAcc).

combine(Indices, Grid, Sum) :-
    combine_acc(Indices, Grid, Sum, 0).

combine_acc([], _, Sum, Sum).
combine_acc([I|Is], Grid, Sum, Acc) :-
    nth0(I, Grid, E),
    NewAcc is Acc + E,
    combine_acc(Is, Grid, Sum, NewAcc).

acceptable( T0, T1, T2, T3, US, U, VS, V, WS, W, GRID) :- 
    combine(US, GRID, UR),
    combine(VS, GRID, VR),
    combine(WS, GRID, WR),
    UR is U,
    VR is V,
    WR is W,
    combine([0,1,3,4], GRID, R1),
    combine([1,2,4,5], GRID, R2),
    combine([3,4,6,7], GRID, R3),
    combine([4,5,7,8], GRID, R4),
    T0 is R1,
    T1 is R2,
    T2 is R3,
    T3 is R4.
    
    
suko( T0, T1, T2, T3, US, U, VS, V, WS, W, GRID) :-
    possible(GRID),
    acceptable( T0, T1, T2, T3, US, U, VS, V, WS, W, GRID).
/*End Question 3.3*/

-- any main predicates for testing goes here