//
//  AvatarCell.swift
//  SmackChat
//
//  Created by Franziska Kammerl on 9/23/17.
//  Copyright © 2017 Franziska Kammerl. All rights reserved.
//

import UIKit

class AvatarCell: UICollectionViewCell {
    
    @IBOutlet weak var avatarImg: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpView()
    }
    
    func setUpView() {
        self.layer.backgroundColor = UIColor.lightGray.cgColor
        self.layer.cornerRadius = 10
        self.clipsToBounds = true 
    }
    
}
