import Nave.*

class Tarea {	
	const property items

	method puedeSerRealizadaPor(unJugador) {
		return items.all { item => unJugador.tieneItem(item) }
	}
	
	method serRealizadaPor(unJugador) {
		unJugador.sacarItems(items)
		self.hacerTareaPor(unJugador) // Punto 4 - OPCION 3
		                              // Opcion 2 no lleva esta linea
	}
	
	method hacerTareaPor(unJugador)
}

object arreglarTableroElectronico inherits Tarea(items = ['Llave inglesa']) {

//	override method serRealizadaPor(unJugador) {  Punto 4 - OPCION 2
//		super(unJugador)
//		unJugador.aumentarNivelDeSospecha(10)
//	}

	override method hacerTareaPor(unJugador) { // Punto 4 - OPCION 3
		unJugador.aumentarNivelDeSospecha(10)
	}
}

object sacarLaBasura inherits Tarea(items = ['Escoba', 'Bolsa de consorcio'])  {

//	override method serRealizadaPor(unJugador) {  Punto 4 - OPCION 2
//		super(unJugador)
//		unJugador.disminuirNivelDeSospecha(4)
//	}

	override method hacerTareaPor(unJugador) { // Punto 4 - OPCION 3
		unJugador.disminuirNivelDeSospecha(4)
	}
}

object ventilarLaNave inherits Tarea(items = [])  {

//	override method serRealizadaPor(unJugador) {  Punto 4 - OPCION 2
//		super(unJugador)
//		nave.aumentarNivelDeOxigeno(5)
//	}

	override method hacerTareaPor(unJugador) { // Punto 4 - OPCION 3
		nave.aumentarNivelDeOxigeno(5)
	}
}

