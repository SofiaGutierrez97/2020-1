//: [Previous](@previous)

import Foundation

struct Temperature{
    static var boilingPoint: Int = 100
    var celsius: Int = 10
    
    static func show(){
        print(boilingPoint)
    }
}

//utilizo la variable sin instanciar un objeto tipo Temperature
Temperature.boilingPoint
Temperature.boilingPoint = 200
Temperature.boilingPoint
//tambien se puede con funciones
Temperature.show()

//si le pongo static a todas las propiedades, Temperature ya no puede instanciarse = SINGLETON
