//
//  DetailViewController.swift
//  StormViewer
//
//  Created by Sofìa Gutièrrez on 8/23/19.
//  Copyright © 2019 unam. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var selectedImage: String?//variable recipiente para la imagen, no inicializada
    
    @IBOutlet weak var imageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //a este solo titulos pequeños
        navigationItem.largeTitleDisplayMode = .never
        title = selectedImage
        //pregunta si selectedImage es nil, si no guarda en imageToLoad un momento para utilizar (eso es una string)
        if let imageToLoad = selectedImage{
            //crea una imagen con el resultado de la busqueda de imageToLoad
            imageView.image = UIImage(named: imageToLoad)
        }
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    
}
