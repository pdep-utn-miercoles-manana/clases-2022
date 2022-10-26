import Nave.*

object troll {
	method jugadorVotado() {
		return nave.jugadorNoSospechoso()
	}
}

object detective {
	method jugadorVotado() {
		return nave.jugadorMasSospechoso()
	}
}

object materialista {
	method jugadorVotado() {
		return nave.jugadorSinItems()
	}
}