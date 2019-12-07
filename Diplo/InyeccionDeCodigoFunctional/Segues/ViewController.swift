//
//  ViewController.swift
//  Segues
//
//  Created by Germán Santos Jaimes on 8/17/19.
//  Copyright © 2019 iosLab. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var tablita: UITableView!
    var carrito: Carrito = Carrito(producto: [])
    var productoSeleccionado: Producto?
    
    var productos = [
        Producto(id: 1, nombre: "Zapato", precio: 3.50),
        Producto(id: 2, nombre: "pantalones", precio: 4.50),
        Producto(id: 3, nombre: "camisa", precio: 5.50)
    ]
    
    
    var datoVistaPrincipal: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        print(carrito.producto.count)
        
    }
    
    @IBAction func unsegueSegundaVista(segue: UIStoryboardSegue){
    
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let miIndexPath = tablita.indexPathForSelectedRow
        
        let segundaVista = segue.destination as! SecondViewController
        productoSeleccionado = productos[(miIndexPath?.row)!]
        segundaVista.primeraVista = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "celda", for: indexPath)
        
        cell.textLabel?.text = productos[indexPath.row].nombre
        cell.detailTextLabel?.text = String(productos[indexPath.row].precio)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
    

}

