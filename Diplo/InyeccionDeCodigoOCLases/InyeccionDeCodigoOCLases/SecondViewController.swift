


//creaco con comand+ N -->cococa 
// Para asociarlo voy al sotryboard y en el periodico--> class--> le pongo el nombre del controlador
import UIKit

class SecondViewController: UIViewController {
    
    var dato: String = ""
    var producto: Producto?
    var primeraVista = ViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let nombre = producto?.nombre, let precio = producto?.precio{
            print(nombre, precio)
        }
        //print("Dato recibido \(producto.nombre): $\(producto.precio)")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        
        
        //me da acceso a todas las variables declaradas del otro controlador
        let primeraVista = segue.destination as! ViewController
        //modifico el dato que quiero porque ya tengo acceso
        primeraVista.datoVistaPrincipal = "Dato enviado"
    }
    
    @IBAction func agregarProducto(_ sender: Any) {
    
        primeraVista.carrito.producto.append(producto!)
        dismiss(animated: true, completion: nil)
    }

    

    
   
    
}

