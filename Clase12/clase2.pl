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

% ? is ? + ?.

% MAL.
% Utilizamos is *ÚNICAMENTE* para aritmética. (Para hacer cuentas!)
% Fede dice que los desaprueba si hacen eso.
% poder(Pokemon, Poder) :-
%   Pokemon is mewtwo,
%   Poder is 1000.

% Asignación \= unificación (unificar variables, ligar variables).
poder(Legendario, 1000) :-
  legendario(Legendario).


% diferenciaEntreEvoluciones/2
% diferenciaEntreEvoluciones(Pokemon, Diferencia).
% Relaciona a un Pokemon y cuánto pasa entre que evoluciona en una cosa y otra.

diferenciaEntreEvoluciones(Pokemon, Diferencia) :-
  evolucion(_, NivelPrimeraEvolucion, Pokemon),
  evolucion(Pokemon, NivelSegundaEvolucion, _),
  Diferencia is NivelSegundaEvolucion - NivelPrimeraEvolucion.
  
% Inversibilidad -> si es inversible o no un predicado.

% Predicado totalmente inversible:
%    Puedo hacer consultas variables para *todos* sus parámetros.
% Predicado parcialmente inversible:
%    Puedo hacer consultas variables para *algunos* de sus parámetros.
% Predicado no inversible:
%    No puedo hacer consultas variables para *ninguno* de sus parámetros.

% Ciertas cuestiones que traen potenciales problemas de inversibilidad.
%   * Aritmética
%   * Comparaciones (<, >, =<, >=, \=)
%   * not/1.

% Queremos que todos nuestros predicados *principales* sean totalmente inversibles.

% entrenadorVencible/1
% Un entrenador es vencible cuando:
%   - Tiene un pokemon de tipo insecto; o
%   - Tiene un pokemon con poder menor a 50; o
%   - Tiene un pokemon que no evoluciona rápido

equipo(esteban, charmander). % esteban es invencible
equipo(felipe, caterpie). % felipe es vencible porque tiene un insecto.
equipo(fede, squirtle). % fede es vencible porque tiene uno con poder menor a 50.
equipo(tomas, wartortle). % tomás es vencible porque tiene uno que *no* evoluciona rápido.

entrenadorVencible(Entrenador) :-
  equipo(Entrenador, Pokemon),
  pokemonVencible(Pokemon).

pokemonVencible(Pokemon) :-
  pokemon(Pokemon, insecto).

pokemonVencible(Pokemon) :-
  poder(Pokemon, Poder),
  Poder < 50.

pokemonVencible(Pokemon) :-
  not(evolucionaRapido(Pokemon)).

% pokemonVencible no es totalmente inversible porque en su tercera cláusula
% el not trae problemas de inversibilidad para el parámetro Pokemon.

% entrenadorVencible es totalmente inversible porque, a pesar de utilizar
% pokemonVencible, utiliza ese predicado con la variable Pokemon ligada.
