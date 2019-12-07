//
//  TableViewController.swift
//  EmojiDictionary
//
//  Created by Sofìa Gutièrrez on 10/11/19.
//  Copyright © 2019 unam. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    @IBOutlet var table: UITableView!
    
    let sections = ["Sección1", "Sección2"]
    
    
    var emojis: [Emoji] = [Emoji(symbol: "😍", name: "enamorado", description: "carita con ojos de corazon", usage: "cuando estas enamorado"), Emoji(symbol: "😚", name: "beso", description: "carita dando besito", usage: "cuando quieres mandar un beso"), Emoji(symbol: "😛", name: "mostar lengua", description: "carita con lengua de fuera", usage: "cuando quieres bromear"), Emoji(symbol: "😒", name: "hastío", description: "carita con ojos y boca de aburrimiento", usage: "cuando te sientes hastiado"), Emoji(symbol: "😍", name: "enamorado", description: "carita con ojos de corazon", usage: "cuando estas enamorado"), Emoji(symbol: "😚", name: "beso", description: "carita dando besito", usage: "cuando quieres mandar un beso"), Emoji(symbol: "😛", name: "mostar lengua", description: "carita con lengua de fuera", usage: "cuando quieres bromear"), Emoji(symbol: "😒", name: "hastío", description: "carita con ojos y boca de aburrimiento", usage: "cuando te sientes hastiado"),Emoji(symbol: "😍", name: "enamorado", description: "carita con ojos de corazon", usage: "cuando estas enamorado"), Emoji(symbol: "😚", name: "beso", description: "carita dando besito", usage: "cuando quieres mandar un beso"), Emoji(symbol: "😛", name: "mostar lengua", description: "carita con lengua de fuera", usage: "cuando quieres bromear"), Emoji(symbol: "😒", name: "hastío", description: "carita con ojos y boca de aburrimiento", usage: "cuando te sientes hastiado"), Emoji(symbol: "😍", name: "enamorado", description: "carita con ojos de corazon", usage: "cuando estas enamorado"), Emoji(symbol: "😚", name: "beso", description: "carita dando besito", usage: "cuando quieres mandar un beso"), Emoji(symbol: "😛", name: "mostar lengua", description: "carita con lengua de fuera", usage: "cuando quieres bromear"), Emoji(symbol: "😒", name: "hastío", description: "carita con ojos y boca de aburrimiento", usage: "cuando te sientes hastiado"), Emoji(symbol: "😍", name: "enamorado", description: "carita con ojos de corazon", usage: "cuando estas enamorado"), Emoji(symbol: "😚", name: "beso", description: "carita dando besito", usage: "cuando quieres mandar un beso"), Emoji(symbol: "😛", name: "mostar lengua", description: "carita con lengua de fuera", usage: "cuando quieres bromear"), Emoji(symbol: "😒", name: "hastío", description: "carita con ojos y boca de aburrimiento", usage: "cuando te sientes hastiado"), Emoji(symbol: "😍", name: "enamorado", description: "carita con ojos de corazon", usage: "cuando estas enamorado"), Emoji(symbol: "😚", name: "beso", description: "carita dando besito", usage: "cuando quieres mandar un beso"), Emoji(symbol: "😛", name: "mostar lengua", description: "carita con lengua de fuera", usage: "cuando quieres bromear"), Emoji(symbol: "😒", name: "hastío", description: "carita con ojos y boca de aburrimiento", usage: "cuando te sientes hastiado")]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.cellLayoutMarginsFollowReadableWidth = true
       
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source
    
    //refrescar vista
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return (emojis.count)/2
        }else if section == 1{
            return (emojis.count)/2
        } else {
            return 0
        }
    }
    

    //para configurar las celdas
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text =  "\(emojis[indexPath.row].symbol) - \(emojis[indexPath.row].name)"
        cell.detailTextLabel?.text = emojis[indexPath.row].description
        
        //activar el reorden de celdas
        cell.showsReorderControl = true

        return cell
    }

    //pone nombre enb las secciones
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String?{
        if section == 0{
            return "\(sections[0])"
        }else{
            return "\(sections[1])"
        }
    }

    //pasa info y va a la otra pantalla
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
            if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController{
                //ya tiene vc la referencia a la imagen que debe poner
                vc.emoji = emojis[indexPath.row]
                //cambio de vista para ver la imagen
                navigationController!.pushViewController(vc, animated: true)}
    }
    
    //para mover las celdas a otro lugar
    //agregar la funcion en el metodo en cellForRowAt
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let movedEmoji = emojis.remove(at: sourceIndexPath.row)
        emojis.insert(movedEmoji, at: destinationIndexPath.row)
        tableView.reloadData()

    }
    
    //boton para activar la configuracion y reorden de celdas
    @IBAction func edit(_ sender: Any) {
        let editTable = tableView.isEditing
        tableView.setEditing(!editTable, animated: true)
    }
    
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */
    
    
    
    
/*
   
//para deshabilitar eliminar en la vista del modo edit
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle{
        return .none
    }
    
   */
    
    
    
    
    
    
    
    
 /*   override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        /*if editingStyle == .delete {
            // Delete the row from the data source
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    */
    }*/
  

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
