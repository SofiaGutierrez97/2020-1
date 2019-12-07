//
//  ViewController.swift
//  Lottie
//
//  Created by Sofìa Gutièrrez on 9/13/19.
//  Copyright © 2019 unam. All rights reserved.
//

import UIKit
import Lottie

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let animationView = AnimationView(name: "9367-running-loading")
        animationView.frame = CGRect(x: 0, y: 0, width: 400, height: 400)
        animationView.center = self.view.center
        animationView.contentMode = .scaleAspectFill
        
        view.addSubview(animationView)
        animationView.loopAnimation = true
        animationView.play()
    
    }
    
  /*
    
    */
    
    


}

