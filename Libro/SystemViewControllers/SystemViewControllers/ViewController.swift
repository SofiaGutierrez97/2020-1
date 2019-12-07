//
//  ViewController.swift
//  SystemViewControllers
//
//  Created by Sofìa Gutièrrez on 11/6/19.
//  Copyright © 2019 unam. All rights reserved.
//

import UIKit
import SafariServices
import MessageUI

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, MFMailComposeViewControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    
    @IBAction func shareButtonTapped(_ sender: Any) {
        guard let image = imageView.image else {return}
        let activityController = UIActivityViewController(activityItems: [image], applicationActivities: nil)
        activityController.popoverPresentationController?.sourceView = sender as! UIView
        
        present(activityController, animated: true, completion: nil)
    }
    
    
    @IBAction func safariButtonTapped(_ sender: Any) {
        if let url = URL(string: "http://www.apple.com"){
            let safariViewController = SFSafariViewController(url: url)
            present(safariViewController, animated: true, completion: nil)
        }
    }
    
    @IBAction func emailButtonTapped(_ sender: Any) {
        //verificación qu el dispositivo sea capaz d enviar un mail
        guard MFMailComposeViewController.canSendMail() else{
            print("Can not send a mail")
            return
        }
        let mailComposer = MFMailComposeViewController()
        mailComposer.mailComposeDelegate = self
        
        mailComposer.setToRecipients(["example@example.com"])
        mailComposer.setSubject("LOOK AT THIS")
    mailComposer.setMessageBody(("bhnjmkhgfcvgbhnjkjihugyftgyhjkmjhnbgvfcdxcfvbghnjm"), isHTML: false)
        present(mailComposer, animated: true, completion: nil)
        
        func mailComposerController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?){
            dismiss(animated: true, completion: nil)
        }
    }
    
    @IBAction func cameraButtonTapped(_ sender: Any) {
        
        //objeto tipo UIImagePickerController para transferir los datos de la imagen a la app
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        
        
        
        let alertController = UIAlertController(title: "Choose Image Source", message: nil, preferredStyle: .actionSheet)
        
    /*    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String: Any]){
            if let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage
            
        }*/

       
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            let cameraAction = UIAlertAction(title: "Camera", style: .default, handler: { action in
                imagePicker.sourceType = .camera
                self.present(imagePicker, animated: true, completion: nil)
            })
            alertController.addAction(cameraAction)
        }
       
        
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
            let photoLibraryAction = UIAlertAction(title: "Photo Library", style: .default, handler: { action in
                imagePicker.sourceType = .photoLibrary
                self.present(imagePicker, animated: true, completion: nil)
            })
            alertController.addAction(photoLibraryAction)
        }
        
        let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        
        alertController.popoverPresentationController?.sourceView = sender as! UIView
        present(alertController, animated: true, completion:  nil)
        
        
    }
    
    
    
}

