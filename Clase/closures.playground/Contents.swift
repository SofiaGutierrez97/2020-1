import UIKit

//CLOSURE
//bloque de código qu puede ser almacenado y puede pasarse por cualquier parte del codigo
let imprimirClosure = { ( ) -> Void in
    print("no tiene parametros ni retorno")
}

//tiene parametro, pero no tiene retorno
let imprimirClosure1 = { (String: String) -> Void in
    print(String)
}

//tiene parametro y retorno
let imprimirClosure2 = { (String: String) -> String in
    print(String)
    return String
}

/*
 
 ESTRUCTURA DE CLOSURE
 
 let variableParaAlmacenarClosure = {(parámetros) -> retorno in
    código
    return
 }
 
 */


//funcion para calcular promedio
func promedio(ComputoMovil materiaUno: Double, Seguridad materiaDos: Double, Distribuidos materiaTres: Double) -> Double{
    return (materiaDos + materiaUno + materiaTres)/3
}

//closure para calcular promedio
let promedioClosure = {(materiaUno: Double, materiaDos: Double, materiaTres: Double) -> Double in
    return (materiaDos + materiaUno + materiaTres)/3
}

//un closure puede pasarse como parametro y ser retorno de una funcion
print("Mi promedio es \(promedioClosure(10, 10, 9))")

//propeiedades de closures
/*
arreglo de arreglos
filtar arreglos
*/

//Sort en closure como propiedad
var voluntarios = [1, 3, 40, 77, 13, 34, 2, 56]
voluntarios.sort()

let acomodarVoluntarios = voluntarios.sort{(primerElemento: Int, segundoElemento: Int) -> Bool in
    
    return primerElemento < segundoElemento
}





//USO DE LA PROPIEDAD MAP
let names = ["h", "j", "k", "kjiji", "Jook"]

//variable para meter los nombres completos
var fullNames:[String] = []

//funcion en la que salen los nombres completos
for name in names{
    let fullName = name + " Smith"
    fullNames.append(fullName)
}

//COn closure
let fullNamesClosure = names.map { (name)-> String in
    return name + " Smith"
}

//closure resumido
let fullNamesClosureResumido = names.map { $0 + " Smith"}

//USO DE LA PROPIEDAD FILTER
let num = [2, 3, 6, 28, 74, 45, 97]
var menosDe20: [Int] = []
//con funcion
for numero in num{
    if numero < 20 {
        menosDe20.append(numero)
    }
}
//Con closure
let numerosMenoresDe20 = num.filter{ $0 < 20 }
print(numerosMenoresDe20)


//USO DE LA PROPIEDAD REDUCE

