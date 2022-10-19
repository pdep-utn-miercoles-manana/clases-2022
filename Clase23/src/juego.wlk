class Juego {
  const property nombre
  const categoria
  const precio

	method esDeCategoria(unaCategoria) {
	  return categoria.equals(unaCategoria)
	}
	
	method seLlama(unNombre) {
	  return nombre == unNombre
	}
	
	method esBarato() {
	  return precio < 30
	}
}

class JuegoViolento inherits Juego {
  method afectarA(unUsuario, unasHoras) {
    unUsuario.reducirHumor(unasHoras * 10)
  }
}

class JuegoMOBA inherits Juego {
  method afectarA(unUsuario, _unasHoras) {
    unUsuario.comprarSkins()
  }
}

class JuegoDeTerror inherits Juego {
  method afectarA(unUsuario, _unasHoras) {
    unUsuario.tirarTodoAlCarajo()
  }
}

class JuegoEstrategico inherits Juego {
  method afectarA(unUsuario, unasHoras) {
    unUsuario.aumentarHumor(unasHoras * 5)
  }
}

// Herencia
// Estática
// Sólo permite implementar un tipo
// +++ fácil

// vs.

// Composicion
// Dinámica
// Permite implementar múltiples tipos
// --- dificil
