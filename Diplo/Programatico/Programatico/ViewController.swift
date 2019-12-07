//
//  ViewController.swift
//  Programatico
//
//  Created by Sofìa Gutièrrez on 9/20/19.
//  Copyright © 2019 unam. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //instancia de un boton, con un constructor
    let boton : UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Click Please", for: .normal)
        //autolayout del boton
        //no obedezca tus reglas de layout, yo pondre mis propios constraints
        btn.translatesAutoresizingMaskIntoConstraints = false
        
        //es el IBAction programatico, te dice que funcion va a decir que hace el boton
        btn.addTarget(self, action: #selector(clicked), for: .touchUpInside)
        //localizar boton en un lugar de la vista
        btn.frame = CGRect(x: 100, y: 100, width: 200, height: 100)
        btn.backgroundColor = .red
    
        
        return btn
    }()
    
    let label: UILabel = {
        let lbl = UILabel()
        lbl.text = "Hola"
        lbl.backgroundColor = .blue
        lbl.frame = CGRect(x: 200, y: 200, width: 50, height: 50)
        lbl.font = UIFont(name: "Arial", size: 20)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textAlignment = .center
        
        return lbl
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // si no se pone color de la view, es transparente y no sale
        view.backgroundColor = .cyan
        //agrego boton a  la vista
        view.addSubview(boton)
        view.addSubview(label)
        //habilitar constraints del boton y los agregamos con isActive
        boton.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        boton.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        boton.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        boton.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        
        //habilitar constraints del boton y los agregamos con isActive
        label.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        label.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        label.topAnchor.constraint(equalTo: boton.bottomAnchor, constant: 100).isActive = true
        label.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }

    //funcion que controla la accion del boton, de bajo nivel
    @objc func clicked(){
        print("click, click")
        
    }

}

