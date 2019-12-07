//
//  Model.swift
//  Segues
//
//  Created by Germán Santos Jaimes on 8/17/19.
//  Copyright © 2019 iosLab. All rights reserved.
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
