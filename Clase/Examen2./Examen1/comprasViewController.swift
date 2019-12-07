//
//  comprasViewController.swift
//  Examen1Bandas
//
//  Created by Jerry Gordillo on 9/19/19.
//  Copyright © 2019 Sofía Gutiérrez. All rights reserved.
//

import UIKit

class comprasViewController: UIViewController {

    @IBOutlet weak var cantidadSouvenir1: UILabel!
    @IBOutlet weak var cantidadSouvenir2: UILabel!
    @IBOutlet weak var tituloCodigo: UILabel!
    @IBOutlet weak var labelCompras: UILabel!
    @IBOutlet weak var lp: UILabel!
    @IBOutlet weak var poster: UILabel!
    @IBOutlet weak var aceptar: UIButton!
    @IBOutlet weak var total: UILabel!
    @IBOutlet weak var labelTotal: UILabel!
    
    var compras = [String]()
    var descuento = ""
    var totalCompras1 = 0
    var totalCompras2 = 0
    var totalCompras = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if compras[0] == "Compra Inválida"{
            cantidadSouvenir2.alpha = 0
            cantidadSouvenir1.alpha = 0
            labelCompras.text = "Compra no aceptada"
            lp.alpha = 0
            poster.alpha = 0
            aceptar.alpha = 0
            total.alpha = 0
            labelTotal.alpha = 0
            tituloCodigo.text = "Error 404 NOT FOUND"
            self.view.backgroundColor = .red
        } else {
            cantidadSouvenir2.text = compras[1]
            cantidadSouvenir1.text = compras[0]
            totalCompras1 = Int(compras[0]) ?? 0
            totalCompras2 = Int(compras[1]) ?? 0
            totalCompras = 200 * totalCompras1 + 1500 * totalCompras2
            
            if descuento == "DescuentoSouvenir"{
                labelTotal.text = String(totalCompras / 2)
            }else {
                labelTotal.text = String(totalCompras)
            }
            total.alpha = 1
            labelCompras.alpha = 1
            lp.alpha = 1
            poster.alpha = 1
            aceptar.alpha = 1
            tituloCodigo.text = "Carrito de Compras"
        }
        
        
        

    }
    

 

}
