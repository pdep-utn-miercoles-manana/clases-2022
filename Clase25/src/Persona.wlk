import Recuerdo.*
import ProcesoMental.*

class Persona {

	const recuerdosDelDia = []
	const procesosMentales = []
	const memoriaLargoPlazo = []

	var pensamientoActual	
	var pensamientosCentrales = []

	var edad		
	var emocionDominante
	var nivelDeFelicidad = 1000

	method vivirUnEvento(unaDescripcion) {
		const unRecuerdo = new Recuerdo(descripcion = unaDescripcion, fecha = new Date(), emocion = emocionDominante)
		recuerdosDelDia.add(unRecuerdo)
	}
	
	method asentarRecuerdo(unRecuerdo) {
		emocionDominante.asentarRecuerdo(self, unRecuerdo)
	}
	
	method esFeliz() {
		return nivelDeFelicidad > 500
	}
	
	method agregarPensamientoCentral(unRecuerdo) {
		pensamientosCentrales.add(unRecuerdo)
	}
	
	method disminuirCoeficienteDeFelicidad(unPorcentaje) {
		nivelDeFelicidad = nivelDeFelicidad - nivelDeFelicidad * unPorcentaje / 100
		self.validarNivelDeFelicidad()
	}
	
	method validarNivelDeFelicidad() {
		if (nivelDeFelicidad < 1) {
			throw new DomainException(message = "Nivel de felicidad menos a 1")
		}
	}
	
	method recuerdosRecientes() {
		return recuerdosDelDia.reverse().take(5)
	}

	method pensamientosCentralesDificilesDeExplicar() {
		return pensamientosCentrales.filter { recuerdo => recuerdo.esDificilDeExplicar() }
	}
	
	method esRecuerdoNegado(unRecuerdo) {
		return emocionDominante.esNegado(unRecuerdo)
	}
	
	method dormir() {
		self.validarProcesosMentales()
		procesosMentales.forEach { procesoMental => procesoMental.apply(self) }
	}
	
	method validarProcesosMentales() {
		if (procesosMentales.contains(liberarRecuerdosDelDia)) {
			procesosMentales.remove(liberarRecuerdosDelDia)
			procesosMentales.add(liberarRecuerdosDelDia)
		}
	}
	
	method asentarRecuerdosDelDia() {
		self.asentarRecuerdos(recuerdosDelDia)
	}
	
	method asentarRecuerdosQueTengan(unaPalabra) {
		self.asentarRecuerdos(recuerdosDelDia.filter { recuerdo => recuerdo.tiene(unaPalabra) })
	}
	
	method asentarRecuerdos(unosRecuerdos) {
		unosRecuerdos.forEach { recuerdo => self.asentarRecuerdo(recuerdo) }
	}
	
	method profundizarRecuerdos() {
		self.recuerdosProfundizables().forEach { recuerdo => self.profundizar(recuerdo) }
	}
	
	method recuerdosProfundizables() {
		return recuerdosDelDia.filter { recuerdo => self.esProfundizable(recuerdo) }
	}
	
	method profundizar(unRecuerdo) {
		memoriaLargoPlazo.add(unRecuerdo)
	}

	method esProfundizable(unRecuerdo) {
		return not self.esPensamientoCentral(unRecuerdo) and not self.esRecuerdoNegado(unRecuerdo)
	}
	
	method esPensamientoCentral(unRecuerdo) {
		return pensamientosCentrales.contains(unRecuerdo)
	}
	
	method puedeDesequilibrase() {
		return self.algunPensamientoCentralEstaProfundizado() or self.tienenLaMismaEmocionDominante()
	}
	
	method tienenLaMismaEmocionDominante() {
		const emocion = recuerdosDelDia.anyOne().emocion()
		return recuerdosDelDia.all { recuerdo => recuerdo.esEmocion(emocion) }
	}

	method algunPensamientoCentralEstaProfundizado() {
		return pensamientosCentrales.any { recuerdo => memoriaLargoPlazo.contains(recuerdo) }
	}
	
	method desequilibrate() {
		self.disminuirCoeficienteDeFelicidad(15)
		self.perderPensamientosCentralesMasAntiguos()
	}
	
	method pensamientosCentrales() {
		return pensamientosCentrales.asSet()
	}
	
	method perderPensamientosCentralesMasAntiguos() {
		pensamientosCentrales = pensamientosCentrales
		                            .sortedBy { r1, r2 => r1.fecha() < r2.fecha() }
		                            .drop(3)
	}
	
	method aumentarNivelDeFelicidad(unaCantidad) {
		nivelDeFelicidad = 1000.min(nivelDeFelicidad + unaCantidad)
	}
	
	method liberarRecuerdos() {
		recuerdosDelDia.clear()
	}
	
	method rememorar() {
		pensamientoActual = self.pensamientosAntiguos().anyOne()
	}
	
	method pensamientosAntiguos() {
		return memoriaLargoPlazo.filter { recuerdo => recuerdo.esAntiguoPara(edad) }
	}
	
}
