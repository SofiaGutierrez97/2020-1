//
//  ViewController.swift
//  SaludoLabel
//
//  Created by Sofìa Gutièrrez on 10/17/19.
//  Copyright © 2019 unam. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var etiqueta: UILabel!
    @IBOutlet weak var introduceTexto: UITextField!
    @IBOutlet weak var boton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        //edición de la etiqueta de saludo
        
        //cambio nombre de la etiqueta
        etiqueta.text = "Hola Sofía"
        //cambia color de la etiqueta
        etiqueta.textColor = .red
        //Alineo el texto al centro
        etiqueta.textAlignment = .center
        
        introduceTexto.placeholder = "Introduce nuevo nombre"
        introduceTexto.backgroundColor = UIColor.lightGray
        
    }
    
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        
        etiqueta.text = introduceTexto.text
    }
    


}

