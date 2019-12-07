//
//  DetailViewController.swift
//  EmojiDictionary
//
//  Created by Sofìa Gutièrrez on 10/12/19.
//  Copyright © 2019 unam. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
  // ya no ocupe esta clase porque ya no voy al detalle sino al tocar la celda voy a editar el emoji
    var emoji: Emoji!

    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = emoji.symbol
        navigationItem.title = emoji.name
    }
    


}
