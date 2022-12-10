% prime(+N:integer) is det.
%
% True if N is a prime number.
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


% DOESNT CHECK FOR ALL OF THE DIGITS BEING THERE

% possible(+InitialBearing1:integer, +InitialBearing2:integer, +InitialBearing3:integer, -Bearing1:integer, -Bearing2:integer, -Bearing3:integer) is nondet.
%
% True if Bearing1, Bearing2, and Bearing3 are possible solutions to the Bearings' Trait.
% This predicate can be used in a search, using the "next" built-in predicate, to generate successive possible solutions.
possible(InitialBearing1, InitialBearing2, InitialBearing3, Bearing1, Bearing2, Bearing3) :-
    % Ensure that the bearings are in the correct range (0-359) and that none of the bearings are prime values.
    between(0, 359, Bearing1),
    \+ prime(Bearing1),
    between(0, 359, Bearing2),
    \+ prime(Bearing2),
    between(0, 359, Bearing3),
    \+ prime(Bearing3),
    % Ensure that the bearings are in different quadrants.
    (Bearing1 >= 0, Bearing1 < 90, Bearing2 >= 90, Bearing2 < 180, Bearing3 >= 180, Bearing3 < 270 ;
     Bearing1 >= 0, Bearing1 < 90, Bearing2 >= 180, Bearing2 < 270, Bearing3 >= 270, Bearing3 < 360 ;
     Bearing1 >= 0, Bearing1 < 90, Bearing2 >= 270, Bearing2 < 360, Bearing3 >= 0, Bearing3 < 90 ;
     Bearing1 >= 90, Bearing1 < 180, Bearing2 >= 180, Bearing2 < 270, Bearing3 >= 270, Bearing3 < 360 ;
     Bearing1 >= 90, Bearing1 < 180, Bearing2 >= 270, Bearing2 < 360, Bearing3 >= 0, Bearing3 < 90 ;
     Bearing1 >= 90, Bearing1 < 180, Bearing2 >= 0, Bearing2 < 90, Bearing3 >= 180, Bearing3 < 270 ;
     Bearing1 >= 180, Bearing1 < 270, Bearing2 >= 270, Bearing2 < 360, Bearing3 >= 0, Bearing3 < 90 ;
     Bearing1 >= 180, Bearing1 < 270, Bearing2 >= 0, Bearing2 < 90, Bearing3 >= 90, Bearing3 < 180 ;
     Bearing1 >= 180, Bearing1 < 270, Bearing2 >= 90, Bearing2 < 180, Bearing3 >= 270, Bearing3 < 360 ;
     Bearing1 >= 270, Bearing1 < 360, Bearing2 >= 0, Bearing2 < 90, Bearing3 >= 90, Bearing3 < 180 ;
     Bearing1 >= 270, Bearing1 < 360, Bearing2 >= 90, Bearing2 < 180, Bearing3 >= 180, Bearing3 < 270 ;
     Bearing1 >= 270, Bearing1 < 360, Bearing2 >= 180, Bearing2 < 270, Bearing3 >= 0, Bearing3 < 90).


% acceptable(+Bearing1:integer, +Bearing2:integer, +Bearing3:integer) is det.
%
% True if the given bearings form an acceptable solution to the Bearings' Trait.
acceptable(Bearing1, Bearing2, Bearing3) :-
    % Ensure that the bearings are in the correct range (0-359) and that none of the bearings are prime values.
    between(0, 359, Bearing1),
    \+ prime(Bearing1),
    between(0, 359, Bearing2),
    \+ prime(Bearing2),
    between(0, 359, Bearing3),
    \+ prime(Bearing3),
    % Ensure that the bearings are in different quadrants.
    (Bearing1 >= 0, Bearing1 < 90, Bearing2 >= 90, Bearing2 < 180, Bearing3 >= 180, Bearing3 < 270 ;
     Bearing1 >= 0, Bearing1 < 90, Bearing2 >= 180, Bearing2 < 270, Bearing3 >= 270, Bearing3 < 360 ;
     Bearing1 >= 0, Bearing1 < 90, Bearing2 >= 270, Bearing2 < 360, Bearing3 >= 0, Bearing3 < 90 ;
     Bearing1 >= 90, Bearing1 < 180, Bearing2 >= 180, Bearing2 < 270, Bearing3 >= 270, Bearing3 < 360 ;
     Bearing1 >= 90, Bearing1 < 180, Bearing2 >= 270, Bearing2 < 360, Bearing3 >= 0, Bearing3 < 90 ;
     Bearing1 >= 90, Bearing1 < 180, Bearing2 >= 0, Bearing2 < 90, Bearing3 >= 180, Bearing3 < 270 ;
     Bearing1 >= 180, Bearing1 < 270, Bearing2 >= 270, Bearing2 < 360, Bearing3 >= 0, Bearing3 < 90 ;
     Bearing1 >= 180, Bearing1 < 270, Bearing2 >= 0, Bearing2 < 90, Bearing3 >= 90, Bearing3 < 180 ;
     Bearing1 >= 180, Bearing1 < 270, Bearing2 >= 90, Bearing2 < 180, Bearing3 >= 270, Bearing3 < 360 ;
     Bearing1 >= 270, Bearing1 < 360, Bearing2 >= 0, Bearing2 < 90, Bearing3 >= 90, Bearing3 < 180 ;
     Bearing1 >= 270, Bearing1 < 360, Bearing2 >= 90, Bearing2 < 180, Bearing3 >= 180, Bearing3 < 270 ;
     Bearing1 >= 270, Bearing1 < 360, Bearing2 >= 180, Bearing2 < 270, Bearing3 >= 0, Bearing3 < 90).

trait(X,Y,Z) :-
    possible(0, 90, 180, X,Y,Z),
    acceptable(X,Y,Z).
% trait(+InitialBearing1:integer, +InitialBearing2:integer, +InitialBearing3:integer, -Solution1:integer, -Solution2:integer, -Solution3:integer) is det.
%
% True if the given initial bearings lead to an acceptable solution to the Bearings' Trait, which is returned in Solution1, Solution2, and Solution3
