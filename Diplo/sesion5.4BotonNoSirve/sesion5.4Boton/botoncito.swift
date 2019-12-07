//
//  botoncito.swift
//  sesion5.4Boton
//
//  Created by Sofìa Gutièrrez on 8/23/19.
//  Copyright © 2019 unam. All rights reserved.
//

import UIKit

class botoncito: UIButton {

    //contrsuctor falible, si funciona inicilaiza, sino null
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .red
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
