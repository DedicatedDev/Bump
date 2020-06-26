//
//  SettingVC.swift
//  Bump
//
//  Created by Updev on 21.04.2020.
//  Copyright © 2020 Updev. All rights reserved.
//

import UIKit

class SettingVC: UIViewController {
    
    let titles = [
        "",
        "availability",
        "push notifications",
        "account details",
        "contact",
        "tutorial",
        "terms",
        "privay policy",
        "log out"
    ]
    
    struct CellId {
        static let photoCell = "ProfilePhotoCell"
        static let switchCell = "SwitchCell"
        static let disclosureCell = "DisclosureCell"
        static let deleteAccountCell = "DeleteAccountCell"
    }
    
    
    @IBOutlet weak var tableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func unwindToSettingVC(_ unwindSegue: UIStoryboardSegue) {
        let sourceViewController = unwindSegue.source
        // Use data from the view controller which initiated the unwind segue
    }

}

extension SettingVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: CellId.photoCell, for: indexPath) as! ProfilePhotoCell
            cell.profileImage = #imageLiteral(resourceName: "photo1")
            return cell
        case 1, 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: CellId.switchCell, for: indexPath) as! SwitchCell
            cell.titleLbl.text = titles[indexPath.row]
            return cell
        case titles.count:
            let cell = tableView.dequeueReusableCell(withIdentifier: CellId.deleteAccountCell, for: indexPath) as! DeleteAccountCell
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: CellId.disclosureCell, for: indexPath) as! DisclosureCell
            cell.titleLbl.text = titles[indexPath.row]
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 3:
            performSegue(withIdentifier: "AccountDetails", sender: self)
        case 9 :
            performSegue(withIdentifier: "DeleteAccount", sender: self)
        case 6:
            performSegue(withIdentifier: "navToTerms", sender: self)
        case 7:
            performSegue(withIdentifier: "navToPrivacy", sender: self)
        default:
            break
        }
    }
    
}
