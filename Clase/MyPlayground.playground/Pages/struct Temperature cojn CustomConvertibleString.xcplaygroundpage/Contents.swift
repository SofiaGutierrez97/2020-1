import Foundation

struct Temperature: CustomStringConvertible{
    
    var celsius: Double
    var farenheit: Double{
        return celsius * 1.8 + 32
    }
    var kelvin: Double{
        return celsius + 273
    }
    
    var description: String{
           return "Temperature(celsius: \(celsius), farenheit: \(farenheit), kelvin: \(kelvin))"
       }
}

var currentTemperature = Temperature(celsius: 30)
print(currentTemperature)

