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


possible(Bearing1, Bearing2, Bearing3) :-
  between(145, 179, Bearing1),
  between(245, 269, Bearing2),
  between(345, 359, Bearing3).


all_digits_present(X, Y, Z) :-
    % convert each number to a list of digits
    number_chars(X, XChars),
    number_chars(Y, YChars),
    number_chars(Z, ZChars),

    % combine the lists of digits into a single list
    append(XChars, YChars, XYChars),
    append(XYChars, ZChars, AllChars),

    % sort the list of digits in ascending order
    sort(AllChars, SortedChars),
    % check if the list of digits contains all digits from 1 to 9
    SortedChars == ['1','2','3','4','5','6','7','8','9'].

acceptable(Bearing1, Bearing2, Bearing3) :-
  not(prime(Bearing1)),
  not(prime(Bearing2)),
  not(prime(Bearing3)),
  all_digits_present(Bearing1, Bearing2, Bearing3).


trait(Solution1, Solution2, Solution3) :-
  possible(Solution1, Solution2, Solution3),
  acceptable(Solution1, Solution2, Solution3).
