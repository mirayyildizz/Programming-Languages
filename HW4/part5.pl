% Miray Yıldız.
% 161044023.
% Programming Languages HW4 Part5.


equation(L,LT,RT) :- split(L,LL,RL), term(LL,LT), term(RL,RT), LT =:= RT.                  
 
term([X],X).                   
                  
term(L,T) :- split(L,LL,RL), term(LL,LT), term(RL,RT), binary(LT,RT,T).            
 
 
binary(LT,RT,LT+RT).
binary(LT,RT,LT-RT).
binary(LT,RT,LT*RT).
binary(LT,RT,LT/RT) :- RT =\= 0.   %% division by zero
 

split(L,L1,L2) :-  append(L1,L2,L), L1 = [_|_], L2 = [_|_].
 
 
% Write file.
do(L) :- 
   equation(L,LT,RT), open("output.txt",write,Stream), swritef(Output,'%w = %w\n',[LT,RT]), write(Stream,Output), close(Stream), fail.
do(_).


:- use_module(library(dcg/basics), except([eos/2])).

lists(FileName) :-
   DCG = readLists(Lists),
   phrase_from_file(DCG,FileName), !, Lists = [List1], do(List1).


eos([], []).


readLists([]) --> call(eos).
readLists([List|Lists]) -->
    readList(List),
    (
        "\n"
    |
        []
    ),
    readLists(Lists).
readLists([]) --> [].

readList([Item|Items]) -->
    number(Item),
    whites,
    readList(Items).
readList([]) --> [].

?- lists("input.txt").