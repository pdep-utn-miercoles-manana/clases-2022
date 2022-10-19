import suscripciones.prueba
import suscripciones.infantil

class Usuario {
	var suscripcion
	var plata
	var humor
	
	method actualizarSuscripcion(unaSuscripcion) {
	  suscripcion = unaSuscripcion
	}
	
	method pagarSuscripcion() {
	  if(self.leAlcanzaParaPagar(suscripcion.costo())){
	    plata -= suscripcion.costo()
	  } else {
	    self.actualizarSuscripcion(prueba)
	  }
	}

  method leAlcanzaParaPagar(unaCantidad) {
    return plata > unaCantidad
  }
  
  method jugar(unJuego, unasHoras) {
    if(!self.puedeJugar(unJuego)) throw new Exception(message = "No puedo jugar ese juego!")

    unJuego.afectarA(self, unasHoras)
  }
  
  method puedeJugar(unJuego) {
    return suscripcion.permiteJugar(unJuego)
  }
  
  method reducirHumor(unaCantidad) {
    humor -= unaCantidad
  }
  
  method comprarSkins() {
    if(!self.leAlcanzaParaPagar(30)) throw new Exception(message = "No me alcanza la plata!")
    plata -= 30
  }
  
  method tirarTodoAlCarajo() {
    self.actualizarSuscripcion(infantil)
  }
  
  method aumentarHumor(unaCantidad) {
    humor += unaCantidad
  }
}
