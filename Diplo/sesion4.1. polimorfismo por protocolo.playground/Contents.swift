import UIKit

//POLIMORFISMO POR PROTOCOLOS


protocol Saltar{
    func salta()
}

protocol Sanar{
    func sana()
}

//si usas protocolos debes implementar la funcion
class Jugador: Saltar{
    func salta(){
        print("jugador salta")
    }
}

class Guerrero: Jugador{
    
}

class Mago: Jugador, Sanar{
    func sana() {
        print("mago sanado")
    }
    
}


var oz = Mago()
var aquiles = Guerrero()


//aquí solo paso protocolos
//PARA HACER POLIMORFISMO

func hazlosSaltar(saltador: Saltar){
    saltador.salta()
}

func hazloSanar(sanador: Sanar){
    sanador.sana()
}

//las funcines solo dicen que ejecuten la funcion como la tengan implmentada
hazlosSaltar(saltador: oz)
hazloSanar(sanador: oz)
hazlosSaltar(saltador: aquiles) //no sana porque aquiles es jugador y jugador solo tiene sanar
