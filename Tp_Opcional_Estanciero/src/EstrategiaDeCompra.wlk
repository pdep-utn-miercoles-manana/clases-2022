import Banco.*

object standard {
	method puedoComprar(unaPropiedad, unJugador) {
		return true
	}
}

object garca {
	method puedoComprar(unaPropiedad, unJugador) {
		return unaPropiedad.cumpleCriterioDeCompraGarca(unJugador)
	}
}

object imperialista {
	method puedoComprar(unaPropiedad, unJugador) {
		return unaPropiedad.cumpleCriterioDeCompraImperialista(unJugador)
	}
}

