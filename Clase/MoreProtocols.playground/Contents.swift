import UIKit

protocol Drink{
    var volume: Double {get set}
    var caffeine: Double {get set}
    var temperature: Double {get set}
    var drinkSize: DrinkSize {get set}
    var description: String {get set}
}



enum DrinkSize{
    case can330, can235, can650, can473
}



extension Drink{
    mutating func drinking (amount: Double){
        volume = volume - amount
    }
    mutating func temperatureChange(change: Double){
        temperature += change
    }
}


struct Monster: Drink{
    var volume: Double
    var caffeine: Double
    var temperature: Double
    var drinkSize: DrinkSize
    var description: String
    
    init(temperature: Double) {
        self.volume = 473
        self.caffeine = 0.5
        self.temperature = temperature
        self.description = "Bebida para salvar el semestre"
        self.drinkSize = .can473
    }
}

struct Coca: Drink{
    var volume: Double
    var caffeine: Double
    var temperature: Double
    var drinkSize: DrinkSize
    var description: String
    
    init(volume: Double, temperature: Double, drinkSize: DrinkSize){
        self.volume = volume
        self.temperature = temperature
        self.drinkSize = drinkSize
        self.description = "Un refresco"
        self.caffeine = 0
    }
}






class Cooler{
    var temperature: Double
    var canOfDrinks = [Drink]()
    var maxCans: Int
    
    init(temperature: Double, maxCans: Int){
        self.temperature = temperature
        self.maxCans = maxCans
    }
    
    func addDrink(drink: Drink) -> Bool{
        if canOfDrinks.count < maxCans{
            canOfDrinks.append(drink)
            return true
        }else{
            print("No se pudo agregar la bebida")
            return false
        }
    }
    
    func removeDrink() -> Drink?{
        if canOfDrinks.count > 0 {
           return canOfDrinks.removeFirst()
        }else{
            return nil
        }
    }
    
}





let myMonster = Monster(temperature: 3)
let refriOS = Cooler.init(temperature: 10, maxCans: 40)

for _ in 0...5{
    let sofiBeverage = Monster(temperature: 20)
    refriOS.addDrink(drink: sofiBeverage)
}
print(refriOS.canOfDrinks)


for _ in 0...5{
    let danielBeverage = Coca(volume: 650, temperature: 20, drinkSize: .can650)
    refriOS.addDrink(drink: danielBeverage)
}

print(refriOS.canOfDrinks)
