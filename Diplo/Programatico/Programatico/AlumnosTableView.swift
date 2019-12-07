//
//  AlumnosTableView.swift
//  Programatico
//
//  Created by Sofìa Gutièrrez on 9/21/19.
//  Copyright © 2019 unam. All rights reserved.
//

import UIKit

class AlumnoTableView: UITableViewController{
    
    var datoRecibidoDeVistaTres: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Lista de alumnos"
        navigationController?.navigationBar.prefersLargeTitles = true
        //fondo
        navigationController?.navigationBar.barTintColor = .rojoQuemado
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        //lo que puedan poner ya tenga el contorno blanco
        navigationController?.navigationBar.tintColor = .white
        //para que no se vea transpratente la barra cuando movemos el table
        navigationController?.navigationBar.isTranslucent = false
        
        tableView.backgroundColor = .azulMarino
        
        
        //registro de la celda a dibujar
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "celda")
        //quita las lineas del table que sobran debajo de la tabla
        tableView.tableFooterView = UIView()
        //color de separacionentre celdas
        tableView.separatorColor = .azulCLaro
        
        //agrega boton en en navigation
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action:  #selector(addAlumno))
        
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "celda", for: indexPath)
        cell.textLabel?.text = "alumno"
        //color fondo de celda
        cell.backgroundColor = .clear
        //color de texto
        cell.textLabel?.textColor = .white
        return cell
    }
    
    
    @objc func addAlumno(){
        print("Alumno")
        let addAlumno = AddAlumnoView()
       // present(addAlumno, animated: true, completion:  nil)
        navigationController?.pushViewController(addAlumno, animated: true)
        
        
    }
}
