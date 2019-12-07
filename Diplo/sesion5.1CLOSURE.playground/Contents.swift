import UIKit

//CLOSURES = lambda en python

//funcion anonima, no recibe ningun parametro y no regresa nada
//expresion minimizada de ote func

//puede ser let o var
var myClosure : (Int, Int) -> Int

//la implmentación del closure siempre lleva "in"
myClosure = { (a: Int, b: Int)-> Int in
    return a + b
}

let resultado = myClosure (3, 5)
print(resultado)

//otra forma de declararlo
myClosure = {(a, b) in a + b }

//otra forma de declarar
myClosure = { $0 + $1 }

//usando un closure como parametro
func operaciones (a: Int, b: Int, funcion: (Int, Int)->Int)-> Int{
    let resultado = funcion(a, b)
    return resultado
}

operaciones (a:6, b:4, funcion: myClosure)
