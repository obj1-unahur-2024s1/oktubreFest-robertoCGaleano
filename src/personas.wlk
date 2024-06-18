import MarcasYJarras.*

class Persona{
	
	var peso
	const property jarrasCompradas=#{}
	var property leGustaLaMusica= true
	const property nivelDeAguante
	const property nacionalidad
	
	method peso()=peso
	method leGustanLasCervezas(unaMarca)
	
	method comprarJarra(unaJarra){
		jarrasCompradas.add(unaJarra)
	}
	method totalAlcoholIngerido()=
		jarrasCompradas.sum({j=> j.contenidoAlcohol()})
		
	method estaEbria()= self.totalAlcoholIngerido()* self.peso() > self.nivelDeAguante()
	
	method quiereEntrarA(unaCarpa)=
		self.leGustanLasCervezas(unaCarpa.marcaQueVende()) and
		(self.leGustaLaMusica() == unaCarpa.tieneBanda())
	
	method puedeEntrarA(unaCarpa){
		return self.quiereEntrarA(unaCarpa) and unaCarpa.puedeEntrar(self)
	}
	
	method ingresarA(unaCarpa){
		if(not self.puedeEntrarA(unaCarpa)){
			self.error("no puede ingresar")
		}
		unaCarpa.ingresarA(self)
	}
	
	method comproSoloJarrasDe1Lts(){
		return jarrasCompradas.all({j=> j.capacidad() >=1})
	}
	
	method esPatriota()=
		jarrasCompradas.all({j=> j.paisCerveza() == self.nacionalidad()})
		
	method marcaDeJarrasCompradas() {
    	return jarrasCompradas.map({c => c.marcaCerveza()}).asSet()
    }
}

class Belga inherits Persona{
	
	override method leGustanLasCervezas(unaMarca)=
		unaMarca.lupulo() > 4	
}
class Checo inherits Persona{
	
	override method leGustanLasCervezas(unaMarca)=
		unaMarca.graduacion() > 8		
}
class Aleman inherits Persona{
	
	override method leGustanLasCervezas(unaMarca)= true
	
	override method quiereEntrarA(unaCarpa)= super(unaCarpa) and unaCarpa.personasAdentro().size()%2==0
}