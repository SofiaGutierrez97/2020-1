import UIKit

//variable infiere el tipo de dato
var saludo = "Hola mundo"
saludo = "Adios"

//constante que infiere el tipo de dato
let edad = 10

//variable que desde el inicio sè que va a ser string
var nombre: String = "Jose"

//tipos
let costo: Int = 34
let promedio = 3.4
type(of: promedio)

//operadores
var edades = 19
edades += 1

//metodo de cuenta de digitos de un var
var name: String = "Sofia"
var numero: Int = 3567
name.count
print(name)

//Intepolaciòn de cadenas
print("Mi nombre \(name) y tengo \(numero)")
var enunciado = "Mi nombre \(name) y tengo \(numero)"

//Entero de 8 bits
print(Int8.max)// va de 127 a -127
print(UInt8.max)//va de 0-255 unsigned

var decimal = 123
var octal = 0o77 //octal
var hexadecimal = 0x1234
var binario = 0b10101


let 🐶 = 25
let 🙉 = 30

🐶 + 🙉

let char: Character = "a" //caracter
let s = "Cadena"           //infiere que es un srting
//no se pueden concatenar porque no son del mismo tipo

enum DiasDeLaSemana{
    case Lunes, Martes, Miercoles, Jueves, Viernes, Sabado, Domingo
}

enum Semana{
    case Lunes
    case Martes
    case Miercoles
    case Jueves
    case Sabado
    case Domingo
}

var dia = DiasDeLaSemana.Domingo
dia = .Martes

enum Status {
    case OK
    case ERROR (String)
}

let status = Status.OK
let failed = Status.ERROR ("No funciona")
print (failed)


