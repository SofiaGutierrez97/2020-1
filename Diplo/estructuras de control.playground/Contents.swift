import UIKit
var edad = 10

if edad > 20{
    print("mayor")
    let robusto = true
} else if edad == 20 {
    print(20)
} else if edad < 20 {
    print("menor")
}

//operador ternario
let resultado = edad > 20 ? "Es mayor" : "Es menor"

//FOR
for var i in 0...10{
    print(i)
}

for i in stride(from: 10, through: 0, by: -1){
    print(i)
}

let cadenas = ["A", "B", "c" ]
for letras in cadenas{
    print(letras)
}
