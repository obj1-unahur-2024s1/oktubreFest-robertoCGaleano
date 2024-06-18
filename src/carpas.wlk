import MarcasYJarras.*
import personas.*

class Carpa{
	
	const property limiteGente
	const property tieneBanda
	const property marcaQueVende
	
	const property personasAdentro=[]
	
	method puedeEntrar(unaPersona){
		return personasAdentro.Size() < limiteGente and not unaPersona.estaEbria()
	}
	
	method ingresarA(unaPersona){
		self.personasAdentro().add(unaPersona)
	}
	
	method servirJarraA(unaPersona, litros){
		if(not personasAdentro.contain(unaPersona)){
			self.error("la persona no esta en la carpa")
		}
		unaPersona.comprarJarra(new Jarra(capacidad= litros, marcaCerveza= marcaQueVende))
	}
	
	method cantEbriosEmpedernidos()=
		personasAdentro.count({p=> p.comproSoloJarrasDe1Lts() and p.estaEbria()})
}
