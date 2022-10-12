// Herencia simple

class Persona {
	const property factor

	const enfermedades = []

	var temperatura
	var cantidadCelulas
	
	method contraerEnfermedad(unaEnfermedad) {
		enfermedades.add(unaEnfermedad)
	}
	
	method tieneEnfermedad(unaEnfermedad) {
		return enfermedades.contains(unaEnfermedad)
	}
	
	method vivirUnDia() {
		enfermedades.forEach({ enfermedad => enfermedad.afectarA(self) })
	}
	
	method subirTemperatura(unosGrados) {
		temperatura = 45.min(temperatura + unosGrados)
	}
	
	method bajarCantidadCelulas(unaCantidadDeCelulas) {
		cantidadCelulas = 0.max(cantidadCelulas - unaCantidadDeCelulas)
	}
	
	method cantidadDeCelulasAmenazadasPorEnfermedadesAgresivas() {
		return self.enfermedadesAgresivas().sum({ unaEnfermedad => unaEnfermedad.celulasAmenazadas() })
	}
	
	method enfermedadesAgresivas() {
		return enfermedades.filter({ unaEnfermedad => unaEnfermedad.esAgresivaPara(self) })
	}
	
	method enfermedadMasPeligrosa() {
		return enfermedades.max({ unaEnfermedad => unaEnfermedad.cantidadCelulasAmenazantes() })
	}
	
	method estaEnComa() {
		return temperatura == 45 || cantidadCelulas < 1000000
	}
	
	method cantidadDeEnfermedades() {
		return enfermedades.size()
	}
	
	method cantidadCelulas() {
		return cantidadCelulas
	}
	
	method tomarMedicamento(unaCantidad) {
		enfermedades.forEach({ unaEnfermedad => unaEnfermedad.atenuar(unaCantidad) })
		enfermedades.removeAllSuchThat({ unaEnfermedad => unaEnfermedad.estaCurada() })
	}
	
	method morite() {
		temperatura = 0
	}
	
	method donarA(unaPersona, unasCelulas) {
		self.validarDonacion(unaPersona, unasCelulas)
		self.bajarCantidadCelulas(unasCelulas)
		unaPersona.aumentarCantidadCelulas(unasCelulas)		
	}
	
	method validarDonacion(unaPersona, unasCelulas) {
		if (! self.puedeDonarA(unaPersona, unasCelulas)) {
			throw new Exception(message = "No se pudo realizar la donación")
		}
	}
	
	method aumentarCantidadCelulas(unasCelulas) {
		cantidadCelulas += unasCelulas
	}
	
	method puedeDonarA(unaPersona, unasCelulas) {
		return self.esCompatibleCon(unaPersona) && self.puedeDonar(unasCelulas)
	}
	
	method puedeDonar(unasCelulas) {
		return unasCelulas <= cantidadCelulas / 4 && unasCelulas >= 500 
	}
	
	method esCompatibleCon(unaPersona) {
		return factor.puedeDonarA(unaPersona.factor())
	}
}

class Medico inherits Persona {
	var dosis
  
	override method contraerEnfermedad(unaEnfermedad) {
		super(unaEnfermedad)
		self.atenderA(self)
	}
  
	method atenderA(unaPersona) {
		unaPersona.tomarMedicamento(dosis * 15)
	}
}

class JefeDeDepartamento inherits Medico(dosis = 0) {
	
	const subordinados = #{}
	
	override method atenderA(unaPersona) {
		subordinados.anyOne().atenderA(unaPersona)
	}
}


