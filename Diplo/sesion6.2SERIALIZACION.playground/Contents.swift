import UIKit

struct User: Codable{
    var name: String
}

let jerry = User(name: "Gerryodas")
let yo = User(name: "Sofia")
let usuarios = [jerry, yo ]

let encoder = JSONEncoder()
let defaults = UserDefaults.standard

if let encoded = try? encoder.encode(usuarios){
    defaults.set(encoded, forKey: "guardado")
    
}

if let guardado = defaults.object(forKey: "guardado") as? Data{
    let decoder = JSONDecoder()
    
    if let saveUser = try? decoder.decode(User.self, from: guardado){
        print(saveUser)
    }
}
