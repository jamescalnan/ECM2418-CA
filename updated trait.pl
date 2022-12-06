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

possible(InitialBearing1, InitialBearing2, InitialBearing3, Bearing1, Bearing2, Bearing3) :-
  between(0, 359, Bearing1),
  between(90, 359, Bearing2),
  between(180, 359, Bearing3),

  Quadrant1 is floor(Bearing1 / 90),
  Quadrant2 is floor(Bearing2 / 90),
  Quadrant3 is floor(Bearing3 / 90),
  Quadrant1 \= Quadrant2,
  Quadrant1 \= Quadrant3,
  Quadrant2 \= Quadrant3.

insert_sort(List,Sorted):-i_sort(List,[],Sorted).
i_sort([],Acc,Acc).
i_sort([H|T],Acc,Sorted):-insert(H,Acc,NAcc),i_sort(T,NAcc,Sorted).
   
insert(X,[Y|T],[Y|NT]):-X>Y,insert(X,T,NT).
insert(X,[Y|T],[X,Y|T]):-X=<Y.
insert(X,[],[X]).

acceptable(Bearing1, Bearing2, Bearing3) :-
  not(prime(Bearing1)),
  not(prime(Bearing2)),
  not(prime(Bearing3)),

  number_chars(Bearing1, XChars),
  number_chars(Bearing2, YChars),
  number_chars(Bearing3, ZChars),

  % combine the lists of digits into a single list
  append(XChars, YChars, XYChars),
  append(XYChars, ZChars, AllChars),
  SortedChars == ['1','2','3','4','5','6','7','8','9'].

  % sort the list of digits in ascending order
  insert_sort(AllChars, SortedChars),

  % check if the list of digits contains all digits from 1 to 9

trait(InitialBearing1, InitialBearing2, InitialBearing3, Solution1, Solution2, Solution3) :-
  possible(InitialBearing1, InitialBearing2, InitialBearing3, Solution1, Solution2, Solution3),
  acceptable(Solution1, Solution2, Solution3).
