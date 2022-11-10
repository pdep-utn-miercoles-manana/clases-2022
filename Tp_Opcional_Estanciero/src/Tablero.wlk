import Banco.*

object tablero {
	
	const property casilleros = []
	const property empresas = []
	
	method todasLasEmpresasSonPropiedadDelBanco() {
		return empresas.all { empresa => empresa.esDe(banco) }
	}
	
	method otroJugadorEsDuenio(unJugador) {
		return empresas.any { empresa => not empresa.esDe(banco) && not empresa.esDe(unJugador) }
	}

	method casillerosDesdeHasta(unCasillero, unNumero) {
		return self.casillerosDesde(unCasillero).take(unNumero + 1)
	}
	
	method casillerosDesde(unCasillero) {
		const casillero = casilleros.first()
		if (unCasillero.equals(casillero)) {
			return casilleros
		} else {
			casilleros.remove(casillero)
			casilleros.add(casillero)
			return self.casillerosDesde(unCasillero)
		}
	}
}
