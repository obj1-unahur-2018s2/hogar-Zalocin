import personas.*

class Habitacion {



	method nivelDeConfort(persona) {
		return 10
	}

}


class UsoGeneral inherits Habitacion {

}


class Banio inherits Habitacion {
	override method nivelDeConfort(persona) {
		if (persona.edad() <= 4) {
			return super(persona) + 2
		} else {
			return super(persona) + 4
		}
	}

}


class Dormitorio inherits Habitacion {
	const duenios = #{}

	method agregarDuenio(persona) {
		duenios.add(persona)
	}

	method quitarDuenio(persona) {
		duenios.remove(persona)
	}
	
	override method nivelDeConfort(persona) {
		if (self.esDuenio(persona)) {
			return super(persona) + (10 / duenios.size())
		}else {
			return super(persona)
		}		
	}

	method esDuenio(persona) {	
		return duenios.contains(persona)	
	}

}

