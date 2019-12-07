//
//  ViewController.swift
//  Login
//
//  Created by Sofìa Gutièrrez on 9/10/19.
//  Copyright © 2019 unam. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var forgotUsername: UIButton!
    @IBOutlet weak var forgotPassword: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let sender = sender as? UIButton else {return}
        if sender == forgotPassword{
            segue.destination.navigationItem.title = "Forgot Password"
        }else if sender == forgotUsername{
            segue.destination.navigationItem.title = "Forgot Username"
        }else{
            segue.destination.navigationItem.title = username.text
        }
        
    }
    
    
    @IBAction func forgotUsername(_ sender: Any) {
        
        performSegue(withIdentifier: "toLandingScreen", sender: forgotUsername)
        
            
        }
    
    
    
    @IBAction func forgotPassword(_ sender: Any) {
        performSegue(withIdentifier: "toLandingScreen", sender: forgotPassword)
        
    }
    
    
}

