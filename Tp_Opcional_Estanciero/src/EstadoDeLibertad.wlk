object libre {
	method sacoDoble(unJugador) {
		if (unJugador.cantidadDeTirosDoblesSeguidos() == 2) {
			unJugador.marchePreso()
		}
	}
	
	method moverSobre(unosCasilleros, unJugador) {
		unJugador.pasarPorTodosMenosElUltimo(unosCasilleros)
		unJugador.caerEn(unosCasilleros.last())
	}
}

class Preso {
	var cantidadTurnosPreso = 0
	
	method sacoDoble(unJugador) {
		unJugador.liberate()
	}
	
	method moverSobre(unosCasilleros, unJugador) {
		cantidadTurnosPreso ++
		if (cantidadTurnosPreso == 3) {
			unJugador.liberate()
		}
	}
}
