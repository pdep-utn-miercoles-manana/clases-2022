import Emocion.alegria

class Recuerdo {
	
	const property descripcion
	const property fecha
	const property emocion
	
	method esDificilDeExplicar() {
		return self.cantidadDePalabras() > 10
	}
	
	method cantidadDePalabras() {
		return self.palabras().size()
	}
	
	method esAlegre() {
		return emocion.esAlegre()
	}
	
	method tiene(unaPalabra) {
		return self.palabras().contains(unaPalabra)
	}
	
	method palabras() {
		return descripcion.words()
	}
	
	method esAntiguoPara(unAnio) {
		return new Date().year() - fecha.year() > unAnio / 2
	}
}
