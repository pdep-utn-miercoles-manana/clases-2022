// Un objeto es una cosa que sabe hacer cosas por nosotres

// WKO (Well Known Object)
object poroto {
  var energia = 100       // Estado
  const raza = "Salchicha"
  
  method ladrido() {      // 
    return "Guau!"        // Método
  }                       //
  
  method salirAPasear() {
    //energia = energia - 20
    energia -= 20
  }

  method raza() { // Getter
    return raza
  }
  
  method energia() { // Getter
    return energia 
  }
  
  method energia(unaEnergia) { // Setter
    energia = unaEnergia
  }
  
  method comer(unaCantidadDeComida) {
    energia += unaCantidadDeComida
  }
  
  method hacerRutina() {
    self.comer(10)
    self.salirAPasear()
  }
}

object sally {
  var energia = 100       // Estado
  const raza = "Salchicha"
  
  method ladrido() {      // 
    return "Wow!"         // Método
  }                       //
  
  method salirAPasear() {
    //energia = energia - 20
    energia -= 20
  }

  method raza() { // Getter
    return raza
  }
  
  method energia() { // Getter
    return energia 
  }
  
  method energia(unaEnergia) { // Setter
    energia = unaEnergia
  }
}

// Clasificacion de métodos

// Métodos que devuelven     / Preguntas / convencion de nombres: sustantivos
// Métodos que tienen efecto / Órdenes   / convencion de nombres: infinitivo


// unObjeto.unMensaje()

//poroto.ladrar()
//       ^^^^^^
//       Mensaje


// == -> comparacion por igualdad
// === -> comparacion por identidad

// interfaz: el conjunto de mensajes que entiende un objeto