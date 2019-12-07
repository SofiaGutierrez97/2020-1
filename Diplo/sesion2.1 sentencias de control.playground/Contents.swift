import UIKit

//while
var i = 10
while i > 0{
    print(i)
    i -= 1
}

//do while
var j = 10
repeat{
    print (j)
    j -= 1
}while j > 0

//switch case
let valor = 11
switch valor{
case 2, 3, 5, 7, 9, 11, 19:    //conjunto de valores
    print("Es un primo")
case 20...30:       //rango de valores
    print("mayor")
default:
    print("otro")
}

//funciones
func sumar (x: Int,  mas y:Int) -> (suma: Int, multiplicacion: Int) {// -> regresa dos valores
    print("sumar \(x) + \(y) = \(x+y)")
    return (x + y, x * y) //por lo que la tupla ya no esta vacía y regresa 8
}
let resultado = sumar (x:3, mas:5) //asì se pasan los parametros

//tuplas
let tupla:(x:Int, String, Int) = (3, "cadena", 2 )
tupla.x //te da el ìndice x de la tupla= 3

//direccion de memoria, apuntadores
var edad = 20
func sumaEdad (edad: inout Int){
    edad += 1
}
sumaEdad(edad : &edad)
print(edad)


//polimorfismo
func estudia( ){
    
}

func estudia(horas: Int){
    print ("Estudiando \(horas) horas al día")
}

func estudia (materia:String){
    print("Estudiando la materia \(materia)")
}



















