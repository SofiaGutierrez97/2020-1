//
//  ViewController.swift
//  sesion6.1NavigationControllerSEGUES
//
//  Created by Sofìa Gutièrrez on 8/24/19.
//  Copyright © 2019 unam. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource{
    

    var users: [User] = [User(email: "jdjdjd@xxx.com", user: "yo", password: "1234")]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .cyan
        print("viewDidLoad")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("viewDidAppear")
        
        let defaults = UserDefaults.standard
        let statusUser = defaults.bool(forKey: "statusUser")
        if statusUser{
            print("Usuario autenticado")
        }else{
        //para ejejutar segue automatico
        performSegue(withIdentifier: "thirdView", sender: self)
        }
    }
    
    //refresh de vista, cuando queremos regresar a una vista sin ser notado
 /*   override func viewWillAppear(_ animated: Bool) {
        print("viewWillAppear")
       // performSegue(withIdentifier: "thirdView", sender: self)

    }*/

    @IBAction func cerrarSesion(_ sender: UIBarButtonItem) {
        let defaults = UserDefaults.standard
            defaults.set(false , forKey: "statusUser")
        
        performSegue(withIdentifier: "thirdView", sender: self)
    }
    

    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "celda", for: indexPath) as! UserTableViewCell
        cell.email.text = users[indexPath.row].email
        cell.password.text = users[indexPath.row].password
        cell.user.text = users[indexPath.row].user
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addUser"{
            let addView = segue.destination as! AddUserViewController
          //  addView.viewController.self
        }
    }
    
    
    
}

