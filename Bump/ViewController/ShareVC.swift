//
//  ShareVC.swift
//  Bump
//
//  Created by Updev on 21.04.2020.
//  Copyright © 2020 Updev. All rights reserved.
//

import UIKit
import KeyboardObserver

class ShareVC: UIViewController {
    
    
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var instaBtn: UIButton!
    
    @IBOutlet weak var whatsAppBtn: UIButton!
    
    @IBOutlet weak var instaView: UIView!
    
    @IBOutlet weak var whatsAppView: UIView!
    
    @IBOutlet weak var instaTF: UITextField!
    
    @IBOutlet weak var whatsAppTF: UITextField!
    
    
    let keyboard = KeyboardObserver()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        keyboard.observe { [weak self] (event) -> Void in
            guard let self = self else { return }
            switch event.type {
            case .willShow, .willHide, .willChangeFrame:
                let keyboardFrameEnd = event.keyboardFrameEnd
                let bottom = keyboardFrameEnd.height - self.view.safeAreaInsets.bottom + 20
                self.bottomConstraint.constant = event.type == .willShow ? bottom : 20
                UIView.animate(withDuration: event.duration, delay: 0.0, options: [event.options], animations: { () -> Void in
                    self.view.layoutIfNeeded()
                    }, completion: nil)
            default:
                break
            }
        }
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(endEditing))
        view.addGestureRecognizer(tapGesture)
        let instaTG = UITapGestureRecognizer(target: self, action: #selector(instaTap))
        instaView.addGestureRecognizer(instaTG)
        let whatsappTG = UITapGestureRecognizer(target: self, action: #selector(whatsAppTap))
        whatsAppView.addGestureRecognizer(whatsappTG)
        instaTF.isEnabled = false
        whatsAppTF.isEnabled = false
    }
    
    @objc func endEditing() {
        view.endEditing(true)
    }
    
    @objc func instaTap() {
        toInsta()
    }
    
    @objc func whatsAppTap() {
        toWhatsApp()
    }
    
    func toInsta() {
        instaBtn.isSelected = true
        whatsAppBtn.isSelected = false
        instaTF.isEnabled = true
        whatsAppTF.isEnabled = false
        instaTF.becomeFirstResponder()
    }
    
    func toWhatsApp() {
        instaBtn.isSelected = false
        whatsAppBtn.isSelected = true
        instaTF.isEnabled = false
        whatsAppTF.isEnabled = true
        whatsAppTF.becomeFirstResponder()
    }
    
    @IBAction func instaBtnTapped(_ sender: Any) {
        toInsta()
    }
    
    @IBAction func whatsAppBtnTapped(_ sender: Any) {
        toWhatsApp()
    }
    
}

extension ShareVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return true
    }
}
