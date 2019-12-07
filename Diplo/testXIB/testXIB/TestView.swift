//
//  TestView.swift
//  testXIB
//
//  Created by Sofìa Gutièrrez on 9/14/19.
//  Copyright © 2019 unam. All rights reserved.
//

import UIKit

class TestView: UIView {

    @IBOutlet var containerView: UIView!
    @IBOutlet weak var titulo: UILabel!
    
 //   @IBInspectable var cualquierCosa: String = "Hola"
// Para poner manejo de algun atributo o propiedad
    
    //@IBDesignable
    //para genrar componentes cuando solo se pograma y no se una storyboard
    
    //aqui no va viewdidload porque ese se encarga de las vistas principales y controladores
    
    //constructor normal
    override init(frame: CGRect) {
        super.init(frame: frame)
        inicio()
    }
    
    //constructor falible, puede o no cargar
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        inicio()
    }
    
    
    private func inicio(){
        //carga el XIB que hice, llamado  TestView
        Bundle.main.loadNibNamed("TestView", owner: self, options: nil)
        //clase en donde se embebe
        addSubview(containerView)
        //hace del tamaño de la vista
        containerView.frame = self.bounds
        containerView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }

}
