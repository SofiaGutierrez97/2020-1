//
//  TableViewController.swift
//  Tablas
//
//  Created by Germán Santos Jaimes on 8/23/19.
//  Copyright © 2019 iosLab. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    var alumnos = ["Jose", "Luis", "Sofia", "Pawis", "Manitas"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return alumnos.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "celda", for: indexPath)

        cell.backgroundColor = .red
        cell.textLabel?.text = alumnos[indexPath.row]

        return cell
    }
 
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cancelClosure = { (action: UIAlertAction!) -> Void in
            
            print("Boton cancelar")
        }
        
        let alerta = UIAlertController(title: "Titulo", message: "Este es el mensaje", preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel, handler: cancelClosure)
        
        let okAction = UIAlertAction(title: "Borrar", style: .default) { (action) in
            self.alumnos.remove(at: indexPath.row)
            print(self.alumnos)
            tableView.reloadData()
        }
        
        alerta.addAction(okAction)
        alerta.addAction(cancelAction)
        
        present(alerta,animated: true, completion: nil )
        
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            alumnos.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
 

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
