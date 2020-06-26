//
//  ImageCollectionViewCell.swift
//  Bump
//
//  Created by Updev on 22.04.2020.
//  Copyright © 2020 Updev. All rights reserved.
//

import UIKit
import Gemini

class ImageCollectionViewCell: GeminiCell {
    @IBOutlet private weak var sampleImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        
//        if UIDevice.current.hasTopNotch {
//            sampleImageView.layer.cornerRadius = 10
//        }
        sampleImageView.layer.cornerRadius = 10
    }

    func configure(with image: UIImage) {
        sampleImageView.image = image
    }
}
