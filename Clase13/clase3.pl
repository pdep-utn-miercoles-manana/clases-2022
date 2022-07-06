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

% legendario(Pokemon).
legendario(mew).
legendario(mewtwo).

% evolucion(Pokemon, Nivel, Evolucion).
evolucion(bulbasaur, 16, ivysaur).
evolucion(ivysaur, 32, venusaur).
evolucion(squirtle, 16, wartortle).
evolucion(wartortle, 36, blastoise).
evolucion(charmander, 16, charmeleon).
evolucion(charmeleon, 36, charizard).

% evolucionaRapido(Pokemon).
evolucionaRapido(Pokemon) :-
  evolucion(Pokemon, Nivel, _),
  Nivel < 20.

% puntos(Pokemon, Ataque, Defensa).
puntos(bulbasaur, 5, 5).
puntos(squirtle, 6, 4).
puntos(charmander, 60, 35).
puntos(pikachu, 50, 30).

% poder(Pokemon, Poder).
% El poder es la suma de ataque y defensa.
% Para los pokemon legendarios, el poder es 1000.

poder(Pokemon, Poder) :-
  puntos(Pokemon, Ataque, Defensa),
  Poder is Ataque + Defensa.


equipo(esteban, charmander).
equipo(esteban, charizard).
equipo(esteban, mew).
equipo(felipe, caterpie).
equipo(felipe, charizard).
equipo(fede, squirtle).
equipo(tomas, wartortle).

% ∃
% Todo lo que hicimos hasta aquí en Lógico fue en términos de existencia.

% ∀
% Saber si un entrenador tiene un pokemon de fuego.

tienePokemonDeFuego(Entrenador) :-
  equipo(Entrenador, Pokemon),
  pokemon(Pokemon, fuego).

% Para todo pokemon de un entrenador, ese pokemon es de fuego.

% ∀ pokemon de un entrenador => pokemon es de fuego.
% ∀ pokemon : p(pokemon, entrenador) => q(pokemon, fuego).

%  ~~(∀ x :  p(x) => q(x))
%  ~~(∀ x : ~p(x) v  q(x))
%   ~(∃ x :  p(x) ^ ~q(x))


% Para todo pokemon de un entrenador, ese pokemon es de fuego.

% No existe un pokemon de un entrenador tal que ese pokemon NO sea de fuego.

% not/1. (De orden superior: reciben consultas como parámetro).

tieneTodosPokemonDeFuego(Entrenador) :-
  equipo(Entrenador, _),
  not( (equipo(Entrenador, Pokemon), not(pokemon(Pokemon, fuego))) ).


% forall/2 -> también predicado de orden superior, como el not/1.
% El primer parámetro es el antecedente y el segundo es el consecuente.

tieneTodosPokemonDeFuego2(Entrenador) :-
  equipo(Entrenador, _),
  forall( equipo(Entrenador, Pokemon), pokemon(Pokemon, fuego)  ).
%                   ^           ^
%       variable ligada      variable libre
%       (actúa como UN)    (actúa como TODOS)


todosLosEntrenadoresTienenTodosPokemonDeFuego(Entrenador) :-
  forall( equipo(Entrenador, Pokemon), pokemon(Pokemon, fuego)  ).
%                   ^           ^
%       variable libre      variable libre
%     (actúa como TODOS)  (actúa como TODOS)


todosLosEntrenadoresTienenAlMenosUnPokemonDeFuego(Pokemon) :-
  pokemon(Pokemon, _),
  forall( equipo(Entrenador, Pokemon), pokemon(Pokemon, fuego)  ).
%                   ^           ^
%       variable libre      variable ligada
%     (actúa como TODOS)    (actúa como UN)


tienePokemonDeFuego(Entrenador) :-
  equipo(Entrenador, Pokemon),
  forall( equipo(Entrenador, Pokemon), pokemon(Pokemon, fuego)  ).
%                   ^           ^
%       variable ligada      variable ligada
%       (actúa como UN)      (actúa como UN)




% Saber si todos los pokemones de cierto tipo son vencibles.
% pokemonVencible(Pokemon).

todosLosPokemonSonVencibles(Tipo) :-
  tipo(Tipo),
  forall(pokemon(Pokemon, Tipo), pokemonVencible(Pokemon)).
%%                 ^        ^
%%      variable libre     variable ligada 
%%     (actúa como TODOS)  (actúa como UNO)

tipo(Tipo) :-
  pokemon(_, Tipo).


%% Saber si un entrenador es malo, lo cual ocurre si no tiene pokemones legendarios.

%% Para todos los pokemones del entrenador, ninguno es legendario.

entrenadorMalo(Entrenador) :-
  entrenador(Entrenador),
  forall(  equipo(Entrenador, Pokemon), not(legendario(Pokemon)) ).
%%                  ^            ^
%%         variable ligada      variable libre
%%         (actúa como UNO)   (actúa como todos)

entrenador(Entrenador) :-
  equipo(Entrenador, _).



% Haremos entonces un listado de ataques.
% * Los especiales dicen su tipo y cuánto daño hacen.
% * Los rápidos solamente dicen cuánto daño hacen.
% * Los potentes no dicen nada, simplemente son potentes.


% impactrueno, especial electrico que hace 20 de daño
% voltio, especial electrico que hace 10 de daño
% cabezazo, rapido y hace 50 de daño
% coletazo, potente


% Functor es un individuo compuesto que tiene la forma de un predicado PERO QUE NO LO ES
%  * especial(TipoPokemon, Daño)
%  * rapido(Daño)
%  * potente()

% ataque/2
% ataque(NombreAtaque, TipoDeAtaque).
ataque(impactrueno, especial(electrico, 20)).
ataque(voltio,      especial(electrico, 10)).
ataque(cabezazo,    rapido(50)).
ataque(coletazo,    potente()).

% Para saber si daño cuando un pokemon ataca con un ataque, se sigue la siguiente lógica:
% * Si es especial y coincide en tipo, hace 50 de daño extra
% * Si es especial y no coincide en ningún tipo, hace 25 de daño extra
% * Si es rápido, sólo hace el daño del ataque
% * Si es potente, hace 100 de daño.


% atacar/3
% atacar(Pokemon, NombreAtaque, Danio)

% pokemon/1 \= pokemon/2
esPokemon(Pokemon):-
  pokemon(Pokemon, _).

%% atacar es un predicado que utiliza danioCausadoPor, el cual trata las clases de ataque indistintamente.
atacar(Pokemon, NombreAtaque, Danio) :-
  ataque(NombreAtaque, ClaseDeAtaque),
  esPokemon(Pokemon),
  danioCausadoPor(Pokemon, ClaseDeAtaque, Danio).

danioCausadoPor(Pokemon, especial(Tipo, DanioAtaque), Danio) :-
  pokemon(Pokemon, Tipo),
  Danio is DanioAtaque + 50.

danioCausadoPor(Pokemon, especial(TipoAtaque, DanioAtaque), Danio) :-
  forall ( pokemon(Pokemon, TipoPokemon), TipoAtaque \= TipoPokemon ),
  Danio is DanioAtaque + 25.

danioCausadoPor(Pokemon, rapido(Danio), Danio).
danioCausadoPor(Pokemon, potente(), 100).


% * Si es especial y coincide en tipo, hace 50 de daño extra
atacar(Pokemon, NombreAtaque, Danio) :-
  ataque(NombreAtaque, especial(Tipo, DanioAtaque)),
  pokemon(Pokemon, Tipo),
  Danio is DanioAtaque + 50.

% * Si es especial y no coincide en ningún tipo, hace 25 de daño extra
atacar(Pokemon, NombreAtaque, Danio) :-
  ataque(NombreAtaque, especial(TipoAtaque, DanioAtaque)),
  pokemon(Pokemon, _),
  forall(   pokemon(Pokemon, TipoPokemon),   TipoPokemon \= TipoAtaque   ),
  Danio is DanioAtaque + 25.

% * Si es rápido, sólo hace el daño del ataque
atacar(Pokemon, NombreAtaque, Danio) :-
  pokemon(Pokemon, _),
  ataque(NombreAtaque, rapido(Danio)).

% * Si es potente, hace 100 de daño.
atacar(Pokemon, NombreAtaque, 100) :-
  pokemon(Pokemon, _),
  ataque(NombreAtaque, potente()).



%% todosAtaquesFuertes/1:
%% Todos los ataques de un pokemon son fuertes.
%% Es fuerte si hace más de 50 de daño.

% Polimorfismo.
% Un predicado (todosAtaquesFuertes/1) que trata indistintamente al predicado atacar/3, sin importar de qué ataque se trata.

todosAtaquesFuertes(Pokemon) :-
  pokemon(Pokemon, _),
  forall( atacar(Pokemon, _, Danio), Danio >= 50 ).
