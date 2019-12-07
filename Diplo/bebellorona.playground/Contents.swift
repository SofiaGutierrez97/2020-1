import UIKit

//tipos asociados, forma de inyectar valores
//un protocolo no maneja genericos porque
class ViewModel{
    func something(){
        print("Algo")
    }
}

protocol ViewModelContainer{
    associatedtype VM: ViewModel
    var viewModel: VM { get set } //
    
    mutating func set(viewModel vm: VM)
}

class CualSea: ViewModelContainer{
    typealias VM = Type 
}
