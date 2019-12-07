import UIKit

class Shoe: CustomStringConvertible{
    var description: String{
        return "Shoe(size: \(size), brand: \(brand), color: \(color))"
    }
    
    let size: Double
    let brand: String
    let color: String
    
    init(size:Double, brand:String, color: String) {
        self.size = size
        self.brand = brand
        self.color = color
    }
    
}

let myShoe = Shoe(size: 23, brand: "Nike", color: "Blanco")
let juanShoe = Shoe(size: 6.5, brand: "DC", color: "Gris")

print(myShoe)
print(juanShoe)










protocol Saltar{
    func salta()
}

protocol Sanar{
    func sana()
}

class Jugador: Saltar{
    func salta() {
        print("Salto como jugador")
    }
}

class Guerrero: Saltar{
    func salta() {
        print("Salto como Guerrero")
    }
}

class Mago: Saltar, Sanar{
    func salta() {
        print("Salta como Mago")
    }
    func sana() {
        print("Mago Sana")
    }
}


class Alumno:Saltar{
    func salta() {
        print("Salto como alumno")
    }
}


var oz = Mago()
var aquiles = Guerrero()

func hazloSaltar(saltador: Saltar){
    saltador.salta()
}

hazloSaltar(saltador: oz)
hazloSaltar(saltador: aquiles)
