//
//  ViewController.swift
//  sesion2.2
//
//  Created by Sofìa Gutièrrez on 8/10/19.
//  Copyright © 2019 unam. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var slider: UISlider!
    
    @IBOutlet weak var slider1: UISlider!
    
    @IBOutlet weak var slider2: UISlider!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //Hola
    }

    
    @IBAction func changer(_ sender: UISlider) {
       // var value = slider.value
        self.view.backgroundColor = UIColor(red: CGFloat(slider.value/255), green: CGFloat(slider1.value/255), blue: CGFloat(slider2.value/255), alpha: 1.0)
        //Aloha
    }
    
}

