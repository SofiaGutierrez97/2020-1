//
//  cajita.swift
//  testXIB
//
//  Created by Sofìa Gutièrrez on 9/14/19.
//  Copyright © 2019 unam. All rights reserved.
//

import UIKit

class cajita: UIView {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet var cajitaContainer: UIView!
   
    
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
        Bundle.main.loadNibNamed("cajita", owner: self, options: nil)
        addSubview(cajitaContainer)
        //hace del tamaño de la vista
        cajitaContainer.frame = self.bounds
        cajitaContainer.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
    
    
    
}
