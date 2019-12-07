//
//  ViewController.swift
//  AnimalSounds
//
//  Created by Sofìa Gutièrrez on 9/3/19.
//  Copyright © 2019 unam. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var animalSoundLabel: UILabel!
    
    let meowSound = SimpleSound(named: "meow")
    let woofSound = SimpleSound(named: "woof")
    let mooSound = SimpleSound(named: "moo")
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func cowButtonTapped(_ sender: Any) {
    animalSoundLabel.text = "Muuuu"
    mooSound.play()
    }
    
    @IBAction func dogButtonTapped(_ sender: Any) {
    animalSoundLabel.text = "Woof"
    woofSound.play()
    }
    
    @IBAction func catButtonTapped(_ sender: Any) {
    animalSoundLabel.text = "Meow"
    meowSound.play()
    }
    
}

