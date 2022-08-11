%% Atleta -> nombre, edad, su país
atleta(andrea, 23, argentina).
atleta(nicolas, 22, argentina).
atleta(thomas, 25, inglaterra).
atleta(dalilahMuhammad, 27, estadosUnidos).

%% Disciplinas -> nombre, atletas/países
disciplina(voleyMasculino, equipo).
disciplina(carrera100MetrosLlanosFemenino, individual).

compiteEnDisciplina(carrera100MetrosLlanosFemenino, andrea).
compiteEnDisciplina(voleyMasculino, nicolas).
compiteEnDisciplina(carrera400MetrosConVallasFemenino, dalilahMuhammad).

%% Medallas -> medalla, disciplina, quiénLaGanó(atl/país)

medalla(bronce, voleyMasculino, argentina).
medalla(plata, carrera400MetrosConVallasFemenino, dalilahMuhammad).

%% Eventos -> disciplina, ronda, quién
evento(hockeyFemenino, final, argentina).
evento(hockeyFemenino, final, paisesBajos).

evento(cienMetrosEspaldaMasculino, rondaUnica, thomas).
evento(cienMetrosEspaldaMasculino, rondaUnica, felipe).
evento(cienMetrosEspaldaMasculino, rondaUnica, lautaro).

% medallasEfectivas
% 3 de oro, 5 de plata, 2 de bronce
% 3  *  3 + 5  *   2  + 2 *    1    = 21

%%% 2
vinoAPasear(Atleta) :-
  atleta(Atleta, _, _),
  not(compiteEnDisciplina(_, Atleta)).


%%% 3-1
medallasDelPais(Medalla, Disciplina, Pais) :-
  medalla(Medalla, Disciplina, Pais).

medallasDelPais(Medalla, Disciplina, Pais) :-
  medalla(Medalla, Disciplina, Atleta),
  atleta(Atleta, _, Pais).

%%% 3-2
medallasDelPais(Medalla, Disciplina, Pais) :-
  medalla(Medalla, Disciplina, PaisOAtleta),
  paisOAtletaDelPais(PaisOAtleta, Pais).

paisOAtletaDelPais(Atleta, Pais) :-
  atletaDelPais(Atleta, Pais).

paisOAtletaDelPais(Pais, Pais) :-
  pais(Pais).

atletaDelPais(Atleta, Pais) :-
  atleta(Atleta, _, Pais).

pais(Pais) :-
  atleta(_, _, Pais).

%%% 4-1
participoEn(Disciplina, Ronda, Atleta) :-
  evento(Disciplina, Ronda, Atleta).

participoEn(Disciplina, Ronda, Atleta) :-
  evento(Disciplina, Ronda, Pais),
  atleta(Atleta, _, Pais).

%%% 4-2
participoEn(Disciplina, Ronda, Atleta) :-
  evento(Disciplina, Ronda, AtletaOPais),
  atletaOPaisDelAtleta(Atleta, AtletaOPais).

atletaOPaisDelAtleta(Atleta, Atleta) :-
  atleta(Atleta, _, _).

atletaOPaisDelAtleta(Atleta, Pais) :-
  atletaDelPais(Atleta, Pais).

%%% 5
dominio(Pais, Disciplina) :-
  pais(Pais),
  compiteEnDisciplina(Disciplina, _),
  forall(medalla(_, Disciplina, PaisOAtleta), paisOAtletaDelPais(PaisOAtleta, Pais)).

%%% 6
% Esto se va a cumplir si hay una única ronda (no importa el nombre)
% Si todas las rondas que hay son la misma.
% Si no hay ninguna ronda que sea distinta.

% evento(100MetrosEspaldaMasculino, final, lautaro).

medallaRapida(Disciplina) :-
  evento(Disciplina, Ronda, _),
  not(otraRonda(Disciplina, Ronda)).

otraRonda(Disciplina, Ronda) :-
  evento(Disciplina, OtraRonda, _),
  Ronda \= OtraRonda.


%%% 7
noEsElFuerte(Pais, Disciplina) :-
  pais(Pais),
  disciplina(Disciplina, _),
  noCompitio(Pais, Disciplina).

% noCompitio se fija si:
%    * no participó
%    * se volvió en ronda inicial

noCompitio(Pais, Disciplina) :-
  forall(paisOAtletaDelPais(AtletaOPais, Pais), not(evento(Disciplina, _, AtletaOPais))).

noCompitio(Pais, Disciplina) :-
  not(paisEstuvoEnRondaNoInicial(Pais, Disciplina)).

paisEstuvoEnRondaNoInicial(Pais, Disciplina) :-
  evento(Disciplina, Ronda, Participante),
  paisOAtletaDelPais(Participante, Pais),
  disciplina(Disciplina, Tipo),
  not(rondaInicialPara(Tipo, Ronda)).

% que el país NO esté en una ronda que NO es inicial
% todas las rondas de ese país tienen que ser la inicial
rondaInicialPara(equipo, faseDeGrupos).
rondaInicialPara(individual, ronda1).


%%% 8
medallasEfectivas(CuentaFinal, Pais) :-
  pais(Pais),
  findall(Puntos, puntosPorMedallaParaPais(Pais, Puntos), ListaDePuntos),
  sumlist(ListaDePuntos, CuentaFinal).

puntosPorMedallaParaPais(Pais, Puntos) :-
  medallasDelPais(Medalla, _, Pais),
  puntosPorMedalla(Medalla, Puntos).

puntosPorMedalla(oro, 3).
puntosPorMedalla(plata, 2).
puntosPorMedalla(bronce, 1).


%%% 9
laEspecialidad(Atleta) :-
  atleta(Atleta, _, _),
  not(vinoAPasear(Atleta)),
  forall(participoEn(Disciplina, _, Atleta), salio1o2(Atleta, Disciplina)).

salio1o2(Atleta, Disciplina) :-
  medalla(Medalla, Disciplina, AtletaOPais),
  paisOAtletaDelPais(Atleta, AtletaOPais),
  medallaDeOroOPlata(Medalla).

medallaDeOroOPlata(oro).
medallaDeOroOPlata(plata).