//
//  EditViewController.swift
//  FB_4G
//
//  Created by Sofìa Gutièrrez on 9/7/19.
//  Copyright © 2019 unam. All rights reserved.
//

import UIKit
import FirebaseFirestore
import Firebase


class EditViewController: UIViewController {

    @IBOutlet weak var precio: UITextField!
    @IBOutlet weak var producto: UITextField!
    var datosProducto: Producto!
    //conecta a la coleccion a consultar
    var ref: DocumentReference!
    //conecta a la base de datos
    var getRef: Firestore!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let id = datosProducto.id
        
        ref = Firestore.firestore().collection("productos").document(id)
        producto.text = datosProducto.nombre
        producto.text = datosProducto.precio
        
    }
    
    @IBAction func aceptar(_ sender: UIButton) {
        let values: [String: Any] = ["nombre": producto.text, "precio": precio.text]
        ref.setData(values){(error) in
            if let error = error{
                print(error.localizedDescription)
            }else{
                print("Datos actualizados")
            }
        }
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func cancelar(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}
