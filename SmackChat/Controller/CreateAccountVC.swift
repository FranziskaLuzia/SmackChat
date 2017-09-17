//
//  CreateAccountVC.swift
//  SmackChat
//
//  Created by Franziska Kammerl on 9/17/17.
//  Copyright © 2017 Franziska Kammerl. All rights reserved.
//

import UIKit

class CreateAccountVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // Actions
    @IBAction func closePressed(_ sender: Any) {
        performSegue(withIdentifier: UNWIND, sender: nil)
    }
    
}
