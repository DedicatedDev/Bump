//
//  BumpVC.swift
//  Bump
//
//  Created by Updev on 21.04.2020.
//  Copyright © 2020 Updev. All rights reserved.
//

import UIKit

struct Notification {
    let message: String
    let image: UIImage
}

class BumpVC: UIViewController {
    
    @IBOutlet weak var minusBtn: UIButton!
    
    @IBOutlet weak var deleteAllBtn: UIButton!
    
    var notifications = [Notification(message: "Hey, chat with me on insta", image: #imageLiteral(resourceName: "Rectangle Copy 5")),
        Notification(message: "Here’s my whatsapp", image: #imageLiteral(resourceName: "Rectangle Copy 6")),
        Notification(message: "Hey david whatsapp me on 07716 123456", image: #imageLiteral(resourceName: "Rectangle Copy 7")),
        Notification(message: "Hey, chat with me on insta", image: #imageLiteral(resourceName: "Rectangle Copy 8"))
    ]
    
    let cellId = "NotificationCell"
    
    @IBAction func minusBtnTapped(_ sender: Any) {
        minusBtn.isHidden = !minusBtn.isHidden
        deleteAllBtn.isHidden = !minusBtn.isHidden
    }
    
    @IBAction func deleteAllBtnTapped(_ sender: Any) {
        deleteAllBtn.isHidden = !deleteAllBtn.isHidden
        minusBtn.isHidden = !deleteAllBtn.isHidden
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

}

extension BumpVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notifications.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! NotificationCell
        cell.partnerImgView.image = notifications[indexPath.row].image
        cell.messageLbl.text = notifications[indexPath.row].message
        return cell
    }
    
    
}


