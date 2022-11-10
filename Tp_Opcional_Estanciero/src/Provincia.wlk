import Banco.*

class Provincia {
	const campos = []

	method duenios() {
		return campos.map { campo => campo.duenio() }.asSet()
	}

	method validarConstruccionDeEstancia(unCampo) {
		self.validarMismoDuenio(unCampo.duenio())
		self.validarConstruccionPareja(unCampo)
	}

	method validarMismoDuenio(unDuenio) {
		if (not self.esMismoDuenio(unDuenio)) {
			throw new DomainException(message = "Todos los campos deben ser del mismo duenio")
		}
	}

	method validarConstruccionPareja(unCampo) {
		if (not self.esConstruccionPareja(unCampo)) {
			throw new DomainException(message = "La construccion de estancias tiene que ser pareja entre los campos")
		}
	}
	
	method esMismoDuenio(unDuenio) {
		return campos.all { campo => campo.esDe(unDuenio) } 
	}
	
	method esConstruccionPareja(unCampo) {
		return campos.all { campo => unCampo.cantidadDeEstancias() <= campo.cantidadDeEstancias() }
	}
	
	method esDuenioDeAlgunCampo(unJugador) {
		return self.duenios().contains(unJugador)
	}
	
	method otroJugadorEsDuenio(unJugador) {
		return not self.esDuenioDeAlgunCampo(unJugador) && 
		       not self.esDuenioDeAlgunCampo(banco)
	}
}

