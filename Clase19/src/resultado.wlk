object bonoResultadoNada {
	method valor(_unEmpleado) {
		return 0
	}
}

object bonoResultadoFijo {
	method valor(_unEmpleado) {
		return 80
	}
}

object bonoResultadoPorcentual {
	method valor(unEmpleado) {
		return unEmpleado.neto() * 0.10
	}
}