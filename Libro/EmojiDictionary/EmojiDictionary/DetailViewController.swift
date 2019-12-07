//
//  DetailViewController.swift
//  EmojiDictionary
//
//  Created by Sofìa Gutièrrez on 10/12/19.
//  Copyright © 2019 unam. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
 
    var emoji: Emoji!

    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = emoji.symbol
        navigationItem.title = emoji.name
    }
    


}
