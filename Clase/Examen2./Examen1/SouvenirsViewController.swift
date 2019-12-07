//
//  SouvenirsViewController.swift
//  Examen1Bandas
//
//  Created by Jerry Gordillo on 9/19/19.
//  Copyright © 2019 Sofía Gutiérrez. All rights reserved.
//

import UIKit

class SouvenirsViewController: UIViewController {
    
    @IBOutlet weak var compra1: UITextField!
    @IBOutlet weak var compra2: UITextField!
    @IBOutlet weak var codigo: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
   func comprar() -> [String] {
        var compras = [String]()
        if compra1.text == "1" || compra1.text == "2" || compra1.text == "3" || compra1.text == "4" || compra1.text == "5" || compra1.text == "6" || compra1.text == "7" || compra1.text == "8" || compra1.text == "9" || compra1.text == "10" || compra2.text == "1" || compra2.text == "2" || compra2.text == "3" || compra2.text == "4" || compra2.text == "5" || compra2.text == "6" || compra2.text == "7" || compra2.text == "8" || compra2.text == "9" || compra2.text == "10" {
            compras.append(compra1.text!)
            compras.append(compra2.text!)
            print(compras)
            return compras
        }else if compra1.text == "0" && compra2.text == "0" {
            compras.append("Compra Inválida")
            print(compras)
            return compras
        }else{
            compras.append("Compra Inválida")
            print(compras)
            return compras
        }
    
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! comprasViewController
        vc.compras = comprar()
        vc.descuento = codigo.text!
    }
    
    
    @IBAction func adiosVistaCompras(for segue: UIStoryboardSegue){
        
    }


}
