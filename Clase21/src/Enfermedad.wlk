class Enfermedad {
  var cantidadCelulasAmenazantes
  
  method cantidadCelulasAmenazantes() {
    return cantidadCelulasAmenazantes
  }
  
  method atenuar(unaCantidad) {
    cantidadCelulasAmenazantes -= unaCantidad
  }
  
  method estaCurada() {
    return cantidadCelulasAmenazantes <= 0
  }
  
  method afectarA(unaPersona)
  method esAgresivaPara(unaPersona)
}

class EnfermedadInfecciosa inherits Enfermedad {
	method reproducirse() {
		cantidadCelulasAmenazantes = cantidadCelulasAmenazantes * 2
	}
	
	override method afectarA(unaPersona) {
		unaPersona.subirTemperatura(cantidadCelulasAmenazantes / 1000)
	}
	
	override method esAgresivaPara(unaPersona) {
	  return cantidadCelulasAmenazantes > unaPersona.cantidadCelulas() * 0.1
	}
}

class EnfermedadAutoinmune inherits Enfermedad {
  var cantidadDeVecesQueSeReprodujo = 0
	
	override method afectarA(unaPersona) {
		unaPersona.bajarCantidadCelulas(cantidadCelulasAmenazantes)
		cantidadDeVecesQueSeReprodujo++
	}
	
	override method esAgresivaPara(unaPersona) {
    return cantidadDeVecesQueSeReprodujo > 30
  }
}