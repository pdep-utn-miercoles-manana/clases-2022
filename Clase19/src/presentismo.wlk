object bonoPresentismoPorFaltas {
	method valor(unaCantidadFaltas) {
		if (unaCantidadFaltas == 0) {
			return 100
		} else if (unaCantidadFaltas == 1) {
			return 50
		} else {
			return 0
		}
	}
}

object bonoPresentismoNada {
	method valor(_unaCantidadFaltas) {
		return 0
	}
}