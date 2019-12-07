import UIKit

class Alumno{
    var numCuenta: String
    var nombre: String
    
    init (numCuenta: String, nombre:String){
        self.numCuenta = numCuenta
        self.nombre = nombre
    }
    func leer(){
        print("leyendo")
    }
}


//los dos puntos significan herencia
class Ingeniero: Alumno{
    var carreraIngenieria: String
    //constructor inicializador para la caracteritica que tiene la clase y no heredo de la superclase
    init(carreraIngenieria: String, numCuenta: String, nombre: String){
        self.carreraIngenieria = carreraIngenieria
        super.init(numCuenta: numCuenta, nombre: nombre)
    }
    
    //sobreescribo metodo
    override func leer(){
        print("leer como ingeniero")
    }
    
    func EcuacionesDiferenciales( ){
        print("Ecuaciones Diferenciales")
    }
}

let sofia = Ingeniero(carreraIngenieria: "Computacion", numCuenta: "313058147", nombre: "Sofia" )


//en swift no existe la herencia multiple
//para heredar de mas de una clase se usan PROTOCOLOS
//una relaciòn en que una clase usa y una clase da o presta una metodos
//los metodos del protocolo no necesitan tener cuerpo



//los metodos del protocol siempre deben ser implementados
protocol CursoExterno{
    func ecDiferenciales()
}

class Derecho: Alumno, CursoExterno{
    func ecDiferenciales(){
        print("APRENDIENDO ecs diferenciales")
    }
}



let armin = Derecho(numCuenta: "0000", nombre: "Armin")
armin.ecDiferenciales()

//poliformismo por herencia es que ambos tengan el mismo metodo pero hgan diferentes cosas
sofia.leer()
armin.leer()

//pueden convivir en el mismo arreglo porque son del mismo padre, aunque no sean de la misma clase
var alumnos = [sofia, armin]
for alumno in alumnos{
    alumno.leer()
}
