class Persona {
	
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
	
}