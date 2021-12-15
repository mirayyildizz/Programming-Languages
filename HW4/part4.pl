% Miray Yıldız.
% 161044023.
% Programming Languages HW4 Part4.



:-style_check(-singleton).

%element
element(E,S) :- member(E,S).



%predicates for union.
familier(X,Y):-  foreach(element(M,X),element(M,Y)).
familierBreak(X,Y,Z):- foreach(element(M,Z),element(M,X);element(M,Y)).           

%union
union(S1,S2,S3):-familier(S1,S3), 
                 familier(S2,S3),
                 familierBreak(S1,S2,S3).

%predicates for intersection.
conflict(X,Y,Z):-foreach((element(M,X),element(M,Y)),element(I,Z)).
intersectBreak(X,Y,Z):- foreach(element(M,Z),(element(M,X),element(M,Y))).

%intersection
intersect(S1,S2,S3):-conflict(S1,S2,S3),
                     intersectBreak(S1,S2,S3).  


%predicate for equivalent
equivalent2([],_).
equivalent2([E|S1],S2):- element(E,S2), equivalent2(S1,S2).

%equivalent
equivalent(S1,S2):- equivalent2(S1,S2), equivalent2(S2,S1).


              