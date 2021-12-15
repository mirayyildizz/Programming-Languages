
% Miray Yıldız.
% 161044023.
% Programming Languages HW4 Part3.

:-style_check(-singleton).

%Facts

class(102,10,z23).
class(108,12,z11).
class(341,14,z06).
class(455,16,207).
class(452,17,207).

enrollment(a,102).
enrollment(a,108).
enrollment(b,102).
enrollment(c,108).
enrollment(d,341).
enrollment(e,455).


%Rules

when(X,Y):-class(X,Y,P).
where(X,Y):-class(X,T,Y).


enroll(X,Y):-enrollment(X,Y).

schedule(S,P,T):-enrollment(S,W), when(W,T), where(W,P).

usage(P,T):- class(C,T,P).

conflict(X,Y):-when(X,T1),when(Y,T2),T1==T2; where(X,P1),where(Y,P2),P1==P2.

meet(X,Y):-enrollment(X,C1),enrollment(Y,C2), C1==C2.