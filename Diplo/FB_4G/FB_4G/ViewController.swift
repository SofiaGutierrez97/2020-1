//
//  ViewController.swift
//  FB_4G
//
//  Created by Sofìa Gutièrrez on 9/6/19.
//  Copyright © 2019 unam. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func aceptar(_ sender: UIButton) {
        guard let userEmail = email.text, userEmail != "", let userPass = password.text, userPass != "" else{
            return
        }
        Auth.auth().createUser(withEmail: userEmail, password: userPass) {(user,error) in
            if let error = error{
                print(error.localizedDescription)
                return
            }
            //si no hay error me da el usuario creado
            print(user?.user.email)
            self.dismiss(animated: true, completion: nil)
        }
        
    }
    
    @IBAction func cancelar(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    
}

