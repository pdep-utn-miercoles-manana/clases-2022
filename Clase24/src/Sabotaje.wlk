import Nave.*

object reducirOxigeno {
	
	method realizarse() {
		if (not nave.algunJugadorTieneTanqueDeOxigeno()) {
			nave.reducirNivelDeOxigeno(10)
		}
	}
	
}

class ImpugnarJugador {
	
	const impugnado
	
	method realizarse() {
		impugnado.votarEnBlanco()
	}
	
}
