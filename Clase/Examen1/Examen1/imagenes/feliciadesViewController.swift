//
//  feliciadesViewController.swift
//  Examen1Bandas
//
//  Created by Sofía Gutiérrez on 9/19/19.
//  Copyright © 2019 Sofía Gutiérrez. All rights reserved.
//

import UIKit

class feliciadesViewController: UIViewController {
    
    @IBOutlet weak var ganador: UILabel!
    @IBOutlet weak var frase: UILabel!
    @IBOutlet weak var imagen: UIImageView!
    @IBOutlet weak var codigo: UILabel!
    @IBOutlet weak var codigoEnter: UILabel!
    @IBOutlet weak var aux: UILabel!
    var variableBooleana: Bool!

    override func viewDidLoad() {
        super.viewDidLoad()

        if variableBooleana{
            ganador.text = "Ganaste Perro!!"
            frase.text = "Ganaste un codigo perro"
            imagen.alpha = 1
            codigo.alpha = 1
            codigoEnter.alpha = 1
            aux.alpha = 0
            self.view.backgroundColor = .black
            
        } else {
            ganador.text = "Lo sentimos"
            frase.text = "Vuelve a Intentarlo"
            imagen.alpha = 0
            codigo.alpha = 0
            codigoEnter.alpha = 0
            aux.alpha = 0

            self.view.backgroundColor = .red
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
