//
//  Model.swift
//  InyeccionDeCodigoOCLases
//
//  Created by Sofìa Gutièrrez on 8/17/19.
//  Copyright © 2019 unam. All rights reserved.
//

import UIKit


struct Producto{
    var id: Int
    var nombre: String
    var precio: Double
    
}

struct Carrito{
    var producto: [Producto]
    
}
