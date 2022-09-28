class EnfermedadInfecciosa {
	
	var cantidadCelulasAmenazantes
	
	method reproducirse() {
		cantidadCelulasAmenazantes = cantidadCelulasAmenazantes * 2
	}
	
	method cantidadCelulasAmenazantes() {
		return cantidadCelulasAmenazantes
	}
	
	method afectarA(unaPersona) {
		unaPersona.subirTemperatura(cantidadCelulasAmenazantes / 1000)
	}
}

class EnfermedadAutoinmune {
		
	var cantidadCelulasAmenazantes
	
	method afectarA(unaPersona) {
		unaPersona.bajarCantidadCelulas(cantidadCelulasAmenazantes)
	}
	
}