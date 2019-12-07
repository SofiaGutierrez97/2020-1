//
//  ViewController.swift
//  StormViewer
//
//  Created by Sofìa Gutièrrez on 8/23/19.
//  Copyright © 2019 unam. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    var pictures = [String]() // inicialización de arreglo de cadenas vacias, afuera de metodos para ser global en ViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        //titulos grandes
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Storm View"
        let fm = FileManager.default
        let path = Bundle.main.resourcePath! //DEL BUNDLE PRINCIPAL, DAME las rutas EL DIRECTORIO
        let items = try! fm.contentsOfDirectory(atPath: path) //DAME LOS CONTENIDOS DEL DIRECTORIO, devuelve un arreglo con todas las rutas de los contenidos del proyecto (referenciaS a los contenidos
        for item in items{
            if item.hasPrefix("nssl"){
                //agregar la imagen a la lista de imagenes
                //aislamos las imagenes del resto de los contenidos del directorio
                pictures.append(item)
            }
        }
        print(pictures)
        
    }

    //funcion para ssaber el numero de celdas que vamos a utilizar
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
    //del administrador de celdas, dame una celda pinture disponiblke y ponle el formato de picture y ponla en una posición disponible (indexpath)
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        //cada celda va a tener el nombre de la imagen
        cell.textLabel?.text = pictures[indexPath.row]
        return cell
    }

    //ejecuta cada que hay click en una celda
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //pregunta si puede del storyboard, hay una instancia con identificador detail y es tipo DetailViewCONTROLLER
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController{
            //ya tiene vc la referencia a la imagen que debe poner
            vc.selectedImage = pictures[indexPath.row]
            
            //cambio de vista para ver la imagen
            navigationController!.pushViewController(vc, animated: true)
        }
    }
    
    
}


