class EmocionCompuesta {
	const emociones = []
	
	method asentarRecuerdo(unaPersona, unRecuerdo) {
		 emociones.forEach { emocion => emocion.asentarRecuerdo(unaPersona, unRecuerdo) } 
	}
	
	method esNegado(unRecuerdo) {
		return emociones.all { emocion => emocion.esNegado(unRecuerdo) }
	}
	
	method esAlegre() {
		return emociones.any { emocion => emocion.esAlegre() }
	}
}

class Emocion {
	method asentarRecuerdo(unaPersona, unRecuerdo) {
		// No hace nada 
	}
	
	method esNegado(unRecuerdo) {
		return false
	}
	
	method esAlegre() {
		return false
	}
}

object alegria {
	
	method asentarRecuerdo(unaPersona, unRecuerdo) {
		if (unaPersona.esFeliz()) {
			unaPersona.agregarPensamientoCentral(unRecuerdo)
		}
	}
	
	method esNegado(unRecuerdo) {
		return not unRecuerdo.esAlegre()
	}
	
	method esAlegre() {
		return true
	}
}

object tristeza inherits Emocion {
	
	override method asentarRecuerdo(unaPersona, unRecuerdo) {
		unaPersona.agregarPensamientoCentral(unRecuerdo)
		unaPersona.disminuirCoeficienteDeFelicidad(10)
	}
	
	override method esNegado(unRecuerdo) {
		return unRecuerdo.esAlegre()
	}
}

object furioso inherits Emocion {}

const temeroso = new Emocion()
const disgusto = object inherits Emocion {}