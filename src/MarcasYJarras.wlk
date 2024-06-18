class Cerveza{
	const property lupulo
	const property paisFabricacion
	
	method graduacion()
}

class Rubia inherits Cerveza{
	var graduacion
	
	override method graduacion()= graduacion
}

class Negra inherits Cerveza{
	
	override method graduacion()= graduacionReglamentaria.graduacion().min(lupulo *2)
}

class Roja inherits Negra{
	
	override method graduacion()= super() * 1.25
}

class Corona inherits Rubia{
}
class Guiness inherits Negra{
}
class Hofbrau inherits Roja{
}

class Jarra {
	const property capacidad
	var property marcaCerveza
	
	method contenidoAlcohol()=
		capacidad * (marcaCerveza.graduacion()/100)
		
	method paisCerveza()= self.marcaCerveza().paisFabricacion()
}

object graduacionReglamentaria{
	var property graduacion = 8.04
}