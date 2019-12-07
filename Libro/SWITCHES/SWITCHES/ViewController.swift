//
//  ViewController.swift
//  SWITCHES
//
//  Created by Sofìa Gutièrrez on 8/27/19.
//  Copyright © 2019 unam. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var button: UIButton!

    @IBAction func Tapper(_ sender: UITapGestureRecognizer) {
        print(sender.location(in: view))
        print(sender.numberOfTapsRequired)
    }
    
    @IBAction func `switch`(_ sender: UISwitch) {
        if sender.isOn{
            print("Encendido")
        }else{
            print("Apagado")
        }
    }
    
    @IBAction func slider1(_ sender: UISlider) {
        if sender.value == 1 {
            print("encendido")
        }else{
            print(sender.value)
        }
    }
    

    @IBAction func sofiNoSabe(_ sender: UITextField) {
        if let text = sender.text{
            print(text)
        }
    }
    
    
    //  Type Casting  (  String(12)  )
    //  as
    
    //  as?
    
    //  as!
    //
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


}

