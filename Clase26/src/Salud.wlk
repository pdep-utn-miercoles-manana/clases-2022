
object sano {
	method comer(unNinio, unaCantidadDeCaramelos) {
		if (unaCantidadDeCaramelos > 10) {
			unNinio.empachate()
		}
	}
	
	method actitud(unaActitud) {
		return unaActitud
	}
}

object empachado {
	method comer(unNinio, unaCantidadDeCaramelos) {
		if (unaCantidadDeCaramelos > 10) {
			unNinio.enfermate()
		}
	}

	method actitud(unaActitud) {
		return unaActitud / 2
	}
}

object enCama {
	method comer(unNinio, unaCantidadDeCaramelos) {
		throw new Exception(message = "El ninio esta en cama y no puede comer caramelos")
	}

	method actitud(unaActitud) {
		return 0
	}
}
