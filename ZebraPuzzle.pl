/*
	each house is represented in the following order:
	house(Nationality, Pet, Cigarette, Drink, Colour)
*/
houses(Hs) :-	
	Hs = [_,_,_,_,_ ],                                              % 1) There are five houses.
	member(house(english,_,_,_,red), Hs),                         	% 2) The Englishman lives in the red house.
	member(house(spanish,dog,_,_,_), Hs),                         	% 3) The Spaniard owns the dog.
	member(house(_,_,_,coffee,green), Hs),                        	% 4) Coffee is drunk in the green house.
	member(house(ukrainian,_,_,tea,_), Hs),                       	% 5) The Ukrainian drinks tea.
	neighbour(house(_,_,_,_,green), house(_,_,_,_,ivory), Hs),      % 6) The green house is immediately to the right of the ivory house.
	member(house(_,snake,oldgold,_,_), Hs),                       	% 7) The Old Gold smoker owns snails.
	member(house(_,_,kool,_,yellow), Hs),                         	% 8) Kools are smoked in the yellow house.
	Hs = [_,_,house(_,_,_,milk,_),_,_],                           	% 9) Milk is drunk in the middle house.
	Hs = [house(norwegian,_,_,_,_)|_],                            	% 10) The Norwegian lives in the first house.
	neighbour(house(_,fox,_,_,_), house(_,_,chesterfield,_,_), Hs), % 11) The man who smokes Chesterfields lives in the house next to the man with the fox.
	neighbour(house(_,_,kool,_,_), house(_,horse,_,_,_), Hs),       % 12) Kools are smoked in the house next to the house where the horse is kept.
	member(house(_,_,lucky,juice,_), Hs),                         	% 13) The Lucky Strike smoker drinks orange juice.
	member(house(japanese,_,parliament,_,_), Hs),                   % 14) The Japanese smokes Parliaments.
	neighbour(house(norwegian,_,_,_,_), house(_,_,_,_,blue), Hs),   % 15) The Norwegian lives next to the blue house
	member(house(_,_,_,water,_), Hs),								% Who drinks water?
	member(house(_,zebra,_,_,_), Hs).								% Who owns the zebra?

	
neighbour(A, B, List) :- append(_, [A,B|_], List).
neighbour(A, B, List) :- append(_, [B,A|_], List).

zebra_owner(X) :-
	houses(Hs),
	member(house(X,zebra,_,_,_), Hs).

water_drinker(X) :-
	houses(Hs),
	member(house(X,_,_,water,_), Hs).

/** 
Who owns the zebra?
?- zebra_owner(X).

Who is the water drinker?
?- water_drinker(X).

?- houses(Houses).

*/
