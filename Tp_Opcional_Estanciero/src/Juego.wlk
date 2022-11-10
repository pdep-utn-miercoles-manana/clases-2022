import Tablero.*

class Juego {
	const property jugadores = []

	method empezar() {
		if (not self.estaTerminado()) {
			jugadores.forEach{ jugador => self.queJuegue(jugador) }
		}
	}

	method estaTerminado() {
		return false
	}

	method queJuegue(unJugador) {
		const numero = unJugador.tirarDados()
		const casillero = unJugador.casilleroActual()
		const casilleros = tablero.casillerosDesdeHasta(casillero, numero)
		unJugador.verificarCambioDeEstado()
		unJugador.moveteSobre(casilleros)
	}
}

