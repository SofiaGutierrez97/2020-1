//
//  AddViewController.swift
//  FB_4G
//
//  Created by Sofìa Gutièrrez on 9/6/19.
//  Copyright © 2019 unam. All rights reserved.
//

import UIKit
import Firebase
import MobileCoreServices
import FirebaseFirestore
import FirebaseStorage

class AddViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    @IBOutlet weak var producto: UITextField!
    @IBOutlet weak var precio: UITextField!
    @IBOutlet weak var photo: UIImageView!
    
    var ref: DocumentReference!
    var getRef: Firestore!
    var optimizedImage: Data!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getRef = Firestore.firestore()
        
        // Do any additional setup after loading the view.
    }
    

    @IBAction func cancelar(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func agregar(_ sender: UIButton) {
        var datos: [String: Any] = ["nombre": producto.text, "precio": precio.text]
        ref = getRef.collection("productos").addDocument(data: datos, completion: {
            (error) in
            
            if let error = error{
                print(error.localizedDescription)
            }else{
                print("Se guardaron los datos")
                //self.dismiss(animated: true, completion: nil)
            }
        })
        uploadImage(imageData: optimizedImage)
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func selectImage(_ sender: UIButton) {
        let photoImage = UIImagePickerController()
        photoImage.sourceType = UIImagePickerController.SourceType.photoLibrary
        photoImage.mediaTypes = [kUTTypeImage as String]
        photoImage.delegate = self
        present(photoImage, animated: true, completion: nil)
        
    }
    
    //funcion para sacar detalles de la imagen
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let imageSelected = info[UIImagePickerController.InfoKey.originalImage] as? UIImage, let optimizedImageData = imageSelected.jpegData(compressionQuality: 0.6){
        photo.image = imageSelected
        optimizedImage = optimizedImageData
        }
        dismiss(animated: true, completion: nil)
    }
    
    
    func uploadImage(imageData: Data){
        let activityIndicator = UIActivityIndicatorView.init(style: .gray)
        activityIndicator.startAnimating()
        activityIndicator.center = self.view.center
        
        view.addSubview(activityIndicator)
        
        let storageReference = Storage.storage().reference()
        let userImageRef = storageReference.child("/photos").child(ref.documentID)
        let uploadMetadata = StorageMetadata()
        
        uploadMetadata.contentType = "image/jpeg"
        
        uploadMetadata.contentType = "image/jpeg"
        userImageRef.putData(imageData, metadata: uploadMetadata){
            (storageMetadata, error) in
            activityIndicator.stopAnimating()
            activityIndicator.removeFromSuperview()
            if let error = error{
                print(error.localizedDescription)
            }else{
                print("metadata: ", storageMetadata?.path)
            }
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
