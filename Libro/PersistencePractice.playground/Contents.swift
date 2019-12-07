import UIKit


//no tengo que implementar sus dos metdodos de codable, porque String y date son tipos de swift que son automaticamente conformables con codable
struct Note: Codable{
    let title: String
    let text: String
    let timestamp: Date
}


//creo una nueva nota
let newNote = Note(title: "Hola", text: "vvgbghbujhbkijuxdfghujioidfuijoiucfgjkojihvgjkjhvgjvgjhvgjhijhjibhjbhj", timestamp: Date())
let newNote1 = Note(title: "Hola", text: "vvgbghbujhbkijuxdfghujioidfuijoiucfgjkojihvgjkjhvgjvgjhvgjhijhjibhjbhj", timestamp: Date())
let newNote2 = Note(title: "Hola", text: "vvgbghbujhbkijuxdfghujioidfuijoiucfgjkojihvgjkjhvgjvgjhvgjhijhjibhjbhj", timestamp: Date())
let newNote3 = Note(title: "Hola", text: "vvgbghbujhbkijuxdfghujioidfuijoiucfgjkojihvgjkjhvgjvgjhvgjhijhjibhjbhj", timestamp: Date())
let newNote4 = Note(title: "Hola", text: "vvgbghbujhbkijuxdfghujioidfuijoiucfgjkojihvgjkjhvgjvgjhvgjhijhjibhjbhj", timestamp: Date())
let newNote5 = Note(title: "Hola", text: "vvgbghbujhbkijuxdfghujioidfuijoiucfgjkojihvgjkjhvgjvgjhvgjhijhjibhjbhj", timestamp: Date())
let newNote6 = Note(title: "Hola", text: "vvgbghbujhbkijuxdfghujioidfuijoiucfgjkojihvgjkjhvgjvgjhvgjhijhjibhjbhj", timestamp: Date())

let notes: [Note] = [newNote, newNote1, newNote2,newNote3, newNote4, newNote6]
/*//Usar el encode, codificar el dato a guardar
let propertyListEncoder = PropertyListEncoder()
if let encodedNote = try? propertyListEncoder.encode(newNote){
    print(encodedNote)

    //decodifica la nota
    let propertyListDecoder = PropertyListDecoder()
    if let decodeNote = try? propertyListDecoder
    .decode(Note.self, from: encodedNote){
    print(decodeNote)
    }
}*/

//variable que nos da un directorio para leer y escribir datos
let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!

//path completo que provee nombre y extensión al archivo
let archiveURL = documentsDirectory.appendingPathComponent("notes_test").appendingPathComponent("plist")


let propertyListEncoder = PropertyListEncoder()
let encodedNote = try? propertyListEncoder.encode(notes)
//crea un archivo en el url completo que hicimos con la informacion de la nota codificada
try? encodedNote?.write(to: archiveURL, options: .noFileProtection)// .noFileProtection permite sobreescribir si el usuario lo permite

//para recuperar la info del archivo inicializo un objeto tipo Data con su init(contentsOf:) y pasando el URL donde esta almacenada la info
//y decodifico la info para que vuelva a ser legible
let propertyListDecoder = PropertyListDecoder()
//para decodificar solo un objeto
/*if let retrievedNoteData = try? Data(contentsOf: archiveURL), let decodedNote = try? propertyListDecoder.decode(Note.self, from: retrievedNoteData){
    print(decodedNote)
}*/

//para decodificar un arreglo
if let retrievedNoteData = try? Data(contentsOf: archiveURL), let decodedNote = try? propertyListDecoder.decode(Array<Note>.self, from: retrievedNoteData){
    print(decodedNote)
}
