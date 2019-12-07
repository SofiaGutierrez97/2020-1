//
//  ViewController.swift
//  ChofisDiploTests
//
//  Created by Sofìa Gutièrrez on 10/26/19.
//  Copyright © 2019 unam. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {

    @IBOutlet weak var backgroundView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]){
            (permision, _) in
            assert(true, "Usuario no te dio permiso")
        }
    }
    @IBAction func didPressedSendNotification(_ sender: Any) {
        
    }
    
    func enviarNotificaciones(){
        let content = UNMutableNotificationContent()
        content.title = "Alerta de prueba"
        content.body = "Esta es una alerta de prueba"
/*        let imageName = "octocat"
        guard let imageURL = Bundle.main.url(forResource: imageName, withExtension: "jpg")else {return}
         let atachment = 
 */
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 10, repeats: false)
        let request = UNNotificationRequest(identifier: "indentifier 01", content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    }

    //animacion
    func setupUI(){
        backgroundView.alpha = 0
        
        backgroundView.topAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        
        UIView.animate(withDuration: 2){
            self.backgroundView.alpha = 1
            self.view.layoutIfNeeded()
        }
    }
    
    
    
    @IBAction func registerUserName(_ sender: Any) {
        let alert = UIAlertController(title: "Nuevo Usuario", message: "Ingresa un nombre de usuario", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let userNameAction = UIAlertAction(title: "listo", style: .default){
            (_) in
            print("termine")
            let userName = alert.textFields![0].text?.trimmingCharacters(in: .whitespacesAndNewlines)
            if userName != ""{
                print(userName)
            }
        }
        alert.addTextField(configurationHandler: nil)
        alert.addAction(cancelAction)
        alert.addAction(userNameAction)
        present(alert, animated: true)
    }
    
}

