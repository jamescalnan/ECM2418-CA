/*Begin Question 3.1*/
%L1 is a list of indices, L2 is a list, and L3 is the result list
indices([], _, []).
%If L1 is empty, then L3 should also be empty and the goal is achieved
indices([I|Is], L, [E|Es]) :- 
    nth0(I, L, E),
%uses the built in nth0 predicate to get element at index I in L and put it at the front of the result list. 
    indices(Is, L, Es).
%Recursively call the indices predicate with the rest of the indices and result list

/*End Question 3.1*/

/*Begin Question 3.2*/
%GRID is a list of numbers from 1 to 9 in any random order 
possible( GRID )
  :- perm([1,2,3,4,5,6,7,8,9], GRID).

%Elem is the element to be removed, List is the list of elements, Result is the result list without Elem
leave(X,[X|R],R).
%base case when element to be removed is the head of the list
leave(X,[F|R],[F|S]) :-
    leave(X,R,S).
%Recursively call leave to the rest of the list until element is removed. 

%List is the list of element, Result is the result permutation of the list
perm([],[]).
%returns empty list on empty list
perm([X|Y],Z) :-
    perm(Y,W),
    leave(X,Z,W).
%perform a leave on the head element of list. This create the first permutation. 
%Recursively call the perm predicate with the rest of the list until all permutations are complete

/*End Question 3.2*/

/*Begin Question 3.3*/
%List is a list of numbers and Sum is the sum of the numbers in the list
sum(List, Sum) :-
    sum_acc(List, Sum, 0).
%calls the sum_acc predicate to add the sum of a list with an accumulator

%List is the list of numbers, Sum is the sum of the list and Accumulator is the value of the added sum so far
sum_acc([], Sum, Sum).
%base case when list is empty, accumulator is the sum of the list 
sum_acc([H|T], Sum, Acc) :-
    NewAcc is Acc + H,
    %add the head element to the accumulator
    sum_acc(T, Sum, NewAcc).
%Recursively call the sums_acc predicate to the rest of the list until all elements are added

%Indices is the list of indices, Grid is the list of elements and Sum is the sum of the elements at indices of Grid. 
combine(Indices, Grid, Sum) :-
    combine_acc(Indices, Grid, Sum, 0).

%Indices is the list of indices, Grid is the list of elements, Sum is the sum of the list, Acc is the accumulator for sum
combine_acc([], _, Sum, Sum).
%base case, when Indices is empty, Accumulator is the sum
combine_acc([I|Is], Grid, Sum, Acc) :-
    nth0(I, Grid, E),
    %Uses the built in nth0 predicate to get element at index I of Grid
    NewAcc is Acc + E,
    %add the element to the Accumulator
    combine_acc(Is, Grid, Sum, NewAcc).
%Recursively call combine_acc with the rest of the indices until all elements in indices are added to the sum. 

%T0...T3 are numbers and GRID is list of nodes. US, VS, WS, U, V, W are lists of indices and numbers
acceptable( T0, T1, T2, T3, US, U, VS, V, WS, W, GRID) :- 
    combine(US, GRID, UR),
    %sum the elements at indices in US of GRID, store it as UR 
    combine(VS, GRID, VR),
    %sum the elements at indices in VS of GRID, store it as VR
    combine(WS, GRID, WR),
    %sum the elements at indices in WS of GRID, store it as WR
    UR is U,
    %check UR = U
    VR is V,
    %check VR = V
    WR is W,
    %check WR = W
    combine([0,1,3,4], GRID, R1),
    %sum elements at 0, 1, 3 and 4 of Grid
    combine([1,2,4,5], GRID, R2),
    %sum elements at 1, 2, 4 and 5 of grid
    combine([3,4,6,7], GRID, R3),
    %sum elements at 3, 4, 6 and 7 of grid
    combine([4,5,7,8], GRID, R4),
    %sum elements at 4, 5, 7 and 8 of grid
    T0 is R1,
    %check T0 = R1
    T1 is R2,
    %check T1 = R2
    T2 is R3,
    %check T2 = R3
    T3 is R4.
    %check T3 = R4
    
%suko(T0, T1, T2, T3, US, U, VS, V, WS, W, GRID)
%T0...T3 are numbers and GRID is list of nodes. US, VS, WS, U, V, W are lists of indices and numbers
suko( T0, T1, T2, T3, US, U, VS, V, WS, W, GRID) :-
    possible(GRID),
    acceptable( T0, T1, T2, T3, US, U, VS, V, WS, W, GRID).

/*End Question 3.3*/