import Salud.*

class Ninio {
	
	var actitud
	var cantidadDeCaramelos = 0

	var salud = sano
		
	const property elementos = []
	
	method capacidadDeAsustar() {
		return self.sumatoriaSustoDeElementos() * self.actitud()
	}
	
	method sumatoriaSustoDeElementos() {
		return elementos.sum { elemento => elemento.cantidadDeSusto() }
	}
	
	method actitud() {
		return salud.actitud(actitud)
	}
	
	method intentarAsustar(unAdulto) {
		unAdulto.serAsustadoPor(self)
	}
	
	method recibirCaramelos(unaCantidad) {
		cantidadDeCaramelos += unaCantidad
	}
	
	method cantidadDeCaramelos() {
		return cantidadDeCaramelos
	}
	
	method comer(unaCantidadDeCaramelos) {
		self.validarCantidadDeCaramelosSuficientes(unaCantidadDeCaramelos)
		salud.comer(self, unaCantidadDeCaramelos)
		cantidadDeCaramelos -= unaCantidadDeCaramelos
	}
	
	method validarCantidadDeCaramelosSuficientes(unaCantidadDeCaramelos) {
		if (cantidadDeCaramelos < unaCantidadDeCaramelos) {
			throw new Exception(message = "No tenes suficientes caramelos")
		}
	}
	
	method empachate() {
		salud = empachado
	}

	method enfermate() {
		salud = enCama
	}	
}