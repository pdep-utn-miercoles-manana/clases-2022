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

	method celulasAmenazadas() {
		return cantidadCelulasAmenazantes
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

class EnfermedadAutoinmune inherits Enfermedad { // Tiene Atributos, Tiene ESTADO o es Stateful

	var cantidadDeVecesQueSeReprodujo = 0

	override method afectarA(unaPersona) {
		unaPersona.bajarCantidadCelulas(cantidadCelulasAmenazantes)
		cantidadDeVecesQueSeReprodujo++
	}

	override method esAgresivaPara(unaPersona) {
		return cantidadDeVecesQueSeReprodujo > 30
	}

}

object laMuerte { // No tiene Atributos, No tiene ESTADO o es Stateless
	
	method afectarA(unaPersona) {
		unaPersona.morite()
	}

	method esAgresivaPara(unaPersona) {
		return true
	}
	
	method atenuar(unaCantidad) {
		// No hace nada
	}
	
	method estaCurada() {
		return false
	}
	
	method celulasAmenazadas() {
		return 0
	}
}

class EnfermedadAutoInfecciosa {
	var enfermedadInfecciosa
	var enfermedadAutoinmune

	method afectarA(unaPersona) {
		enfermedadInfecciosa.afectarA(unaPersona)
		enfermedadAutoinmune.afectarA(unaPersona)
	}

	method esAgresivaPara(unaPersona) {
		return enfermedadInfecciosa.esAgresivaPara(unaPersona) && 
		       enfermedadAutoinmune.esAgresivaPara(unaPersona)
	}
	
	method atenuar(unaCantidad) {
		enfermedadInfecciosa.atenuar(unaCantidad)
		enfermedadAutoinmune.atenuar(unaCantidad)
	}
	
	method estaCurada() {
		return enfermedadInfecciosa.estaCurada() && enfermedadAutoinmune.estaCurada()
	}
	
	method celulasAmenazadas() {
		return enfermedadInfecciosa.celulasAmenazadas() + enfermedadAutoinmune.celulasAmenazadas()
	}
}