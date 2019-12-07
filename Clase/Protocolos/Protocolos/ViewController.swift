//
//  ViewController.swift
//  Protocolos
//
//  Created by Sofìa Gutièrrez on 10/25/19.
//  Copyright © 2019 unam. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var data: [String] = ["Juan", "Diego", "Sofi", "Daniel"]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Dfuncion que configura la tabla
        setupTableView()
    }


}
extension ViewController: UITableViewDelegate, UITableViewDataSource{
    
    //FUncion para configurar la tabla, aquì especificacmos quien va a hacer el delegado de la tabla
    func setupTableView(){
        //delegamos a ViewController lo que debe hacer el tableView que puse.
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    
    //Funciones para conformar las funciones del la tabla, que vienen en el TablaViewDelegate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") else {
            return UITableViewCell()
        }
        cell.textLabel?.text = data[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
    
}

