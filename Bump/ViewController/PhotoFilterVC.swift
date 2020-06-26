//
//  PhotoFilterVC.swift
//  Bump
//
//  Created by Updev on 21.04.2020.
//  Copyright © 2020 Updev. All rights reserved.
//

import UIKit


class PhotoFilterVC: UIViewController {
    
    var photo: UIImage?

    @IBOutlet weak var photoImgView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        photoImgView.image = photo
        filterImage()
    }
    
    func filterImage() {
        guard let image = photo, let currentCGImage = image.cgImage else { return }
        let currentCIImage = CIImage(cgImage: currentCGImage)

        let filter = CIFilter(name: "CIColorMonochrome")
        filter?.setValue(currentCIImage, forKey: "inputImage")

        // set a gray value for the tint color
        filter?.setValue(CIColor(cgColor: UIColor.blue.cgColor), forKey: "inputColor")
        
        filter?.setValue(1.0, forKey: "inputIntensity")
        guard let outputImage = filter?.outputImage else { return }

        let context = CIContext()
        let originalOrientation = image.imageOrientation
        let originalScale = image.scale
        if let cgimg = context.createCGImage(outputImage, from: outputImage.extent) {
            let processedImage = UIImage(cgImage: cgimg, scale: originalScale, orientation: originalOrientation)
            photoImgView.image = processedImage
            print(processedImage.size)
        }
    }

}
