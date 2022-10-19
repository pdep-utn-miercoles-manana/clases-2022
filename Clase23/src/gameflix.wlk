import juego.Juego

object gameflix {
  const juegos = #{
    new Juego(nombre = "Fortnite", categoria = "Battle Royale", precio = 0),
    new Juego(nombre = "The Witcher 3 - Wild Hunt", categoria = "Acción", precio = 300)
  }
  
  const usuarios = #{}
  
  method agregarJuego(unJuego) {
    juegos.add(unJuego)
  }
  
	method juegosDeCategoria(unaCategoria) {
	  return juegos.filter({ unJuego => unJuego.esDeCategoria(unaCategoria) })
	}
	
	method juegoQueSeLlama(unNombre) {
	  return juegos.findOrElse({ unJuego => unJuego.seLlama(unNombre) }, { throw new Exception(message = "No hay un juego que se llame así!") })
	}
	
	method juegoRecomendado() {
	  return juegos.asList().anyOne()
	}
	
  method cobrarSuscripciones() {
    usuarios.forEach({ unUsuario => unUsuario.pagarSuscripcion() })
  }
}
