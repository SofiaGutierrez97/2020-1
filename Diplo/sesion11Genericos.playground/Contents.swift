import UIKit

//: #Genericos
//: ###Una funcion que recibe e imprime cadenas
func printString(str: String){
    print(str)
}

let greeting = "hello"
printString(str: greeting)

let anotherGreeting: Any = "Hola"
// no se puede hacer porque es Any y la funcin solo recibe cadenas
//printString(str: anotherGreeting)

//para hacer una funcion generica
func printSome<Type>(item: Type){
    print(item)
}

let myInteger = 1
let myString = "hello world"

printSome(item: myInteger)
printSome(item: myString)



//: #Stack genérico

struct Stack<Type>{
    var list: Array<Type> = []
    
    init(items: Type...){
        self.list = items
    }
    
    mutating func push(items: Type...){
        self.list += list
    }
    
    mutating func pop()-> Type?{
        guard list.count > 0 else { return nil }
        return list.removeLast()
    }
    
    mutating func printStack(){
        for element in list{
            print(list)
        }
    }
}


var stack1 = Stack<String>()
var stack2 = Stack<Int>()
var stack3 = Stack<Array<Int>>()

stack1.push(items: "hola", "adios", "jiji", "jojo")
stack2.push(items: 1, 2, 3, 4, 5, 6, 7, 8, 9 )
stack3.push(items: [5, 6, 7], [2,4])

stack1.printStack()

/*var dato: String
while(dato = stack1.pop()!) != nil {
    print(dato)
}*/

//: #Programación funcional
let array1: [ String?] = ["Hola", "Adios", nil]
let resultArray = array1.map{str in
    return "Trnsformando a \(str ?? "")"
}
print(resultArray)


let resultArray2 = array1.filter { str in
    return str != nil
}

print(resultArray2)

//: #Restricciones Genericas
struct Pair<T,U>{
    let key: T
    let value: U
}

let p1 = Pair(key: "hello", value: 1)

struct Pair1<T: Equatable, U: Equatable>: Equatable{
    
    var key: T
    var value: U
    
    init(key: T, value: U) {
        self.key = key
        self.value = value
    }
    
    static func == (lhs: Pair1<T, U>, rhs: Pair1<T, U>)-> Bool{
        return lhs.key == rhs.key && lhs.value == rhs.value
    }

}

let p3 = Pair1(key: "CADENA 3", value: 3)
let p4 = Pair1(key: "CADENA 3", value: 3)

p3 == p4




