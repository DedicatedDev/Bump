//
//  CameraVC.swift
//  Bump
//
//  Created by Updev on 21.04.2020.
//  Copyright © 2020 Updev. All rights reserved.
//

import UIKit
import AVFoundation

class CameraVC: UIViewController {
    
    var captureSession = AVCaptureSession()
    var backCamera: AVCaptureDevice?
    var frontCamera: AVCaptureDevice?
    var currentCamera: AVCaptureDevice?
    
    var photoInput: AVCaptureDeviceInput?
    
    var photoOutput: AVCapturePhotoOutput?
    
    var cameraPreviewLayer: AVCaptureVideoPreviewLayer?
    
    var image: UIImage?
    
    var isTorchOn = false

    override func viewDidLoad() {
        super.viewDidLoad()

//        setupCaptureSession()
//        setupDevice()
//        setupInputOutput()
//        setupPreviewLayer()
//        startRunningCaptureSession()
    }
    
    func setupCaptureSession() {
        captureSession.sessionPreset = AVCaptureSession.Preset.photo
    }
    
    func setupDevice() {
        let deviceDiscoverySession = AVCaptureDevice.DiscoverySession(deviceTypes: [AVCaptureDevice.DeviceType.builtInWideAngleCamera], mediaType: AVMediaType.video, position: AVCaptureDevice.Position.unspecified)
        let devices = deviceDiscoverySession.devices
        
        for device in devices {
            if device.position == AVCaptureDevice.Position.back {
                backCamera = device
            } else if device.position == AVCaptureDevice.Position.front {
                frontCamera = device
            }
        }
        
        currentCamera = frontCamera
    }
    
    func setupInputOutput() {
        do {
            if photoInput != nil {
                captureSession.removeInput(photoInput!)
            }
            if photoOutput != nil {
                captureSession.removeOutput(photoOutput!)
            }
            photoInput = try AVCaptureDeviceInput(device: currentCamera!)
            captureSession.addInput(photoInput!)
            photoOutput = AVCapturePhotoOutput()
            photoOutput?.setPreparedPhotoSettingsArray([AVCapturePhotoSettings(format: [AVVideoCodecKey: AVVideoCodecType.jpeg])], completionHandler: nil)
            captureSession.addOutput(photoOutput!)
        } catch {
            print(error)
        }
    }
    
    func setupPreviewLayer() {
//        if cameraPreviewLayer != nil {
//            self.view.layer.sublayers?.forEach { $0.removeFromSuperlayer() }
//        }
        cameraPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        cameraPreviewLayer?.videoGravity = AVLayerVideoGravity.resizeAspectFill
        cameraPreviewLayer?.connection?.videoOrientation = AVCaptureVideoOrientation.portrait
        cameraPreviewLayer?.frame = self.view.frame
        self.view.layer.insertSublayer(cameraPreviewLayer!, at: 0)
    }
    
    func startRunningCaptureSession() {
        captureSession.startRunning()
    }
    
    @IBAction func unwindToCameraVC(_ unwindSegue: UIStoryboardSegue) {
        let sourceViewController = unwindSegue.source
        // Use data from the view controller which initiated the unwind segue
    }

    @IBAction func captureBtnTapped(_ sender: Any) {
//        let setting = AVCapturePhotoSettings()
//        photoOutput?.capturePhoto(with: setting, delegate: self)
        performSegue(withIdentifier: "segueToFilterVC", sender: nil)
    }
    
    @IBAction func exchangeCamera(_ sender: Any) {
        captureSession.stopRunning()
        if currentCamera == frontCamera {
            currentCamera = backCamera
        } else {
            currentCamera = frontCamera
        }
        setupInputOutput()
        setupPreviewLayer()
        startRunningCaptureSession()
    }
    
    @IBAction func flashBtnTapped(_ sender: Any) {
        isTorchOn = !isTorchOn
        toggleTorch(on: isTorchOn)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueToFilterVC" {
            let filterVC = segue.destination as! PhotoFilterVC
//            if currentCamera == frontCamera {
//                filterVC.photo = UIImage(cgImage: image!.cgImage!, scale: image!.scale, orientation: .leftMirrored)
//            } else {
//                filterVC.photo = image
//            }
            
        }
    }
    
    func toggleTorch(on: Bool) {
        guard let device = currentCamera else { return }

        if device.hasTorch {
            do {
                try device.lockForConfiguration()

                if on == true {
                    device.torchMode = .on
                } else {
                    device.torchMode = .off
                }
                
                device.unlockForConfiguration()
            } catch {
                print("Torch could not be used")
            }
        } else {
            print("Torch is not available")
        }
    }
    
}

extension CameraVC: AVCapturePhotoCaptureDelegate {
    func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
        if let imageData = photo.fileDataRepresentation() {
            image = UIImage(data: imageData)
            print(imageData)
            performSegue(withIdentifier: "segueToFilterVC", sender: nil)
        }
    }
}
