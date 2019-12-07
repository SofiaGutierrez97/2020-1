//
//  ViewController.swift
//  textFIeld
//
//  Created by Sofìa Gutièrrez on 10/17/19.
//  Copyright © 2019 unam. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func boton(_ sender: Any) {
        label.text = textField.text
    }
    
    
}

