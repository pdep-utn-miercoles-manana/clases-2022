aeropuerto(aep, buenosAires).
aeropuerto(eze, buenosAires).

aeropuerto(gru, saoPaulo).
aeropuerto(scl, santiagoDeChile).

ciudad(palawan, filipinas, paradisiaca).
ciudad(chicago, estadosUnidos, negocios).
ciudad(paris, francia, importanciaCultural([torreEiffel, arcoDelTriunfo, museoLouvre, catedralNotreDame])).

ciudad(buenosAires, argentina, importanciaCultural([obelisco, congreso, cabildo])).

viaje(aerolineasProlog, aep, gru, 75000).
viaje(aerolineasProlog, gru, scl, 65000).

deCabotaje(UnaAerolinea) :-
  aeropuertoQueTrabaja(UnaAerolinea, UnAeropuerto)
  forall(aeropuertoQueTrabaja(UnaAerolinea, OtroAeropuerto), estanEnElMismoPais(UnAeropuerto, OtroAeropuerto)).

estanEnElMismoPais(UnAeropuerto, OtroAeropuerto) :-
  pais(UnAeropuerto, UnPais),
  pais(OtroAeropuerto, UnPais).

pais(UnAeropuerto, UnPais) :-
  aeropuerto(UnAeropuerto, UnaCiudad),
  ciudad(UnaCiudad, UnPais, _).

viajeDeIda(UnaCiudad) :-
  ciudad(UnaCiudad, _, _),
  not(tieneViajeDeVuelta(UnaCiudad)).

tieneViajeDeVuelta(UnaCiudad) :-
  viaje(_, AeropuertoOrigen, _, _),
  aeropuerto(AeropuertoOrigen, UnaCiudad).

relativamenteDirectas(UnOrigen, UnDestino) :-
  viaje(_, UnOrigen, UnDestino, _).

relativamenteDirectas(UnOrigen, UnDestino) :-
  viaje(UnaAerolinea, UnOrigen, UnaEscala, _),
  viaje(UnaAerolinea, UnaEscala, UnDestino, _).

% persona(nombre, millas, pesos, ubicacion)
persona(eduardo, 750, 50000, buenosAires).

puedeViajar(UnaPersona, UnaCiudadDestino) :-
  persona(UnaPersona, Millas, Plata, _),
  costoParaPersona(UnaPersona, UnaCiudadDestino, UnCosto),
  leAlcanzaParaElViaje(Millas, Plata, Costo).

costoParaPersona(UnaPersona, UnaCiudadDestino, UnCosto) :-
  persona(UnaPersona, _, _, UnaCiudadOrigen),
  aeropuerto(AeropuertoDestino, UnaCiudadDestino),
  aeropuerto(AeropuertoOrigen, UnaCiudadOrigen),
  viaje(_, AeropuertoOrigen, AeropuertoDestino, _),
  costo(AeropuertoOrigen, AeropuertoDestino, UnCosto).

costo(AeropuertoOrigen, AeropuertoDestino, millas(500)) :-
  estanEnElMismoPais(AeropuertoOrigen, AeropuertoDestino).

costo(AeropuertoOrigen, AeropuertoDestino, millas(Costo)) :-
  not(estanEnElMismoPais(AeropuertoOrigen, AeropuertoDestino)),
  viaje(_, AeropuertoOrigen, AeropuertoDestino, Precio),
  Costo is Precio * 0.2.

costo(AeropuertoOrigen, AeropuertoDestino, pesos(Costo)) :-
  viaje(_, AeropuertoOrigen, AeropuertoDestino, Costo).

leAlcanzaParaElViaje(Millas, _, millas(UnCosto)) :-
  Millas >= UnCosto.

leAlcanzaParaElViaje(_, Plata, pesos(UnCosto)) :-
  Plata >= UnCosto.

quiereViajar(UnaPersona, UnaCiudadDestino) :-
  persona(UnaPersona, _, _, _),
  ciudad(UnaCiudadDestino, qatar, negocios).

quiereViajar(UnaPersona, UnaCiudadDestino) :-
  listaParaViajar(UnaPersona),
  ciudadPopular(UnaCiudadDestino).

listaParaViajar(UnaPersona) :-
  persona(UnaPersona, Millas, Plata, _),
  Plata > 5000,
  Millas > 100.

ciudadPopular(UnaCiudad) :-
  ciudad(UnaCiudad, _, TipoDeCiudad),
  tipoPopular(TipoDeCiudad).

tipoPopular(paradisiaca).
tipoPopular(importanciaCultural(LugaresEmblematicos)) :-
  length(LugaresEmblematicos, Cantidad),
  Cantidad >= 4.

ahorrarUnPoquitoMas(UnaPersona, UnaCiudad) :-
  persona(UnaPersona, _, _, Ubicacion)
  quiereViajar(UnaPersona, UnaCiudad),
  forall(ciudadALaQueQuierePeroNoPuedeViajar(UnaPersona, OtraCiudad), estaMasCercaEconomicamente(UnaPersona, UnaCiudad, OtraCiudad)).

ciudadALaQueQuierePeroNoPuedeViajar(UnaPersona, UnaCiudad) :-
  quiereViajar(UnaPersona, UnaCiudad),
  not(puedeViajar(UnaPersona, UnaCiudad)).

estaMasCercaEconomicamente(UnaPersona, UnaCiudad, OtraCiudad) :-
  costoParaPersona(UnaPersona, UnaCiudad, pesos(UnCosto)),
  costoParaPersona(UnaPersona, OtraCiudad, pesos(OtroCosto)),
  UnCosto =< OtroCosto.
