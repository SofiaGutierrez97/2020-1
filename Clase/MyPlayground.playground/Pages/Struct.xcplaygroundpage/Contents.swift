import UIKit

var temperature = 90

switch temperature {
case 65...75:
    print("the temperature is just right")
case Int.min...64:
    print("it's too cold")
default:
    print("it's too hot")
}

func displayPi(value: Int)->Int{
    let result = value * 3
    print("3.14159")
    return result
}

displayPi(value: 10)



//valor default de un parametro
func display(teamName: String, _ score: Int = 0){
    print("\(teamName): \(score)")
}

display(teamName: "Wombats", 100)
display(teamName: "Wombat")





//Estructuras
struct Person{
    var nombre: String
    var peliculas: String
    
    func esCochino(){
        print("sólo sí es \(nombre)")
    }
    
    func verPeliculas(){
    print("Soy \(nombre) y voy a ver \(peliculas)")
    }
    
    
}

let moda = Person(nombre: "Moda", peliculas: "Hentai")
moda.esCochino()
moda.verPeliculas()




let string = String.init()


//Estructuramcon inicializadores
struct Temperature{
    var celsius: Double
    
    init(celsius: Double){
        self.celsius = celsius
    }
    
    init(farenheit: Double){
        self.celsius = (farenheit - 32)/1.8
    }
    
    init (){
        self.celsius = 30.5
    }
}

let temp = Temperature(celsius: 30.0)
print(temp.celsius)

let tempFarenheit = Temperature(farenheit: 98.3)

let temp2 = Temperature()
