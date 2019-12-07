//
//  albumContenido.swift
//  Examen1Bandas
//
//  Created by Sofía Gutiérrez on 9/18/19.
//  Copyright © 2019 Sofía Gutiérrez. All rights reserved.
//

import Foundation
import UIKit

struct cancion{
    let tituloCancion: String
    let duracion: String
    
    init(tituloCancion: String, duracion: String){
        self.tituloCancion = tituloCancion
        self.duracion = duracion
    }
}


struct album{
    let titulo: String
    let año: String
    let cancion1: cancion
    let cancion2: cancion
    let cancion3: cancion
    let cancion4: cancion
    let cancion5: cancion

    
    init(titulo: String, año: String, cancion1: cancion, cancion2: cancion, cancion3: cancion, cancion4: cancion, cancion5: cancion){
            self.titulo = titulo
            self.año = año
            self.cancion1 = cancion1
            self.cancion2 = cancion2
            self.cancion3 = cancion3
            self.cancion4 = cancion4
            self.cancion5 = cancion5
    }
}
