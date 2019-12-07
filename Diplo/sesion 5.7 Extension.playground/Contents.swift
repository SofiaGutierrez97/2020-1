import UIKit

var cadena: String = "Hola mundo"
extension String{
    func grita(){
        print("Ahhhhhhh")
    }
}

cadena.grita()



protocol Saltar{
    func salta()
}

extension Saltar{
    func agacharse( ){
        print("agachado")
    }
}

class Jugador: Saltar{
    func salta(){
        print("saltando")
    }
}



