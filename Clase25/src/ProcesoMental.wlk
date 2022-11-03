object asentamiento {
	method apply(unaPersona) {
		unaPersona.asentarRecuerdosDelDia()
	}
}

class AsentamientoSelectivo {
	const palabraClave
	
	method apply(unaPersona) {
		unaPersona.asentarRecuerdosQueTengan(palabraClave)
	}
}

object profundizacion {
	method apply(unaPersona) {
		unaPersona.profundizarRecuerdos()
	}
}

object controlHormonal {
	method apply(unaPersona) {
		if (unaPersona.puedeDesequilibrase()) {
			unaPersona.desequilibrate()
		}
	}
}

class RestauracionCognitiva {
	const puntosDeFelicidad
	
	method apply(unaPersona) {
		unaPersona.aumentarNivelDeFelicidad(100.min(puntosDeFelicidad))
	}
}

object liberarRecuerdosDelDia {
	method apply(unaPersona) {
		unaPersona.liberarRecuerdos()
	}	
}