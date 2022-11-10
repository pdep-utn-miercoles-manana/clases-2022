import Tablero.*
import Propiedad.*

class Empresa inherits Propiedad {
	method sosEmpresa() {
		return true
	}
	
	method rentaPara(unJugador) {
		return 30000 * self.duenio().cantidadEmpresas() * unJugador.tirarDados()
	}
	
	method cumpleCriterioDeCompraImperialista(unJugador) {
		return tablero.todasLasEmpresasSonPropiedadDelBanco()
	}

	method cumpleCriterioDeCompraGarca(unJugador) {
		return tablero.otroJugadorEsDuenio(unJugador)
	}	
}
