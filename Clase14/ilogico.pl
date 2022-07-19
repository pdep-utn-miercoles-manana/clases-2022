%% Punto 1
%% No hay un personaje que no siga al rey
%% es igual a decir
%% todos los personajes siguen al rey
todosSiguenA(Rey) :-
  rey(Rey),
  forall(personaje(Personaje), sigueA(Personaje, Rey)).


%% Punto 2
puntosDeInteresCopadosEn(Ciudad, PuntosDeInteres) :-
  findall(PuntoDeInteres, puntoDeInteresCopadoEn(PuntoDeInteres, Ciudad), PuntosDeInteres).

puntoDeInteresCopadoEn(PuntoDeInteres, Ciudad) :-
  puntoDeInteres(PuntoDeInteres, Ciudad),
  puntoDeInteresCopado(PuntoDeInteres).

puntoDeInteresCopado(bar(VariedadesDeCerveza)) :-
  VariedadesDeCerveza > 4.

puntoDeInteresCopado(museo(cienciasNaturales)).

puntoDeInteresCopado(estadio(Capacidad)) :-
  Capacidad > 4000.

puntoDeInteresCopado(parque(CantidadDeArboles)) :-
  CantidadDeArboles > 5.

ciudadInteresante(Ciudad) :-
  antigua(Ciudad),
  puntosDeInteresCopadosEn(Ciudad, PuntosDeInteres),
  length(PuntosDeInteres, Cantidad),
  Cantidad > 10.


%% Punto 3
inFraganti(Delito, Delincuente) :-
  cometio(Delito, Delincuente),
  testigo(Delito, _).


%% Punto 4
viejoMaestro(Pensador) :-
  pensador(Pensador),
  forall(pensamiento(Pensador, Pensamiento), llegaANuestrosDias(Pensamiento)).


%% Punto 5
numeroDeLaSuerte(Persona, Numero) :-
  diaDelNacimiento(Persona, Numero).

numeroDeLaSuerte(joaquin, 8).


%% Punto 6
obraMaestra(Compositor, Obra) :-
  compositor(Compositor, Obra),
  forall(movimiento(Obra, Movimiento), movimientosMajestuosos(Movimiento)).


%% Punto 7
puedeComer(analia, Comida) :-
  ingrediente(Comida, _),
  forall(ingrediente(Comida, Ingrediente), esVegano(Ingrediente)).

esVegano(Ingrediente) :-
  not(contieneCarne(Ingrediente)),
  not(contieneHuevo(Ingrediente)),
  not(contieneLeche(Ingrediente)).

puedeComer(evaristo, asado).


%% Punto 8
costoEnvio(Paquete, PrecioTotal) :-
  findall(PrecioItem, precioDeItemEnPaquete(Paquete, PrecioItem), Precios),
  sumlist(Precios, PrecioTotal).

precioDeItemEnPaquete(Paquete, Precio) :-
  itemPaquete(Paquete, Item),
  precioIndividual(Item, Precio).

precioIndividual(libro(Precio), Precio).
precioIndividual(productoEnOferta(_, Precio), Precio).
precioIndividual(mp3(_, Duracion), Precio) :-
  Precio is Duracion * 2.
precioIndividual(juguete(Partes), Precio) :-
  Precio is Partes + 5.

