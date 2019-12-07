import UIKit

protocol EventoType{
    var titulo: String {get set}
    var id: Int {get}
    func creaNotificacionLocal()
}

class EventoClass: EventoType{
    var titulo: String = ""
    var id: Int = 0
    func creaNotificacionLocal() {
        //algo aquí
    }
}

struct EventStruct: EventoType{
    var titulo: String = ""
    var id: Int = 0
    func crea(<#parameters#>) -> <#return type#> {
        //algo aquí
    }
    
}
