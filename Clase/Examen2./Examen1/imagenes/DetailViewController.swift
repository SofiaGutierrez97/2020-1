//
//  DetailViewController.swift
//  Examen1Bandas
//
//  Created by Sofía Gutiérrez on 9/18/19.
//  Copyright © 2019 Sofía Gutiérrez. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    
    @IBOutlet weak var titulo: UILabel!
    @IBOutlet weak var foto: UIImageView!
    @IBOutlet weak var año: UILabel!
    @IBOutlet weak var song1: UILabel!
    @IBOutlet weak var song2: UILabel!
    @IBOutlet weak var song3: UILabel!
    @IBOutlet weak var song4: UILabel!
    @IBOutlet weak var song5: UILabel!
    
    @IBOutlet weak var duracion1: UILabel!
    @IBOutlet weak var duracion2: UILabel!
    @IBOutlet weak var duracion3: UILabel!
    @IBOutlet weak var duracion4: UILabel!
    @IBOutlet weak var duracion5: UILabel!
    

    
    var selectedAlbum: String!
    var fotos = [String]()
/*    let boton: UIButton = {
        var barButton = UIButton
        return barButton
    }()*/
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let canciones = [
            cancion(tituloCancion: "Cigarettes", duracion: "3.33"),
            cancion(tituloCancion: "Something Good Can Work", duracion: "2.42"),
            cancion(tituloCancion: "I Can Talk", duracion: "2.55"),
            cancion(tituloCancion: "Undercover Martyn", duracion: "2.46"),
            cancion(tituloCancion: "What You Know", duracion: "3:09"),
            cancion(tituloCancion: "Ready?", duracion: "3.50"),
            cancion(tituloCancion: "Bad Decisions", duracion: "4.58"),
            cancion(tituloCancion: "Gameshow", duracion: "3.53"),
            cancion(tituloCancion: "Ordinary", duracion: "4.59"),
            cancion(tituloCancion: "Lavender", duracion: "3.56"),
            cancion(tituloCancion: "Alone", duracion: "3.24"),
            cancion(tituloCancion: "Sun", duracion: "3:07"),
            cancion(tituloCancion: "Next Year", duracion: "4:11"),
            cancion(tituloCancion: "Handshake", duracion: "3:31"),
            cancion(tituloCancion: "Beacon", duracion: "3:24"),
            cancion(tituloCancion: "Talk", duracion: "4:24"),
            cancion(tituloCancion: "Satellite", duracion: "4:19"),
            cancion(tituloCancion: "Dirty Air", duracion: "4:03"),
            cancion(tituloCancion: "Once", duracion: "3:18"),
            cancion(tituloCancion: "So Many People", duracion: "4:41")
        ]
        
        let albumes = [
            album(titulo: "Tourist History", año: "2009", cancion1: canciones[0], cancion2: canciones[1], cancion3: canciones[2], cancion4: canciones[3], cancion5: canciones[4]),
            album(titulo: "Gameshow", año: "2016", cancion1: canciones[5], cancion2: canciones[6], cancion3: canciones[7], cancion4: canciones[8], cancion5: canciones[9]),
            album(titulo: "Beacon", año: "2012", cancion1: canciones[10], cancion2: canciones[11], cancion3: canciones[12], cancion4: canciones[13], cancion5: canciones[14]),
            album(titulo: "False Alarm", año: "2019", cancion1: canciones[15], cancion2: canciones[16], cancion3: canciones[17], cancion4: canciones[18], cancion5: canciones[19])
        ]
        
        navigationItem.largeTitleDisplayMode = .never
        title = selectedAlbum
        
        if selectedAlbum == albumes[0].titulo{
            titulo.text = albumes[0].titulo
            año.text = albumes[0].año
            song1.text = albumes[0].cancion1.tituloCancion
            duracion1.text = albumes[0].cancion1.duracion
            song2.text = albumes[1].cancion2.tituloCancion
            duracion2.text = albumes[1].cancion2.duracion
            song3.text = albumes[0].cancion3.tituloCancion
            duracion3.text = albumes[0].cancion3.duracion
            song4.text = albumes[0].cancion4.tituloCancion
            duracion4.text = albumes[0].cancion4.duracion
            song5.text = albumes[0].cancion5.tituloCancion
            duracion5.text = albumes[0].cancion5.duracion
            foto.image = UIImage(named: fotos[0])
        }else if selectedAlbum == albumes[1].titulo{
            titulo.text = albumes[1].titulo
            año.text = albumes[1].año
            song1.text = albumes[1].cancion1.tituloCancion
            duracion1.text = albumes[1].cancion1.duracion
            song2.text = albumes[1].cancion2.tituloCancion
            duracion2.text = albumes[1].cancion2.duracion
            song3.text = albumes[1].cancion3.tituloCancion
            duracion3.text = albumes[1].cancion3.duracion
            song4.text = albumes[1].cancion4.tituloCancion
            duracion4.text = albumes[1].cancion4.duracion
            song5.text = albumes[1].cancion5.tituloCancion
            duracion5.text = albumes[1].cancion5.duracion
            foto.image = UIImage(named: fotos[1])
        }else if selectedAlbum == albumes[2].titulo{
            titulo.text = albumes[2].titulo
            año.text = albumes[2].año
            song1.text = albumes[2].cancion1.tituloCancion
            duracion1.text = albumes[2].cancion1.duracion
            song2.text = albumes[2].cancion2.tituloCancion
            duracion2.text = albumes[2].cancion2.duracion
            song3.text = albumes[2].cancion3.tituloCancion
            duracion3.text = albumes[2].cancion3.duracion
            song4.text = albumes[2].cancion4.tituloCancion
            duracion4.text = albumes[2].cancion4.duracion
            song5.text = albumes[2].cancion5.tituloCancion
            duracion5.text = albumes[2].cancion5.duracion
            foto.image = UIImage(named: fotos[2])
        }else if selectedAlbum == albumes[3].titulo{
            titulo.text = albumes[3].titulo
            año.text = albumes[3].año
            song1.text = albumes[3].cancion1.tituloCancion
            duracion1.text = albumes[3].cancion1.duracion
            song2.text = albumes[3].cancion2.tituloCancion
            duracion2.text = albumes[3].cancion2.duracion
            song3.text = albumes[3].cancion3.tituloCancion
            duracion3.text = albumes[3].cancion3.duracion
            song4.text = albumes[3].cancion4.tituloCancion
            duracion4.text = albumes[3].cancion4.duracion
            song5.text = albumes[3].cancion5.tituloCancion
            duracion5.text = albumes[3].cancion5.duracion
            foto.image = UIImage(named: fotos[3])
        }
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Info", style: .plain, target: self, action: #selector(presentInfo))
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @objc func presentInfo(){
        if let vc = storyboard?.instantiateViewController(withIdentifier: "infoView") {
            //cambio de vista para ver la imagen
            navigationController!.pushViewController(vc, animated: true)
        }
    }
    
    @IBAction func adiosVista(for segue: UIStoryboardSegue){
        
    }

}
