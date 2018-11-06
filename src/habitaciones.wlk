import personas.*

class Habitacion {
	const listaOcupantes = #{}
	
	method agregarOcupante(persona) {
		listaOcupantes.add(persona)
	}
	method desAgregarOcupante(persona) {
		listaOcupantes.remove(persona)
	}
	
	method nivelDeConfort(persona) {
		return 10 + self.nivelDeConfortExtra(persona)
	}
	method nivelDeConfortExtra(persona) 
	
	
	method estaVacia() {
		return listaOcupantes.size() < 1
	}
	
	method ocuparHabitacion(persona) {
		if (self.estaVacia()) {self.agregarOcupante(persona)
		}else if (self.condicionIngresoExtra(persona))
				{self.agregarOcupante(persona)			
		}else{
			 self.error("No puede entrar")
		}
		
	}
	
	method condicionIngresoExtra(persona)
	
}


class UsoGeneral inherits Habitacion {
	override method nivelDeConfortExtra(persona) {
		return 0
	}
}


class Banio inherits Habitacion {
	override method nivelDeConfortExtra(persona) {
		if (persona.edad() <= 4) {
			return 2
		} else {
			return 4
		}
	}
	
	override method condicionIngresoExtra(persona) {
		listaOcupantes.any ({p => p.edad() <= 4})
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
	
	override method nivelDeConfortExtra(persona) {
		if (self.esDuenio(persona)) {
			return (10 / duenios.size())
		}else {
			return 0
		}		
	}

	method esDuenio(persona) {	
		return duenios.contains(persona)	
	}
	
	override method condicionIngresoExtra(persona) {
		return self.esDuenio(persona) or
			(listaOcupantes.size()) == (duenios.size())	

	}

}


class Cocina inherits Habitacion {
	override method nivelDeConfortExtra(persona) {
	if (persona.habilidadDeCocina()) {
			return (metrosCuadradoCocina.metrosCuadrados() * 0.1)
		}else{
			return 0
		}	
	}

}



object metrosCuadradoCocina {
	var property metrosCuadrados = 20	
	
}

