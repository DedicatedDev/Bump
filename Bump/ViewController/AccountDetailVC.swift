//
//  AccountDetailVC.swift
//  Bump
//
//  Created by Updev on 21.04.2020.
//  Copyright © 2020 Updev. All rights reserved.
//

import UIKit

class AccountDetailVC: UIViewController {
    
    
    @IBOutlet weak var nameView: UIView!
    
    @IBOutlet weak var emailView: UIView!
    
    @IBOutlet weak var maleBtn: UIButton!
    
    @IBOutlet weak var femaleBtn: UIButton!
    
    @IBOutlet weak var instaView: UIView!
    
    @IBOutlet weak var whatsappView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nameView.layer.cornerRadius = 6
        nameView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        emailView.layer.cornerRadius = 6
        emailView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        maleBtn.layer.cornerRadius = 6
        maleBtn.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        femaleBtn.layer.cornerRadius = 6
        femaleBtn.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        instaView.layer.cornerRadius = 6
        instaView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        whatsappView.layer.cornerRadius = 6
        whatsappView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
    }

}
