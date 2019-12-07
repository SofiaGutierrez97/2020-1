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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
   func comprar() -> Bool {
        if compra1.text == "" || compra2.text == ""{
            print("No hay Compra")
            return false
        }else if compra1.text == "1" || compra1.text == "2" || compra1.text == "3" || compra1.text == "4" || compra1.text == "5" || compra1.text == "6" || compra1.text == "7" || compra1.text == "8" || compra1.text == "9" || compra1.text == "10" || compra2.text == "1" || compra2.text == "2" || compra2.text == "3" || compra2.text == "4" || compra2.text == "5" || compra2.text == "6" || compra2.text == "7" || compra2.text == "8" || compra2.text == "9" || compra2.text == "10" {
          
            print("Sí hay Compra")
            return true
    }else{return false}
    }
    
    
    @IBAction func pantallaCompra(_ sender: Any) {
        func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if comprar(){
                let vc = segue.destination as! comprasViewController
                vc.hayCompra = comprar()
                vc.cantidadSouvenir1.text = compra1.text
                vc.cantidadSouvenir2.text = compra2.text
            }else{
                dismiss(animated: true, completion: nil)
            }
        }
    }
    
    
    
/*    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if comprar(){
        let vc = segue.destination as! comprasViewController
            vc.hayCompra = comprar()
            vc.cantidadSouvenir1.text = compra1.text
            vc.cantidadSouvenir2.text = compra2.text
        }else{
            dismiss(animated: true, completion: nil)
        }
    }*/

    
    
    
    



}
