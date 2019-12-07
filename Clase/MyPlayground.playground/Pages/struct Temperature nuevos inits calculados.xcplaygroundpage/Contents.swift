//: [Previous](@previous)

import Foundation

struct Temperature{
    var celsius: Double
    var farenheit: Double
    var kelvin: Double
    
    init(celsius: Double){
        self.celsius = celsius
        self.farenheit = (celsius * 1.8) + 32
        self.kelvin = celsius - 273
    }
    
    init(farenheit: Double){
        self.celsius = (farenheit - 32)/1.8
        self.farenheit = farenheit
        self.kelvin = ((farenheit - 32)/1.8)-273
    }
    
    init(kelvin: Double){
           self.celsius = kelvin + 273
        self.farenheit = ((kelvin + 273) * 1.8) + 32
           self.kelvin = kelvin
    }
    
    
}

