padreDe(abe, abbie).
padreDe(abe, homero).
padreDe(abe, herbert).
padreDe(clancy, marge).
padreDe(clancy, patty).
padreDe(clancy, selma).
padreDe(homero, bart).
padreDe(homero, hugo).
padreDe(homero, lisa).
padreDe(homero, maggie).

madreDe(edwina, abbie).
madreDe(mona, homero).
madreDe(gaby, herbert).
madreDe(jacqueline, marge).
madreDe(jacqueline, patty).
madreDe(jacqueline, selma).
madreDe(marge, bart).
madreDe(marge, hugo).
madreDe(marge, lisa).
madreDe(marge, maggie).
madreDe(selma, ling).

% tieneHijo/1: Nos dice si un personaje tiene un hijo o hija.
tieneHijo(Personaje) :-
  padreDe(Personaje, _).

tieneHijo(Personaje) :-
  madreDe(Personaje, _).

% hermanos/2: Relaciona a dos personajes cuando estos comparten madre y padre.
hermanos(UnHermano, UnaHermana) :-
  compartenPadre(UnHermano, UnaHermana),
  compartenMadre(UnHermano, UnaHermana),
  UnHermano \= UnaHermana.

compartenPadre(Persona1, Persona2) :-
  padreDe(Padre, Persona1),
  padreDe(Padre, Persona2).

compartenMadre(Persona1, Persona2) :-
  madreDe(Madre, Persona1),
  madreDe(Madre, Persona2).

% medioHermanos/2: Relaciona a dos personajes cuando estos comparten madre o padre.
medioHermanos(MedioHermano1, MedioHermano2) :-
  compartenPadre(MedioHermano1, MedioHermano2),
  madreDe(Madre1, MedioHermano1),
  madreDe(Madre2, MedioHermano2),
  Madre1 \= Madre2.

medioHermanos(MedioHermano1, MedioHermano2) :-
  compartenMadre(MedioHermano1, MedioHermano2),
  padreDe(Padre1, MedioHermano1),
  padreDe(Padre2, MedioHermano2),
  Padre1 \= Padre2.