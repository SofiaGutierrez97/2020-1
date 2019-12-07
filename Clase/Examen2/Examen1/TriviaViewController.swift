//
//  TriviaViewController.swift
//  Examen1Bandas
//
//  Created by Sofía Gutiérrez on 9/19/19.
//  Copyright © 2019 Sofía Gutiérrez. All rights reserved.
//

import UIKit

class TriviaViewController: UIViewController {

    @IBOutlet weak var question1: UISwitch!
    @IBOutlet weak var question2: UISwitch!
    @IBOutlet weak var question3: UISwitch!
    @IBOutlet weak var question4: UISwitch!
    @IBOutlet weak var question5: UISwitch!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func revisarRespuestas() -> Bool {
        if !question1.isOn && question2.isOn && question3.isOn && question4.isOn && !question5.isOn {
            return true
        } else {
            return false
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! feliciadesViewController
        vc.variableBooleana = revisarRespuestas()
    }
    

   
    
    @IBAction func adiosVistaTrivia(for segue: UIStoryboardSegue){
        
    }
    

}
