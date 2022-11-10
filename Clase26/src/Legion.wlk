class Legion {
	const miembros = []
	
	method intentarAsustar(unAdulto) {
		unAdulto.serAsustadoPor(self)
	}
	
	method capacidadDeAsustar() {
		return miembros.sum { miembro => miembro.capacidadDeAsustar() }
	}
	
	method cantidadDeCaramelos() {
		return miembros.sum { miembro => miembro.cantidadDeCaramelos() }		
	}
	
	method recibirCaramelos(unaCantidad) {
		self.lider().recibirCaramelos(unaCantidad)
	}
	
	method lider() {
		return miembros.max { miembro => miembro.capacidadDeAsustar() }
	}
}

object legionesBuilder {
	method crearLegion(unosMiembros) {
		self.validarMiembros(unosMiembros)
		return new Legion(miembros = unosMiembros)
	}
	
	method validarMiembros(unosMiembros) {
		if (unosMiembros.size() < 2) {
			throw new Exception(message = "Una legion no puede tener menos de 2 miembros")
		}
	}
}
