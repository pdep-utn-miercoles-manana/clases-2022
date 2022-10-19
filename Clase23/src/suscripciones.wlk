object premium {
	method permiteJugar(unJuego) {
	  return true
	}
	
	method costo() = 50
}

object base {
  method permiteJugar(unJuego) {
    return unJuego.esBarato()
  }
  
  method costo() {
    return 25
  }
}

class SuscripcionCategorica {
  const property categoria
  const property costo
  
  method permiteJugar(unJuego) {
    return unJuego.esDeCategoria(categoria)
  }
}

const prueba = new SuscripcionCategorica(categoria = "Demo", costo = 0)
const infantil = new SuscripcionCategorica(categoria = "Infantil", costo = 10)