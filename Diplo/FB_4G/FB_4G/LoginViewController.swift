//
//  LoginViewController.swift
//  FB_4G
//
//  Created by Sofìa Gutièrrez on 9/6/19.
//  Copyright © 2019 unam. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {

    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        isLogged()

    }
    
    @IBAction func aceptar(_ sender: Any) {
        guard let userEmail = email.text, userEmail != "", let userPass = password.text, userPass != "" else{
            return
        }
        
        Auth.auth().signIn(withEmail: userEmail, password: userPass){
            (user, error) in
            if let error = error{
                print(error.localizedDescription)
                return
            }
            print("Usuario autenticado")
            //self.dismiss(animated: true, completion: nil)
        }
    }
    
    
    func isLogged(){
        //patron singleton para no crear más instancias de memoria
        //para identificar si el usuario esta logeado o no
        Auth.auth().addStateDidChangeListener{(auth , user) in
            if user == nil{
                print("usuario no loggeado")
            }else{
                print("usuario loggeado")
                self.performSegue(withIdentifier: "listView", sender: self)
            }
        
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
