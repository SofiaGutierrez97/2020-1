//
//  ThirdViewController.swift
//  sesion6.1NavigationControllerSEGUES
//
//  Created by Sofìa Gutièrrez on 8/24/19.
//  Copyright © 2019 unam. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {

    @IBOutlet weak var usuario: UITextField!
    @IBOutlet weak var password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
    }

    @IBAction func login(_ sender: UIButton){
        //guarda valores de en memoria, recomendable para poca memoria, se carga cuando se ejecuta, string y edos, menu de configuracion
       let defaults = UserDefaults.standard
        
        if let user = usuario.text, let pass = password.text{
             
            if user == "usuario" && pass == "password"{
                
                defaults.set(true, forKey: "statusUser")
                dismiss(animated: true, completion: nil)
            }else{
                muestraError()
                usuario.text = ""
                password.text = ""
                
            }
        }
    }
    
    @IBAction func cancel(_ sender: UIButton){
        dismiss(animated: true, completion: nil)
    }
    
    func muestraError(){
        let errorController = UIAlertController(title: "Error", message: "Usuario Incorrecto", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        errorController.addAction(okAction)
        
        present(errorController, animated: true, completion: nil)
        
    }
    
    
    
    
    

}
