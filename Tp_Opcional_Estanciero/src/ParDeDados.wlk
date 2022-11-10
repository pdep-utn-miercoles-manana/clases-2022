object parDeDados {
	
	var dado1
	var dado2
	
	method tirar() {
		dado1 = self.tirarUnDado()
		dado2 = self.tirarUnDado()
		return dado1 + dado2
	}
	
	method ultimoTiroFueDoble() {
		return dado1 == dado2
	}
	
	method tirarUnDado() {
		return 1.randomUpTo(7)
	}
	
}
