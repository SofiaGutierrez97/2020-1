//
//  ViewController.swift
//  Sesion2-1
//
//  Created by Sofìa Gutièrrez on 8/10/19.
//  Copyright © 2019 unam. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var saludo: UILabel!
    var toogle: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        saludo.text = "Adios mundo!"
    }

    @IBAction func cambiaColor(_ sender: UIButton) {
        if sender.tag == 0{
            saludo.textColor = UIColor.blue
        }else if sender.tag == 1 {
            saludo.textColor = UIColor.red
        }
   // toogle = !toogle
    }
}
