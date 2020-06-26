//
//  ViewController.swift
//  Bump
//
//  Created by Updev on 20.04.2020.
//  Copyright © 2020 Updev. All rights reserved.
//

import UIKit
import KeyboardObserver

class SignVC: UIViewController {
    
    
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    
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
    }
    
    @IBAction func endEditing(_ sender: Any) {
        view.endEditing(true)
    }
    
}

extension SignVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return true
    }
}
