import categoria.*
import resultado.*
import presentismo.*

object pepe {
	var categoria = cadete
	
	var faltas = 0	
	var bonoPresentismo = bonoPresentismoNada
	
	var bonoResultado = bonoResultadoNada
	
	method sueldo() {
		return self.neto() + self.bonoPresentismo() + self.bonoResultado()
	}
	
	method neto() {
		return categoria.neto()
	}
	
	method bonoPresentismo() {
		return bonoPresentismo.valor(faltas)
	}

	method bonoResultado() {
		return bonoResultado.valor(self)
	}

	method bonoPresentismo(unBonoPresentismo) {
		bonoPresentismo = unBonoPresentismo
	}

	method bonoResultado(unBonoResultado) {
		bonoResultado = unBonoResultado
	}
	
	method categoria(unaCategoria) {
		categoria = unaCategoria
	}
	
	method faltas(unasFaltas) {
		faltas = unasFaltas
	}
}
