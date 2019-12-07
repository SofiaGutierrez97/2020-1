//
//  NewTableViewController.swift
//  sesion5.1
//
//  Created by Sofìa Gutièrrez on 8/23/19.
//  Copyright © 2019 unam. All rights reserved.
//

import UIKit

class NewTableViewController: UITableViewController {


    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 8
    }

   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "celda", for: indexPath)

        // Configure the cell...
        cell.backgroundColor = .red
        cell.textLabel?.text = "Hola"
        return cell
    }

    //Para cuando da click
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //para pintar la celda donde hay click
        //print(indexPath.row)
        
        let cancelCLosure = {( action: UIAlertAction!)-> Void in
            print("Boton cancelar")
        }
        
        //para hacer una alerta
        let alerta = UIAlertController(title: "Titulo", message: "Hay un mensaje", preferredStyle: .alert )
        //present (alerta, animated: true, completion: nil)
        //para cerrar la alerta
        _ = UIAlertAction(title: "Cancelar", style: .cancel, handler: cancelCLosure)
        //agrego a alerta una accion    solo va la siguiente linea si handler de arriba es nil
        //alerta.addAction(cancelAction)
        
        
        //agrego boton de ok
        let okAction = UIAlertAction(title: "Borrar", style: .default)
        { (action in )
            self.alumnos.remove(at: indexPath.row)
            print(self.alumnos)
            
            
        }
        alerta.addAction(okAction)
        alerta
        
        
        
        
        
        
        
        override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt: indexPath: IndexPath ) -> UISwipeActionsConfiguration?{
            let deleteAction = UIContextualAction(style: normal, title: "Borrar"){
                (action, view, MTLNewLibraryCompletionHandler)in self.alumnos.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .fade)
                completionHandler(true)
            }
            
            let swipeConfiguration = UISwipeActionsConfiguration (actions: deleteAction)
            return swipeConfiguration
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
