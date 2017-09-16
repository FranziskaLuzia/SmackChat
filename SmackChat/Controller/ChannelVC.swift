//
//  ChannelVC.swift
//  SmackChat
//
//  Created by Franziska Kammerl on 9/12/17.
//  Copyright © 2017 Franziska Kammerl. All rights reserved.
//

import UIKit

class ChannelVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.revealViewController().rearViewRevealWidth = self.view.frame.size.width - 60 

    }

}
