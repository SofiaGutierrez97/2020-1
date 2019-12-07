//
//  ViewController.swift
//  InyeccionDeCodigoOCLases
//
//  Created by Sofìa Gutièrrez on 8/17/19.
//  Copyright © 2019 unam. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tablita: UITableView!
    var carrito: Carrito!
    var productoSeleccionado: Producto!
    
    var datoVistaPrincipal: String = " "
    var productos = [
        Producto(id: 1, nombre: "Zapato", precio: 3.50),
        Producto(id: 2, nombre: "pantalones", precio: 4.50),
        Producto(id: 3, nombre: "camisa", precio: 5.50)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
    }
    
    //SIEMPRE QUE LIGAMOS UN COMPONENTE A UNA FUNCION VA UN:   IBAction
    //Funcion Segue para la vista
    //en storyboard arrastro boton a exit y la ligo a la función
    @IBAction func unsegueSegundavista (segue: UIStoryboardSegue){
        
    }
    
    
    //Funcion para pasar un dato a la vista siguiente
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let miIndexPath = tablita.indexPathForSelectedRow
        
        
        //cas para enviar el dato de la primera vista a la segunda, me perimite modificar las variables de de la segunda vista
        let segundaVista = segue.destination as! SecondViewController
        //modifico la variable que quiero de la segunda vista porque ya tengo acceso
        
        segundaVista.producto = productos[(miIndexPath?.row)!]
    }
    
    
    //como la vista 1 ya esta dibujada, para mostrar el dato recibido
    //refresh a la ventana para que muestre el dato recibido
    override func viewWillAppear(_ animated: Bool) {
        print(datoVistaPrincipal)
    }
    
    //MARK: TableView Delegates
    //tenemos que asociar la tableview con el view controller en data source
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell = tableView.dequeueReusableCell(withIdentifier: "celda", for: indexPath)
        //escribe el dato en la celda de la tabla
        cell.textLabel?.text = productos[indexPath.row].nombre
        cell.detailTextLabel?.text = String(productos[indexPath.row].precio)
        //regresa para que la tabla la reciba y la pega
        return cell
    }
    
    //dice que posicion se toco y  se pone en delegate al relacionar con el view controller
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
    
    
    
    
    
}

// as
// as?
// as!
