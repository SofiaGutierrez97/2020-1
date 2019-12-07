import UIKit

/*  struct es por valor
    class es por referencia
*/

struct Alumno{
    var nombre: String
    var edad: Int
    
    func estudiar(horas:Int){
        print("Estudia \(horas)")
    }
}
var pedro = Alumno(nombre: "Pedro", edad: 20)
pedro.nombre = "Pedrito"
pedro.estudiar(horas:4)

var otroPedro = Alumno(nombre:"Pedro", edad:28)
otroPedro.nombre = "Peter"



//CLASES
class Profesor{
    var nombre: String
    var edad: Int
    
    //Constructor
    init(nombre: String, edad:Int){
        self.nombre = nombre
        self.edad = edad
    }
}

let luis = Profesor (nombre: "Luis", edad: 20)
let sofia = luis
sofia.nombre = "Sofia"
luis.nombre





//OPTIONALS
var nombre: String? = nil
nombre = "Gerardo"
//print(nombre!)//aseguro que esa variable tiene algo

//OPTIONAL BINDING
if let respaldo = nombre {//si respaldo tiene algo
    print("Hay respaldo")//ejecuta
}else{
    print("No hay respaldo")//sino
}

//Nil cualescente
let nombreEjecutivo = nombre ?? "pepito" //si no hay nombre pone pepito, sino el nombre que puso
print (nombreEjecutivo)

//guard binding
func valida (cadena: String?){
    guard let nombre = cadena else{
        print("no llego nada")
        return
    }
    print("si llego algo")
}

valida(cadena: nombre)


