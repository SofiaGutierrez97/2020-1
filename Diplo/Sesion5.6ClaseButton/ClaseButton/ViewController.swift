//
//  ViewController.swift
//  ClaseButton
//
//  Created by Germán Santos Jaimes on 3/13/19.
//  Copyright © 2019 iosLab. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var botonTemblorin: Boton!
    
    //boton tipo botonprog,  que hace que los bordes sean de 50 ptos
    let botoncito: BotonProg = {
        let b = BotonProg()
        b.setTitle("click please pleas please", for: .normal)
        b.translatesAutoresizingMaskIntoConstraints = false
        b.backgroundColor = .blue
        b.addTarget(self, action: #selector(clickon), for: .touchUpInside)
        return b
    }()
    
    
    //agrego boton que acabo de hacer a la vista
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(botoncito)
        
        botoncito.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        botoncito.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
    }


    //ligado a dos botones
    @IBAction func click(_ sender: Boton) {
        sender.shake()
        
    }
    
    @objc func clickon(){
        botonTemblorin.shake()
    }
}

