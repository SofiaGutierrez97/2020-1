//
//  DiscografiaTableViewController.swift
//  Examen1Bandas
//
//  Created by Sofía Gutiérrez on 9/18/19.
//  Copyright © 2019 Sofía Gutiérrez. All rights reserved.
//

import UIKit

class DiscografiaTableViewController: UITableViewController {
    var discosImage = [String]()
    let nombres = ["Tourist History", "Gameshow", "Beacon", "False Alarm"]
    @IBOutlet weak var foto: UIImageView!
    @IBOutlet weak var titulo: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let fm = FileManager.default
        let path = Bundle.main.resourcePath! //DEL BUNDLE PRINCIPAL, DAME las rutas EL DIRECTORIO
        let items = try! fm.contentsOfDirectory(atPath: path) //DAME LOS CONTENIDOS DEL DIRECTORIO, devuelve un arreglo con todas las rutas de los contenidos del proyecto (referenciaS a los contenidos
        for item in items{
            if item.hasPrefix("album"){
                //agregar la imagen a la lista de imagenes
                //aislamos las imagenes del resto de los contenidos del directorio
                discosImage.append(item)
            }
        }
        print(discosImage)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
       // return discosImage.count
        return nombres.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "celda", for: indexPath)
        cell.textLabel?.text = nombres[indexPath.row]
        cell.textLabel?.textColor = .white
        cell.imageView?.image = UIImage(named: discosImage[indexPath.row])
 
        return cell
    }
 
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //pregunta si puede del storyboard, hay una instancia con identificador detail y es tipo DetailViewCONTROLLER
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController{
            //ya tiene vc la referencia a la imagen que debe poner
            vc.selectedAlbum = nombres[indexPath.row]
            vc.fotos = discosImage
            //cambio de vista para ver la imagen
            navigationController!.pushViewController(vc, animated: true)
            
        }
    }
    
    @IBAction func adiosVista(for segue: UIStoryboardSegue){
        
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
