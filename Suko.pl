%{-Begin Question 3.1-}
indices( IS, XS, ES ) :-
    indicesin(IS, XS, ES).

indicesin([], _, []).
indicesin([I|Is], List, [R|Rs]) :-
    nth0(I, List, R),
    indicesin(Is, List, Rs).

%{-End Question 3.1-}

%{-Begin Question 3.2-}
possible( GRID )
  :- perm([1,2,3,4,5,6,7,8,9], GRID).

takeout(X,[X|R],R).
    
takeout(X,[F|R],[F|S]) :-
    takeout(X,R,S).

perm([],[]).

perm([X|Y],Z) :-
    perm(Y,W),
    takeout(X,Z,W).

%{-End Question 3.2-}

%{-Begin Question 3.3-}
% first check that the numbers in the colour zones
% add up to the correct amount

sum([], 0).
sum([H|T], Sum) :-
   sum(T, Rest),
   Sum is H + Rest.

combine(Indi,GRid,  R) :-
    indices( Indi, GRid, ES),
    sum(ES, R).

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

%{-End Question 3.3-}

%-- any main predicates for testing goes here