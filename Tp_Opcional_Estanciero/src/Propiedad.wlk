import Banco.*

class Propiedad {
	var property duenio = banco
	var estado = noHipotecada
	
	const precioCompra
	
	method paso(unJugador) {
		// No hace Nada
	}
	
	method cayo(unJugador) {
		duenio.cayoEn(self, unJugador)
	}
	
	method precioCompra() {
		return precioCompra * estado.factorDeHipoteca()
	}
	
	method esDe(unDuenio) {
		return duenio.equals(unDuenio)
	}
	
	method puedeHipotecarse() {
		return estado.puedeHipotecarse()
	}
	
	method hipotecarPara(unJugador) {
		unJugador.cobrar(precioCompra / 2)
		estado = hipotecada
		duenio = banco
	}
	
	method teComproElJugador(unJugador) {
		estado = noHipotecada
		duenio = unJugador
	}
}

object noHipotecada {
	method puedeHipotecarse() = true
	method factorDeHipoteca() = 1
}

object hipotecada {
	method puedeHipotecarse() = false	
	method factorDeHipoteca() = 1.5	
}