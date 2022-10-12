object factorA {	
	method puedeDonarA(otroFactorSanguineo) {
		return [self, factorR].contains(otroFactorSanguineo)
	}
}

object factorR {	
	method puedeDonarA(otroFactorSanguineo) {
		return otroFactorSanguineo == self
	}
}

object factorO {	
	method puedeDonarA(otroFactorSanguineo) {
		return true
	}
}
