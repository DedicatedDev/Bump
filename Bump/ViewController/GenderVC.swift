//
//  GenderVC.swift
//  Bump
//
//  Created by Updev on 21.04.2020.
//  Copyright © 2020 Updev. All rights reserved.
//

import UIKit

class GenderVC: UIViewController {
    
    
    @IBOutlet weak var manBtn: UIButton!
    
    @IBOutlet weak var womanBtn: UIButton!
    
    @IBAction func manBtnTapped(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        womanBtn.isSelected = !sender.isSelected
    }
    
    @IBAction func womanBtnTapped(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        manBtn.isSelected = !sender.isSelected
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        manBtn.layer.cornerRadius = 6
        manBtn.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        womanBtn.layer.cornerRadius = 6
        womanBtn.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
    }
}
