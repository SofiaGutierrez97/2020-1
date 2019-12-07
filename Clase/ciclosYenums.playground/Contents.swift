import UIKit

//For
for index in 1...5{
    print("hola \(index)")
}

for _ in 1...3{
    print("hola")
}

for _ in 0..<10{
    print("hola")
}

let nombres = ["Manu", "Grecia", "Armi"]
let nombre = [String]()

for i in nombres{
    print("\(i)")
}









//While
var numeroDeVidas = 3

while numeroDeVidas > 0 {
    print("Estoy vivo \(numeroDeVidas)")
    numeroDeVidas -= 1
}









//Enumeraciones
//asignan un valor a un numero limitado de opciones
//restringen a un numero de opciones
enum coordenadas{
    case norte
    case sur
    case este
    case oeste
}

print(coordenadas.norte)

enum comida{
    case sopa, carne, postre
}

print(comida.sopa)

var aDondeVoy: coordenadas = .norte

switch aDondeVoy {
case .norte:
    print("voy al norte")
case .sur:
    print("voy al sur")
case .este:
    print("voy al este")
case .oeste:
    print("voy al oeste")
default:
    print("no voy a ningun lugar")
}

var coordenada = coordenadas.este

enum ruedas: Int{
    case una , dos = 2, tres = 3, cuatro = 4, cinco, seis
}

ruedas.cuatro.rawValue  //4
ruedas.cuatro.hashValue // valor raro hash
ruedas.cuatro.self      //cuatro

ruedas.una.rawValue     // te da el indice


enum rueditas{
    case una (Int)
    case dos (String)
    case tres (Int)
    case cuatro (Double)
}

rueditas.cuatro


var carro = [rueditas]()
