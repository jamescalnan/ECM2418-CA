%{-Begin Question 4.1-}
prime(2) :- 
    true,
    !.
prime(X) :-
    X < 2,
    !,
    false.
prime(X) :-
    not(divisible(X, 2)).

divisible(X,Y) :-
    0 is X mod Y,
    !.
divisible(X,Y) :-
    X > Y+1,
  divisible(X, Y+1).

%{-End Question 4.1-}

%{-Begin Question 4.2-}

listToNum(L, N) :-
    listToNum(L, 0, N).

listToNum([], A, A).
listToNum([H|T], A, N) :-
    B is 10*A + H,
    listToNum(T, B, N).

betweenToList(X,X,[X]) :- !.

betweenToList(X,Y,[X|Xs]) :-
    X =< Y,
    Z is X+1,
    betweenToList(Z,Y,Xs).

range([],A,B):-
    A > B.

range([A|T],A,B):-
    A =< B,
    A1 is A + 1,
    range(T,A1,B).


%test(X, Y, Z) :-
%    range(L1, 1, 5),
%    range(L2, 1, 5),
%    range(L3, 1, 5),
%    list_pairs(L1, L2, L3, I, J, K),
%    write(I).

list_pairs(List1, List2, List3, I, J, K) :-
    findall((X,Y,Z), (member(X, List1), member(Y, List2), member(Z, List3)), (I, J, K)).

goodRange(X,Y,Z) :-
    X > 90,
    X < 180,
    Y > 180,
    Y < 270,
    Z > 270,
    Z < 360, !.

possible(X,Y,Z) :-
    out(X,Y,Z),
    goodRange(X,Y,Z).


out(A, B, C) :-
    maplist(between(90, 360), [A, B, C]).



possi( GRID )
  :- perm([1,2,3], GRID).

takeout(X,[X|R],R).% :-
    %write('fin: '), write(X),nl,
    %write('  R: '), write(R),nl,nl.
    
takeout(X,[F|R],[F|S]) :-
    %write('takeout: X: '), write(X),nl,
    %write('         F: '), write(F),nl,
    %write('         R: '), write(R),nl,
    %write('         S: '), write(S),nl,nl,
    takeout(X,R,S).

perm([],[]).

perm([X|Y],Z) :-
    %write('before: X: '), write(X),nl,
    %write('        Y: '), write(Y),nl,
    %write('        Z: '), write(Z), nl,nl,
    perm(Y,W),
    takeout(X,Z,W).


%possible(X,Y,Z) :-
    

%{-End Question 4.2-}

%{-Begin Question 4.3-}

combineNumbers(No1, No2, No3, Result) :-
    atom_concat(No1, No2, NewNoAtom),
    atom_concat(NewNoAtom, No3, Final),
    atom_number(Final, NewNo),
    Result is NewNo.

numToList(NUM,[LIST|[]]):-
   NUM < 10,
   LIST is NUM,
   !.
numToList(NUM,LIST):-
   P is NUM // 10,
   numToList(P,LIST1),
   END is (NUM mod 10), 
   append(LIST1,[END] ,LIST).

insert_sort(List,Sorted):-i_sort(List,[],Sorted).
i_sort([],Acc,Acc).
i_sort([H|T],Acc,Sorted):-insert(H,Acc,NAcc),i_sort(T,NAcc,Sorted).
   
insert(X,[Y|T],[Y|NT]):-X>Y,insert(X,T,NT).
insert(X,[Y|T],[X,Y|T]):-X=<Y.
insert(X,[],[X]).

same([], []).

same([H1|R1], [H2|R2]):-
    H1 = H2,
    same(R1, R2).

allNumsPresent(X, Y, Z) :-
    same(R, [1,2,3,4,5,6,7,8,9]),
    combineNumbers(X, Y, Z, Combined),
    numToList(Combined, Li),
  insert_sort(Li, R). % check if numbers are all present

acceptable( X, Y, Z ) :-
    allNumsPresent(X,Y,Z),
  not(prime(X)),
  not(prime(Z)),
  not(prime(Y)).

trait(X,Y,Z) :-
    possible(X,Y,Z),
    acceptable(X,Y,Z).
    

%{-End Question 4.3-}

%-- any main predicates for testing goes here