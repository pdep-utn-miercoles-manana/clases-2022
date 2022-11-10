import Banco.*
import Prision.*
import ParDeDados.*
import EstadoDeLibertad.*
import EstrategiaDeCompra.*

class Jugador {
	var dinero = 5000
	var estadoDeLibertad = libre

	var property casilleroActual
	var property estrategiaDeCompra = standard
	var property cantidadDeTirosDoblesSeguidos = 0
	
	const propiedades = []
	
	method cantidadEmpresas() {
		return propiedades.count { propiedad => propiedad.sosEmpresa() }
	}
	
	method pagarA(unAcreedor, unMonto) {
		self.validarDineroDisponible(unMonto)
		unAcreedor.cobrar(unMonto)
		self.pagar(unMonto)
	}
	
	method validarDineroDisponible(unMonto) {
		if (dinero < unMonto) {
			self.hipotecar()
		}
	}
	
	method hipotecar() {
		const propiedad = propiedades.findOrElse(
			{ propiedad => propiedad.puedeHipotecarse() },
			{ throw new DomainException(message = "Dinero insuficiente") }
		)
		propiedad.hipotecarPara(self)
	}
	
	method cobrar(unMonto) {
		dinero += unMonto
	}

	method pagar(unMonto) {
		dinero -= unMonto
	}
	
	method tirarDados() {
		return parDeDados.tirar() 
	}
	
	method cayoEn(unaPropiedad, unJugador) {
		unJugador.pagarA(self, unaPropiedad.rentaPara(unJugador))
	}
	
	method comprarPropiedad(unaPropiedad) {
		if (estrategiaDeCompra.puedoComprar(unaPropiedad, self)){
			self.pagarA(banco, unaPropiedad.precioCompra())
			self.agregarPropiedad(unaPropiedad)
		}
	}
	
	method agregarPropiedad(unaPropiedad) {
		propiedades.add(unaPropiedad)
		unaPropiedad.teComproElJugador(self)
	}
	
	method moveteSobre(unosCasilleros) {
		estadoDeLibertad.moverSobre(unosCasilleros, self)
	}

	method pasarPorTodosMenosElUltimo(unosCasilleros) {
		const casillerosAPasar = unosCasilleros.reverse().drop(1).reverse()
		casillerosAPasar.forEach { casillero => casillero.paso(self) }
	}
	
	method caerEn(unCasillero) {
		unCasillero.cayo(self)
		casilleroActual = unCasillero
	}
	
	method verificarCambioDeEstado() {
		if (parDeDados.ultimoTiroFueDoble()) {
			self.incrementarCantidadDeTirosDoblesSeguidos()
		} else {
			self.resetearCantidadDeTirosDoblesSeguidos()
		}
	}
	
	method resetearCantidadDeTirosDoblesSeguidos() {
		cantidadDeTirosDoblesSeguidos = 0
	}
	
	method incrementarCantidadDeTirosDoblesSeguidos() {
		cantidadDeTirosDoblesSeguidos ++
		estadoDeLibertad.sacoDoble(self)
	}
	
	method marchePreso() {
		self.resetearCantidadDeTirosDoblesSeguidos()
		self.caerEn(prision)
		estadoDeLibertad = new Preso()
	}
	
	method liberate() {
		self.resetearCantidadDeTirosDoblesSeguidos()
		estadoDeLibertad = libre
	}
}
