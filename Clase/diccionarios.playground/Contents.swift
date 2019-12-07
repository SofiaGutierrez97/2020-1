import UIKit

struct Pagina{
    var tipoDeLetra: String
    var tamaño: Int
}

struct Libro{
    var numeroDePaginas: Int
    var titulo: String
    var paginas: [Pagina]
}


var paginasDeLibro = [Pagina(tipoDeLetra: "Arial", tamaño: 12), Pagina(tipoDeLetra: "Baskerville", tamaño: 6)]







//Diccionarios
var scores = ["manuel":10, "lupe":8]

//inicializcion de diccionarios vacios
var diccionarioVacio = [String: Int]()
var diccionarioVacio2 = Dictionary<String, Int>()
var diccionarioVacio3 : [String: Int] = [:]

//aceder a cada elemento, no necesito saber su posicion
scores["manuel"]

//cambio de valores del diccionario
scores.updateValue(6, forKey: "lupe")
scores["lupe"]

//para verificar un valor que no sabemos si esta o no en el diccionario
if let score = scores["pedro"]{
    print(score)
}else{
    print("No hay elemento")
}
