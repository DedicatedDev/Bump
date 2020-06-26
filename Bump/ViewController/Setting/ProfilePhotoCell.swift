//
//  ProfilePhotoCell.swift
//  Bump
//
//  Created by Updev on 21.04.2020.
//  Copyright © 2020 Updev. All rights reserved.
//

import UIKit

class ProfilePhotoCell: UITableViewCell {
    
    
    @IBOutlet weak var nameLbl: UILabel!
    
    
    @IBOutlet weak var profileImgView: UIImageView!
    
    @IBOutlet weak var aspectRatio: NSLayoutConstraint!
    
    
    var profileImage: UIImage? {
        didSet {
            profileImgView.image = profileImage
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}


extension NSLayoutConstraint {
    func constraintWithMultiplier(_ multiplier: CGFloat) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: self.firstItem!, attribute: self.firstAttribute, relatedBy: self.relation, toItem: self.secondItem, attribute: self.secondAttribute, multiplier: multiplier, constant: self.constant)
    }
}
