import UIKit


var numero: Int = 4
var cadena: String = "HOLA"
//diferente
if numero != 4{
    print("cumplio condicion")
}else if numero < 6{
    print("es menor a 6")
}

//mayor que
if numero > 2{
    print("El numero es mayor a 2")
}

//or
if numero == 6 || numero == 1{
    print("hola")
}

//and
if numero < 10 && numero > 5{
    print("cumple")
}

//igual y semejante
if cadena == "hola"{
    print("sí es hola")
}
