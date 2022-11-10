class Barrio {
	const ninios = []
	
	method podioNiniosConMasCaramelos() {
		return self.niniosOrdenadosPorMayorCantidadDeCaramelos().take(3)
	}
	
	method niniosOrdenadosPorMayorCantidadDeCaramelos() {
		return ninios.sortedBy { ninio1, ninio2 => 
			ninio1.cantidadDeCaramelos() > ninio2.cantidadDeCaramelos()
		}
	}
	
	method elementosDeNiniosGlotones() {
		return self.niniosGlotones().flatMap { ninio => ninio.elementos() }
	}
	
	method niniosGlotones() {
		return ninios.filter { ninio => ninio.cantidadDeCaramelos() > 10 }
	}
}
