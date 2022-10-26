import Nave.*

class Jugador {
	
	var estaVivo = true
	var nivelDeSospecha = 40
	var proximoVotoEnBlanco = false
	
	const mochila = []
	
	method esSospechoso() {
		return nivelDeSospecha > 50
	}
	
	method buscarItem(unItem) {
		mochila.add(unItem)
	}

	method sacarItems(unosItems) {
		mochila.removeAll(unosItems)
	}
	
	method tieneItem(unItem) {
		return mochila.contains(unItem)
	}
	
	method aumentarNivelDeSospecha(unaCantidad) {
		nivelDeSospecha += unaCantidad
	}
	
	method disminuirNivelDeSospecha(unaCantidad) {
		nivelDeSospecha -= unaCantidad
	}
	
	method votarEnBlanco() {
		proximoVotoEnBlanco = true
	}
	
	method llamarReunionDeEmergencia() {
		nave.convocarVotacion()
	}
	
	method estaVivo() {
		return estaVivo
	}
	
	method expulsar() {
		estaVivo = false
	}
	
	method tieneMochilaVacia() {
		return mochila.isEmpty()
	}

}

class Impostor inherits Jugador {

	method hacerTarea() {
		// NO HACE NADA
	}

	method completoTodasLasTareas() {
		return true
	}
	
	method sabotear(unSabotaje) {
		self.aumentarNivelDeSospecha(5)
		unSabotaje.realizarse()
	}
	
	override method expulsar() {
		super()
		nave.impostorExpulsado()
	}
	
	method jugadorVotado() {
		return nave.jugadorVivoCualquiera()
	}
	
	method nivelDeSospecha() {
		return nivelDeSospecha
	}
	
}

class Tripulante inherits Jugador {

	const tareas = []
	const tipoJugador

	method completoTodasLasTareas() {
		return tareas.isEmpty()
	}
	
	method hacerTarea() {
		const tarea = self.tareaRealizable()
		tarea.serRealizadaPor(self)
		// self.sacarItems(tarea.items())     // Punto 4 - OPCION 1
		tareas.remove(tarea)
		nave.tareaRealizada()
	}
	
	method tareaRealizable() {
		return tareas.find { tarea => tarea.puedeSerRealizadaPor(self) }
	}
	
	override method expulsar() {
		super()
		nave.tripulanteExpulsado()
	}
	
	method jugadorVotado() {
		if (proximoVotoEnBlanco) {
			proximoVotoEnBlanco = false
			return votoEnBlanco
		}
		return tipoJugador.jugadorVotado()
	}
}
