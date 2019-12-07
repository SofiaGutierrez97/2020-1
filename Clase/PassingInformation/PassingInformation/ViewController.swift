//
//  ViewController.swift
//  PassingInformation
//
//  Created by Sofìa Gutièrrez on 9/6/19.
//  Copyright © 2019 unam. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //en el titulo del otro navigation bar pone lo que hay en text field
        segue.destination.navigationItem.title = textField.text
    }


}

