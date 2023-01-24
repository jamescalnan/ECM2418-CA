/*Begin Question 4.1*/
% This predicate checks whether a given number N is prime
prime(2) :- !.
prime(N) :- 
    N > 2,              % The number is greater than 2
    N mod 2 =\= 0,      % The number is not divisible by 2
    \+ has_factor(N, 3).% The number doesn't have a factor greater than or equal to 3

% This predicate checks whether a number has a factor greater than or equal to L
has_factor(N, L) :- N mod L =:= 0.
has_factor(N, L) :- 
    L * L < N,        % Check if the factor is less than N
    L2 is L + 2,      % Increase the factor by 2 as even numbers are not prime
    has_factor(N, L2).

/*End Question 4.1*/

/*Begin Question 4.2*/
% This predicate checks if the number is in the given range
possible(Bearing1, Bearing2, Bearing3) :-
    between(145, 179, Bearing1),
    between(245, 269, Bearing2),
    between(345, 359, Bearing3).

/*End Question 4.2*/

/*Begin Question 4.3*/

% This predicate checks if all the digits from 1 to 9 are present in the three numbers 
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

% This predicate checks if the provided numbers are acceptable traits
acceptable(Bearing1, Bearing2, Bearing3) :-
    % Checks if the numbers are not prime
    not(prime(Bearing1)),
    not(prime(Bearing2)),
    not(prime(Bearing3)),
    % Checks if the numbers contain all digits from 1 to 9
    all_digits_present(Bearing1, Bearing2, Bearing3).


% This predicate checks if the provided numbers are possible and acceptable traits
trait(Solution1, Solution2, Solution3) :-
    % Checks if the numbers are in the given range
    possible(Solution1, Solution2, Solution3),
    % Checks if the numbers are not prime and have all digits from 1 to 9
    acceptable(Solution1, Solution2, Solution3).

/*End Question 4.3*/
