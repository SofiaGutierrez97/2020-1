//
//  previewView.swift
//  helloCamera
//
//  Created by Sofìa Gutièrrez on 11/15/19.
//  Copyright © 2019 unam. All rights reserved.
//

import AVFoundation
import UIKit

//copiado de https://developer.apple.com/documentation/avfoundation/cameras_and_media_capture/setting_up_a_capture_session
class PreviewView: UIView {
    override class var layerClass: AnyClass {
        return AVCaptureVideoPreviewLayer.self
    }
    
    var session: AVCaptureSession?{
        get{
            return videoPreviewLayer.session
        }
        set{
            videoPreviewLayer.session = newValue
        }
    }
    
    /// Convenience wrapper to get layer as its statically known type.
    var videoPreviewLayer: AVCaptureVideoPreviewLayer {
        return layer as! AVCaptureVideoPreviewLayer
    }
}
