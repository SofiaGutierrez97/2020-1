//
//  SecondViewController.swift
//  testXIB
//
//  Created by Sofìa Gutièrrez on 9/14/19.
//  Copyright © 2019 unam. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var tabla: UITableView!
    var nombres = ["y", "h", "G"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let nib = UINib(nibName: "TableViewCell", bundle: nil)
        tabla.register(nib, forCellReuseIdentifier: "celda")
        //delegamos, pero necesito un outlet
        tabla.dataSource = self
        //delegar para hacer mas grande la celda, ligado a la funcioin de abajo
        tabla.delegate = self
    }
    
    
}

extension SecondViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //numero de renglones
        return nombres.count    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "celda", for: indexPath) as! TableViewCell
        cell.titulo.text = nombres[indexPath.row]
        cell.foto.image = UIImage(named: "nssl0046")
        return cell
    }
    
    
}

//hacer mas grande la celda por codigo
extension SecondViewController: UITableViewDelegate{
    func tableView(_tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        return 150
    }
}
