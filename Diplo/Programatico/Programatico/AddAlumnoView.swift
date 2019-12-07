//
//  AddAlumnoView.swift
//  Programatico
//
//  Created by Sofìa Gutièrrez on 9/21/19.
//  Copyright © 2019 unam. All rights reserved.
//

import UIKit

class AddAlumnoView: UIViewController{
    
    
    let nombre: UITextField = {
        let name = UITextField()
        name.backgroundColor = .white
        name.textColor = .azulMarino
        name.placeholder = "Name"
        name.frame = CGRect(x: 100, y: 100, width: 200, height: 50)
        name.textAlignment = .center
        return name
    }()
    
    
    let apellido: UITextField = {
        let ap = UITextField()
        ap.backgroundColor = .white
        ap.textColor = .azulMarino
        ap.placeholder = "Last Name"
        ap.frame = CGRect(x: 100, y: 200, width: 200, height: 50)
        ap.textAlignment = .center
        return ap
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Agregar Alumno"
        
        //color de fondo para que se vea la vista
        view.backgroundColor = .azulMarino
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancelar", style: .plain, target: self, action: #selector(cancel))
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Guardar", style: .plain, target: self, action: #selector(save))
        
        view.addSubview(nombre)
        view.addSubview(apellido)
        
        
    }
    
    @objc func cancel(){
        print("cancelar")
        navigationController?.popViewController(animated: true)
    }
    
    @objc func save(){
        print("save")
    }
}
