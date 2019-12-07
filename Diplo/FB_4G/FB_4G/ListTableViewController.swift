//
//  ListTableViewController.swift
//  FB_4G
//
//  Created by Sofìa Gutièrrez on 9/6/19.
//  Copyright © 2019 unam. All rights reserved.
//

import UIKit
import FirebaseFirestore
import MobileCoreServices
import FirebaseStorage
import FirebaseUI



class ListTableViewController: UITableViewController {

    var productos = [Producto]()
    //conecta a la coleccion a consultar
    var ref: DocumentReference!
    //conecta a la base de datos
    var getRef: Firestore!
    var storageReference: StorageReference!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getRef = Firestore.firestore()
        getProductos()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        //conexion al storage
        storageReference = Storage.storage().reference()
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return productos.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "celda", for: indexPath)
        
        cell.textLabel!.text = productos[indexPath.row].nombre
        
        let placeHolder = UIImage(named: "fondo.jpg")
        
        let userImageRef = storageReference.child("/photos").child(productos[indexPath.row].id)
        
        
        userImageRef.downloadURL{(url, error) in
            if let error = error{
                print(error.localizedDescription)
            }else{
                print(String(describing: url!))
            }
            
        }

        cell.imageView?.sd_setImage(with: userImageRef, placeholderImage: placeHolder)
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "editView"{
            let indexPath = tableView.indexPathForSelectedRow
            let editView = segue.destination as? EditViewController
            editView?.datosProducto = productos[(indexPath?.row)!]
        }
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
    
    //funcion que se conecta a firebase y te trae la lista de productos
    func getProductos(){

       // getRef.collection("productos").getDocuments{(querySnapshot, error ) in
        getRef.collection("productos").addSnapshotListener{ (querySnapshot, error) in
            if let error = error{
                print(error.localizedDescription)
                return
            }else{
                self.productos.removeAll()
                for document in querySnapshot!.documents{
                    let id = document.documentID
                    let values = document.data()
                    // del arreglo de valores, dame una propiedad que se llama nombre que te aseguro que es una cadena, si no tiene nada, ponle sin valor
                    //el nombre lo definimos en la web de firebase
                    let nombre = values["nombre"] as? String ?? "sin valor"
                    let precio = values["precio"] as? String ?? "sin precio"
                    let producto = Producto(nombre: nombre, precio: precio, id: id)
                    self.productos.append(producto)
                }
                self.tableView.reloadData()
            }
        }
    }
    
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let delete = UITableViewRowAction(style: .destructive, title: "Borrar"){(action, indexPath) in
            let producto = self.productos[indexPath.row]
            self.getRef.collection("productos").document(producto.id).delete()
        }
        return [delete]
    }
    
    
    
    
}
