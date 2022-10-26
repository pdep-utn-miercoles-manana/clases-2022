object nave {
	
	var nivelDeOxigeno = 10
	
	var cantidadImpostores
	var cantidadTripulantes
	
	const jugadores = #{}
	
	method aumentarNivelDeOxigeno(unaCantidad) {
		nivelDeOxigeno += unaCantidad
	}
	
	method tareaRealizada() {
		if (self.todosCompletaronSusTareas()) {
			throw new Exception(message = 'Ganaron los tripulantes')
		}
	}
	
	method todosCompletaronSusTareas() {
		return jugadores.all { jugador => jugador.completoTodasLasTareas() }
	}
	
	method algunJugadorTieneTanqueDeOxigeno() {
		return jugadores.any { jugador => jugador.tieneItem("Tanque de oxígeno") }
	}
			
	method reducirNivelDeOxigeno(unaCantidad) {
		nivelDeOxigeno -= unaCantidad
		if (nivelDeOxigeno <= 0) {
			throw new Exception(message = 'Ganaron los impostores')
		}
	}
	
	method convocarVotacion() {
		const votados = self.jugadoresVivos().map { jugador => jugador.jugadorVotado() }
		const elMasVotado = votados.max { voto => votados.occurrencesOf(voto) }
		elMasVotado.expulsar()
		self.verificarJuegoTerminado()
	}
	
	method jugadoresVivos() {
		return jugadores.filter { jugador => jugador.estaVivo() }
	}
	
	method verificarJuegoTerminado() {
		if (cantidadImpostores == 0) {
			throw new Exception(message = 'Ganaron los tripulantes')
		}
		if (cantidadImpostores == cantidadTripulantes) {
			throw new Exception(message = 'Ganaron los impostores')
		}
	}
	
	method impostorExpulsado() {
		cantidadImpostores --
	}
	
	method tripulanteExpulsado() {
		cantidadTripulantes --
	}
	
	method jugadorNoSospechoso() {
		return self.jugadoresVivos().findOrDefault({ jugador => not jugador.esSospechoso() }, votoEnBlanco)
	}
	
	method jugadorMasSospechoso() {
		return self.jugadoresVivos().max { jugador => jugador.nivelDeSospecha() } 		
	}
	
	method jugadorSinItems() {
		return self.jugadoresVivos().findOrDefault({ jugador => jugador.tieneMochilaVacia() }, votoEnBlanco)		
	}

	method jugadorVivoCualquiera() {
		return self.jugadoresVivos().anyOne()
	}	
}

object votoEnBlanco {
	method expulsar() {
		// NO HACE NADA
	}
}