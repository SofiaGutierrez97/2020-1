//
//  ViewController.swift
//  ProgramaticSegue
//
//  Created by Sofìa Gutièrrez on 9/6/19.
//  Copyright © 2019 unam. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var segueSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func yellowButtonTapped(_ sender: Any) {
        if segueSwitch.isOn{
            performSegue(withIdentifier: "Yellow", sender: sender)
            
        }
    }
    
    @IBAction func greenButtonTapped(_ sender: Any) {
        if segueSwitch.isOn{
            performSegue(withIdentifier: "Green", sender: sender)
        }
    }
    
    //esta funcion se ejecuta cuando ya esta ejecutandose  el segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //si viene algo pon lo de la var, sino "Sin nombre": segue.identifier ?? "Sin nombre"
        print("ejecutando segue: ", segue.identifier!)
        // para usar sender lo desenvuelvo
        if let sender = sender as? UIButton{
            print("el boton es:")
            print(sender.currentTitle!)
        }
    }
    
    
}

