import UIKit

var contador = 0

//el closure es una variable
let incrementa = {
    contador += 1
}

incrementa()
incrementa()
incrementa()
print(contador)


let nombres = ["Paw", "koko", "jiji", "lolo" ]
nombres.sorted()
nombres.sorted{
    $0.count > $1.count
}

let numeros = [1, 2, 3, 4, 5 ]
numeros.forEach {
    print("\($0): \($0 * $0)")
}

//hace un filtro del arreglo
let filtro = numeros.filter{
    return $0 > 2
    true
}
print(filtro)
