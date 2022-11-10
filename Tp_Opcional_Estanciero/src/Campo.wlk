import Banco.*
import Propiedad.*

class Campo inherits Propiedad {
	var cantidadEstancias = 0
			
	const provincia
	const valorRentaFijo
	const costoConstruccionEstancia
	
	method agregarEstancia() {
		provincia.validarConstruccionDeEstancia(self)
		duenio.pagarA(banco, costoConstruccionEstancia)
		cantidadEstancias++
	}
	
	method cantidadDeEstancias() {
		return cantidadEstancias
	}
	
	method sosEmpresa() {
		return false
	}
	
	method rentaPara(unJugador) {
		return 2 ** cantidadEstancias * valorRentaFijo
	}
	
	method cumpleCriterioDeCompraImperialista(unJugador) {
		return provincia.esMismoDuenio(banco) or provincia.esDuenioDeAlgunCampo(unJugador) 
	}
		
	method cumpleCriterioDeCompraGarca(unJugador) {
		return provincia.otroJugadorEsDuenio(unJugador)
	}
	
	override method hipotecarPara(unJugador) {
		super(unJugador)
		unJugador.cobrar(cantidadEstancias * costoConstruccionEstancia / 2)
	}
}
