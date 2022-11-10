class AdultoComun {
	var cantidadDeNiniosQueIntentaronAsustarme = 0
	
	method serAsustadoPor(unAsustador) {
		self.sumarIntentoDeSustoSiAplica(unAsustador)
		if (self.puedeAsustarte(unAsustador)) {
			unAsustador.recibirCaramelos(self.cantidadCaramelosADar())
		}
	}
	
	method sumarIntentoDeSustoSiAplica(unAsustador) {
		if (unAsustador.cantidadDeCaramelos() > 15) {
			cantidadDeNiniosQueIntentaronAsustarme++
		}
	}
	
	method puedeAsustarte(unAsustador) {
		return self.tolerancia() < unAsustador.capacidadDeAsustar()
	}
	
	method tolerancia() {
		return 10 * cantidadDeNiniosQueIntentaronAsustarme
	}
	
	method cantidadCaramelosADar() {
		return self.tolerancia() / 2
	}
}

class Abuelo inherits AdultoComun {
	override method puedeAsustarte(unAsustador) {
		return true
	}
	override method cantidadCaramelosADar() {
		return super() / 2
	}
}

class AdultoNecio {
	method serAsustadoPor(unAsustador) {
		// No hace nada
	}
}
