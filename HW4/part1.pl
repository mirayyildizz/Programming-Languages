% Miray Yıldız.
% 161044023.
% Programming Languages HW4 Part1.


%% PART1


% Facts (Knowledge Base).

flight(istanbul,rize).
flight(istanbul,izmir).
flight(istanbul,ankara).
flight(istanbul,van).
flight(istanbul,gaziantep).
flight(istanbul,antalya).
flight(edirne,edremit).
flight(edremit,edirne).
flight(edremit,erzincan).
flight(ısparta,izmir).
flight(ısparta,burdur).
flight(burdur,ısparta).
flight(erzincan,edremit).
flight(konya,ankara).
flight(konya,antalya).
flight(gaziantep,antalya).
flight(gaziantep,istanbul).
flight(ankara,istanbul).
flight(ankara,konya).
flight(ankara,van).
flight(van,istanbul).
flight(van,ankara).
flight(van,rize).
flight(rize,istanbul).
flight(rize,van).
flight(izmir,ısparta).
flight(izmir,istanbul).
flight(antalya,istanbul).
flight(antalya,konya).
flight(antalya,gaziantep).


% Rules.

route(X,Y):-flight(X,A),
          flight(B,Y),X\=Y,
          (flight(A,B);A==B).
