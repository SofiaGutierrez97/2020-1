//
//  SecondViewController.swift
//  Segues
//
//  Created by Germán Santos Jaimes on 8/17/19.
//  Copyright © 2019 iosLab. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    var dato:String = ""
    var producto: Producto?
    
    var primeraVista: ViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print(primeraVista.productoSeleccionado?.nombre, primeraVista.productoSeleccionado?.precio)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let primeraVista = segue.destination as! ViewController
        primeraVista.datoVistaPrincipal = "Desde la segunda vista"
    }
    
    
    @IBAction func agregar(_ sender: UIButton) {
        
        primeraVista.carrito.producto.append(primeraVista.productoSeleccionado!)
        print(primeraVista.carrito.producto.count)
        dismiss(animated: true, completion: nil)
        
    }
}
