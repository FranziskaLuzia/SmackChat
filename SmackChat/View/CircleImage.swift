//
//  CircleImage.swift
//  SmackChat
//
//  Created by Franziska Kammerl on 9/24/17.
//  Copyright © 2017 Franziska Kammerl. All rights reserved.
//

import UIKit
@IBDesignable

class CircleImage: UIImageView {

    override func awakeFromNib() {
        setUpView()
    }
    
    func setUpView() {
        self.layer.cornerRadius = self.frame.width / 2
        self.clipsToBounds = true
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setUpView()
    }
}
