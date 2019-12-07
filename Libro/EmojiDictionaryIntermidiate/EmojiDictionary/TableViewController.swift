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
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 44.0
    
        
        //table.cellLayoutMarginsFollowReadableWidth = true
       
        
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
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      /*  if section == 0 {
            return (emojis.count)/2
        }else if section == 1{
            return (emojis.count)/2
        } else {
            return 0
        }*/
        return emojis.count
    }
 

    //para configurar las celdas
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! EmojiTableViewCell
        
        
        //cell.textLabel?.text =  "\(emojis[indexPath.row].symbol) - \(emojis[indexPath.row].name)"
       // cell.detailTextLabel?.text = emojis[indexPath.row].description
        
        //para que tome la celda custom que configure en Update de EmojiTableViewCell, en lugar de la defualt
        cell.update(with: emojis[indexPath.row])
        
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

    
/*  //lo comento porque voy a hacer un prepare para pasar a la tabla estatica  de añadir
    //pasa info y va a la otra pantalla
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
            if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController{
                //ya tiene vc la referencia a la imagen que debe poner
                vc.emoji = emojis[indexPath.row]
                //cambio de vista para ver la imagen
                navigationController!.pushViewController(vc, animated: true)}
    }
 
 */
    
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
    
    
    
    

   
//para deshabilitar eliminar en la vista del modo edit
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle{
        return .delete
    }
    
 
    
    
    
    
    
    
    
//elimina del arreglo el elemento a eliminar y elimina la celda dibujada
  override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            emojis.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        
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
    
   override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "EditEmoji"{
            let indexPath = tableView.indexPathForSelectedRow!
            let emoji = emojis[indexPath.row]
            let navController = segue.destination as! UINavigationController
            let addEditEmojiTableViewController = navController.topViewController as! AddEditEmojiTableViewController
            
            addEditEmojiTableViewController.emoji = emoji
            
        }
    }

    
    @IBAction func unwindToEmojiTableView(_ unwindSegue: UIStoryboardSegue) {
       // let sourceViewController = unwindSegue.source
        //checar si se hizo saveUnwind porque quiere decir que hay ediciòn en un emoji
        guard unwindSegue.identifier == "saveUnwind" else {return}
        let sourceViewController = unwindSegue.source as!
        AddEditEmojiTableViewController
        
        if let emoji = sourceViewController.emoji{
            if let selectedIndexPath = tableView.indexPathForSelectedRow{
                emojis[selectedIndexPath.row] = emoji
                tableView.reloadRows(at: [selectedIndexPath], with: .none)
            }else{
                let newIndexPath = IndexPath(row: emojis.count, section: 0)
                emojis.append(emoji)
                tableView.insertRows(at: [newIndexPath], with: .automatic)
            }
        }
    }
    
    

}
