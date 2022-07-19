% pokemon(Nombre, Tipo).
pokemon(pikachu, electrico).
pokemon(bulbasaur, hierba).
pokemon(squirtle, agua).
pokemon(wartortle, agua).
pokemon(blastoise, agua).
pokemon(charmander, fuego).
pokemon(charmeleon, fuego).
pokemon(charizard, fuego).
pokemon(ivysaur, veneno).
pokemon(ivysaur, hierba).
pokemon(venusaur, hierba).
pokemon(mew, psiquico).
pokemon(dugtrio, tierra).
pokemon(caterpie, insecto).

equipo(esteban, charmander).
equipo(esteban, charizard).
equipo(esteban, mew).
equipo(felipe, caterpie).
equipo(felipe, charizard).
equipo(fede, squirtle).
equipo(tomas, wartortle).

esPokemon(Pokemon):-
  pokemon(Pokemon, _).

tipo(Tipo) :-
  pokemon(_, Tipo).

entrenador(Entrenador) :-
  equipo(Entrenador, _).

ataque(impactrueno, especial(electrico, 20)).
ataque(voltio,      especial(electrico, 10)).
ataque(cabezazo,    rapido(50)).
ataque(coletazo,    potente()).

atacar(Pokemon, NombreAtaque, Danio) :-
  ataque(NombreAtaque, ClaseDeAtaque),
  esPokemon(Pokemon),
  danioCausadoPor(Pokemon, ClaseDeAtaque, Danio).

danioCausadoPor(Pokemon, especial(Tipo, DanioAtaque), Danio) :-
  pokemon(Pokemon, Tipo),
  Danio is DanioAtaque + 50.

danioCausadoPor(Pokemon, especial(TipoAtaque, DanioAtaque), Danio) :-
  forall( pokemon(Pokemon, TipoPokemon), TipoAtaque \= TipoPokemon ),
  Danio is DanioAtaque + 25.

danioCausadoPor(_, rapido(Danio), Danio).
danioCausadoPor(_, potente(), 100).


%%%%%

% not/1     -> negar
% forall/2  -> saber si todos los que cumplen un antecedente cumplen un consecuente
% findall/3 -> me encuentra todos los que cumplen una condición.

% findall(Elemento, Condicion, Lista).

% length/2 -> se cumple para la longitud de la lista
% sumlist/2 -> se cumple para la suma de los elementos de la lista
% member/2 -> se cumple si el elemento está en la lista


%%% No recomendado!!!!1
% pokemonesDeFuego/1 -> la lista de pokemones que son de fuego.
pokemonesDeFuego(Lista) :-
  findall(Pokemon, pokemon(Pokemon, fuego), Lista).

%% Recomendado
pokemonesDeFuego2(Pokemon) :-
  pokemon(Pokemon, fuego).

%%% Requiere findall.
% cuantosPokemonesSonDeUnTipo/2 -> Tipo, Cantidad.
cuantosPokemonesSonDeUnTipo(Tipo, Cantidad) :-
  tipo(Tipo),
  findall(Pokemon, pokemon(Pokemon, Tipo), Pokemones),
  length(Pokemones, Cantidad).

hayAlMenosTresDeUnTipo(Tipo) :-
  cuantosPokemonesSonDeUnTipo(Tipo, Cantidad),
  Cantidad >= 3.

hayMasDeCincoDeUnTipo(Tipo) :-
  cuantosPokemonesSonDeUnTipo(Tipo, Cantidad),
  Cantidad > 5.

hayExactamenteSiete(Tipo) :-
  cuantosPokemonesSonDeUnTipo(Tipo, 7).


% no voy a usar findall para esto!
hayAlMenosUnoDeUnTipo(Tipo) :- %% es lo mismo que decir si existe alguno
  pokemon(_, Tipo).
  
hayAlMenosDosDeUnTipo(Tipo) :-
  pokemon(Pokemon1, Tipo),
  pokemon(Pokemon2, Tipo),
  Pokemon1 \= Pokemon2.

hayAlMenosTresDeUnTipo(Tipo) :-
  pokemon(Pokemon1, Tipo),
  pokemon(Pokemon2, Tipo),
  pokemon(Pokemon3, Tipo),
  Pokemon1 \= Pokemon2,
  Pokemon2 \= Pokemon3,
  Pokemon1 \= Pokemon3.


% Para fijarme si...
% ninguno cumple:               not/1
% alguno cumple:                existencia (todo lo que vimos las primeras tres clases!)
% todos cumplen:                forall/2 
% al menos dos cumplen:         existencia
% al menos N cumplen (N > 2):   findall + length
% exatamente N cumplen (N > 2): findall + length


%% ataqueDelEquipo/2 -> entrenador, ataqueTotal
%% relaciona al entrenador con el ataque total de todos los pokemones de su equipo

%% Fede tiene squirtle que suma 230.
%% Tomás tiene wartortle que suma 230.
%% Felipe tiene otros dos que suman 230 y 230 = 460
%% esteban tiene tres, 230 + 230 + 230 = 690

%%% Requiere findall.
ataqueDelEquipo(Entrenador, AtaqueTotal) :-
  entrenador(Entrenador),
  findall(Danio, daniosDeCadaPokemon(Entrenador, Danio), Danios),
  sumlist(Danios, AtaqueTotal).

daniosDeCadaPokemon(Entrenador, Danio) :-
  equipo(Entrenador, Pokemon),
  atacar(Pokemon, _, Danio).

