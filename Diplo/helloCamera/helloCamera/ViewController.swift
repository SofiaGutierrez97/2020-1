//
//  ViewController.swift
//  helloCamera
//
//  Created by Sofìa Gutièrrez on 11/15/19.
//  Copyright © 2019 unam. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var previewView: PreviewView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        validateCameraAccess()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if !session.isRunning{
            session.startRunning()
        }
    }
    

    override func viewWillDisappear(_ animated: Bool) {
        session.stopRunning()
        super.viewDidDisappear(animated)
    }

    func validateCameraAccess(){
        //copiado de /*https://developer.apple.com/documentation/avfoundation/cameras_and_media_capture/requesting_authorization_for_media_capture_on_macos */
        
        switch AVCaptureDevice.authorizationStatus(for: .video) {
        case .authorized: // The user has previously granted access to the camera.
            self.setupCaptureSession()
            
        case .notDetermined: // The user has not yet been asked for camera access.
            AVCaptureDevice.requestAccess(for: .video) { granted in
                if granted {
                    self.setupCaptureSession()
                }
            }
            
        case .denied: // The user has previously denied access.
            return
            
        case .restricted: // The user can't grant access due to restrictions.
            return
        }
    }
    
    let session = AVCaptureSession()
    //sin el output no òdemos tomar fotos, este es el output, lo pongo fuera porque lo  vamos a utilizar fuera
    let photoOutput = AVCapturePhotoOutput()
    
    func setupCaptureSession(){
        //captura una entrada de session
        session.beginConfiguration()
        //copiado de https://developer.apple.com/documentation/avfoundation/cameras_and_media_capture/setting_up_a_capture_session
        let device = AVCaptureDevice.default(.builtInWideAngleCamera,
                                                  for: .video, position: .back)!
        guard
            let videoDeviceInput = try? AVCaptureDeviceInput(device: device),
            session.canAddInput(videoDeviceInput)
            else { return }
        session.addInput(videoDeviceInput)
        
        //captura la salida de session es nuestro output
        guard session.canAddOutput(photoOutput) else { return }
        session.sessionPreset = .photo
        session.addOutput(photoOutput)
        session.commitConfiguration()
        
        
        session.commitConfiguration()
        previewView.session = session
        
        session.startRunning()
    }
    
    
    @IBAction func onTapCapture(_ sender: Any) {
        print("snap")
    }
    
    
}

