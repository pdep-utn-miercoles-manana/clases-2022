% Base de conocimiento
% Conjunto de predicados

% pokemon/2.
%    ^    ^------ aridad
% predicado     

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

% legendario/1.
legendario(mew).
legendario(mewtwo).

% Consultas variables
% ¿Cuáles son los pokemon de hierba? --> la variable es el nombre del pokemon
% ¿De qué tipo es el pokemon squirtle? --> la variable es el tipo del pokemon

% Funciones  <-- funcional
% Relaciones <-- lógico


% superEfectivo/2
% Agua -> Fuego
% Fuego -> Hierba
% Hierba -> Agua

% superEfectivo(TipoQueGana, TipoQuePierde).
superEfectivo(agua, fuego).
superEfectivo(fuego, hierba).
superEfectivo(hierba, agua).
superEfectivo(tierra, electrico).

% Un pokemon gana en batalla cuando su tipo es súper efectivo contra el del otro.
% Los pokemon legendarios siempre ganan todas las batallas.
% ganaEnBatalla(NombrePokemon1, NombrePokemon2).

% variable sin ligar = no tiene ningún valor
ganaEnBatalla(PokemonQueGana, PokemonQuePierde) :-
  pokemon(PokemonQueGana, TipoQueGana),
  pokemon(PokemonQuePierde, TipoQuePierde),
  superEfectivo(TipoQueGana, TipoQuePierde).

ganaEnBatalla(PokemonLegendario, PokemonQuePierde) :-
  legendario(PokemonLegendario),
  pokemon(PokemonQuePierde, _).

ganaEnBatalla(fede, _).


%% evolucion/3
evolucion(bulbasaur, 16, ivysaur).
evolucion(ivysaur, 32, venusaur).
evolucion(squirtle, 16, wartortle).
evolucion(wartortle, 36, blastoise).
evolucion(charmander, 16, charmeleon).
evolucion(charmeleon, 36, charizard).

%% evolucionaRapido/1
%% Se cumple para los pokemon que evolucionan antes del nivel 20.

evolucionaRapido(Pokemon) :-
  evolucion(Pokemon, Nivel, _),
  Nivel < 20.


% puedeCapturar/2
% Un entrenador puede capturar a un pokemon
% si tiene algún pokemon que le gane una batalla
% al que quiere capturar.
% pikachu nunca se puede capturar.

% equipo/2
% equipo(Entrenador, Pokemon).
equipo(ash, pikachu).
equipo(ash, charizard).
equipo(fede, bulbasaur).
equipo(fede, dugtrio).

puedeCapturar(Entrenador, PokemonACapturar) :-
  equipo(Entrenador, PokemonDelEntrenador),
  ganaEnBatalla(PokemonDelEntrenador, PokemonACapturar),
  PokemonACapturar \= pikachu.