//
//  ViewController.swift
//  testXIB
//
//  Created by Sofìa Gutièrrez on 9/14/19.
//  Copyright © 2019 unam. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var customView: cajita!
    @IBOutlet weak var test: TestView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //customView.titulo.text = "Buenos Días"
        
        //test.titulo.text = customView.textField.text
    }

    //para ejecutar cambiar el inicio de la app a la otra vista
    
    @IBAction func buttonTouched(_ sender: UIButton) {
        test.titulo.text = customView.textField.text
    }
    
}

